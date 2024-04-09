package com.clarkparsia.owlapi.explanation;

import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.util.OWLAPIPreconditions;

import javax.annotation.Nonnegative;
import java.util.*;


// idea: track in the recursion the mups from "allMups" that could be valid on this path
public class MupsTrackingHSTExplanationGenerator extends com.clarkparsia.owlapi.explanation.SchemaHSTExplanationGenerator
        implements MultipleExplanationGenerator {

    /**
     * Instantiates a new HST explanation generator.
     *
     * @param relevantAxioms
     * @param hookIndividualAxioms
     * @param anchorAxioms
     * @param singleExplanationGenerator explanation generator to use
     */
    public MupsTrackingHSTExplanationGenerator(Set<OWLLogicalAxiom> relevantAxioms,
                                               Set<OWLLogicalAxiom> hookIndividualAxioms,
                                               Set<OWLLogicalAxiom> anchorAxioms,
                                               TransactionAwareSingleExpGen singleExplanationGenerator) throws OWLOntologyCreationException {
        super(relevantAxioms, hookIndividualAxioms, anchorAxioms, singleExplanationGenerator);
    }




    @Override
    public Set<Set<OWLAxiom>> getExplanations(OWLClassExpression unsatClass,
                                              @Nonnegative int maxExplanations) {
        OWLAPIPreconditions
                .checkNotNegative(maxExplanations, "max explanations cannot be negative");
        Object max = maxExplanations == 0 ? "all" : Integer.valueOf(maxExplanations);
        LOGGER.info("Get {} explanation(s) for: {}", max, unsatClass);
        try {
            Set<OWLAxiom> firstMups = getExplanation(unsatClass);

            //System.out.println(relevantAxioms);
            if (firstMups.isEmpty()) {
                LOGGER.info("First MUPS empty");
                //System.out.println("First MUPS is empty!");
                //return Collections.emptySet();
            }
            Set<Set<OWLAxiom>> allMups = new LinkedHashSet<>();
            //System.out.println(firstMups);

            progressMonitor.foundExplanation(firstMups);
            allMups.add(firstMups);

            // call to schemas
            Set<Set<OWLAxiom>> analogMUPS = computeAnalogJustifications(firstMups);
            // add all generated mups to "allMups"
            allMups.addAll(analogMUPS);
            // update relevant mups
            Set<Set<OWLAxiom>> allMupsRelevant = new LinkedHashSet<>();
            for (Set<OWLAxiom> m : analogMUPS)
                if (!m.equals(firstMups))
                    allMupsRelevant.add(m);


            // System.out.println(firstMups);
            //System.out.println(allMups);
            Set<Set<OWLAxiom>> satPaths = new HashSet<>();
            Set<OWLAxiom> currentPathContents = new HashSet<>();
            singleExplanationGenerator.beginTransaction();
            try {
                constructHittingSetTree(unsatClass, firstMups, allMups, allMupsRelevant, satPaths,
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
     * This is a recursive method that builds a hitting set tree to obtain all
     * justifications for an unsatisfiable class.
     *
     * @param unsatClass the unsat class
     * @param mups The current justification for the current class. This corresponds to a node in
     * the hitting set tree.
     * @param allMups All of the MUPS that have been found - this set gets populated over the course
     * of the tree building process. Initially this should just contain the first justification
     * @param satPaths Paths that have been completed.
     * @param currentPathContents The contents of the current path. Initially this should be an
     * empty set.
     * @param maxExplanations the max explanations
     * @throws OWLException the oWL exception
     */
    protected void constructHittingSetTree(OWLClassExpression unsatClass, Set<OWLAxiom> mups,
                                           Set<Set<OWLAxiom>> allMups,
                                           Set<Set<OWLAxiom>> allMupsRelvant,
                                           Set<Set<OWLAxiom>> satPaths, Set<OWLAxiom> currentPathContents, int maxExplanations)
            throws OWLException {
        if (progressMonitor.isCancelled()) {
            return;
        }
        // We go through the current mups, axiom by axiom, and extend the tree
        // with edges for each axiom
        List<OWLAxiom> orderedMups = getOrderedMUPS(new ArrayList<>(mups), allMups);
        //System.out.println("m: " + depthCounter + " " + mups + " ");
        //System.out.println("p: " + depthCounter + " " + currentPathContents + " ");
        while (!orderedMups.isEmpty()) {
            if (progressMonitor.isCancelled()) {
                return;
            }
            OWLAxiom axiom = orderedMups.get(0);

            orderedMups.remove(0);
            if(relevantAxioms.contains(axiom)){
                //System.out.println("remove axiom" + axiom);
                if (allMups.size() == maxExplanations) {
                    LOGGER.info("Computed {} explanations", Integer.valueOf(maxExplanations));
                    return;
                }

                Set<OWLAxiom> axiomsToRemove = new HashSet<>(Collections.emptySet());
                axiomsToRemove.add(axiom);

                Set<OWLAxiom> remainingHookSpecificAxioms = new HashSet<>(hookIndividualAxioms);
                remainingHookSpecificAxioms.removeAll(currentPathContents);

                if (!hookIndividualAxioms.contains(axiom)) {
                    // remove all hook specific axioms that are not already contained in mups
                    if (!isDisjoint(mups, hookIndividualAxioms)) {
                        // create set of all hook specific axioms that are still to consider, i.e. have not been removed
                        // on the path to the node
                        for (OWLAxiom tempAxiom : remainingHookSpecificAxioms) {
                            if (!mups.contains(tempAxiom)) {
                                axiomsToRemove.add(tempAxiom);
                            }
                        }
                    }
                }

                // if no individual is marked as relevant anymore, we also remove the anchor axiom, to trigger early
                // termination faster
                //System.out.println("remove all " + axiomsToRemove);
                remainingHookSpecificAxioms.removeAll(axiomsToRemove);

                //if (remainingHookSpecificAxioms.isEmpty()) {
                //    axiomsToRemove.addAll(anchorAxioms);
                //}


                List<OWLDeclarationAxiom> temporaryDeclarations = new ArrayList<>();
                Set<OWLOntology> ontologies =

                        removeAxiomsAndAddDeclarations(axiomsToRemove,
                                temporaryDeclarations);

                currentPathContents.addAll(axiomsToRemove);

                boolean earlyTermination = checkEarlyTermination(satPaths, currentPathContents);

                depthCounter += 1;

                //System.out.println();

                if (!earlyTermination) {
                    //System.out.println("p " + currentPathContents);
                    orderedMups = recurse(unsatClass, allMups, allMupsRelvant, satPaths, currentPathContents,
                            maxExplanations, orderedMups,
                            axiom);
                }
                backtrack(currentPathContents, axiomsToRemove,
                        temporaryDeclarations, ontologies);

                // add the mups back, when backtracking
                // TODO: make more efficient, i.e. track what to add earlier
                for (Set<OWLAxiom> m : allMups)
                    if (!allMupsRelvant.contains(m))
                        if (mupsIsRelevant(m, currentPathContents))
                            allMupsRelvant.add(m);

                depthCounter -= 1;
            }
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
    protected List<OWLAxiom> recurse(OWLClassExpression unsatClass, Set<Set<OWLAxiom>> allMups,
                                     Set<Set<OWLAxiom>> allMupsRelevant,
                                     Set<Set<OWLAxiom>> satPaths, Set<OWLAxiom> currentPathContents, int maxExplanations,
                                     List<OWLAxiom> orderedMups,
                                     OWLAxiom axiom) throws OWLException {

        // remove all mups from the relevant ones that are invalid
        Set<Set<OWLAxiom>> allMupsRelevantCopy = new HashSet<>(allMupsRelevant);

        for (Set<OWLAxiom> m : allMupsRelevantCopy)
            if (!mupsIsRelevant(m, currentPathContents))
                allMupsRelevant.remove(m);

        Set<OWLAxiom> newMUPS = getNewMUPS(unsatClass, allMupsRelevant, currentPathContents);

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
            if (!allMups.contains(newMUPS)){
                // call forward reasoning
                Set<Set<OWLAxiom>> analogMUPS = computeAnalogJustifications(newMUPS);
                // add all generated mups to "allMups"
                allMups.addAll(analogMUPS);

                // update relevant mups
                for (Set<OWLAxiom> m : analogMUPS) {
                    if(mupsIsRelevant(m, currentPathContents))
                        allMupsRelevant.add(m);
                }
            }
            allMups.add(newMUPS);

            progressMonitor.foundExplanation(newMUPS);
            // Recompute priority here?
            constructHittingSetTree(unsatClass, newMUPS, allMups, allMupsRelevant, satPaths, currentPathContents,
                    maxExplanations);
            // We have found a new MUPS, so recalculate the ordering
            // axioms in the MUPS at the current level
            return getOrderedMUPS(orderedMups, allMups);
        }
        return orderedMups;
    }



    /**
     * Gets the new mups.
     *
     * @param unsatClass the unsat class
     * @param allMupsRelevant the all mups that are relevant on this branch of the HST
     * @param currentPathContents the current path contents
     * @return the new mups
     */
    @Override
    protected Set<OWLAxiom> getNewMUPS(OWLClassExpression unsatClass,
                                       Set<Set<OWLAxiom>> allMupsRelevant,
                                       Set<OWLAxiom> currentPathContents) {

        Set<OWLAxiom> newMUPS = null;

        if (!allMupsRelevant.isEmpty())
            newMUPS = allMupsRelevant.stream().findAny().get();

        if (newMUPS == null) {
            newMUPS = getExplanation(unsatClass);
        }
        return newMUPS;
    }


    // true, if the mups should be considered on a path labeled with the path content
    protected boolean mupsIsRelevant(Set<OWLAxiom> mups,
                                     Set<OWLAxiom> currentPathContents) {
        Set<OWLAxiom> foundMUPSCopy = new HashSet<>(mups);
        foundMUPSCopy.retainAll(currentPathContents);
        return foundMUPSCopy.isEmpty();
    }

}
