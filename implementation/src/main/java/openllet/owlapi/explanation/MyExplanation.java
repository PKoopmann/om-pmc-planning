package openllet.owlapi.explanation;

import com.clarkparsia.owlapi.explanation.MyBlackBoxExplanation;
import com.clarkparsia.owlapi.explanation.MyHSTExplanationGenerator;
import com.clarkparsia.owlapi.explanation.SatisfiabilityConverter;
import com.clarkparsia.owlapi.explanation.TransactionAwareSingleExpGen;

import java.util.Collections;
import java.util.Set;
import openllet.owlapi.OpenlletReasoner;
import openllet.owlapi.OpenlletReasonerFactory;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;

/**
 * @author Evren Sirin
 * @author Patrick Koopmann (small adaptation)
 */
public class MyExplanation
{
    static
    {
	setup();
    }

    /**
     * Very important initialization step that needs to be called once before a reasoner is created. This function will be called automatically when
     * GlassBoxExplanation is loaded by the class loader. This function simply calls the {@link GlassBoxExplanation#setup()} function.
     */
    public static void setup()
    {
	GlassBoxExplanation.setup();
    }

    private final OWLDataFactory _factory;

    private final MyHSTExplanationGenerator _expGen;

    private final SatisfiabilityConverter _converter;

    public MyExplanation(final OWLOntology ontology,
                         final Set<OWLLogicalAxiom> relevantAxioms)
    {
	this(ontology, true, relevantAxioms);
    }

    public MyExplanation(final OWLOntology ontology,
                         final boolean useGlassBox,
                         final Set<OWLLogicalAxiom> relevantAxioms)
    {
	this(new OpenlletReasonerFactory().createReasoner(ontology),
	     useGlassBox, Collections.unmodifiableSet(relevantAxioms));
    }

    public MyExplanation(final OpenlletReasoner reasoner,
                         final Set<OWLLogicalAxiom> relevantAxioms)
    {
	this(reasoner, true, relevantAxioms);
    }

    private MyExplanation(final OpenlletReasoner reasoner,
                          final boolean useGlassBox,
                          final Set<OWLLogicalAxiom> relevantAxioms) {
        this(getSingleExp(useGlassBox,reasoner), reasoner.getFactory(), relevantAxioms);
    }

    private static TransactionAwareSingleExpGen getSingleExp(final boolean useGlassBox, OpenlletReasoner reasoner) {
        return  useGlassBox
                ? new GlassBoxExplanation(reasoner)
                : new MyBlackBoxExplanation(reasoner.getRootOntology(), new OpenlletReasonerFactory(), reasoner);
    }


    public static  MyExplanation getBlackBoxExplanation(
            final OWLReasonerFactory factory,
            final OWLReasoner reasoner,
            final Set<OWLLogicalAxiom> relevantAxioms){
        OWLOntology ontology = reasoner.getRootOntology();
        OWLDataFactory dataFactory = ontology.getOWLOntologyManager().getOWLDataFactory();
        TransactionAwareSingleExpGen singleExp = new MyBlackBoxExplanation(reasoner.getRootOntology(), factory, reasoner);
        return new MyExplanation(
                singleExp,
                dataFactory,
                relevantAxioms
        );
    }

    private MyExplanation(final TransactionAwareSingleExpGen singleExp, OWLDataFactory factory,
                          final Set<OWLLogicalAxiom> relevantAxioms) {
	// Get the _factory object
	_factory = factory;

	// Create multiple explanation generator
	_expGen = new MyHSTExplanationGenerator(relevantAxioms, singleExp);

	// Create the converter that will translate axioms into class expressions
	_converter = new SatisfiabilityConverter(_factory);
    }

    public Set<OWLAxiom> getEntailmentExplanation(final OWLAxiom axiom)
    {
	final OWLClassExpression unsatClass = _converter.convert(axiom);
	return getUnsatisfiableExplanation(unsatClass);
    }

    public Set<Set<OWLAxiom>> getEntailmentExplanations(final OWLAxiom axiom)
    {
	final OWLClassExpression unsatClass = _converter.convert(axiom);
	return getUnsatisfiableExplanations(unsatClass);
    }

