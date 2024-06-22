#!/bin/sh
# make sure we're in the directory of this file
cd -P -- "/mnt/e/gitkraken/gourd/mrcpsp/local" || exit

for CHUNK_DIR in runs_*/
do
  printf "Running chunk %s\n" "$CHUNK_DIR"

  # run the chunk
  "$CHUNK_DIR/run_chunk.sh"
done
