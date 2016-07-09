#!/bin/bash
# mclogalyzer is script for periodically updating Minecraft server/player stats

#MCLOG=/home/lalligood/McMyAdmin/Minecraft/logs
#HTMLDEST=/home/lalligood/www/stats.html
MCLOG=$HOME/.ampdata/instances/survival1-10/Minecraft/logs
HTMLDEST=$HOME/www/stats.html
/usr/local/bin/mclogalyzer --chat ${MCLOG} ${HTMLDEST}
