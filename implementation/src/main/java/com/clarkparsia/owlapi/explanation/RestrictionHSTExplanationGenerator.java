package com.clarkparsia.owlapi.explanation;

import com.clarkparsia.owlapi.explanation.util.ExplanationProgressMonitor;
import com.clarkparsia.owlapi.explanation.util.OntologyUtils;
import com.clarkparsia.owlapi.explanation.util.SilentExplanationProgressMonitor;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;
import org.semanticweb.owlapi.util.OWLAPIPreconditions;
import org.semanticweb.owlapi.util.OWLEntityCollector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Nonnegative;
import javax.annotation.Nullable;
import java.util.*;
import java.util.stream.Collectors;

import static org.semanticweb.owlapi.model.parameters.Imports.INCLUDED;
import static org.semanticweb.owlapi.util.OWLAPIPreconditions.checkNotNull;

/**
 * HST explanation generator.
 * modified to delete more axioms for faster pruning of search tree
 */
public class RestrictionHSTExplanationGenerator implements MultipleExplanationGenerator {

    protected static final Logger LOGGER = LoggerFactory.getLogger(HSTExplanationGenerator.class);
    protected final TransactionAwareSingleExpGen singleExplanationGenerator;
    protected ExplanationProgressMonitor progressMonitor = new SilentExplanationProgressMonitor();

    protected final Set<OWLLogicalAxiom> relevantAxioms;


    protected int justificationCalls = 0;
    protected int emptyJustificationCalls = 0;


    // each hook is related to only one of the following axioms, i.e. these are the supporting axioms
    // such as the class belonging for each hook
    protected final Set<OWLLogicalAxiom> hookIndividualAxioms;
    protected final Set<OWLLogicalAxiom> anchorAxioms; // anchor for hooks that get explained

    protected int depthCounter = 0;

    /**
     * Instantiates a new hST explanation generator.
     *
     * @param singleExplanationGenerator explanation generator to use
     */
    public RestrictionHSTExplanationGenerator(Set<OWLLogicalAxiom> relevantAxioms,
                                              Set<OWLLogicalAxiom> hookIndividualAxioms,
                                              Set<OWLLogicalAxiom> anchorAxioms,
                                              TransactionAwareSingleExpGen singleExplanationGenerator) {
	this.relevantAxioms = relevantAxioms;
    this.hookIndividualAxioms = hookIndividualAxioms;
    this.anchorAxioms = anchorAxioms;
	
	this.singleExplanationGenerator =
	    checkNotNull(singleExplanationGenerator,
			 "singleExplanationGenerator cannot be null");
    }

    /**
     * Orders the axioms in a single MUPS by the frequency of which they appear
     * in all MUPS.
     *
     * @param mups The MUPS containing the axioms to be ordered
     * @param allMups The set of all MUPS which is used to calculate the ordering
     * @return the ordered mups
     */
    protected static List<OWLAxiom> getOrderedMUPS(List<OWLAxiom> mups,
                                                   final Set<Set<OWLAxiom>> allMups) {
        Comparator<OWLAxiom> mupsComparator = (o1, o2) -> {
            // The axiom that appears in most MUPS has the lowest index
            // in the list
            int occ1 = getOccurrences(o1, allMups);
            int occ2 = getOccurrences(o2, allMups);
            return -occ1 + occ2;
        };
        Collections.sort(mups, mupsComparator);
        return mups;
    }

    /**
     * Given an axiom and a set of axioms this method determines how many sets
     * contain the axiom.
     *
     * @param ax The axiom that will be counted.
     * @param axiomSets The sets to count from
     * @return the occurrences
     */
    protected static int getOccurrences(@Nullable OWLAxiom ax, Set<Set<OWLAxiom>> axiomSets) {
        int count = 0;
        if (ax == null) {
            return count;
        }
        for (Set<OWLAxiom> axioms : axiomSets) {
            if (axioms.contains(ax)) {
                count++;
            }
        }
        return count;
    }

    /**
     * Returns the entities referenced in an axiom.
     *
     * @param axiom axiom whose signature is being computed
     * @return the entities referenced in the axiom
     */
    private static Set<OWLEntity> getSignature(OWLAxiom axiom) {
        Set<OWLEntity> toReturn = new HashSet<>();
        OWLEntityCollector collector = new OWLEntityCollector(toReturn);
        axiom.accept(collector);
        return toReturn;
    }

    /**
     * Check early termination.
     *
     * @param satPaths the sat paths
     * @param currentPathContents the current path contents
     * @return true, if successful
     */
    protected static boolean checkEarlyTermination(Set<Set<OWLAxiom>> satPaths,
                                                   Set<OWLAxiom> currentPathContents) {
        boolean earlyTermination = false;
        // Early path termination. If our path contents are the superset of
        // the contents of a path then we can terminate here.
        for (Set<OWLAxiom> satPath : satPaths) {
            if (currentPathContents.containsAll(satPath)) {
                earlyTermination = true;
                LOGGER.info("Stop - satisfiable (early termination)");
                break;
            }
        }
        return earlyTermination;
    }

