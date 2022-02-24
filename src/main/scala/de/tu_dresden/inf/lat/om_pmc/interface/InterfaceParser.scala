package de.tu_dresden.inf.lat.om_pmc.interface

import de.tu_dresden.lat.prettyPrinting.parsing.{DLParser, OWLParser}
import org.semanticweb.owlapi.model.OWLLogicalAxiom

import java.io.File
import scala.io.Source

object InterfaceParser {

  def parseAxiomMapping(file: File) = {

    val parser = new OWLParser()

    val result = new AxiomToFormulaMap()

    Source.fromFile(file).getLines().foreach(line => {
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

  def parseHookDefinitions(file: File) = {

    val parser = new OWLParser()

    val result = new HookToAxiomMap()

    Source.fromFile(file).getLines().foreach(line => {
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
