#!/bin/bash
cd /mnt/data/bfss-mixed68-20261124
export OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1
for d in "$@"; do
  python mixed68.py /mnt/data/bfss-covariants-20261124 /mnt/data/bfss-seed-transport/source_seed_integer.npz /mnt/data/bfss-tensor-20261124 8 0 "$d" > "run_${d//,/}.log" 2>&1 || exit $?
done
