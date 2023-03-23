#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./runFDPlanner.sh FOLDER PDDL-DOMAIN PDDL-PROBLEM [TIME-LIMIT]





TimeStart="$(date -u +%s.%N)"


# read config file to find rewriter and planner
ConfigFile=config.txt

# read config file to extract location of generator of rewritings and planner
# check if configuration file exists
if ! [[ -f "$ConfigFile" ]]; then
  echo "ERROR: No configuration file found. Please add configuration file $ConfigFile in this Folder."
  echo "exit script"
  exit 1
fi

foundPlanner=0
while read line; do
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



DomainFolder=$1
Domain="$DomainFolder"/$2
Problem="$DomainFolder"/$3

MiscFolder="$DomainFolder"/misc
# create folder if it does not exist yet
mkdir -p "$MiscFolder"

Plan="$DomainFolder"/plan.txt
PlannerLog="$MiscFolder"/planner_log.txt
PlannerSAS="$MiscFolder"/output.sas

TimeLimit=-1
if [ "$#" == 4 ]; then
  TimeLimit=$4
fi

# call planner
TimeStartPlanning="$(date -u +%s.%N)"

if [ $TimeLimit == -1 ]; then
  # run without time limit
  $Planner --plan-file $Plan --sas-file $PlannerSAS $Domain $Problem --search "astar(blind())"  > "$PlannerLog"
else
  $Planner --overall-time-limit "$TimeLimit"s --plan-file $Plan --sas-file $PlannerSAS $Domain $Problem --search "astar(blind())"  > "$PlannerLog"
fi

TimeEndPlanning="$(date -u +%s.%N)"
DurationPlanning="$(bc <<<"$TimeEndPlanning-$TimeStartPlanning")"

echo "called planner"


echo "planning time: ${DurationPlanning}s"



