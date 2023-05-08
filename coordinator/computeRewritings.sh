#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./computeRewritings.sh FOLDER ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM 

RewritingGenerator=$1
Fluents=$2
Hooks=$3
Ontology=$4
Rewritings=$5
ReasonerLog=$6
increment=$7


start=0
lastSize=-1
newSize=0


while ((lastSize!=newSize))
do

  #echo $lastSize $newSize $start
  lastSize=$newSize
  
  end=$((start+increment))

  echo "compute hooks $start til $end"
  # possible options: -Xmx16g (increase RAM limit)
  java -Xmx8g -cp "$RewritingGenerator" de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions "-pddl" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" $start $end >> "$ReasonerLog" 2>>"$ReasonerLog"
  #java -cp "$RewritingGenerator" de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions "-pddl" "$Fluents" "$Hooks" "$Ontology" "$Rewritings" >> "$ReasonerLog"

  start=$end
    
  newSize=`stat -c%s "$Rewritings"` 
done
