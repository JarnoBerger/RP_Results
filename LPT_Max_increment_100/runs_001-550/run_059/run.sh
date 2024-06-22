#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local/runs_001-550/run_059" || exit
# remove possible previous failed report
if [ -f driver.err ]; then
  rm driver.err
fi
if [ -f run.err ]; then
  rm run.err
fi
printf "name = \"_j30_14_8\"\nprogram = \"pumpkin\"\nfile = \"["../../../instances/mm_j30/j30_14_8.dzn"]\"\n" > driver.log
# Get gnu-time from environment, don't call shell built-in. Use it to record time information to driver.log about the run, while writing the exit code to driver.err iff the run fails.
env time --append --output=driver.log --format="wall_clock_time = %e\nsystem_time = %S\nuser_time = %U" \
   sh -c '( /mnt/e/gitkraken/pumpkin/target/release/examples/mrcpsp "--timeout" "100000" "../../../instances/mm_j30/j30_14_8.dzn" > run.log 2> run.err ) || printf "exit_code = $?\n" > driver.err'
