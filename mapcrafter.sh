#!/bin/bash
# mapcrafter.sh is script for periodically updating Minecraft map
# MCHOME is defined in .bashrc

# Generate Overworld map
mapcrafter -c $MCHOME/overworld.conf -j 2
# Generate Nether map
mapcrafter -c $MCHOME/nether.conf -j 2
