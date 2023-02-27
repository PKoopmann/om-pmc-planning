package de.tu_dresden.inf.lat.om_pmc.interface

import de.tu_dresden.inf.lat.prettyPrinting.parsing.{DLParser, OWLParser}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.{OWLEntityChecker, ShortFormEntityChecker}
import org.semanticweb.owlapi.manchestersyntax.parser
import org.semanticweb.owlapi.manchestersyntax.parser.{ManchesterOWLSyntaxInlineAxiomParser, ManchesterOWLSyntaxParserImpl}
import org.semanticweb.owlapi.model.providers.EntityProvider
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLDataFactory, OWLEntity, OWLLogicalAxiom, OWLOntology, OntologyConfigurator}
import org.semanticweb.owlapi.util.mansyntax.ManchesterOWLSyntaxParser
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager, ShortFormProvider}

import java.io.File
import scala.io.{BufferedSource, Source}

class InterfaceParser(ontology: OWLOntology) {

  val COMMENT = "#"
  val PREFIX = "PREFIX"

  var MANCHESTER_SYNTAX=true

  def parseAxiomMapping(file: File): AxiomToFormulaMap = {

    parseAxiomMapping(Source.fromFile(file))
  }

  def parseAxiomMapping(source: BufferedSource): AxiomToFormulaMap = {

    val result = new AxiomToFormulaMap()

    val prefixManager = new DefaultPrefixManager();
    var parser = new OWLParser(prefixManager)
    val manager = OWLManager.createOWLOntologyManager()
    val factory = manager.getOWLDataFactory()
    var shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    var manchesterParser = new ManchesterOWLSyntaxParserImpl(new OntologyConfigurator(), factory)
    manchesterParser.setOWLEntityChecker(shortFormProvider);
    manchesterParser.setDefaultOntology(ontology)
    //new ManchesterOWLSyntaxInlineAxiomParser(factory,shortFormProvider)

    source.getLines().foreach(_line => {
      val line = _line.trim()
      if( line.startsWith(COMMENT) || line.isEmpty)  {
        // do nothing
      } else if (line.startsWith(PREFIX)) {
        line.substring(PREFIX.size).split(":").toList match {
          case prefixName::rest =>
            var prefix = rest.mkString(":").trim
            if(prefix.startsWith("<") && prefix.endsWith(">"))
              prefix = prefix.substring(1, prefix.length-1);
            println("Register prefix: '"+prefixName.trim+"' with "+prefix)
            prefixManager.setPrefix(prefixName.trim,prefix)
            println("Prefixes (now added): ")
            prefixManager.prefixNames().forEach(x => println(x))
            manchesterParser.getPrefixManager.setPrefix(prefixName.trim,prefix)
            parser = new OWLParser(prefixManager)

            manchesterParser.setOWLEntityChecker(shortFormProvider);
            manchesterParser.setDefaultOntology(ontology)

          case other => throw new ParsingException("wrong prefix declaration: "+other)
        }
      }
      else {
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val formula = right
            //println("Prefixes: ")
            //prefixManager.prefixNames().forEach(x => println(x))
            val axiom =
              if(MANCHESTER_SYNTAX)
                parse(left, manchesterParser, factory, shortFormProvider)
              else
                parser.parse(left)
            //val axiom = manchesterParser.parse(left)
            if(!axiom.isInstanceOf[OWLLogicalAxiom])
              throw new ParsingException("Not a logical axiom: "+axiom)
            result.add(axiom.asInstanceOf[OWLLogicalAxiom], formula)
          case _ => throw new ParsingException("Unexpected line: "+line)
        }
      }
    })

