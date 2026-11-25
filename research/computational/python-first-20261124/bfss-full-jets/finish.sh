#!/bin/bash
set -e
cd "$(dirname "$0")"
export OPENBLAS_NUM_THREADS=1
while [ ! -f jet_124_p8.json ]; do sleep 1; done
python reconstruct8.py ../bfss-higher-jets-20261124 > reconstruction.log 2>&1
python integrate56.py ../bfss-yukawa-moments-20261124 ../bfss-cross-gram22-20261124 ../bfss-higher-jets-20261124 > integration.log 2>&1
python bracket56.py > bracket.log 2>&1
