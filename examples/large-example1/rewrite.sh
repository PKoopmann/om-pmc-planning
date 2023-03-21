#! /bin/bash

for start in 0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000
do
    end=$((start+100))

    java -cp ../../ontology-mediated-pmc-assembly-0.2.jar de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions -pddl fluents.txt hooks.txt TTL5-5.ttl output.txt $start $end
done
