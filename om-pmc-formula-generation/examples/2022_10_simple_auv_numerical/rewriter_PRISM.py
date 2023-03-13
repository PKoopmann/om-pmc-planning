# author: Tobias John
# affiliation: University of Oslo
# February 2022

# small skript to insert the hooks in a RPSIM program with the correct rewritings

# inserts lines of rewriting files between the specific (comment) lines
# // begin Hook rewritings
# // end Hook rewritings
# in the PRISM file

# CAVE: not very sophisticated, i.e. only works with PRISM programs; 
# does not check for mutliple occurences of specific lines;...
from operator import ne
from pydoc import doc
import sys

# rewrites the strings in the file 'source' into 'target'
# 'rewritings' contains all the rewritings that we want to aplly
def insert (path_source, path_target, path_rewritings):
    new_lines = []
    with open(path_source, "r") as source:
        lines = source.readlines()
        between_identifiers = False
        for line in lines:

            if line.startswith("// begin Hook rewritings"):
                between_identifiers = True
                new_lines.append(line)

            elif line.startswith("// end Hook rewritings"):
                between_identifiers = False
                with open(path_rewritings, "r") as rewritings:
                    rewrite_rules = rewritings.readlines()
                    for rewrite_rule in rewrite_rules:
                        rule = rewrite_rule[:-1].replace("||", "|")
                        new_lines.append(rule+";"+"\n")
                new_lines.append(line)

            elif not between_identifiers:
                new_lines.append(line)

    with open (path_target, "w") as target:
        target.writelines(new_lines)   


#replace("abstract_auv_control.prism", "auv_control.prism", "rewritings.txt")
insert(sys.argv[1], sys.argv[2], sys.argv[3])