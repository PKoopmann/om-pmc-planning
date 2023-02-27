#!/bin/bash

Inputfile=$1
Outputfile=$2
Rewritings=$3

python3 rewriter_PRISM.py $Inputfile $Outputfile $Rewritings
