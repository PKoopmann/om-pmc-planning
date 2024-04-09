package com.clarkparsia.owlapi.explanation;


import org.semanticweb.HermiT.ReasonerFactory;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.util.OWLAPIPreconditions;


import javax.annotation.Nonnegative;
import java.util.*;
import java.util.stream.Collectors;


/**
 * HST explanation generator.
 */

// use MupsTrackingHSTExplanationGenerator instead (faster)
public class SchemaHSTExplanationGenerator extends com.clarkparsia.owlapi.explanation.RestrictionHSTExplanationGenerator
        implements MultipleExplanationGenerator {


    // attributes to do some forward reasoning
    // disconnect from other ontology to make memory freeing easier
    private final OWLOntologyManager forwardManager = OWLManager.createOWLOntologyManager();
    private OWLOntology forwardOntology  = forwardManager.createOntology();
    private final ReasonerFactory rf = new ReasonerFactory();
    private OWLReasoner forwardReasoner = rf.createReasoner(forwardOntology);
    private final OWLDataFactory owlFactory = forwardManager.getOWLDataFactory();
    private final Set<OWLAxiom> originalAxioms;


    /**
     * Instantiates a new HST explanation generator.
     *
     * @param singleExplanationGenerator explanation generator to use
     */
    public SchemaHSTExplanationGenerator(Set<OWLLogicalAxiom> relevantAxioms,
                                         Set<OWLLogicalAxiom> hookIndividualAxioms,
                                         Set<OWLLogicalAxiom> anchorAxioms,
                                         TransactionAwareSingleExpGen singleExplanationGenerator) throws OWLOntologyCreationException {
        super(relevantAxioms, hookIndividualAxioms, anchorAxioms, singleExplanationGenerator);
        this.originalAxioms = getOntology().getAxioms();
    }





    // Hitting Set Stuff


    @Override
    public Set<Set<OWLAxiom>> getExplanations(OWLClassExpression unsatClass,
					      @Nonnegative int maxExplanations) {
        OWLAPIPreconditions
            .checkNotNegative(maxExplanations, "max explanations cannot be negative");
        Object max = maxExplanations == 0 ? "all" : Integer.valueOf(maxExplanations);
        LOGGER.info("Get {} explanation(s) for: {}", max, unsatClass);
        try {
            Set<OWLAxiom> firstMups = getExplanation(unsatClass);

            if (firstMups.isEmpty()) {
                LOGGER.info("First MUPS empty");
                //System.out.println("First MUPS is empty!");
                //return Collections.emptySet();
            }
            Set<Set<OWLAxiom>> allMups = new LinkedHashSet<>();



            progressMonitor.foundExplanation(firstMups);
            allMups.add(firstMups);
            // call to schemas
            addAnalogMUPS(firstMups, allMups);
            //System.out.println(firstMups);
            //System.out.println(allMups);
            Set<Set<OWLAxiom>> satPaths = new HashSet<>();
            Set<OWLAxiom> currentPathContents = new HashSet<>();
            singleExplanationGenerator.beginTransaction();
            try {
                constructHittingSetTree(unsatClass, firstMups, allMups, satPaths,
                    currentPathContents, maxExplanations);
            } finally {
                singleExplanationGenerator.endTransaction();
            }
            progressMonitor.foundAllExplanations();
            System.out.println("explanation calls: " + justificationCalls);
            System.out.println("empty explanation calls: " + emptyJustificationCalls);
            return allMups;
        } catch (OWLException e) {
            throw new OWLRuntimeException(e);
        }
    }


    /**
     * Recurse.
     *
     * @param unsatClass the unsat class
     * @param allMups the all mups
     * @param satPaths the sat paths
     * @param currentPathContents the current path contents
     * @param maxExplanations the max explanations
     * @param orderedMups the ordered mups
     * @param axiom the axiom
     * @return the list
     * @throws OWLException the oWL exception
     */
    @Override
    protected List<OWLAxiom> recurse(OWLClassExpression unsatClass, Set<Set<OWLAxiom>> allMups,
				   Set<Set<OWLAxiom>> satPaths, Set<OWLAxiom> currentPathContents, int maxExplanations,
				   List<OWLAxiom> orderedMups,
				   OWLAxiom axiom) throws OWLException {
	
        Set<OWLAxiom> newMUPS = getNewMUPS(unsatClass, allMups, currentPathContents);
		
        // Generate a new node - i.e. a new justification set
        if (newMUPS.contains(axiom)) {
            // How can this be the case???
            throw new OWLRuntimeException("Explanation contains removed axiom: " + axiom);
        }
		
        if (newMUPS.isEmpty()) {
            LOGGER.info("Stop - satisfiable");
            // End of current path - add it to the list of paths
            satPaths.add(new HashSet<>(currentPathContents));
        } else {
            // Note that getting a previous justification does not mean
            // we can stop. stopping here causes some justifications to
            // be missed

            // only compute analogue mups if this pattern has not been considered yet
            if (!allMups.contains(newMUPS))
                // call forward reasoning
                addAnalogMUPS(newMUPS, allMups);
            allMups.add(newMUPS);

            progressMonitor.foundExplanation(newMUPS);
            // Recompute priority here?
            constructHittingSetTree(unsatClass, newMUPS, allMups, satPaths, currentPathContents,
                maxExplanations);
            // We have found a new MUPS, so recalculate the ordering
            // axioms in the MUPS at the current level
            return getOrderedMUPS(orderedMups, allMups);
        }
        return orderedMups;
    }

    // adds all analog mups to set of all mups
    protected void addAnalogMUPS(Set<OWLAxiom> newMUPS, Set<Set<OWLAxiom>> allMUPS) {
       // System.out.println("original mups ");
        // System.out.println(newMUPS);
        Set<Set<OWLAxiom>> analogMUPS = computeAnalogJustifications(newMUPS);
        //Integer i = 0;
        // System.out.println("analogue mups " + i++);
        //System.out.println(newMUPS);
        //System.out.println("found analog: " + analogMUPS.size());
        //for (Set<OWLAxiom> m : analogMUPS)
        //    if (allMUPS.contains(m))
        //       System.out.println("bad");
        allMUPS.addAll(analogMUPS);
    }



    /////////////////////////////////////////////////

    // stuff to handle forward reasoning


    // computes all justifications with a similar pattern
    protected Set<Set<OWLAxiom>> computeAnalogJustifications(Set<OWLAxiom> justification) {
        Set<Set<OWLAxiom>> analogJustifications = new HashSet<>();


        JustificationSchema schema = new JustificationSchema(justification, owlFactory);
        // get valid mappings w.r.t. axioms in current ontology
        Set<Map<OWLIndividual, OWLIndividual>> mappings = schema.getValidMappings(originalAxioms);

        for (Map<OWLIndividual, OWLIndividual> m : mappings) {
            Set<OWLAxiom> just = schema.instantiate(m);

            // do forward reasoning to check, if instantiated schema is also a justification
            updateForwardReasoner(just);
            if (!forwardReasoner.isConsistent()) {
                // we found another (analog justification)
                analogJustifications.add(just);
            }
        }
        return analogJustifications;
    }

    private void updateForwardReasoner(Set<OWLAxiom> newAxioms)  {
        OWLOntology oldOntology = forwardReasoner.getRootOntology();
        //oldOntology.removeAxioms(oldOntology.getAxioms())
        //oldOntology.addAxioms(ontology.getAxioms())

        Set<OWLAxiom> oldAxioms = oldOntology.getAxioms();
        Set<OWLAxiom> deleteAxioms = oldOntology.getAxioms();
        deleteAxioms.removeAll(newAxioms);
        Set<OWLAxiom> addAxioms = new HashSet<>(newAxioms);
        addAxioms.removeAll(oldAxioms);

        // apply changes to ontology
        oldOntology.removeAxioms(deleteAxioms);
        oldOntology.addAxioms(addAxioms);

        forwardReasoner.flush();
    }



}

