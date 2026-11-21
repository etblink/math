# D1Q original source physical smooth-core bridge: executable checks

**Status:** Exact source-anchored original 9×3 SVD / 48-Majorana covariance prescreen plus reduced six-mode CAR/Kato/source-oriented color-gauge test. These are **not** Lean source-qualified proofs of `SmoothCore 2`, `pairedGaugeData.invariantCore`, closed physical form, essential spectrum, or any hopfion/GUT claim.

Run from this directory with Python 3, NumPy and SciPy:

```bash
OPENBLAS_NUM_THREADS=1 python d1q_svd_smooth_core_prescreen.py
OPENBLAS_NUM_THREADS=1 python d1q_kato_source_gauge_prescreen.py
sha256sum -c SHA256SUMS
```

Both scripts have deterministic seed `20261121`. The first uses original Gamma9 source Pauli words and 70 original 9×3 matrices; checks deck, SO3 source color covariance, ambient derivatives, squared smooth cutoff, spectral gap, compact zero-extension region and a uniform covariance derivative bound. The second uses an actual reduced 64-dimensional, six-orbital Jordan–Wigner CAR carrier with two opposite Gamma8 spin-pair signs; computes the true exterior-power color unitary by occupancy minors and compares it against Kato **vectors**. The transposed-color negative control must fail, and a full SO3 2π loop must return phase +1. Neither script constructs a dense original 2^24 Hilbert matrix.

Generated JSON files: `d1q_svd_smooth_core_prescreen_results.json`, `d1q_kato_source_gauge_prescreen_results.json`. The report `D1Q_ORIGINAL_FOCK_SMOOTH_CORE_GAUSS_BRIDGE_2026_11_21.md` gives the analytical theorem architecture and source blob pins; `D1Q_SOURCE_LEAN_MICROGATE_INTERFACE_2026_11_21.md` specifies future independent proof gates only. `SHA256SUMS` covers the six files other than itself. The first (rejected) local SVD derivative implementation had a Python dimension error; the corrected version is the only one archived.
