#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./runBenchmark.sh BENCHMARK-FILE TIME-BOUND [s] [-delete-misc]
# output will be put in folder ../benchmark_runs/NAME___.csv

TimeStart="$(date -u +%s.%N)"


benchmarks=$1
TimeBound=$2
DeleteMisc=${3: }


hostname=$(hostname)
directory="../benchmark_runs/${hostname}"
# create folder if it does not exist yet
mkdir -p "$directory"
name="${1%".csv"}_$(date +'%Y_%m_%d_%H_%M')"
logName="${1%".csv"}_$(date +'%Y_%m_%d_%H_%M')_log"
result="${directory}/${name}.csv"
log="${directory}/${logName}.txt"
tempLog="${directory}/${logName}_temp.txt"


echo "run benchmarks from file $benchmarks with a time limit of ${TimeBound}s."
echo "start time: $(date +'%d.%m.%Y at %H:%M')"
echo "start time: $(date +'%d.%m.%Y at %H:%M')" >> $log
echo "result will be written to $result"

read -r head < "$benchmarks"
if [[ $head != "id,method,name,folder,ontology,domain,problem" ]]; then
    echo "ERROR: benchmark file needs the following header:"
    echo "id,method,name,folder,ontology,domain,problem"
    echo "terminating bechmark skript"
    exit 1
fi

echo "id,method,name,folder,ontology,domain,problem,reasoning_time,planning_time,total_time,plan_length,analyzed_states,ontology_axioms,hooks,fluents,repairs" > $result

while IFS="," read -r id method name folder ontology domain problem
do
  runPlanner=0
  # run planning
  if [[ $method == "om_planning" ]]; then
    echo "run ontology mediated planning for example with id ${id} (folder: ${folder})"
    echo "run ontology mediated planning for example with id ${id} (folder: ${folder})" >> $log

    runPlanner=1
    ./runOMPlanning.sh $folder $ontology $domain $problem $TimeBound $DeleteMisc >"$tempLog" 2>"$tempLog"
  else if [[ $method == "horn_planning" ]]; then
    echo "run horn planning for example with id ${id} (folder: ${folder})"
    echo "run horn planning for example with id ${id} (folder: ${folder})" >> $log

    runPlanner=1
    ./runHornPlanning.sh $folder $ontology $domain $problem $TimeBound $DeleteMisc >"$tempLog" 2>"$tempLog"
  else
    echo "ERROR: can not parse example with id ${id}. 'method' needs to be 'om_planning' or 'horn_planning'"
  fi fi

  # extract results
  reasoningTime="-"
  planningTime="-"
  planLength="-"
  analyzedStates="-"
  ontologySize="-"
  hookCount="-"
  fluentCount="-"
  repairCount="-"
  if [[ $runPlanner == 1 ]] ; then
    runPlanner=0
    while read line; do
        if [[ "$line" == reasoning\ time:* ]]; then
            reasoningTime=${line#*:} # remove everything left of and including ":
        fi
        if [[ "$line" == planning\ time:* ]]; then
            planningTime=${line#*:}	# remove everything left of and including ":"
        fi
        if [[ "$line" == total\ time:* ]]; then
            totalTime=${line#*:}	# remove everything left of and including ":""
        fi
        if [[ "$line" == analyzed\ states:* ]]; then
            analyzedStates=${line#*:}	# remove everything left of and including ":""
        fi
        if [[ "$line" == plan\ length:* ]]; then
            planLength=${line#*:}	# remove everything left of and including ":""
        fi
        # the following parameters are only relevant for interface based planning
        if [[ "$line" == ontology\ size:* ]]; then
            ontologySize=${line#*:}	# remove everything left of and including ":""
        fi
        if [[ "$line" == hook\ count:* ]]; then
            hookCount=${line#*:}	# remove everything left of and including ":""
        fi
        if [[ "$line" == fluent\ count:* ]]; then
            fluentCount=${line#*:}	# remove everything left of and including ":""
        fi
        if [[ "$line" == repair\ count:* ]]; then
            repairCount=${line#*:}	# remove everything left of and including ":""
        fi
    done < "$tempLog"

    echo ${id},${method},$name,$folder,$ontology,$domain,$problem,${reasoningTime%s},${planningTime%s},${totalTime%s},${planLength},${analyzedStates},${ontologySize},${hookCount},${fluentCount},${repairCount} >> $result

    cat $tempLog >> $log
    rm $tempLog
  fi

done < <(tail -n +2 "$benchmarks")

TimeEnd="$(date -u +%s.%N)"
Duration="$(bc <<<"$TimeEnd-$TimeStart")"

echo "total time to run benchmark set: ${Duration}s"
echo "total time to run benchmark set: ${Duration}s" >> $log