// a class to represent the schema of a justification.
// contains the schema and the variables occurring in it (to
class JustificationSchema {
    public Set<OWLAxiom> justificationSchema;
    public Set<OWLIndividual> variableNames;
    public OWLDataFactory owlFactory;


    public JustificationSchema(Set<OWLAxiom> justification, OWLDataFactory _owlFactory) {
        justificationSchema = new HashSet<>();
        variableNames = new HashSet<>();
        owlFactory = _owlFactory;


        // get individual names
        Set<OWLIndividual> justIndividuals = new HashSet<>();
        for (OWLAxiom a : justification)
            // only consider the individuals in assertions
            if (a instanceof OWLClassAssertionAxiom || a instanceof  OWLObjectPropertyAssertionAxiom)
                Collections.addAll(justIndividuals, a.individualsInSignature().toArray(OWLIndividual[]::new));

        Map<OWLIndividual, OWLIndividual> indToVarMap = new HashMap<>();
        // generate fresh variables for each individual
        for (OWLIndividual ind : justIndividuals) {
            String varName = ind.toString() + "#HSTvariable";
            OWLNamedIndividual varInd = owlFactory.getOWLNamedIndividual(varName);
            indToVarMap.put(ind, varInd);
            variableNames.add(varInd);
        }

        // replace all variables in the axioms to get schema
        for (OWLAxiom a : justification) {
            justificationSchema.add(replaceIndividuals(a, indToVarMap));
        }
    }

