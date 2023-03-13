# author: Tobias John
# affiliation: University of Oslo
# February 2022

# small skript to take the numerical hooks from a .csv file and transform them into a PRISM formula
# CAVE! : only for xsd:decimal and the default value is 0.0

import csv
import sys


def parse_decimal(decimal):
    
    elements = decimal.split('^')
    if (elements[1] != 'xsd:decimal'):
        print("ERROR: program can only handle decimal numbers!")
        return 0.0
    else:
        # get rid of the quotation marks
        return elements[0][1:-1]

def create_selection(pairs):
    if pairs == []:
        return "0.0"
    else:
        (value, condition) = pairs[0]
        return "((" + condition +") ? " + str(value) + " : " + create_selection(pairs[1:]) + ")"


def create_formulas(inputfile, outputfile):
    # mapping from hook names to pairs of (value, condition)
    rewritings = {}
    # opening the CSV file
    with open(inputfile, mode ='r', encoding='utf-16') as file:
    
        # reading the CSV file
        csvFile = csv.reader(file, delimiter='\t')
        
    
        line_count = 0
        # displaying the contents of the CSV file
        for line in csvFile:
            if line_count == 0:
                line_count += 1
            else:
                line_count += 1
                hook = line[0]
                value = line[1]
                condition = line[2]
                pairs = [(parse_decimal(value), condition)]
                if hook in rewritings.keys():
                    old_pairs = rewritings[hook]
                    for pair in old_pairs:
                        pairs.append(pair)
                rewritings[hook] = pairs
    
    with open(outputfile, mode='w', encoding='utf-8') as file:
        # build strings
        for key in rewritings.keys():
            pairs = rewritings[key]
            formula = "formula " + key + " = " + create_selection(pairs) + ";"
            file.write(formula)
    




# create_formulas(.csv-file=input, .txt-file=output)
create_formulas(sys.argv[1], sys.argv[2])

