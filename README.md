# Ontology-Mediated Planning

This repository contains a tool for planning w.r.t. to OWL ontologies. The implementation is based on the approach discussed our paper "Planning with OWL-DL Ontologies" (presented at ECAI 2024).

## Usage
- run the tool by calling: `./omPlanner.sh <folder-of-files> <name-of-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>`

  e.g. `./omPlanner.sh examples/performance_check/pipesA-8 pipesA-8.ttl pipes.pddl pipesProblemA-8.pddl`
- the generated plan will be saved to the specified folder
- the tool builds the necessary `.jar` file if it does not exist yet, if you change the source code you have to manually run `sbt assembly` to generate a new `.jar`

### Options
- automatically, a folder `misc` is created, to save the intermediate PDDL files and log files. If you wish to automatically delete them, you can append `-delete-misc`to the arguments
- if you want to provide a time limit, you can add the number of seconds
- overall, this might look like this (60s time limit for planning and `misc` folder gets deleted):
`./omPlanner.sh examples/performance_check/pipesA-8 pipesA-8.ttl pipes.pddl pipesProblemA-8.pddl 60 -delete-misc`

## Evaluation ECAI 2024 paper
- the files with the results of the evaluation for our ECAI 2024 paper and instructions on how to reproduce them can be found in the branch [ecai](https://github.com/PKoopmann/om-pmc-planning/tree/ecai)

## Installation
see file `Installation.md`

## Requirements
- We use the [Fast Downward planner](https://www.fast-downward.org/HomePage) to solve the planning problems. See also the [dependencies](https://www.fast-downward.org/ObtainingAndRunningFastDownward) of this planner. Obtain the planner by downloading the code from [github](https://github.com/aibasel/downward/). We tested our system with the release version 22.12 that we needed to slightly modify and can be obtained via [this fork](https://github.com/remaro-network/downward/tree/release_22_12_0). Download all the files and put them in a folder `downward-release-22.12.0-patched` in the same folder as this readme and build the planner by running `./build.py`. If you change the name of the folder or use a different location, you need to provide the correct path to the `fast-downward.py` script in `Coordinator/config.txt`.
- some JRE (version?)

## Structure
- om-pmc-formula-generation
    - project that contains the generator for the rewritings
- coordinator:
    - contains script to construct plans for examples
- coordinator/evaluation:
    - contains script to analyze generated benchmark documentations
- examples:
    - set of examples
