#!/bin/bash

for i in {1..5}
do
    cd r$i/TRAJ/1to8_6nm/
    file="output_preLasso_chirality.txt"
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        echo "Number of lines in $file: $lines"
    else
        echo "$file not found in $PWD"
    fi
    cd ../../../
done
