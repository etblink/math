# D1M global Fock-line and SVD-deck research — reproducibility

Scope: source-matched 9×16×16 real Gamma9 matrices, 48-Majorana Gaussian covariance, exact 24-orbital deck phase, raw/spinor-frame south-pole behavior, fixed-tube Gaussian tails. **Finite-dimensional analytical/Python evidence only; no native Lean, physical BFSS closed form, or spectral theorem.**

Environment tested: Python 3.13, NumPy, SymPy, SciPy; no network access needed.

From this directory execute:

```bash
python d1m_geometry.py
python d1m_deck.py > d1m_deck_results.json
python d1m_tube_tail.py
```

This reproduces the three JSON result files shipped with this package. `d1m_geometry.py` uses 72 fixed-seed source-matched covariance/metric/curvature checks and a south-pole stress scan. `d1m_deck.py` uses **exact SymPy**, no floating-point tolerance, for the four 2×2 occupied-wedge blocks and `+1` deck holonomy. `d1m_tube_tail.py` calculates the true chi-square survival function and its elementary Chernoff upper bound.

The original Lean source Gamma9 `perm` and `sign` arrays at blob `b9b8192055c70f0d001d7982669b9823c55562ed` were independently compared coefficient by coefficient against the nine Kronecker Pauli words. Source carrier and original gauge action qualification remain separate obligations. See the full D1M report and counterfactual ledger for the mathematical scope and limitations.

`SHA256SUMS` contains each included file's SHA-256 hash except the manifest itself. The ZIP checksum is reported in the user message/research ledger.
