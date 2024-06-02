#!/usr/bin/env bash

# Get all submodules
git submodule init
git submodule update

# Copy the SBN modules to the apps directory
./apps/sbn/install .

# Run Cmake to create a new build tree.
# The native keyword instructs to use the host machine's native compiler.
make SIMULATION=native prep
