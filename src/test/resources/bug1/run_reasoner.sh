#!/bin/bash


java -jar ontology-mediated-pmc-assembly-0.2.jar fluents.txt hooks_bad.txt bug.ttl rewritings_bad.txt


java -jar ontology-mediated-pmc-assembly-0.2.jar fluents.txt hooks_good.txt bug.ttl rewritings_good.txt
