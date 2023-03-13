# Ontology-Mediated Planning

- add some general information… 

## Requirements
- We use the [Fast Downward planner](https://www.fast-downward.org/HomePage) to solve the planning problems. See also the [dependencies](https://www.fast-downward.org/ObtainingAndRunningFastDownward) of this planner. Obtain the planner by downloading the code from [github](https://github.com/aibasel/downward/). We tested our system with the release version 22.12 that can be found [here](https://github.com/aibasel/downward/releases/tag/release-22.12.0). Extract all the files and put them in a folder in the same folder as this readme and build the planner by running `./build.py`. If you choose a different release version or change the name of the folder, you need to provide the correct path to the `fast-downward.py` script in `Coordinator/config.txt`.
- some JRE (version?)

## Structure
- om-pmc-formula-generation
    - project that contains the generator for the rewritings
- coordinator:
    - contains script to construct plans for examples
- examples:
    - set of examples

## Usage
- go to folder "coordintor"
- run the script by calling: `./runOMPlanning.sh <folder-of-example> <name-of-file-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>`
- the generated plan will be in the folder of the example
