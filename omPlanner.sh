#!/bin/bash

# usage: ./omPlanner.sh DIR ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM [TIME-BOUND (in s) DELETE-MISC]
# cave: as current: option -delete-misc can only be added if time bound is used

# DIR: directory in which planner searches for ontology, domain and problem; also the directory where plan is created at

# build source code if .jar does not exist yet
tool=implementation/target/scala-2.12/ontology-mediated-pmc-assembly-0.2.jar
if ! [[ -f "$tool" ]]; then
    cd implementation
	sbt assembly
	cd ..
fi




# transform relative path, because we are going to change the dirctory
Dir=$1
if ! [[ "$Dir" = /* ]]; then
	Dir="../$Dir"
fi

# call planner
cd coordinator
./runOMPlanning.sh $Dir "${@:2}"




