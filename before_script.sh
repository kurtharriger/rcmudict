#!/bin/bash -ex
mv DESCRIPTION DESCRIPTION.orig
sed "s/Version: \(.*\)/Version: \1.$TRAVIS_BUILD_NUMBER/" < DESCRIPTION.orig > DESCRIPTION
cd src 
make
