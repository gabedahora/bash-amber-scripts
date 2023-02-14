#!/bin/bash

for i in {1..5}
do
    cd r$i/TRAJ/
    cpptraj -p p00-noWater.parm7 -y TRAJ_J25_noWater.nc -tl
    cpptraj -p p00-noWater.parm7 -y 1to8_6nm/DISTANCES_filtered_2to6nm.nc -tl
    cd ../../
done
