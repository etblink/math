#!/bin/bash
set -e
cd /mnt/data/bfss-mixed68-20261124
export OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1
python reconstruct68.py /mnt/data/bfss-full-jets-20261124 /mnt/data/bfss-covariant-cross-20261124 > reconstruct.log 2>&1
sha256sum jet_polynomials.json > pre_holdout.sha256
python integrate68.py /mnt/data/bfss-yukawa-moments-20261124 /mnt/data/bfss-cross-gram22-20261124 /mnt/data/bfss-full-jets-20261124 /mnt/data/bfss-covariant-cross-20261124 > integrate.log 2>&1
python bracket68.py > bracket.log 2>&1
