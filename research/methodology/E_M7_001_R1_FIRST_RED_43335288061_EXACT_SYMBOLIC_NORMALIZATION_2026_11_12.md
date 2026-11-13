# E-M7-001-R1 first run — RED, apparatus defect, not a mathematical counterexample

**Status:** `INCONCLUSIVE`, no acceptance or physical theorem. **Date:** 2026-11-12 Pacific.
**Exact run:** https://github.com/etblink/math/actions/runs/43335288061, tested `ce67c9bba1a5b8b5498362409fd50b94af28e332`, completed FAILURE, attempt 1. Artifact 13996992812, digest sha256:99d9e1bebd991e7052a8a5f584bb7ea766ffd3afb6710734c3f5698e8b1e5f49.

## Actual first causal error
- Exact source pin/pre-registration checks passed. Python 3 + pinned NumPy 2.3.5, SymPy 1.14.0 installed.
- The **pre-existing** script `research/spectral-p2-original-field/tools/audit_source_fermion_sharp_constant.py` failed at line 177:
  `require(poly == sp.zeros(12), "12x12 exact source-symmetry model polynomial")`.
- This compared unexpanded SymPy expressions for structural equality. Of 144 symbolic matrix entries, 36 were syntactically nonzero but **all 36 expanded or factored exactly to zero**. The 12×12 matrix polynomial therefore passed an independent exact simplification check. Under this correction, no counterexample to the hypothesized polynomial is present.
- As the first step failed, the newly added *independent* 48×48 Kronecker/eigvalsh method never ran. Therefore no finite replication acceptance is justified.

## Prespecified response and narrow repair
The original registered hypothesis, integer 16-case battery, fixed 200 pseudorandom configurations, source pins, threshold `16*sqrt(2/3)`, `3e-10` float tolerances and model/physical distinction remain **unchanged**. Repair only the symbolic zero check from `poly == sp.zeros(12)` to `all(sp.expand(entry) == 0 for entry in poly)` (exact polynomial normalization). Re-run original experiment E-M7-001-R1, not a changed hypothesis; verify later independent method and receipt comparison. The initial red is retained; do not rewrite its history or promote it as falsification.

**Scientific method lesson:** `SymPy Matrix.__eq__` structural expression equality is not polynomial equivalence. Canonicalize expressions exactly before a purported symbolic mathematical rejection. A failing computational assertion is evidence about both the hypothesis **and the measurement apparatus**; classify the first causal failure.

**Roadmap:** M1 D5-B4A remains next proof gate. M7 remains an exploratory pre-gate. No new Lean changes.
