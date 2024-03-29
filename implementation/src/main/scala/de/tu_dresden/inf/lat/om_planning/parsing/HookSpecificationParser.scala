package de.tu_dresden.inf.lat.om_planning.parsing

import de.tu_dresden.inf.lat.om_planning.data.HookPredicate
import de.tu_dresden.inf.lat.om_pmc.interface.HookToAxiomMap
import de.tu_dresden.inf.lat.om_pmc.parsing.{GeneralOWLParsing, ParsingException}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.ShortFormEntityChecker
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxParserImpl
import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLOntology, OntologyConfigurator}
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager}

import java.io.File
import scala.io.{BufferedSource, Source}

class HookSpecificationParser(ontology: OWLOntology) {

  val COMMENT = "#"
  val PREFIX = "PREFIX"
  val HOOK_PREDICATE = "HOOK_PREDICATE:"
  val VARIABLES = "VARIABLES:"
  val TYPE_SPECIFICATION = "TYPE_SPECIFICATION:"
  val QUERY = "QUERY:"

  trait ParsingState
  object PARSING_TYPE_SPECIFICATION extends ParsingState
  object PARSING_QUERY extends ParsingState
  object PARSING_INDETERMINED extends ParsingState

  def parse(file: File): Seq[HookPredicate] = {
    parse(Source.fromFile(file))
  }

  def parse(source: BufferedSource): Seq[HookPredicate] = {
    val prefixManager = new DefaultPrefixManager()
    val manager = OWLManager.createOWLOntologyManager()
    val factory = manager.getOWLDataFactory()
    val shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    val manchesterParser = new ManchesterOWLSyntaxParserImpl(new OntologyConfigurator(), factory)
    manchesterParser.setOWLEntityChecker(shortFormProvider);
    manchesterParser.setDefaultOntology(ontology)

    var result = Seq[HookPredicate]()

    var currentName: Option[String] = None
    var currentVariables: Option[Set[String]] = None
    var currentTypeConditions: Set[OWLLogicalAxiom] = Set()
    var currentQuery: Set[OWLLogicalAxiom] = Set()

    var parsingState: ParsingState = PARSING_INDETERMINED

    source.getLines().foreach(_line => {
      val line = _line.trim
      if( line.startsWith(COMMENT) || line.isEmpty)  {
        // do nothing
      } else if (line.startsWith(PREFIX)) {
        line.substring(PREFIX.size).split(":").toList match {
          case prefixName::rest =>
            var prefix = rest.mkString(":").trim
            if(prefix.startsWith("<") && prefix.endsWith(">"))
              prefix = prefix.substring(1, prefix.length-1);
            //println("Register prefix: '"+prefixName.trim+"' with "+prefix)
            prefixManager.setPrefix(prefixName.trim,prefix)
            manchesterParser.getPrefixManager.setPrefix(prefixName.trim,prefix)
            manchesterParser.setDefaultOntology(ontology)
            //println("Prefixes (now added): ")
            //prefixManager.prefixNames().forEach(x => println(x))
          case other => throw new ParsingException("wrong prefix declaration: "+other)
        }
      } else if (line.startsWith(HOOK_PREDICATE)) {
        if(currentName.isDefined)
          result = result :+ newHook(currentName,currentVariables,currentTypeConditions,currentQuery)
        currentName = Some(line.substring(HOOK_PREDICATE.length).trim)
        //println("Hook name: "+currentName.get)
        currentVariables=None
        currentTypeConditions=Set()
        currentQuery=Set()
      } else if(line.startsWith(VARIABLES)) {
        val varString = line.substring(VARIABLES.length).trim
        currentVariables = Some(varString.split(raw"\s+").toSet)
      } else if(line.equals(TYPE_SPECIFICATION)) {
        parsingState= PARSING_TYPE_SPECIFICATION
      } else if(line.equals(QUERY)) {
        parsingState = PARSING_QUERY
      } else if(parsingState.equals(PARSING_QUERY) || parsingState.equals(PARSING_TYPE_SPECIFICATION)){
        val axiom = GeneralOWLParsing
          .parse(line, manchesterParser, factory)
          .asInstanceOf[OWLLogicalAxiom]
        parsingState match {
          case PARSING_QUERY => currentQuery += axiom
          case PARSING_TYPE_SPECIFICATION => currentTypeConditions += axiom
        }
      } else {
        throw new ParsingException("Unexpected line: "+line)
      }
    })

    if(currentName.isDefined)
      result = result :+ newHook(currentName,currentVariables,currentTypeConditions,currentQuery)

    result
  }

  def newHook(name: Option[String],
              variables: Option[Set[String]],
              typeConditions: Set[OWLLogicalAxiom],
              query: Set[OWLLogicalAxiom]): HookPredicate = {
    if(name.isEmpty)
      throw new ParsingException("No hook name specified")
    else if(variables.isEmpty)
      throw new ParsingException("No variables specified for "+name)
    else if(query.isEmpty)
      throw new ParsingException("No query specified for "+name)
    else
      HookPredicate(name.get, variables.get, typeConditions,query)
  }
}
