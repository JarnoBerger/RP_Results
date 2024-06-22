#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local/runs_001-560" || exit
# Generate run numbers; shuffle tasks to avoid systematic bias; then for each in a subshell: generate the run dir with padded numbers; go into that dir; check if not run before; then run.
# shellcheck disable=SC2016
for num in $(seq 1 560 | shuf); do (
  RUN_DIR=$(printf "run_%03d" "$num");
  cd "$RUN_DIR" || exit;
  if [ -f driver.log ] && [ ! -f driver.err ]; then
      echo "$RUN_DIR was already started, and did not fail, skipping.";
      exit 0;
  fi;
  ./run.sh
) done
