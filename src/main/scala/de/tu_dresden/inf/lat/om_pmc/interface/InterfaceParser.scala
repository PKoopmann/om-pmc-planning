package de.tu_dresden.inf.lat.om_pmc.interface

import de.tu_dresden.lat.prettyPrinting.parsing.{DLParser, OWLParser}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.ShortFormEntityChecker
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxInlineAxiomParser
import org.semanticweb.owlapi.model.{OWLEntity, OWLLogicalAxiom}
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager, ShortFormProvider}

import java.io.File
import scala.io.{BufferedSource, Source}

object InterfaceParser {

  val COMMENT = "#"
  val PREFIX = "PREFIX"

  def parseAxiomMapping(file: File): AxiomToFormulaMap = {

    parseAxiomMapping(Source.fromFile(file))
  }

  def parseAxiomMapping(source: BufferedSource): AxiomToFormulaMap = {

    val result = new AxiomToFormulaMap()

    val prefixManager = new DefaultPrefixManager();
    val parser = new OWLParser(prefixManager)
    //val manager = OWLManager.createOWLOntologyManager()
    //val factory = manager.getOWLDataFactory()
    //val shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    //val manchesterParser = new ManchesterOWLSyntaxInlineAxiomParser(factory,shortFormProvider)

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
          case other => throw new ParsingException("wrong prefix declaration: "+other)
        }
      }
      else {
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val formula = right
            val axiom = parser.parse(left)
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
    val parser = new OWLParser(prefixManager)
    //val manager = OWLManager.createOWLOntologyManager()
    //val factory = manager.getOWLDataFactory()
    //val shortFormProvider = new ShortFormEntityChecker(new BidirectionalShortFormProviderAdapter(prefixManager))
    //val manchesterParser = new ManchesterOWLSyntaxInlineAxiomParser(factory,shortFormProvider)

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
        case other => throw new ParsingException("wrong prefix declaration: "+other)
      }
    } else {
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val hook = left
            println(right)
            //\println(DLParser.parseDLStatement(right))
            val definition = parser.parse(right).asInstanceOf[OWLLogicalAxiom]
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
