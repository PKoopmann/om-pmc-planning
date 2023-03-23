#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./insertPDDLRewritings.sh FOLDER ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM [TIME-BOUND (in s)]





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

Plan="$DomainFolder"/plan.txt
PlannerLog="$MiscFolder"/planner_log.txt
PlannerSAS="$MiscFolder"/output.sas

# number of hooks that are evaluated at a time between restarts
increment=50

TimeLimit=-1
if [ "$#" == 5 ]; then
  TimeLimit=$5
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

# call rewriting generator
TimeStartReasoning="$(date -u +%s.%N)"

while ((lastSize!=newSize))
do

  #echo $lastSize $newSize $start
  lastSize=$newSize
  
  end=$((start+increment))

  echo "compute hooks $start til $end"
  # possible options: -Xmx16g (increase RAM limit)
  if [ $TimeLimit == -1 ]; then
    # run without time limit
    java -cp "$RewritingGenerator" de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions "-pddl" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" $start $end >> "$ReasonerLog"
  else
    timeout "$TimeLimit"s java -cp "$RewritingGenerator" de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions "-pddl" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" $start $end >> "$ReasonerLog"
  fi

  start=$end
    
  newSize=`stat -c%s "$Rewritings"` 

done


TimeEndReasoning="$(date -u +%s.%N)"
DurationReasoning="$(bc <<<"$TimeEndReasoning-$TimeStartReasoning")"

if [ -s "$Rewritings" ]; then
  echo "generated rewritings"
else
  # no rewritings were created
  echo "timeout for rewriting generator after $TimeLimit seconds"
  echo "exit script"
  exit 1
fi





# remove the new domain if it exists
if [[ -f "$DomainNew" ]]; then
  rm $DomainNew
fi

# go through the domain line wise to insert rewritings at correct place
insertedRW=0
noLine=0   
while IFS= read line; do
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
while IFS= read line; do
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

# call planner
TimeStartPlanning="$(date -u +%s.%N)"

if [ $TimeLimit == -1 ]; then
  # run without time limit
  $Planner --plan-file $Plan --sas-file $PlannerSAS $DomainNew $ProblemNew --search "astar(blind())"  > "$PlannerLog"
else
  $Planner --overall-time-limit "$TimeLimit"s --plan-file $Plan --sas-file $PlannerSAS $DomainNew $ProblemNew --search "astar(blind())"  > "$PlannerLog"
fi

TimeEndPlanning="$(date -u +%s.%N)"
DurationPlanning="$(bc <<<"$TimeEndPlanning-$TimeStartPlanning")"

echo "called planner"



# print out computation times
TimeEnd="$(date -u +%s.%N)"
DurationAll="$(bc <<<"$TimeEnd-$TimeStart")"

echo "reasoning time: ${DurationReasoning}s"
echo "planning time: ${DurationPlanning}s"
echo "total time: ${DurationAll}s"


