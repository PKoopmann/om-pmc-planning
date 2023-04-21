lazy val commonSettings = Seq(
  organization := "de.tu_dresden.inf.lat",
  version := "0.2",
  scalaVersion := "2.12.5"
)

lazy val root = (project in file("."))
  .settings(
    commonSettings,
    name := "ontology-mediated-pmc",
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-api
libraryDependencies += "org.slf4j" % "slf4j-api" % "1.7.36",
libraryDependencies += "net.sourceforge.owlapi" % "owlapi-distribution" % "5.1.4",
//    libraryDependencies += "net.sourceforge.owlapi" % "owlexplanation" % "5.0.0",
    libraryDependencies += "net.sourceforge.owlapi" % "org.semanticweb.hermit" % "1.3.8.500",
    libraryDependencies += "com.github.galigator.openllet" % "openllet-explanation" % "2.6.4",
    libraryDependencies += "org.semanticweb.elk" % "elk-owlapi" % "0.4.3",
    //libraryDependencies += "de.tu-dresden.lat" %% "dl-pretty-printer-owlapi5" % "0.4-SNAPSHOT",
    libraryDependencies += "de.tu-dresden.inf.lat" %% "lat-scala-dl-tools-owlapi5" % "0.4.1-SNAPSHOT",
    libraryDependencies += "net.sourceforge.owlapi" % "org.semanticweb.hermit" % "1.4.5.519",
    libraryDependencies += "junit" % "junit" % "4.12" % "test",
    libraryDependencies += "com.novocode" % "junit-interface" % "0.11" % "test"
      )

//libraryDependencies ++= Seq("net.aichler" % "jupiter-interface" % JupiterKeys.jupiterVersion.value % Test)
//libraryDependencies += "net.aichler" % "jupiter-interface" % "0.10.0" % Test

mainClass in (Compile, packageBin) := Some("de.tu_dresden.inf.lat.om_planning.CreatePlanningDefinitions")

resolvers += Resolver.mavenLocal


assemblyMergeStrategy in assembly := {
  case "logback.xml.example" => MergeStrategy.discard
  case "logback.xml" => MergeStrategy.first
  //  case PathList("net.sourceforge.owlapi", "owlapi-distribution", xs @
  //      _*)         => MergeStrategy.first
  case PathList(ps @ _*) if ps.last endsWith ".class" => MergeStrategy.first
  //  case PathList(ps @ _*) if ps.last endsWith ".html" => MergeStrategy.first
  //  case "application.conf"                            => MergeStrategy.concat
  //  case "unwanted.txt"                                =>
  //  MergeStrategy.discard
  case "META-INF/axiom.xml" => MergeStrategy.first
  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}
