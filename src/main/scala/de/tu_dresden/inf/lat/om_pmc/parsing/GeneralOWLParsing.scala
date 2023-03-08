package de.tu_dresden.inf.lat.om_pmc.parsing

import org.semanticweb.owlapi.expression.OWLEntityChecker
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxParserImpl
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLDataFactory}

object GeneralOWLParsing {

  val rePropertyAssertion = raw"([^\s]+)\s+([^\s]+)\s+([^\s]+)".r

  val reLiteral = """([0-9\.]+|"[^"]*"(@.*)?(\^\^.*)?|true|false)""".r


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

  def parse(string: String,
            manchesterParser: ManchesterOWLSyntaxParserImpl,
            factory: OWLDataFactory): OWLAxiom = {
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

}
