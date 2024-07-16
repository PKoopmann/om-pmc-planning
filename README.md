# Ontology-Mediated Planning (ECAI 2024 evaluation)

## Structure
- om-pmc-formula-generation
    - project that contains the generator for the rewritings
- coordinator:
    - contains script to construct plans for examples
- coordinator/evaluation:
    - contains script to analyze generated benchmark documentations
- examples:
    - set of examples
- ECAI-evaluation:
    - benchmark runs that are the foundation of the evaluation in our paper "Planning with OWL-DL Ontologies" published at ECAI 2024

## Usage
- go to folder "coordintor"
- run the script by calling: `./runOMPlanning.sh <folder-of-example> <name-of-file-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>`
- the generated plan will be in the folder of the example

## Installation
see file `Installation.md`

## Requirements
- We use the [Fast Downward planner](https://www.fast-downward.org/HomePage) to solve the planning problems. See also the [dependencies](https://www.fast-downward.org/ObtainingAndRunningFastDownward) of this planner. We tested our system with the release version 22.12 that we needed to slightly modify and can be obtained via [this fork](https://github.com/remaro-network/downward/tree/release_22_12_0). Download all the files and put them in a folder `downward-release-22.12.0-patched` in the same folder as this readme and build the planner by running `./build.py`. If you change the name of the folder or use a different location, you need to provide the correct path to the `fast-downward.py` script in `Coordinator/config.txt`.
- some JRE (version?)
