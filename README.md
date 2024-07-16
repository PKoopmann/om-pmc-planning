# Ontology-Mediated Planning (ECAI 2024 evaluation)

## ECAI Evaluation
- can be found in folder [ECAI-evaluation](/ECAI-evaluation)
- we measured the times for reasoning, planning and the total time as well as some metrics of the generated plan and the analyzed ontology
- the results of the benchmark runs for the different algorithms can be found in different files in the folder:
    - basic algorithm: [benchmarkAll_BasicOM_2024_04_15.csv](ECAI-evaluation/benchmarkAll_BasicOM_2024_04_15.csv)
    - concept-based algorithm: [benchmarkAll_ConceptOM_2024_04_19.csv](ECAI-evaluation/benchmarkAll_ConceptOM_2024_04_19.csv)
    - schema-based algorithm: [benchmarkAll_Schema_Horn_2024_04_11.csv](ECAI-evaluationbenchmarkAll_Schema_Horn_2024_04_11.csv) (method: om_planning)
    - horn algorithm: [benchmarkAll_Schema_Horn_2024_04_11.csv](ECAI-evaluationbenchmarkAll_Schema_Horn_2024_04_11.csv) (method: horn_planning)

## Reproduction of Benchmark Runs
- Note: reproducing the evaluation takes several hours (in our experiments, it was about 100h on a server with an Intel Xeon Gold 5118 CPU @2.30GHz)
### Schema-Based Algorithm and Horn
1. build the tool by running `sbt assembly`
1. go to folder [coordinator](coordinator)
2. run `./runBenchmark.sh benchmarkAllECAI.csv 1800`
3. output will be written to a a file in a folder [benchmark_runs](benchmark_runs)

### Basic and Concept-Based Algorithm
1. edit line 24 in [FormulaGenerator.scala](implementation/src/main/scala/de/tu_dresden/inf/lat/om_pmc/formulaGeneration/FormulaGenerator.scala)
   - use `var explanationMethod = Methods.INC_BASED` for basic algorithm
   - use `var explanationMethod = Methods.CLASS_BASED` for concept-based algorithm
1. build the tool by running `sbt assembly`
1. go to folder [coordinator](coordinator)
2. run `./runBenchmark.sh benchmarkAllOmECAI.csv 1800`
3. output will be written to a a file in a folder [benchmark_runs](benchmark_runs)
 
## General Structure
- implementation
    - project that contains the generator for the rewritings
- coordinator:
    - contains script to construct plans for examples
- coordinator/evaluation:
    - contains script to analyze generated benchmark documentations
- examples:
    - set of examples

## Usage
- we recommend using the version of the tool from the [main branch](https://github.com/PKoopmann/om-pmc-planning/tree/main)
- if you wish to use the specific version of the ECAI evaluation:
    - go to folder "coordintor"
    - run the script by calling: `./runOMPlanning.sh <folder-of-example> <name-of-file-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>`
    - the generated plan will be in the folder of the example

## Installation
see file `Installation.md`

## Planner
- We use the [Fast Downward planner](https://www.fast-downward.org/HomePage) to solve the planning problems. See also the [dependencies](https://www.fast-downward.org/ObtainingAndRunningFastDownward) of this planner. We tested our system with the release version 22.12 that we needed to slightly modify and can be obtained via [this fork](https://github.com/remaro-network/downward/tree/release_22_12_0). Download all the files and put them in a folder `downward-release-22.12.0-patched` in the same folder as this readme and build the planner by running `./build.py`. If you change the name of the folder or use a different location, you need to provide the correct path to the `fast-downward.py` script in `Coordinator/config.txt`.
