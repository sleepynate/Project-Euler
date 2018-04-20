name :="project euler"

scalaVersion :="2.12.5"

version :="0.1"

libraryDependencies += "org.scalactic" %% "scalactic" % "3.0.5"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % "test"

resolvers += Resolver.sonatypeRepo("releases")

addCompilerPlugin("org.wartremover" %% "wartremover" % "2.2.1")

scalacOptions += "-P:wartremover:traverser:org.wartremover.warts.Unsafe"
