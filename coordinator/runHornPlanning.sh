#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# ./runHornPlanning.sh FOLDER ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM [TIME-BOUND (in s)]

TimeStart="$(date -u +%s.%N)"

# read config file to find rewriter and planner
ConfigFile=config.txt


DomainFolder=$1
MiscFolder="$DomainFolder"/misc
# create folder if it does not exist yet
mkdir -p "$MiscFolder"


Ontology="$DomainFolder"/$2
Domain="$DomainFolder"/$3
Problem="$DomainFolder"/$4

# where the result should be written to
TempDomain="$MiscFolder/_temp_compiledDomain.pddl"
TempProblem="$MiscFolder/_temp_compiledProblem.pddl"
ResultDomain="$MiscFolder/generated_$3"
ResultProblem="$MiscFolder/generated_$4"

Plan="${DomainFolder}/${4%".pddl"}.plan.txt"
HornCompilerLog="$MiscFolder"/horn_compiler_log.txt
PlannerLog="$MiscFolder"/planner_log.txt
PlannerSAS="$MiscFolder"/output.sas

# check, if a time limit is provided
TimeLimit=-1
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


# read config file to extract location of Horn compiler, path to (patched) clipper and planner
# check if configuration file exists
if ! [[ -f "$ConfigFile" ]]; then
  echo "ERROR: No configuration file found. Please add configuration file $ConfigFile in this Folder."
  echo "exit script"
  exit 1
fi


foundPlanner=0
foundCompiler=0
foundClipper=0
while read line; do
	if [[ "$line" == HornCompilerFolder=* ]]; then
		HornFolder=${line#*=}	# remove everything left of and including "="
		foundCompiler=1
	fi
    if [[ "$line" == Clipper=* ]]; then
		clipper=${line#*=} # remove everything left of and including "="
		foundClipper=1
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

if [[ $foundClipper == 0 ]]; then
  echo "ERROR: Configuration file $ConfigFile does not contain location of Clipper."
  echo "exit script"
  exit 1
fi

if [[ $foundCompiler == 0 ]]; then
  echo "ERROR: Configuration file $ConfigFile does not contain location of Horn compiler."
  echo "exit script"
  exit 1
fi






# path to a (patched) clipper
#clipper="patchedClipper/clipper-distribution/target/clipper/clipper.sh"

# path to compiler.py
compiler="$HornFolder/compiler.py"
tseitin="$HornFolder/tseitin.py"

# remove the reasoner log if they exists
if [[ -f "$ReasonerLog" ]]; then
  rm $ReasonerLog
fi

echo "start compiling Horn axioms"
TimeStartReasoning="$(date -u +%s.%N)"



if [ $TimeLimit == -1 ]; then
  # no timeout
  ./compileHorn.sh "$compiler" "$clipper" "$tseitin" "$Ontology" "$Domain" "$Problem" "$TempDomain" "$TempProblem" "$ResultDomain" "$ResultProblem" "$HornCompilerLog"

else
  # consider timeout
  timeout "$TimeLimit"s ./compileHorn.sh "$compiler" "$clipper" "$tseitin" "$Ontology" "$Domain" "$Problem" "$TempDomain" "$TempProblem" "$ResultDomain" "$ResultProblem" "$HornCompilerLog"
  if [ $? -eq 124 ]
  then
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

fi


echo "finished compiling Horn axioms"
TimeEndReasoning="$(date -u +%s.%N)"
DurationReasoning="$(bc <<<"$TimeEndReasoning-$TimeStartReasoning")"



echo "start planning"
# call planner
TimeStartPlanning="$(date -u +%s.%N)"

if [ $TimeLimit == -1 ]; then
  # run without time limit
  $Planner --plan-file $Plan --sas-file $PlannerSAS $ResultDomain $ResultProblem --search "astar(blind())"  > "$PlannerLog"
else
  # time limit is shorter by amount of time used for reasoning
  RoundedDurationReasoning=${DurationReasoning%*"."*}
  TimeLimitPlanning=$((TimeLimit-RoundedDurationReasoning))
  timeout "$TimeLimitPlanning"s  $Planner --plan-file $Plan --sas-file $PlannerSAS $ResultDomain $ResultProblem --search "astar(blind())"  > "$PlannerLog"
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