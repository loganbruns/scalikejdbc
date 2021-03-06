#!/bin/bash

if [[ ${TRAVIS_SCALA_VERSION} = "scripted-test" ]]; then
  sbt '++ 2.11.6' root211/publishLocal '++ 2.10.5' publishLocal checkScalariform &&
  sbt -J-XX:+CMSClassUnloadingEnabled -J-Xmx512M -J-Xms512M mapper-generator/scripted
else
  sbt ++${TRAVIS_SCALA_VERSION} "project root211" test:compile checkScalariform testSequential
fi

