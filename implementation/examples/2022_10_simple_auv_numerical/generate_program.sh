#!/bin/bash

Rewritings=rewritings.txt
RewritingsCSV=rewritings.csv
Fluents=fluents.txt
Hooks=hooks.txt
Ontology=simple_auv_numerical.owl

Folder=$1


# first case
echo "start generating DL rewritings"
# in the third case, we have to create a .csv file
#if [ $Folder = "./case3" ]; then
	#java -jar ontology-mediated-pmc-assembly-0.1.5.jar "$Folder/$Fluents" "$Folder/$Hooks" $Ontology "$Folder/$RewritingsCSV" > "$Folder/reasoner_log.txt"
#else
	#java -jar ontology-mediated-pmc-assembly-0.1.5.jar "$Folder/$Fluents" "$Folder/$Hooks" $Ontology "$Folder/$Rewritings" > "$Folder/reasoner_log.txt"
#fi

echo "finished generating DL rewritings (written to $Folder/$Rewritings)"

# call method to translate .scv to PRISM rewriting if necessary
if [ $Folder = "./case3" ]; then
	python3 csv_to_PRISM_rewriting.py "$Folder/$RewritingsCSV" "$Folder/$Rewritings"
fi

echo "apply rewritings"
./apply_rewritings.sh "$Folder/abstract_auv_control.prism" "$Folder/auv_control.prism" "$Folder/$Rewritings"
echo "finished apllying rewritings"

echo "do model checking"
prism "$Folder/auv_control.prism" -pf "Rmax=? [ F (abort) ]" > "$Folder/MC_result.txt"
echo "finished model checking (written to $Folder/MC_result.txt)"
echo "———————————————————————————————————————————"
