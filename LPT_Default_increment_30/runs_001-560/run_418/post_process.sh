#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local/runs_001-560/run_418" || exit
# Run the post-process command
../../.././parse_pumpkin.sh