    @Override
    public void setProgressMonitor(ExplanationProgressMonitor progressMonitor) {
        this.progressMonitor = checkNotNull(progressMonitor, "progressMonitor cannot be null");
    }

    @Override
    public OWLOntologyManager getOntologyManager() {
        return singleExplanationGenerator.getOntologyManager();
    }

    @Override
    public OWLOntology getOntology() {
        return singleExplanationGenerator.getOntology();
    }

    @Override
    public OWLReasoner getReasoner() {
        return singleExplanationGenerator.getReasoner();
    }

    @Override
    public OWLReasonerFactory getReasonerFactory() {
        return singleExplanationGenerator.getReasonerFactory();
    }

    /**
     * Gets the single explanation generator.
     *
     * @return the explanation generator
     */
    public TransactionAwareSingleExpGen getSingleExplanationGenerator() {
        return singleExplanationGenerator;
    }

    // Hitting Set Stuff

    @Override
    public Set<OWLAxiom> getExplanation(OWLClassExpression unsatClass) {
        //System.out.println("SingleExplanationGenerator: "+singleExplanationGenerator);
        Set<OWLAxiom> result =
                new HashSet<OWLAxiom>(singleExplanationGenerator.getExplanation(unsatClass));

        justificationCalls++;
        if (result.isEmpty())
            emptyJustificationCalls++;
        //else
        //    System.out.println(result);
        return result;
    }

    @Override
    public Set<Set<OWLAxiom>> getExplanations(OWLClassExpression unsatClass) {
        return getExplanations(unsatClass, 0);
    }

