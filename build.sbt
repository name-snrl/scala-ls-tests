val scala3Version = "3.3.1"

lazy val root = project
  .in(file("."))
  .settings(
    name := "rules_scala3",
    version := "0.1.0",
    scalaVersion := scala3Version,
    libraryDependencies += "com.github.scopt" %% "scopt" % "4.1.0",
    libraryDependencies += "org.scala-sbt" %% "librarymanagement-core" % "2.0.0-alpha12",
    libraryDependencies += "org.scala-sbt" %% "librarymanagement-coursier" % "2.0.0-alpha6"
  )
