#!/bin/bash
# This script starts the McMyAdmin server engine
cd $HOME/McMyAdmin
tmux new -s McMyAdmin -n SrvrStatus "./MCMA2_Linux_x86_64"
