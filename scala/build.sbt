name :="project euler"

scalaVersion :="2.10.3"

version :="0.1"

libraryDependencies += "org.scalatest" % "scalatest_2.10" % "2.1.0" % "test"

resolvers += Resolver.sonatypeRepo("releases")

addCompilerPlugin("org.brianmckenna" %% "wartremover" % "0.7")

scalacOptions in (Compile, compile) += "-P:wartremover:traverser:org.brianmckenna.wartremover.warts.Unsafe"

