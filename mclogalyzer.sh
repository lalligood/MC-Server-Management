#!/bin/bash
# mclogalyzer is script for periodically updating Minecraft server/player stats
# MCLOGS & HTMLDEST are defined in .bashrc

fileout=$HTMLDEST/stats.html
/usr/local/bin/mclogalyzer --chat $MCLOGS ${fileout}
