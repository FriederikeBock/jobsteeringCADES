energytemp=$1
particle=$2
outputdirS=$3
config=$4
nEventSingle=$5
mkdir -p outputDir/$outputdirS

for energy in 1 2 3 4 5 6 7 8 9 10 12 14 16 18 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 125 145; do
  hadd -n 5 -f outputDir/$outputdirS/$config\_$energy\GeV_$particle.root outputDir/output_$config\_$energy\GeV_$particle\_eicrecon/eicrecon_histograms_$config\_$energy\GeV_$particle\_$nEventSingle\_*.ana.root

  if [ $6 == 1 ]; then
    rm -r outputDir/output_$config\_$energy\GeV_$particle\_eicrecon
  fi
done
