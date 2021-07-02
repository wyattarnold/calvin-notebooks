#!/bin/bash -l

#SBATCH -J "calvin-cosvfea"   # job name
#SBATCH -n 96            # Total number of processors to request (32 cores per node)
#SBATCH -p high           # Queue name hi/med/lo
#SBATCH -t 90:00:00        # Run time (hh:mm:ss) - 24 hours
#SBATCH --mail-user=wlarnold@ucdavis.edu              # address for email notification
#SBATCH --mail-type=ALL                  # email at Begin and End of job

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE



# user directory
UDIR=/home/wlarnold
GDIR=/group/hermangrp

# set paths
export GRB_LICENSE_FILE=$GDIR/gurobi652/gurobi.lic
export GUROBI_HOME=$GDIR/gurobi652/linux64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib
export PATH=$UDIR/miniconda3/bin:${GUROBI_HOME}/bin${PATH}

# . ~/.bashrc
# conda activate py37

# down here you can run whatever you want to run.
mpiexec -n 96 --use-hwthread-cpus python -m mpi4py.futures ./main-cosvfea.py