    result
  }

  val rePropertyAssertion = raw"([^\s]+)\s+([^\s]+)\s+([^\s]+)".r

  val reLiteral = """([0-9\.]+|"[^"]*"(@.*)?(\^\^.*)?|true|false)""".r


  def parse(string: String,
            manchesterParser: ManchesterOWLSyntaxParserImpl,
            factory: OWLDataFactory,
            entityChecker: OWLEntityChecker): OWLAxiom = {
    val axiom = string match {
      case rePropertyAssertion(first,property,second) if second matches(reLiteral.regex) =>
        println(reLiteral.findFirstIn(second))
        println("first: "+first)
        println("second: "+second)
        println("property: "+property)
        val ind = factory.getOWLNamedIndividual(getIRI(first,manchesterParser))
        val prp = factory.getOWLDataProperty(getIRI(property,manchesterParser))
        manchesterParser.setStringToParse(second)
        val value = manchesterParser.parseLiteral(null)
        println(ind)
        println(prp)
        println(value)

        factory.getOWLDataPropertyAssertionAxiom(prp,ind,value)

      case rePropertyAssertion(first, property, second) if property.equals("Type:") =>
        val ind1 = factory.getOWLNamedIndividual(getIRI(first, manchesterParser))
        val cl = factory.getOWLClass(getIRI(second, manchesterParser))
        factory.getOWLClassAssertionAxiom(cl, ind1)

      case rePropertyAssertion(first,property,second) if !property.equals("Type:")  =>
        println("first: "+first)
        println("second: "+second)
        println("property: "+property)
        val ind1 = factory.getOWLNamedIndividual(getIRI(first,manchesterParser))
        val ind2 = factory.getOWLNamedIndividual(getIRI(second,manchesterParser))
        val prp = factory.getOWLObjectProperty(getIRI(property,manchesterParser))
        println(ind1)
        println(ind2)
        println(prp)

        factory.getOWLObjectPropertyAssertionAxiom(prp,ind1,ind2)

      case _ =>
        manchesterParser.setStringToParse(string)
        manchesterParser.parseAxiom()
    }

    println("Parsed axiom: "+axiom)

    axiom
   /* string match {
      case rePropertyAssertion(property,first,second) =>
        val second = manchesterParser.parseL
      case reClassAssertion(classExp,individual) =>
        val ce = manchesterParser.parseClassExpression(classExp)
        val ind = entityChecker.getOWLIndividual(individual)
        factory.getOWLClassAssertionAxiom(ce,ind)
    }*/
  }

  /**
   * copied and slightly adapted from ManchesterOWLSyntaxParserImpl for maximimum compatibility
   * @param inputName
   * @return
   */
  def getIRI(string: String, manchesterParser: ManchesterOWLSyntaxParserImpl): IRI = {
    if(string.startsWith("<"))
      return IRI.create(string)
    else {
      val shortened =
        if(!string.contains(":"))
          ":"+string
        else
          string

      return manchesterParser.getPrefixManager.getIRI(string)
    }
  }


  def parseHookDefinitions(file: File): HookToAxiomMap = {
    parseHookDefinitions(Source.fromFile(file))
  }

  def parseHookDefinitions(source: BufferedSource): HookToAxiomMap= {
    val prefixManager = new DefaultPrefixManager();
    val parser = new OWLParser(prefixManager)
    val manager = OWLManager.createOWLOntologyManager()
    val factory = manager.getOWLDataFactory()
    val shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    val manchesterParser = new ManchesterOWLSyntaxParserImpl(new OntologyConfigurator(), factory)
    manchesterParser.setOWLEntityChecker(shortFormProvider);
    manchesterParser.setDefaultOntology(ontology)

    val result = new HookToAxiomMap()

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
          println("Register prefix: '"+prefixName.trim+"' with "+prefix)
          prefixManager.setPrefix(prefixName.trim,prefix)
          manchesterParser.getPrefixManager.setPrefix(prefixName.trim,prefix)
          manchesterParser.setDefaultOntology(ontology)
          println("Prefixes (now added): ")
          prefixManager.prefixNames().forEach(x => println(x))
        case other => throw new ParsingException("wrong prefix declaration: "+other)
      }
    } else {
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val hook = left
            println(right)
            //\println(DLParser.parseDLStatement(right))
            val definition =
              if(MANCHESTER_SYNTAX)
                parse(right,manchesterParser,factory,shortFormProvider).asInstanceOf[OWLLogicalAxiom]
              else
                parser.parse(right).asInstanceOf[OWLLogicalAxiom]

            //val definition = manchesterParser.parse(right)
            if(!definition.isInstanceOf[OWLLogicalAxiom])
              throw new ParsingException("Not a logical axiom: "+definition)
            result.add(hook, definition.asInstanceOf[OWLLogicalAxiom])
          case _ => throw new ParsingException("Unexpected line: "+line)
        }
    }
    })

    result
  }
}
