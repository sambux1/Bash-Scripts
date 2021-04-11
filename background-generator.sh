#!/bin/bash

# include aliases
shopt -s expand_aliases
source ~/.bashrc

# cd into the correct folder (using an alias)
background_directory

# check if an executable file has already been created
FILE=./generate
if ! [ -f "$FILE" ]; then
    # if no executable exists, create it with make
    make
fi

# create an infinite loop
while true; do

    # run the background generation program
    ./generate
    
    # set the new image as the current background
    feh --bg-scale "out.png"

    # sleep for 15 seconds
    sleep 15

done