    @Override
    public void dispose() {
        singleExplanationGenerator.dispose();
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

            if (firstMups.isEmpty()) {
                LOGGER.info("First MUPS empty");
                //System.out.println("First MUPS is empty!");
                //return Collections.emptySet();
            }
            Set<Set<OWLAxiom>> allMups = new LinkedHashSet<>();
            progressMonitor.foundExplanation(firstMups);
            allMups.add(firstMups);
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
                                         Set<Set<OWLAxiom>> satPaths, Set<OWLAxiom> currentPathContents, int maxExplanations)
            throws OWLException {
        //System.out.println(depthCounter + " MUPS "+ Integer.valueOf(allMups.size())+" : "+ mups);
        if (progressMonitor.isCancelled()) {
            return;
        }
        // We go through the current mups, axiom by axiom, and extend the tree
        // with edges for each axiom
        List<OWLAxiom> orderedMups = getOrderedMUPS(new ArrayList<>(mups), allMups);
        while (!orderedMups.isEmpty()) {
            if (progressMonitor.isCancelled()) {
                return;
            }
            OWLAxiom axiom = orderedMups.get(0);

            orderedMups.remove(0);
            if(relevantAxioms.contains(axiom)){
                if (allMups.size() == maxExplanations) {
                    LOGGER.info("Computed {} explanations", Integer.valueOf(maxExplanations));
                    return;
                }

                Set<OWLAxiom> axiomsToRemove = new HashSet<>(Collections.emptySet());
                axiomsToRemove.add(axiom);

                //System.out.println(depthCounter + " MUPSnew "+ Integer.valueOf(allMups.size())+" : "+ mups);
                //System.out.println(depthCounter + " remove initial: " + axiom);

                Set<OWLAxiom> remainingHookSpecificAxioms = new HashSet<>(hookIndividualAxioms);
                remainingHookSpecificAxioms.removeAll(currentPathContents);

                if (!hookIndividualAxioms.contains(axiom)) {
                    //System.out.println("BUM! " + axiom);
                    // remove all hook specific axioms that are not already contained in mups
                    if (!isDisjoint(mups, hookIndividualAxioms)) {
                        // create set of all hook specific axioms that are still to consider, i.e. have not been removed
                        // on the path to the node
                        // System.out.println("p: " + currentPathContents);
                        for (OWLAxiom tempAxiom : remainingHookSpecificAxioms) {
                            if (!mups.contains(tempAxiom)) {
                                axiomsToRemove.add(tempAxiom);
                                //System.out.println(depthCounter + " remove " + tempAxiom);
                            }
                        }
                    }
                }

                // if no individual is marked as relevant anymore, we also remove the anchor axiom, to trigger early
                // termination faster
                remainingHookSpecificAxioms.removeAll(axiomsToRemove);
                //System.out.println(remainingHookSpecificAxioms.size());
                // if (remainingHookSpecificAxioms.size() ==1)
                //    System.out.println("r: " + remainingHookSpecificAxioms + " " + axiom);
                //    System.out.println("p: " + currentPathContents);
                if (remainingHookSpecificAxioms.isEmpty()) {
                    axiomsToRemove.addAll(anchorAxioms);
                    //System.out.println("remove anchor");
                }

                //System.out.println("Removing axiom: "+axiom+" "+
                // Integer.valueOf(currentPathContents.size())
                // + " more removed: "+
                // currentPathContents);
                // Removal may have dereferenced some entities, if so declarations
                // are added
                List<OWLDeclarationAxiom> temporaryDeclarations = new ArrayList<>();
                Set<OWLOntology> ontologies =
                        //removeAxiomAndAddDeclarations(axiom,
                        //              temporaryDeclarations);
                        removeAxiomsAndAddDeclarations(axiomsToRemove,
                                temporaryDeclarations);

                currentPathContents.addAll(axiomsToRemove);

                boolean earlyTermination = checkEarlyTermination(satPaths, currentPathContents);

                depthCounter += 1;
                if (!earlyTermination) {
                    orderedMups = recurse(unsatClass, allMups, satPaths, currentPathContents,
                            maxExplanations, orderedMups,
                            axiom);
                }
                backtrack(currentPathContents, axiomsToRemove,
                        temporaryDeclarations, ontologies);
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

    protected void backtrack(Set<OWLAxiom> currentPathContents, Set<OWLAxiom> axioms,
                             List<OWLDeclarationAxiom> temporaryDeclarations,
                             Set<OWLOntology> ontologies) {

        // Back track - go one level up the tree and run for the next axiom
        currentPathContents.removeAll(axioms);
        LOGGER.info("Restoring axioms: {}", axioms);

        // Remove any temporary declarations
        for (OWLDeclarationAxiom decl : temporaryDeclarations) {
            OntologyUtils.removeAxiom(decl, getReasoner().getRootOntology().importsClosure());
        }

        // Done with the axiom that was removed. Add it back in
        for (OWLAxiom a : axioms)
            OntologyUtils.addAxiom(a, ontologies.stream());
    }



    /**
     * Gets the new mups.
     *
     * @param unsatClass the unsat class
     * @param allMups the all mups
     * @param currentPathContents the current path contents
     * @return the new mups
     */
    protected Set<OWLAxiom> getNewMUPS(OWLClassExpression unsatClass, Set<Set<OWLAxiom>> allMups,
        Set<OWLAxiom> currentPathContents) {
		
        Set<OWLAxiom> newMUPS = null;
		
        for (Set<OWLAxiom> foundMUPS : allMups) {
            Set<OWLAxiom> foundMUPSCopy = new HashSet<>(foundMUPS);
            foundMUPSCopy.retainAll(currentPathContents);
            if (foundMUPSCopy.isEmpty()) {
                newMUPS = foundMUPS;
                break;
            }
        }
		
        if (newMUPS == null) {
            newMUPS = getExplanation(unsatClass);
        }
        return newMUPS;
    }

    /**
     * Removes multiple axioms and add declarations.
     *
     * @param axioms the axioms
     * @param temporaryDeclarations the temporary declarations
     * @return the sets the
     */
    protected Set<OWLOntology> removeAxiomsAndAddDeclarations(Set<OWLAxiom> axioms,
                                                              List<OWLDeclarationAxiom> temporaryDeclarations) {
        // Remove the current axiom from all the ontologies it is included
        // in
        Set<OWLOntology> ontologies = Collections.emptySet();
        ontologies = getReasoner().getRootOntology().importsClosure().collect(Collectors.toSet());
        for (OWLAxiom axiom : axioms) {
            ontologies = OntologyUtils
                    .removeAxiom(axiom, ontologies.stream());

            OntologyUtils.removeAxiom(axiom, getReasoner().getRootOntology()
                            .importsClosure());

            List<OWLDeclarationAxiom> tempList = new ArrayList<>();
            collectTemporaryDeclarations(axiom, tempList);
            for (OWLDeclarationAxiom decl : tempList) {
                OntologyUtils.addAxiom(decl, getReasoner().getRootOntology().importsClosure());
                temporaryDeclarations.add(decl);
            }

        }


        return ontologies;
    }

    private void collectTemporaryDeclarations(OWLAxiom axiom,
        List<OWLDeclarationAxiom> temporaryDeclarations) {
        for (OWLEntity e : getSignature(axiom)) {
            boolean referenced = getReasoner().getRootOntology().isDeclared(e, INCLUDED);
            if (!referenced) {
                temporaryDeclarations.add(getDeclaration(e));
            }
        }
    }

    /**
     * Gets the declaration.
     *
     * @param e the e
     * @return the declaration
     */
    private OWLDeclarationAxiom getDeclaration(OWLEntity e) {
        return getOntologyManager().getOWLDataFactory().getOWLDeclarationAxiom(e);
    }

    protected boolean isDisjoint(Set<OWLAxiom> a, Set<OWLLogicalAxiom> b) {
        for (OWLAxiom tempAxiom : a) {
            if (b.contains(tempAxiom))
                return false;
        }
        return true;
    }

    // first argument is contained in second one
    private boolean isContained(Set<OWLLogicalAxiom> a, Set<OWLAxiom> b) {
        for (OWLAxiom tempAxiom : a) {
            if (!b.contains(tempAxiom))
                return false;
        }
        return true;
    }
}
