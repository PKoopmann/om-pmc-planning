#!/bin/bash
# author: Tobias John, University of Oslo
# year: 2023

# usage: ./runBenchmarkBackground.sh BENCHMARK-FILE TIME-BOUND [s]
# output will be put in folder ../benchmark_runs/NAME___.csv


nohup ./runBenchmark.sh $1 $2 >temp.log 2>temp.log </dev/null &
