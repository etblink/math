# D1L Python-first BFSS trial-energy research reproduction

**Research date:** 2026-11-21. **Scope:** original-source-anchored SU(2) BFSS commuting-valley *model prescreen*, not a native Lean, physical Gauss-domain, full closed-form, or spectral theorem. The exact source Git branch is `research/bfss-hopfion-gut-counterfactuals-20261121`; report `research/counterfactual-gut/D1L_ADVERSARIAL_BFSS_TRIAL_ENERGY_REPORT_2026_11_21.md`.

Requires Python 3.11+, NumPy, SciPy, SymPy. We used Python and the installed package versions: Python 3.13.5, NumPy 2.3.5, SciPy 1.17.0, SymPy 1.14.0. The three scripts write JSON outputs into their own directory. Do not move `d1l_deterministic.py` without `d1l_full_energy.py` beside it.

```bash
python d1l_symbolic_checks.py
python d1l_full_energy.py
python d1l_deterministic.py
```

- `d1l_symbolic_checks.py` symbolically checks D1H exact selected scalar cancellation, general Gaussian width penalty, independent 10×10 SVD metric/Jacobian, and finite-difference tube derivatives.
- `d1l_full_energy.py` checks fixed-tube and Gaussian-width variations using exact Gaussian moments, original 8×2 matrix SVD angles, flat-endpoint cutoffs and QMC. Its output deliberately excludes shrinking tubes because severe truncation causes unacceptable rare-event variance.
- `d1l_deterministic.py` integrates the exact real 8×2 Gaussian Wishart eigenvalue joint density using independent Gamma(8,1) and Beta(1,7/2) variables, with converged quadrature on the finite physical tube. It supersedes unstable shrinking-tube QMC estimates.

**Negative controls retained:** the initial cutoff-complement sign mistake was corrected before scientific conclusions were recorded. The shrinking-tube QMC estimator was rejected after divergent values across seeds/samples and replaced by deterministic quadrature. A physical Gauss-invariant smooth-core trial remains unproved. The code directly exposes assumptions and can be used to reproduce falsifiers and counterfactuals.

The SHA256SUMS file covers each included payload (except itself); the ZIP SHA256 is recorded in the response and repository ledger.