package de.tu_dresden.inf.lat.om_pmc.interface

import de.tu_dresden.lat.prettyPrinting.parsing.{DLParser, OWLParser}
import org.semanticweb.owlapi.model.OWLLogicalAxiom

import java.io.File
import scala.io.{BufferedSource, Source}

object InterfaceParser {

  def parseAxiomMapping(file: File): AxiomToFormulaMap = {

    parseAxiomMapping(Source.fromFile(file))
  }

  def parseAxiomMapping(source: BufferedSource): AxiomToFormulaMap = {
    val parser = new OWLParser()

    val result = new AxiomToFormulaMap()

    source.getLines().foreach(line => {
      if(! line.startsWith("#") && !line.trim().isEmpty())
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val formula = right
            val axiom = parser.parse(left).asInstanceOf[OWLLogicalAxiom]
            result.add(axiom, formula)
          case _ => throw new ParsingException("Unexpected line: "+line)
        }
    })

    result
  }

  def parseHookDefinitions(file: File): HookToAxiomMap = {
    parseHookDefinitions(Source.fromFile(file))
  }

  def parseHookDefinitions(source: BufferedSource): HookToAxiomMap= {
    val parser = new OWLParser()

    val result = new HookToAxiomMap()

    source.getLines().foreach(line => {
      if(! line.startsWith("#") && !line.trim().isEmpty())
        line.split(" := ") match {
          case Array(left: String, right: String) =>
            val hook = left
            println(right)
            println(DLParser.parseDLStatement(right))
            val definition = parser.parse(right).asInstanceOf[OWLLogicalAxiom]
            result.add(hook, definition)
          case _ => throw new ParsingException("Unexpected line: "+line)
        }
      })

    result
  }
}
