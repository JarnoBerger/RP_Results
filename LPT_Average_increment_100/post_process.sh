#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local" || exit
# remove previous post-processing results
if [ -f results.csv ]; then
    rm results.csv
fi
# create new post-processing results
printf '' > results.csv
for RUN_DIR in ./*/run_*/
do
  printf "Post-processing %s\n" "$RUN_DIR"
  # run post-processing for each run, gathering the results in a file
  "$RUN_DIR/post_process.sh" >> results.csv
done
