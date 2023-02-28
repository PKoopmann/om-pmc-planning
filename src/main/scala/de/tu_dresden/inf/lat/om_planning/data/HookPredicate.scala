package de.tu_dresden.inf.lat.om_planning.data

import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLNamedIndividual}

/** n-ary predicate to be used in action preconditions in the planning problem,
 * which is translated to a query to the current planning state
 *
 * @param name Name of the predicate (on the planning side).
 * @param variables Names of the variables used by the predicate (determine the arity).
 * @param typeSpecification Set of axioms restricting the fillers of the variables.
 *                          Here, the variables occur as OWLNamedIndividual with the variable string as IRI.
 *                          An assignment of variables to individual names is valid for this hook predicate if the
 *                          result of applying it to the type specification is entailed by the static part of the
 *                          ontology.
 * @param query Query determining when the hook is active.
 *              Again, variables are represented using OWLNamedIndividual.
 *              The hook becomes active for a variable assignment if the variable assignment is valid according to
 *              the type specification, and the query under the assignment is entailed by the ontology view on the
 *              current planning state. Different to the type specification, this will typically depend on the fluents.
 */
case class HookPredicate(name: String,
                         variables: Set[String],
                         typeSpecification: Set[OWLLogicalAxiom],
                         query: Set[OWLLogicalAxiom])