    // returns all valid mappings from variables to individuals such that only allowed axioms are used
    // TODO: replace this function with efficient implementation, e.g. using OBDDs
    public Set<Map<OWLIndividual, OWLIndividual>> getValidMappings(Set<OWLAxiom> allowedAxioms) {

        // collect all occuring individuals
        Set<OWLIndividual> individuals = new HashSet<>();
        for (OWLAxiom a : allowedAxioms) {
            Collections.addAll(individuals, a.individualsInSignature().toArray(OWLIndividual[]::new));
        }
        // compute all mappings

        Set<Map<OWLIndividual, OWLIndividual>> allMappings = allMappings(
                variableNames,
                individuals,
                allowedAxioms
        );
        Set<Map<OWLIndividual, OWLIndividual>> varToIndMap = new HashSet<>(allMappings);



                // check, if the mapping is allowed or not
        for (Map<OWLIndividual, OWLIndividual> map : allMappings){
            // compute instantiatiation according to mapping
            Set<OWLAxiom> instantiatedPattern = instantiate(map);
            //if (instantiatedPattern.toString().contains("aa") && instantiatedPattern.toString().contains("ab"))
           //     System.out.println("found");
            for (OWLAxiom axiom : instantiatedPattern) {
                // check if any instantiated axiom is not in ontology --> remove this mapping
                // TODO: check if the axiom is a fluent, only then check, if it is in ontology?
                if (!allowedAxioms.contains(axiom)) {
                    varToIndMap.remove(map);
                    break;
                }
            }
        }

        return varToIndMap;
    }

    public Set<OWLAxiom> instantiate(Map<OWLIndividual, OWLIndividual> varToIndMap){
        Set<OWLAxiom> instantiatedAxioms = new HashSet<>();
        // replace all variables in the axioms to get schema
        for (OWLAxiom a : justificationSchema) {
            instantiatedAxioms.add(replaceIndividuals(a, varToIndMap));
        }
        return instantiatedAxioms;
    }

    // returns true, if the (partial) mapping does not violate the allowed axioms,
    // i.e. creates new, fully instantiated axioms that are not part of "allowedAxioms"
    private boolean validMapping(Map<OWLIndividual, OWLIndividual> varToIndMap, Set<OWLAxiom> allowedAxioms) {
        Set<OWLAxiom> axioms = partialInstantiate(varToIndMap);
        for (OWLAxiom a : axioms) {
            if (!allowedAxioms.contains(a))
                return false;
        }
        return true;
    }

