# D1N source-convention BFSS original-form boundary research — reproduction

**No new Lean proof or physical-spectrum theorem.** Local 27-coordinate/original Fermion/source field model and exact Gaussian moments.

Requirements: Python 3, NumPy, SciPy and SymPy. Scripts use deterministic random seeds, no network, and write JSON beside themselves. Run from this folder:

```bash
python d1n_original_form_differential.py
python d1n_gauge_global_quadrature.py
python d1n_symbolic_moments_bounds.py
sha256sum -c SHA256SUMS
```

The `SHA256SUMS` records **all eight non-manifest files** (three scripts, three JSON results, mathematical report and this README) and excludes itself. Running the scripts and then validating the checksums tests reproducibility of the exact archived machine outputs (subject to the pinned numerical runtime below).

Machine tested: Python 3.13.5, NumPy 2.3.5, SciPy 1.17.0, SymPy 1.14.0. Source gamma words parsed and checked against `SU2RealGammaProbe.lean` blob `b9b8192055c70f0d001d7982669b9823c55562ed` in D1M. Source GaugeData exact color fields frozen in the mathematical report. Earlier-stage D1M and D1L work is separate and retained in Git; this package's three scripts are standalone except that `d1n_gauge_global_quadrature.py` imports `d1n_original_form_differential.py` from the same folder.

**Two critical negative controls:** the full 3×3 determinant of `Y.T @ Y` is zero on a 2-color-dimensional transverse `Y`—use the two nonzero eigenvalues; the all-positive occupation pattern acquires a nontrivial stabilizer phase, unlike the four-plus/four-minus source seed. Numerical R160 values can suffer catastrophic cancellation; exact symbolic moments are the primary asymptotic evidence.

Read `D1N_ORIGINAL_PHYSICAL_FORM_BOUNDARY_AUDIT_2026_11_21.md` for tested hypotheses, source provenance and explicit proof-obligation ceiling. ZIP checksum is reported separately in the Git counterfactual ledger.
