package de.tu_dresden.inf.lat.om_pmc.parsing

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.owlapi.OWLParser
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.{OWLEntityChecker, ShortFormEntityChecker}
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxParserImpl
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager}

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
    //var parser = new OWLParser(prefixManager)
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
         //   parser = new OWLParser(prefixManager)

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
                GeneralOWLParsing.parse(left, manchesterParser, factory)
              else
                throw new AssertionError("Only Manchester Syntax supported")
           //     parser.parse(left)
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


  def parseHookDefinitions(file: File): HookToAxiomMap = {
    parseHookDefinitions(Source.fromFile(file))
  }

  def parseHookDefinitions(source: BufferedSource): HookToAxiomMap= {
    val prefixManager = new DefaultPrefixManager();
    //val parser = new OWLParser(prefixManager)
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
          //println("Register prefix: '"+prefixName.trim+"' with "+prefix)
          prefixManager.setPrefix(prefixName.trim,prefix)
          manchesterParser.getPrefixManager.setPrefix(prefixName.trim,prefix)
          manchesterParser.setDefaultOntology(ontology)
          //println("Prefixes (now added): ")
          //prefixManager.prefixNames().forEach(x => println(x))
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
                GeneralOWLParsing.parse(right,manchesterParser,factory).asInstanceOf[OWLLogicalAxiom]
              else
                throw new AssertionError("Only Manchester syntax supported right now!")
               // parser.parse(right).asInstanceOf[OWLLogicalAxiom]

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