    // instantiates only the axioms that already have all the variables assigned from map
    private Set<OWLAxiom> partialInstantiate(Map<OWLIndividual, OWLIndividual> varToIndMap) {
        Set<OWLAxiom> instantiatedAxioms = new HashSet<>();
        // replace all variables in the axioms to get schema
        for (OWLAxiom a : justificationSchema) {
            // check, if all variables mapped
            if (allVariablesMapped(a, varToIndMap))
                instantiatedAxioms.add(replaceIndividuals(a, varToIndMap));
        }
        return instantiatedAxioms;
    }

    // returns true if all variables in the axiom are assigned to something by the map
    private boolean allVariablesMapped(OWLAxiom axiom, Map<OWLIndividual, OWLIndividual> varToIndMap){
        for (OWLIndividual i : axiom.individualsInSignature().collect(Collectors.toSet())) {
            if (!varToIndMap.containsKey(i))
                return false;
        }
        return true;
    }

    // replaces all individuals according to the map
    private OWLAxiom replaceIndividuals(OWLAxiom axiom, Map<OWLIndividual, OWLIndividual> mapping) {
       if (axiom instanceof OWLClassAssertionAxiom) {
           OWLIndividual oldInd = ((OWLClassAssertionAxiom) axiom).getIndividual();
           return owlFactory.getOWLClassAssertionAxiom(
                   ((OWLClassAssertionAxiom) axiom).getClassExpression(),
                   mapping.getOrDefault(oldInd, oldInd)
           );
       }
       else if (axiom instanceof OWLObjectPropertyAssertionAxiom)  {
           OWLIndividual subject = ((OWLObjectPropertyAssertionAxiom) axiom).getSubject();
           OWLIndividual object = ((OWLObjectPropertyAssertionAxiom) axiom).getObject();
           return owlFactory.getOWLObjectPropertyAssertionAxiom(
                   ((OWLObjectPropertyAssertionAxiom) axiom).getProperty(),
                   mapping.getOrDefault(subject, subject),
                   mapping.getOrDefault(object, object)
           );
       }
       else {
           //System.out.println("WARNING: axiom not supported yet: " + axiom);
           return axiom;
       }
    }

    private Set<Map<OWLIndividual, OWLIndividual>> allMappings(Set<OWLIndividual> variables,
                                                               Set<OWLIndividual> individuals,
                                                               Set<OWLAxiom> allowedAxioms) {

        Optional<OWLIndividual> variable = variables.stream().findFirst();
        if (variables.isEmpty())
            // base case
            return new HashSet<>();
        else if (variables.size() == 1) {
            // base case
            Set<Map<OWLIndividual, OWLIndividual>> mappings = new HashSet<>();
            for (OWLIndividual ind : individuals) {
                Map<OWLIndividual, OWLIndividual> mapping = new HashMap<>();
                mapping.put(variable.get(), ind);
                if (validMapping(mapping, allowedAxioms))
                    mappings.add(mapping);
            }
            return mappings;
        }
        else {
            // recursive call
            Set<OWLIndividual> newVariables = new HashSet<>(variables);
            newVariables.remove(variable.get());
            Set<Map<OWLIndividual, OWLIndividual>> recursiveMappings = allMappings(newVariables, individuals, allowedAxioms);
            Set<Map<OWLIndividual, OWLIndividual>> mappings = new HashSet<>();

            for (Map<OWLIndividual, OWLIndividual> map : recursiveMappings){
                for (OWLIndividual ind : individuals) {
                    Map<OWLIndividual, OWLIndividual> mapping = new HashMap<>(map);
                    mapping.put(variable.get(), ind);
                    if (validMapping(mapping, allowedAxioms))
                        mappings.add(mapping);
                }
            }
            return mappings;
        }
    }

}


