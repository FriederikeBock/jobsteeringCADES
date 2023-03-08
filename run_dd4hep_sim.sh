#!/usr/bin/env bash

export EPIC_ROOT="/lustre/or-scratch/cades-birthright/${USER}/EPIC"

source /opt/detector/epic-nightly/setup.sh
source ${EPIC_ROOT}/epic-dd4hep/install/setup.sh


nEvents=$1
particlemomMin=$2
particlemomMax=$3
particleThetaMin=$4
particleThetaMax=$5
detectorXML=$6
customName=$7
generatorSetting=$8
#outputFile=$7
#embed_input_file=$7
#skip=$8
outDir=${9}
runAngle=${10}
runSteps=${11}

# Determine the output filename here because we need to add the index.
# We want to normalize the output to contain leading zeros.
ifileLeadingZero=$(printf "%03d" $SLURM_ARRAY_TASK_ID)
echo $ifileLeadingZero
outputFile="ddsim_${detectorXML}_${customName}_${generatorSetting}_${nEvents}_${ifileLeadingZero}.edm4hep.root"

echo "nEvents = $nEvents"
echo "particlemomMin = $particlemomMin"
echo "particlemomMax = $particlemomMax"
echo "particleThetaMin = $particleThetaMin"
echo "particleThetaMax = $particleThetaMax"
echo "detectorXML = $detectorXML"
echo "generatorSetting = $generatorSetting"
echo "outputFile = $outputFile"
echo "embed_input_file = $embed_input_file"
echo "outDir = $outDir"
#skip=$(($ifileLeadingZero * $nEvents))
#echo "skip = $skip"

if [ $runSteps == "full" | $runSteps == "dd4hep" ]; then 
  if [ $runAngle == 0 ]; then 
    npsim --compactFile $DETECTOR_PATH/epic_$detectorXML.xml -G -N $nEvents --gun.thetaMin "$particleThetaMin*deg" --gun.thetaMax "$particleThetaMax*deg" --gun.distribution "pseudorapidity" --gun.momentumMin "$particlemomMin*GeV" --gun.momentumMax "$particlemomMax*GeV" --gun.particle "$generatorSetting" --outputFile ${outDir}/${outputFile}
  else 
    # 45 deg on calo
    npsim --compactFile $DETECTOR_PATH/epic_$detectorXML.xml -G -N $nEvents --gun.position "(0.,0.,3000)" --gun.direction "(1.,1.,1.)" --gun.momentumMin "$particlemomMin*GeV" --gun.momentumMax "$particlemomMax*GeV" --gun.particle "$generatorSetting" --outputFile ${outDir}/${outputFile}
  fi 
fi

if [ $runSteps == "full" | $runSteps == "eicrecon" ]; then 
  source ${EPIC_ROOT}/epic-eicrecon/bin/eicrecon-this.sh
  #rm -rf calibrations/*

  outputFileeicrecon="eicrecon_${detectorXML}_${customName}_${generatorSetting}_${nEvents}_${ifileLeadingZero}.ana.edm4hep.root"
  outputFileeicreconHists="eicrecon_histograms_${detectorXML}_${customName}_${generatorSetting}_${nEvents}_${ifileLeadingZero}.ana.root"
  mkdir -p ${outDir}_eicrecon
  # run eicrecon
  eicrecon -Ppodio:output_file=${outDir}_eicrecon/${outputFileeicrecon} -Phistsfile=${outDir}_eicrecon/$outputFileeicreconHists -Pplugins=lfhcal_studies -Pdd4hep:xml_files=$DETECTOR_PATH/epic_$detectorXML.xml ${outDir}/${outputFile}
fi
