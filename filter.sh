#!/bin/bash

for i in {1..5}
do
    cd r$i/TRAJ/
    mkdir new_1to8
    cd new_1to8

    # create the filter script and run it
    cat << EOF > filter.in
parm ../p00-noWater.parm7 
trajin ../TRAJ_J25_noWater_7us.nc 1 last 1
rms fit :2-20
distance d0 :1@N :8@CD out distance_1N_8CD_forfilter6nm.dat
filter d0 min 2 max 6 out filter-distance_1N_8CD_6nm.dat
outtraj DISTANCES_filtered_2to6nm.nc netcdf
run
EOF
    cpptraj -i filter.in  

    # run the triangulation script with vmd
    vmd -dispdev text -e ~/scripts/vmd/triangulation_chi.tcl << EOF
    quit
EOF
    
    # move up three directories
    cd ../../../
done
