#!/bin/bash -ex
sed -i '' "s/Version: \(.*\)/Version: \1.$TRAVIS_BUILD_NUMBER/" DESCRIPTION
cd src 
make
