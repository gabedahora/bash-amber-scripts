#!/bin/bash

for i in {1..5}
do
    cd r$i/TRAJ/
    cat << EOF > trunc.in
parm p00-noWater.parm7
trajin TRAJ_J25_noWater.nc 1 700000
autoimage
trajout TRAJ_J25_noWater_7us.nc netcrd
run
EOF
    cpptraj -i trunc.in  
    cd ../../
done
