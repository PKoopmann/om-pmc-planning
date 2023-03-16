#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./insertPDDLRewritings.sh FOLDER ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM




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




# read config file to extract location of generator of rewritings and planner
# check if configuration file exists
if ! [[ -f "$ConfigFile" ]]; then
  echo "ERROR: No configuration file found. Please add configuration file $ConfigFile in this Folder."
  echo "exit skript"
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
  echo "exit skript"
  exit 1
fi

if [[ $foundGenerator == 0 ]]; then
	echo "ERROR: Configuration file $ConfigFile does not contain location of rewriting generator."
  echo "exit skript"
  exit 1
fi



# call rewriting generator
TimeStartReasoning="$(date -u +%s.%N)"

# possible options: -Xmx16g (increase RAM limit)
java -jar "$RewritingGenerator" "-pddl" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" >  "$ReasonerLog"

TimeEndReasoning="$(date -u +%s.%N)"
DurationReasoning="$(bc <<<"$TimeEndReasoning-$TimeStartReasoning")"
echo "generated rewritings"


# check if new domain already exists; if so: try to append a number to the file until new domain can be created
# disable for now...
#i=0
#changed=0
#DomainNewI="$DomainNew"
#while [[ -f "$DomainNewI" ]]; do
#	changed=1
#	DomainNewI="$DomainNew"_$i.pddl
#	((i=i+1))
#done
#
#if [[ $changed == 1 ]]; then
#	echo "WARNING: New domain $DomainNew already exists. New domain will be saved to $DomainNewI instead."
#	DomainNew=$DomainNewI
#fi


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

$Planner --plan-file $Plan --sas-file $PlannerSAS $DomainNew $ProblemNew --search "astar(blind())"  > "$PlannerLog"

TimeEndPlanning="$(date -u +%s.%N)"
DurationPlanning="$(bc <<<"$TimeEndPlanning-$TimeStartPlanning")"

echo "called planner"



# print out computation times
TimeEnd="$(date -u +%s.%N)"
DurationAll="$(bc <<<"$TimeEnd-$TimeStart")"

echo "reasoning time: ${DurationReasoning}s"
echo "planning time: ${DurationPlanning}s"
echo "total time: ${DurationAll}s"