    public Set<Set<OWLAxiom>> getEntailmentExplanations(final OWLAxiom axiom, final int maxExplanations)
    {
	final OWLClassExpression unsatClass = _converter.convert(axiom);
	return getUnsatisfiableExplanations(unsatClass, maxExplanations);
    }

    public Set<OWLAxiom> getInconsistencyExplanation()
    {
	return getUnsatisfiableExplanation(_factory.getOWLThing());
    }

    public Set<Set<OWLAxiom>> getInconsistencyExplanations()
    {
	return getUnsatisfiableExplanations(_factory.getOWLThing());
    }

    public Set<Set<OWLAxiom>> getInconsistencyExplanations(final int maxExplanations)
    {
	return getUnsatisfiableExplanations(_factory.getOWLThing(), maxExplanations);
    }

    public Set<OWLAxiom> getInstanceExplanation(final OWLIndividual ind, final OWLClassExpression cls)
    {
	final OWLClassAssertionAxiom classAssertion = _factory.getOWLClassAssertionAxiom(cls, ind);
	return getEntailmentExplanation(classAssertion);
    }

    public Set<Set<OWLAxiom>> getInstanceExplanations(final OWLIndividual ind, final OWLClassExpression cls)
    {
	final OWLClassAssertionAxiom classAssertion = _factory.getOWLClassAssertionAxiom(cls, ind);
	return getEntailmentExplanations(classAssertion);
    }

    public Set<Set<OWLAxiom>> getInstanceExplanations(final OWLIndividual ind, final OWLClassExpression cls, final int maxExplanations)
    {
	final OWLClassAssertionAxiom classAssertion = _factory.getOWLClassAssertionAxiom(cls, ind);
	return getEntailmentExplanations(classAssertion, maxExplanations);
    }

    public Set<OWLAxiom> getSubClassExplanation(final OWLClassExpression subClass, final OWLClassExpression superClass)
    {
	final OWLSubClassOfAxiom subClassAxiom = _factory.getOWLSubClassOfAxiom(subClass, superClass);
	return getEntailmentExplanation(subClassAxiom);
    }

    public Set<Set<OWLAxiom>> getSubClassExplanations(final OWLClassExpression subClass, final OWLClassExpression superClass)
    {
	final OWLSubClassOfAxiom subClassAxiom = _factory.getOWLSubClassOfAxiom(subClass, superClass);
	return getEntailmentExplanations(subClassAxiom);
    }

    public Set<Set<OWLAxiom>> getSubClassExplanations(final OWLClassExpression subClass, final OWLClassExpression superClass, final int maxExplanations)
    {
	final OWLSubClassOfAxiom subClassAxiom = _factory.getOWLSubClassOfAxiom(subClass, superClass);
	return getEntailmentExplanations(subClassAxiom, maxExplanations);
    }

    /**
     * Returns a single explanation for an arbitrary class expression, or empty set if the given expression is satisfiable.
     * 
     * @param unsatClass an unsatisfiabile class expression which is will be explained
     * @return set of axioms explaining the unsatisfiability of given class expression, or empty set if the given expression is satisfiable.
     */
    public Set<OWLAxiom> getUnsatisfiableExplanation(final OWLClassExpression unsatClass)
    {
	return _expGen.getExplanation(unsatClass);
    }

    /**
     * Returns all the explanations for the given unsatisfiable class.
     * 
     * @param unsatClass The class that is unsatisfiable for which an explanation will be generated.
     * @return All explanations for the given unsatisfiable class, or an empty set if the concept is satisfiable
     */
    public Set<Set<OWLAxiom>> getUnsatisfiableExplanations(final OWLClassExpression unsatClass)
    {
	return _expGen.getExplanations(unsatClass);
    }

    /**
     * Return a specified number of explanations for the given unsatisfiable class. A smaller number of explanations can be returned if there are not as many
     * explanations for the given concept. The returned set will be empty if the given class is satisfiable,
     * 
     * @param unsatClass The class that is unsatisfiable for which an explanation will be generated.
     * @param maxExplanations Maximum number of explanations requested, or 0 to get all the explanations
     * @return A specified number of explanations for the given unsatisfiable class, or an empty set if the concept is satisfiable
     */
    public Set<Set<OWLAxiom>> getUnsatisfiableExplanations(final OWLClassExpression unsatClass, final int maxExplanations)
    {
	return _expGen.getExplanations(unsatClass, maxExplanations);
    }
}
