#!/bin/bash

# compile source files
javac -cp "lib/*:src" -d bin $(find . -name "*.java")

cd bin

# extract the contents of the JAR dependencies
find ../lib -name "*.jar" | xargs -n 1 jar xvf

# create a single JAR file with sources and dependencies
jar cvf microrts.jar $(find . -name '*.class' -type f)
