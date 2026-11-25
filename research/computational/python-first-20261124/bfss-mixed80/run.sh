#!/bin/bash
set -e
cd "$(dirname "$0")"
export OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1
for d in "$@"; do
  python mixed80.py /mnt/data/bfss-covariants-20261124 /mnt/data/bfss-seed-transport/source_seed_integer.npz /mnt/data/bfss-tensor-20261124 8 1 "$d" > "run_${d//,/}.log" 2>&1
done
