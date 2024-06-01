#!/usr/bin/env bash

git submodule init
git submodule update

make SIMULATION=native prep

