#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local/runs_001-550/run_057" || exit
# Run the post-process command
../../.././parse_pumpkin.sh
