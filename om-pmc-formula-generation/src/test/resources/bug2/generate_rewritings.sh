#!/bin/bash

Rewritings1=rewritings_1.txt
Rewritings2=rewritings_2.txt

echo "start generating DL rewritings 1"
java -jar ontology-mediated-pmc-assembly-0.2.jar fluents1.txt hooks.txt bugs.owl $Rewritings1 > reasoner_log_1.txt
echo "finished generating DL rewritings (written to $Rewritings1)"

echo "start generating DL rewritings 2"
java -jar ontology-mediated-pmc-assembly-0.2.jar fluents2.txt hooks.txt bugs.owl $Rewritings2 > reasoner_log_2.txt
echo "finished generating DL rewritings (written to $Rewritings2)"




