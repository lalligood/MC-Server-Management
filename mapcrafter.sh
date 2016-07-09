#!/bin/bash
# mapcrafter.sh is script for periodically updating Minecraft map

#MCHOME=/home/lalligood/McMyAdmin/Minecraft/mapcrafter
MCHOME=/home/lalligood/bin
# Generate Overworld map
mapcrafter -c ${MCHOME}/overworld.conf -j 2
# Generate Nether map
mapcrafter -c ${MCHOME}/nether.conf -j 2
