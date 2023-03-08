package de.tu_dresden.inf.lat.om_planning.parsing

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, FluentSpecification, OWLAxiom2Condition, OWLClass2Predicate, OWLIndividual2Object, OWLProperty2Predicate}
import de.tu_dresden.inf.lat.om_pmc.parsing.{GeneralOWLParsing, ParsingException}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.ShortFormEntityChecker
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxParserImpl
import org.semanticweb.owlapi.model.{OWLDataFactory, OWLLogicalAxiom, OWLOntology, OntologyConfigurator}
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager}

import java.io.File
import scala.io.{BufferedSource, Source}

class FluentSpecificationParser(ontology: OWLOntology, factory: OWLDataFactory) {

  val COMMENT = "#"
  val PREFIX = "PREFIX"
  val objectRe = raw"OBJECT\s+([^\s]+)\s+([^\s]+)\s*->\s*([^\s]+)".r
  val unaryPredicateRe = raw"PREDICATE\s+([^\s]+)\(([^\s,]+)\)\s*->\s*([^\s]+)".r
  val binaryPredicateRe = raw"PREDICATE\s+([^\s]+)\(([^\s]+),\s*([^\s]+)\)\s*->\s*([^\s]+)".r
  val conditionRe = raw"CONDITION (.+)".r


  def parse(file: File): FluentMap = {
    parse(Source.fromFile(file))
  }

  def parse(source: BufferedSource): FluentMap = {
    val prefixManager = new DefaultPrefixManager()
    val manager = OWLManager.createOWLOntologyManager()
    val factory = manager.getOWLDataFactory()
    val shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    val manchesterParser = new ManchesterOWLSyntaxParserImpl(new OntologyConfigurator(), factory)
    manchesterParser.setOWLEntityChecker(shortFormProvider);
    manchesterParser.setDefaultOntology(ontology)

    var specs = Set[FluentSpecification]()


    source.getLines().foreach(_line => {
      val line = _line.trim
      if (line.startsWith(COMMENT) || line.isEmpty) {
        // do nothing
      } else if (line.startsWith(PREFIX)) {
        line.substring(PREFIX.size).split(":").toList match {
          case prefixName :: rest =>
            var prefix = rest.mkString(":").trim
            if (prefix.startsWith("<") && prefix.endsWith(">"))
              prefix = prefix.substring(1, prefix.length - 1);
            println("Register prefix: '" + prefixName.trim + "' with " + prefix)
            prefixManager.setPrefix(prefixName.trim, prefix)
            manchesterParser.getPrefixManager.setPrefix(prefixName.trim, prefix)
            manchesterParser.setDefaultOntology(ontology)
            println("Prefixes (now added): ")
            prefixManager.prefixNames().forEach(x => println(x))
          case other => throw new ParsingException("wrong prefix declaration: " + other)
        }
      } else specs += (line match {
        case objectRe(type1, obj, iri) => OWLIndividual2Object(
          factory.getOWLNamedIndividual(GeneralOWLParsing.getIRI(iri, manchesterParser)),
          obj, type1)
        case unaryPredicateRe(pred, type1, iri) => OWLClass2Predicate(
          factory.getOWLClass(GeneralOWLParsing.getIRI(iri, manchesterParser)),
          pred, type1
        )
        case binaryPredicateRe(pred, type1, type2, iri) => OWLProperty2Predicate(
          factory.getOWLObjectProperty(GeneralOWLParsing.getIRI(iri, manchesterParser)),
          pred, type1, type2
        )
        case conditionRe(string) =>
          val components = string.split("->")
          assert(components.size == 2)
          OWLAxiom2Condition(
            GeneralOWLParsing.parse(components(1), manchesterParser, factory).asInstanceOf[OWLLogicalAxiom],
            components(0).trim
          )
        case other =>
          throw new ParsingException("Unexpected line: " + other)
      })
    })

    FluentMap(specs)
  }
}
