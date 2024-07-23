#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./runOMPlanning.sh FOLDER ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM [TIME-BOUND (in s) DELETE-MISC]
# cave: as current: option -delete-misc can only be added if time bound is used




TimeStart="$(date -u +%s.%N)"


# read config file to find rewriter and planner
ConfigFile=config.txt


DomainFolder=$1
MiscFolder="$DomainFolder"/misc
# create folder if it does not exist yet
mkdir -p "$MiscFolder"

Ontology="$DomainFolder"/$2
Fluents="$DomainFolder"/fluents.txt
Hooks="$DomainFolder"/hooks.txt
Rewritings="$MiscFolder"/rewritings.txt
ReasonerLog="$MiscFolder"/reasoner_log.txt

Domain="$DomainFolder"/$3
DomainNew="$MiscFolder"/generated_$3
Problem="$DomainFolder"/$4
ProblemNew="$MiscFolder"/generated_$4

Plan="$DomainFolder"/${4%".pddl"}.plan.txt
PlannerLog="$MiscFolder"/planner_log.txt
PlannerSAS="$MiscFolder"/output.sas

# number of hooks that are evaluated at a time between restarts
increment=500
DeleteMisc=false
 
TimeLimit=-1
if [ "$#" -ge 5 ]; then
  if [ $5 == "-delete-misc" ]; then
    DeleteMisc=true
  else
    TimeLimit=$5
  fi
  if [ "$#" == 6 ]; then
    if [ $6 == "-delete-misc" ]; then
      DeleteMisc=true
    else
      TimeLimit=$6
    fi
  fi
  echo "time limit is set to ${TimeLimit}s"
fi

if [[ $DeleteMisc == true ]]; then
  echo "delete misc folders"
fi


# read config file to extract location of generator of rewritings and planner
# check if configuration file exists
if ! [[ -f "$ConfigFile" ]]; then
  echo "ERROR: No configuration file found. Please add configuration file $ConfigFile in this Folder."
  echo "exit script"
  exit 1
fi

