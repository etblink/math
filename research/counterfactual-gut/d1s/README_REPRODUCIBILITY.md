# D1S source-quantization and coefficient-transport prescreen

Run on Python 3 with NumPy:

```bash
python d1s1_original_quantization_covariance_prescreen.py
```

This rewrites `d1s1_original_quantization_covariance_prescreen_results.json` deterministically (random seed 20261121). The source definitions, 40 full 48-index cases, 9 small Fock cases, and transposed-color negative controls are documented in the report. SHA-256 entries cover each file in the bundle, including the exact expected JSON.

Limit: independently tested source *mathematical convention*, not compiled Lean, an actual 2^24-dimensional Fock computation, or a physical Hamiltonian theorem. Exact original source/consumer/strict workflow are in the isolated `etblink/math` D1S0 commit and deliberately excluded from this Python-only bundle.
