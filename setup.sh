#!/usr/bin/env bash

git submodule init
git submodule update

cp ./cfe/cmake/Makefile.sample Makefile
cp -r ./cfe/cmake/sample_defs sample_defs

