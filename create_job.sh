#!/usr/bin/env bash

date

if [ $# != 12 ]; then
     echo "This script needs 12 parameters !"
     echo "Parameters: nEvents, particlemomMin, particlemomMax, particleThetaMin, particleThetaMax, detectorXML, generatorSetting, customName, runAnlge, runSteps, njobs, cleanPreviousSimulations"
     exit 0
fi
echo ${@}
nEvents=$1
particlemomMin=$2
particlemomMax=$3
particleThetaMin=$4
particleThetaMax=$5
detectorXML=$6
generatorSetting="$7"
customName="$8"
runAngle="$9"
runSteps="${10}"
njobs="${11}"
cleanPreviousSimulations="${12}"
echo "njobs=$njobs"
echo "cleanPreviousSimulations=$cleanPreviousSimulations"

skip=0


uniqueID=${detectorXML}_${customName}_${generatorSetting}

echo "uniqueID: ${uniqueID}"

initDir=$PWD
outputDir="outputDir"
outDir="$outputDir/output_$uniqueID"
logDir="$outputDir/log_$uniqueID"

mkdir -p $outDir $logDir

# Determine which index to start the job index from
startingIndex=1
if [[ "${cleanPreviousSimulations}" == true ]];
then
    echo "Removing previous simulations results for \"${uniqueID}\""
    rm -rf $outDir/* $logDir/*
#else
#    startingIndex=$(ls ${outDir}/ | sort | tail -n 1 | cut -d '_' -f2)
    # Force bash to treat this as an integer (it could be treated as octal if it has a leading 0)
#    startingIndex=$((10#$startingIndex))
    # We want to take the next index, so we increment one further
#    startingIndex=$((startingIndex + 1))
fi
echo "Starting index: ${startingIndex}"

slurmJobConfig="$initDir/$outputDir/slurmJob_${uniqueID}.sbatch"

echo "nEvents=$nEvents"
echo "particlemomMin=$particlemomMin"
echo "particlemomMax=$particlemomMax"
echo "particleThetaMin=$particleThetaMin"
echo "particleThetaMax=$particleThetaMax"
echo "detectorXML=\"$detectorXML\""
echo "customName=$customName"
echo "generatorSetting=\"$generatorSetting\""
echo "outDir=\"$outDir\""
echo "runAngle=\"$runAngle\""
echo "runSteps=\"$runSteps\""

# We want a ceiling function so we always have enough nodes.
# Based on https://stackoverflow.com/a/12536521/12907985
nNodes=$(((${njobs} + 32 - 1) / 32))
tasksPerNode=$(((${njobs} + ${nNodes} - 1) / ${nNodes}))

# Now, implement steering script for slurm
#SBATCH --tasks-per-node=1 
# queues testing , high_mem_cd, burst, gpu
cat > ${slurmJobConfig} <<- _EOF_
#!/usr/bin/env bash
#SBATCH -A birthright
#SBATCH -p high_mem_cd
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -J eic-dd4hep-sim
#SBATCH --mem=6G
#SBATCH -t 6:00:00
#SBATCH -o ${logDir}/%A-%a.stdout
#SBATCH -e ${logDir}/%A-%a.stderr

./run_job_with_singularity.sh $nEvents $particlemomMin $particlemomMax $particleThetaMin $particleThetaMax $detectorXML $customName $generatorSetting $initDir/$outDir $runAngle $runSteps
_EOF_


#sbatch -a 1-$njobs $slurmJobConfig
# -1 for the upper edge because it's inclusive
sbatch -a ${startingIndex}-$((${startingIndex} + ${njobs} - 1)) $slurmJobConfig

