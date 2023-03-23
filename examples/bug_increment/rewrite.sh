#! /bin/bash

outputfile=output.txt
increment=25

rm output.txt

start=0
lastSize=-1
newSize=0

while ((lastSize!=newSize))
do

    echo $lastSize $newSize $start

    lastSize=$newSize
    
    end=$((start+increment))

    java -cp ../../ontology-mediated-pmc-assembly-0.2.jar de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions -pddl fluents.txt hooks.txt drone5-5.ttl $outputfile $start $end

    start=$end
    
    newSize=`stat -c%s "$outputfile"`

    echo $lastSize $newSize $start
    
done
