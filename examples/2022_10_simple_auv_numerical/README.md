# Short Documentation

There are three cases / levels of using numerical values that are considered here. I assume that the implementation effort grows with every level. 

Implementing the feature of Case 2 would at the same time allow to deal with Case 1 (only syntax of fluent file would need to be modified).

Case 3 is more different: assumes that a `.csv` file is create that contains the rewritings. Therefore, the postprocessing of the rewritings for PRISM is a bit different.

## (some of the) Files
- `simple_auv_numerical.owl` is the ontology. Is rather simple: contains a robot (called AUV) that can detect a whale which can have several weights. And the robot has two capabilities:
	- to make pictures if it is sunny (leads in 90% of tries to a good result)
	- to make pictures if it is cloudy (leads in 50% of tries to a good result)
- `generate_program.sh` short skript that takes folder of the case to consider as an argument and runs creating rewritings, applying rewritings to PRISM models and using PRISM to do one simple verification (to speed up testing)
- `csv_to_PRISM_rewriting.py` Python skript to do the rewriting from a `.csv` file to PRISM formulas for case 3


## Cases
### Case 1
#### Idea
- weight of whale depends on a fluent
- this has impact on whether the robot will surface or not
- measured property: how long is expected mission time

#### Requires Feature
- use property assertions in fluents (would be also nice in hooks)

#### Benefit
- allows to change numerical values in the ontology from the programming component

### Case 2
#### Idea
- weight of whale depends on a fluent
- this has impact on whether the robot will surface or not
- difference to case 1: we query in hook directly whether weight of whale is above certain threshold
- measured property: how long is expected mission time

#### Requires Feature
- use general axioms in hooks (would also be nice in fluents)
- in this example I used Manchester syntax but maybe another syntax is more suitable (?)

#### Benefit
- allows to query in hooks about whether numerical values satisfy given bounds

### Case 3
#### Idea
- robot has either one of two capabilities (depending on weather)
- we want to query for the probability that trying to make a picture results in a good result
- measured property: expected number of good pictures

#### Requires Feature
- to query for a numerical value in a hook
	- my idea: use 
	`<nameOfVariableInProgram>=?x := <axiom where "?x" occurs at wanted value>`
	- "?" would mark that this term is a variable and "x" could be any name one would like; the axiom could be in Manchester Syntax (see hook file)
- output format for the hook
	- my idea: use `.csv` instead of text file, e.g. with three columns (the name of the variable in the program (hook), the possible value and the condition (i.e., the rewriting that leads to this value))
	- the value could be `true` for a "traditional" boolean hook
	- result could be e.g. the following
	
| hook        | value                     | condition       |
|-------------|---------------------------|-----------------|
| hookWeight  | "40"\^xsd:integer  | moby_heavy=true |
| hookWeight  | "10"\^xsd:integer | moby_heavy=false |

#### Benefit
- allows to extract numerical values that depend on configuration of fluents
- programmers could decide how to further process this rewriting result to their needs (especially important because the cases described by "condition" might overlap and there should be a default value to be set by the programmer if no condition is applicable)
        