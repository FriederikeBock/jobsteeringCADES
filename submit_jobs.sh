#!/bin/bashselect 
#only trackers = 0.25s/evt -> 10k evt in 45 minutes
#rm -rf calibrations/*
currbatch=1
overwriteoutput=false
nEvents=200
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_wTOF_700umEC_3cmBRL pi- trackers_only_wTOF_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_wTOF_800um pi- trackers_only_wTOF_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_wTOF_1000umEC_2cmBRL pi- trackers_only_wTOF_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_wTOF pi- trackers_only_wTOF_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_noTOF pi- trackers_only_noTOF_1 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 50.0 2. 178. arches_trks_noTOF pi- trackers_only_noTOF_${currbatch} 200 $overwriteoutput

#./create_job.sh $nEvents 0.1 10.0 2. 178. arches_trks_wTOF pi- trackers_only_wTOF_TOFstudies_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 178. arches_trks_wTOF kaon- trackers_only_wTOF_TOFstudies_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 178. arches_trks_wTOF proton trackers_only_wTOF_TOFstudies_${currbatch} 200 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 178. arches_trks_wTOF e- trackers_only_wTOF_TOFstudies_${currbatch} 200 $overwriteoutput


#./create_job.sh $nEvents 0.1 10.0 2. 45. arches_trks_wTOF pi- trackers_only_wTOF_TOFstudiesFwd_${currbatch} 400 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 45. arches_trks_wTOF kaon- trackers_only_wTOF_TOFstudiesFwd_${currbatch} 400 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 45. arches_trks_wTOF proton trackers_only_wTOF_TOFstudiesFwd_${currbatch} 400 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 45. arches_trks_wTOF e- trackers_only_wTOF_TOFstudiesFwd_${currbatch} 400 $overwriteoutput
#./create_job.sh $nEvents 0.1 10.0 2. 45. gfhcal_only pi- gfhcal_studies_${currbatch} 20 $overwriteoutput



#./create_job.sh 200 0.1 50.0 2. 178. arches_trks_wTOF pi- trackers_only_wTOF_testing_${currbatch} 5 true


#./create_job.sh 15000 0.1 50.0 2. 178. arches_trks_wTOF kaon- trackers_only_wTOF_${currbatch} 200 false
#./create_job.sh 10000 0.1 50.0 2. 178. arches_trks_wTOF e- trackers_only_wTOF_${currbatch} 200 false
#./create_job.sh 15000 0.1 50.0 2. 178. arches_trks_wTOF proton trackers_only_wTOF_${currbatch} 200 false

#./create_job.sh 15000 0.1 50.0 2. 178. arches_trks_noTOF kaon- trackers_only_noTOF_${currbatch} 200 false
#./create_job.sh 10000 0.1 50.0 2. 178. arches_trks_noTOF e- trackers_only_noTOF_${currbatch} 200 false
#./create_job.sh 15000 0.1 50.0 2. 178. arches_trks_noTOF proton trackers_only_noTOF_${currbatch} 200 false

# for energy in 1 2 ; do
# for energy in 1 2 3 4 5 6 7 8 9 10 12 14 16 18 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 125 145; do 
for energy in 1 2 5 10 16 20 30; do
#    ./create_job.sh $nEvents $energy $energy 2. 35. gfhcal_only pi- gfhcal_morelayers_$energy\GeV full full 25 $overwriteoutput
#   ./create_job.sh $nEvents $energy $energy 2. 35. lfhcal_only pi- lfhcal_steelonly_$energy\GeV full full 25 $overwriteoutput
#    ./create_job.sh $nEvents $energy $energy 2. 35. gfhcal_only pi- gfhcal_45degMoreLayers_$energy\GeV 45deg full 25 $overwriteoutput
#   ./create_job.sh $nEvents $energy $energy 2. 35. lfhcal_only pi- lfhcal_45deg_$energy\GeV 45deg dd4hep 25 $overwriteoutput
#   ./create_job.sh $nEvents $energy $energy 2. 35. gfhcal_only pi- gfhcal_45deg_$energy\GeV 45deg full 25 $overwriteoutput
#   ./create_job.sh $nEvents $energy $energy 2. 35. lfhcal_only pi- lfhcal_45deg_$energy\GeV 45deg full 25 $overwriteoutput
#  ./create_job.sh $nEvents $energy $energy 2. 35. gfhcal_only pi- gfhcal_xaxis_$energy\GeV xaxis full 25 $overwriteoutput
#  ./create_job.sh $nEvents $energy $energy 2. 35. lfhcal_only pi- lfhcal_xaxis_$energy\GeV xaxis full 25 $overwriteoutput
#  ./create_job.sh $nEvents $energy $energy 2. 35. gfhcal_only pi- gfhcal_yaxis_$energy\GeV yaxis full 25 $overwriteoutput
#  ./create_job.sh $nEvents $energy $energy 2. 35. lfhcal_only pi- lfhcal_yaxis_$energy\GeV yaxis full 25 $overwriteoutput
  ./create_job.sh $nEvents $energy $energy 2. 35. forwardNew e- fecal_$energy\GeV full fullB 25 $overwriteoutput
  ./create_job.sh $nEvents $energy $energy 2. 35. forwardNew pi- fecal_steelonly_$energy\GeV full fullB 25 $overwriteoutput

done
