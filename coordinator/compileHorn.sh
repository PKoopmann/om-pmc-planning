#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./compileHorn.sh COMPILER CLIPPER TSEITIN ONTOLOGY PDDL-DOMAIN PDDL-PROBLEM TEMP-DOMAIN TEMP-PROBLEM RESULT-DOMAIN RESULT-PROBLEM LOG-FILE

compiler=$1
clipper=$2
tseitin=$3
Ontology=$4
Domain=$5
Problem=$6
TempDomain=$7
TempProblem=$8
ResultDomain=$9
ResultProblem=${10}
LogFile=${11}


# remove the reasoner log if they exists
if [[ -f "$LogFile" ]]; then
  rm $LogFile
fi


# run compilation
python3 "$compiler" "$Ontology" "$Domain" "$Problem" -d "$TempDomain" -p "$TempProblem" --clipper "$clipper" --clipper-mqf -v >> $LogFile 2>&1

# run tseitin transformation
python3 "$tseitin" "$TempDomain" "$TempProblem" -d "$ResultDomain" -p "$ResultProblem" -v >> $LogFile

rm "$TempDomain" "$TempProblem"