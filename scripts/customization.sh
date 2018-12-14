#!/bin/bash

BASE=`realpath $(dirname $0)/..`
rsync -rlptD $BASE/overlays/customization/ --exclude .keep /scratch/root/
