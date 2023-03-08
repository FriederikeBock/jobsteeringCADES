#!/usr/bin/env bash

# Setup for singularity
module purge
module load PE-gnu singularity/3.6.3

export EPIC_ROOT="/lustre/or-scratch/cades-birthright/$USER/EPIC"
export EIC_SHELL_PREFIX="${EPIC_ROOT}/EPIC/local"
#export SINGULARITY_BINDPATH=/lustre/or-scratch
echo "Running run_dd4hep_sim.sh"
# We need the first argument to determine the macro. We pass the rest of them along
singularity exec -B /lustre/or-scratch:/lustre/or-scratch ${EPIC_ROOT}/local/lib/jug_xl-nightly.sif bash ${EPIC_ROOT}/jobSteering/run_dd4hep_sim.sh "${@:1}"
