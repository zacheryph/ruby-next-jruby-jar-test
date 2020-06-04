#!/usr/bin/env bash

echo "=> install dependencies"
gem install bundler warbler

echo "=> generate jar file"
warble

echo "=> run jar file: java -jar next-test.jar"
java -jar next-test.jar
