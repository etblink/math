# D1O original-carrier Gaussian projector research — reproducibility

**2026-11-21.** Numerical/symbolic test suite, *not* a Lean or source physical domain theorem. The original SU2-BFSS source paths/commit pins, proof boundaries and negative controls are in `D1O_ORIGINAL_CAR_GAUSSIAN_PROJECTOR_AND_KATO_AUDIT_2026_11_21.md`.

Environment checked: Python 3.13.5, NumPy 2.3.5, SymPy 1.14.0. From this directory:

```sh
OPENBLAS_NUM_THREADS=1 python d1o_clifford_projector.py
OPENBLAS_NUM_THREADS=1 python d1o_gauge_projector.py
OPENBLAS_NUM_THREADS=1 python d1o_reference_blocks.py
OPENBLAS_NUM_THREADS=1 python d1o_projector_geometry.py
OPENBLAS_NUM_THREADS=1 python d1o_kato_transport.py
```

Each command writes its respective `*_results.json` file. The scripts are deliberately **not** written to allocate the full original 2^24-dimensional Hilbert matrix. The 3-mode exact SymPy blocks and reduced 6-mode numerical geometry are independent tests of the source-normalized finite-CAR algebra, not a substitute carrier.

Artifacts: five Python scripts, five JSON results, the research report, this README, and `SHA256SUMS`. The ZIP includes the exact same files. `SHA256SUMS` lists all files except itself. Preserved negative controls: wrong gauge matrix transpose; wrong all-positive chirality stabilizer; explicitly excluded naive arbitrary-vector global projection; source D1K1A and D1F RED history.
