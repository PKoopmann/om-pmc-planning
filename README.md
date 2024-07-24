# Ontology-Mediated Planning

This repository contains a tool for planning w.r.t. to OWL ontologies. The implementation is based on the approach discussed our paper "Planning with OWL-DL Ontologies" (presented at ECAI 2024).

## Usage
### Docker
The easiest way to use our tool is to download the docker iamge provided on [Zenodo](https://doi.org/10.5281/zenodo.12799965). 

1. obtain the container image `omplan.tar` using this [download link](https://zenodo.org/records/12799965/files/omplanner.tar?download=1)
2. load image `docker load -i omplan.tar`
3. use `docker run omplan` to solve ontology-mediate planning problems
    - run examples from repository:
      ```
      docker run omplan <directory-of-files> <name-of-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>
      ```
    - run using your own files by mounting the directory from your machine:
       ```
      docker run -v <directory-on-your-machine>:<directory-in-container> omplan <directory-of-files> <name-of-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>
       ```
    - the tool expects a `fluents.txt` and a `hooks.txt` file in the folder that specify the interface between the planning domain / problem and the ontology. To see an example how to specify the interfacr, you should have a look at the [blocksworld domain](examples/blocksworld/10-0).
    - the plan (if found) is output on the terminal and saved in the specified folder

#### Options
- automatically, a folder `misc` is created, to save the intermediate PDDL files and log files. If you wish to automatically delete them, you can append `-delete-misc` to the arguments
- if you want to provide a time limit, you can add the number of seconds
- overall, this might look like this (60s time limit for planning and `misc` folder gets deleted):
  ```
  docker run omplan examples/performance_check/pipesA-8 pipesA-8.ttl pipes.pddl pipesProblemA-8.pddl 60 -delete-misc
  ```

### Usage without Docker
1. see file `Installation.md` for instructions how to set up the tool correctly

1. run the tool by calling:
   ```
   ./omPlanner.sh <directory-of-files> <name-of-ontology-file> <name-of-PDDL-domain-file> <name-of-PDDL-problem-file>
   ```
  e.g. 
  ```
./omPlanner.sh examples/performance_check/pipesA-8 pipesA-8.ttl pipes.pddl pipesProblemA-8.pddl
  ```
- the generated plan will be saved to the specified folder
- the tool builds the necessary `.jar` file if it does not exist yet, if you change the source code you have to manually run `sbt assembly` to generate a new `.jar`
- the options are the same as for running the tool with docker


## Evaluation ECAI 2024 paper
- the files with the results of the evaluation for our ECAI 2024 paper and instructions on how to reproduce them can be found in the branch [ecai](https://github.com/PKoopmann/om-pmc-planning/tree/ecai)
