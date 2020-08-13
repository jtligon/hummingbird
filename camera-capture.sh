#!/usr/bin/bash -x

STORAGE_FOLDER='/home/jligon/data'
mkdir -p $STORAGE_FOLDER
cd $STORAGE_FOLDER
shopt -s nullglob
numfiles=(*)
numfiles=${#numfiles[@]}
filename='capt'$numfiles'.jpg'
gphoto2 \
    --filename $filename \
    --quiet \
    --set-config manualfocusdrive="None"\
    --set-config eosremoterelease="Immediate" \
    --set-config eosremoterelease="Release Full" \
    --wait-event-and-download=1s

#https://medium.com/nerdery/dslr-webcam-setup-for-linux-9b6d1b79ae22
#https://github.com/gphoto/gphoto2/issues/161

#    --capture-image-and-download \


#mv $filename $STORAGE_FOLDER