foundPlanner=0
foundGenerator=0
while read line; do
	if [[ "$line" == RewritingGenerator=* ]]; then
		RewritingGenerator=${line#*=}	# remove everything left of and including "="
		foundGenerator=1
	fi
	if [[ "$line" == Planner=* ]]; then
		Planner=${line#*=} # remove everything left of and including "="
		foundPlanner=1
	fi
done < "$ConfigFile"

if [[ $foundPlanner == 0 ]]; then
	echo "ERROR: Configuration file $ConfigFile does not contain location of planner."
  echo "exit script"
  exit 1
fi

if [[ $foundGenerator == 0 ]]; then
	echo "ERROR: Configuration file $ConfigFile does not contain location of rewriting generator."
  echo "exit script"
  exit 1
fi


echo "start generating rewritings"

# remove the rewritings if they exists
if [[ -f "$Rewritings" ]]; then
  rm $Rewritings
fi
# remove the reasoner log if they exists
if [[ -f "$ReasonerLog" ]]; then
  rm $ReasonerLog
fi


start=0
lastSize=-1
newSize=0

TimeOut=0
MemOut=0
Exception=0

# call rewriting generator
TimeStartReasoning="$(date -u +%s.%N)"
if [ $TimeLimit == -1 ]; then
  ./computeRewritings.sh "$RewritingGenerator" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" "$ReasonerLog" "$increment" 2>"$ReasonerLog"
  # no timeout
else
  # consider timeout
  timeout "$TimeLimit"s  ./computeRewritings.sh "$RewritingGenerator" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" "$ReasonerLog" "$increment"
  if [ $? -eq 124 ]
  then
    TimeOut=1
  fi
fi


TimeEndReasoning="$(date -u +%s.%N)"
DurationReasoning="$(bc <<<"$TimeEndReasoning-$TimeStartReasoning")"

# extract stats of ontology
while read line; do
  if [[ "$line" == *"Module size"* ]]; then
		AxiomCount=${line#*: } # remove everything left of and including ":"
	fi
  if [[ "$line" == *"Number of Hooks:"* ]]; then
		HookCount=${line#*: } # remove everything left of and including ":"
	fi
  if [[ "$line" == *"Number of Fluents:"* ]]; then
		FluentCount=${line#*: } # remove everything left of and including ":"
	fi
  if [[ "$line" == *"Number of repairs:"* ]]; then
		RepairCount=${line#*: } # remove everything left of and including ":"
	fi
  if [[ "$line" == *"OutOfMemoryError"* ]]; then
    MemOut=1
    echo $line
  fi
  if [[ "$line" == *"StackOverflowError"* ]]; then
    MemOut=1
    echo $line
  fi
  if [[ "$line" == *"Exception"* ]]; then
    Exception=1
    echo $line
  fi
  
done < "$ReasonerLog"

echo "ontology size: ${AxiomCount}"
echo "hook count: ${HookCount}"
echo "fluent count: ${FluentCount}"
#echo "repair count: ${RepairCount}"

if [[ $TimeOut == 1 ]]; then
  echo "timeout for rewriting generator after $TimeLimit seconds"
  echo "reasoning time: >${TimeLimit}s"
  echo "planning time: -"
  echo "total time: -"
  # remove misc (if wished)
  if [[ $DeleteMisc == true ]]; then
    rm -r -f $MiscFolder
  fi
  exit 1
fi

if [[ $MemOut == 1 ]]; then
  echo "memory out for rewriting generator"
  echo "reasoning time: MEMOUT"
  echo "planning time: -"
  echo "total time: -"
  # remove misc (if wished)
  if [[ $DeleteMisc == true ]]; then
    rm -r -f $MiscFolder
  fi
  exit 1
fi

if [[ $Exception == 1 ]]; then
  echo "exception in rewriting generator"
  echo "reasoning time: EXCEPTION"
  echo "planning time: -"
  echo "total time: -"
  # remove misc (if wished)
  if [[ $DeleteMisc == true ]]; then
    rm -r -f $MiscFolder
  fi
  exit 1
fi


# remove the new domain if it exists
if [[ -f "$DomainNew" ]]; then
  rm $DomainNew
fi

# go through the domain line wise to insert rewritings at correct place
insertedRW=0
noLine=0   
while IFS= read -r line || [ -n "$line" ]; do
  if [[ "$line" =~ ':precondition' ]]; then
    echo "        :precondition (and" >> $DomainNew
    echo "            (not (inconsistent))" >> $DomainNew
    echo "           "${line#*:precondition} >> $DomainNew
    noLine=1
  fi
  if [[ "$line" =~ ':effect' ]]; then
    echo "        )" >> $DomainNew
  fi
  if [[ "$line" =~ '(:predicates' ]]; then
    echo "$line" >> $DomainNew
    # insert true / false / inconsistent declaration
    echo "    (false)" >> $DomainNew
    echo "    (true)" >> $DomainNew
    echo "    (inconsistent)" >> $DomainNew
    noLine=1
  fi
  if [[ "$line" =~ '(:action' && $insertedRW = 0 ]]; then
  	# insert rewritings before the first action declaration
  	echo "    (:derived (true)" >> $DomainNew
    echo "        (not (false))" >> $DomainNew
    echo "    )" >> $DomainNew
    echo "" >> $DomainNew
    cat $Rewritings >> $DomainNew
    insertedRW=1
  fi
  if [[ $noLine = 1 ]]; then
    noLine=0
  else
    echo "$line" >> $DomainNew
  fi
done < "$Domain"



# remove the new problem if it exists
if [[ -f "$ProblemNew" ]]; then
  rm $ProblemNew
fi

# add (not (inconsistent)) to goal
while IFS= read -r line || [ -n "$line" ]; do
  if [[ "$line" =~ '(:goal' ]]; then
    echo "    (:goal (and" >> $ProblemNew
    echo "        (not (inconsistent))" >> $ProblemNew
    echo "       "${line#*(:goal} >> $ProblemNew
    noLine=1
  fi
  if [[ $noLine = 1 ]]; then
    noLine=0
  else
    echo "$line" >> $ProblemNew
  fi
done < "$Problem"
echo ")" >> $ProblemNew # add closing bracket for goal

echo "created new domain"
echo "start planning"

# call planner
TimeStartPlanning="$(date -u +%s.%N)"


if [ $TimeLimit == -1 ]; then
  # run without time limit
  $Planner --plan-file $Plan --sas-file $PlannerSAS $DomainNew $ProblemNew --search "astar(blind())"  > "$PlannerLog"
else
  # time limit is shorter by amount of time used for reasoning
  RoundedDurationReasoning=${DurationReasoning%*"."*}
  TimeLimitPlanning=$((TimeLimit-RoundedDurationReasoning))
  echo "time limit for planning is $TimeLimitPlanning"

  timeout "$TimeLimitPlanning"s $Planner --plan-file $Plan --sas-file $PlannerSAS $DomainNew $ProblemNew --search "astar(blind())"  > "$PlannerLog"
  if [ $? -eq 124 ]
  then
    echo "timeout for rewriting generator after $TimeLimitPlanning seconds"
    echo "reasoning time: ${DurationReasoning}s"
    echo "planning time: >${TimeLimitPlanning}s"
    echo "total time: -"
    # remove misc (if wished)
    if [[ $DeleteMisc == true ]]; then
      rm -r -f $MiscFolder
    fi
    exit 1
  fi
fi



TimeEndPlanning="$(date -u +%s.%N)"
DurationPlanning="$(bc <<<"$TimeEndPlanning-$TimeStartPlanning")"

echo "finished planning"

RepairCount=0
# extract information from planner log
while read line; do
	if [[ "$line" == *"Plan length"* ]]; then
		LengthTemp=${line#*: } # remove everything left of and including ":"
    PlanLength=${LengthTemp% step(s).}
	fi
  if [[ "$line" == *"Evaluations:"* ]]; then
		Evaluations=${line#*: } # remove everything left of and including ":"
	fi
  if [[ "$line" == *"Search stopped without finding a solution."* ]]; then
    PlanLength="no plan"
  fi
done < "$PlannerLog"

# remove misc (if wished)
if [[ $DeleteMisc == true ]]; then
  rm -r -f $MiscFolder
fi


# print out computation times
TimeEnd="$(date -u +%s.%N)"
DurationAll="$(bc <<<"$TimeEnd-$TimeStart")"

echo "reasoning time: ${DurationReasoning}s"
echo "planning time: ${DurationPlanning}s"
echo "total time: ${DurationAll}s"

echo "analyzed states: ${Evaluations}"
echo "plan length: ${PlanLength}"

# display plan, if one was generated
if ! [[ "$PlanLength" == "no plan" ]]; then
  echo ""
  echo "Found plan:"
  cat $Plan
fi