#! /bin/bash

outputfile=output.txt
increment=100

rm output.txt

start=0
lastSize=-1
newSize=0

while ((lastSize!=newSize))
do

    lastSize=$newSize
    
    end=$((start+increment))

    java -cp ../../implementation/target/scala-2.12/ontology-mediated-pmc-assembly-0.2.jar de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions -pddl fluents.txt hooks.txt queens5-1.ttl $outputfile $start $end

    start=$end
    
    newSize=`stat -c%s "$outputfile"`

    echo $lastSize $newSize $start
    
done

outputfile=output_good.txt
increment=100

rm output_good.txt

start=0
lastSize=-1
newSize=0

while ((lastSize!=newSize))
do

    echo $lastSize $newSize $start

    lastSize=$newSize
    
    end=$((start+increment))

    java -cp ../../implementation/target/scala-2.12/ontology-mediated-pmc-assembly-0.2.jar de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions -pddl fluents.txt hooks_good.txt queens5-1.ttl $outputfile $start $end

    start=$end
    
    newSize=`stat -c%s "$outputfile"`

    echo $lastSize $newSize $start
    
done
