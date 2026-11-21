# RHOPF-P9C3D2G1D43 R3 — original Gamma9 complex dimension-two strict GREEN

**Pacific date:** 2026-11-21. **Disposition:** ACCEPTED_STRICT_GREEN; acceptance is evidence-only. Canonical branch `integration/bfss-unified-research-20261108`.

[Original run #44922284220](https://github.com/etblink/math/actions/runs/44922284220), attempt 1 SUCCESS, exact tested source SHA `ce117ad55176b672c6f20ae5a06df4638bf7fc05`, native job `136900712051`. [Original GitHub evidence ZIP #14715110662](https://github.com/etblink/math/actions/runs/44922284220/artifacts/14715110662).

**Original ZIP SHA-256, independently recomputed:** `dcfca0f30aaec14b92672a71b9fba42b21ceeb931f3db3719325a68dbc56bb03`, matching GitHub original uploader and artifact digest. All six ZIP members independently inspected and ZIP integrity passed. Embedded `exact-tested-commit.txt` equals `ce117ad55176b672c6f20ae5a06df4638bf7fc05`.

## Native and independent qualification
- Frozen original Gamma9 SHA and source contract PASS; original integer signed-permutation fixture PASS.
- Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, dependency build 9,090 jobs PASS.
- Native original D43 source and independent imported D43 consumer compile under warnings-as-errors PASS.
- All three native and all three independent `#print axioms` reports contain only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, no Lean errors.

## Exact admitted mathematical scope
```lean
FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFourRealLinearEquiv
FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFour_finrank_real
FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFour_finrank_complex
```
On D31's accepted original Gamma9 J4-induced complex scalar action, the isolated source carrier admits a **real-linear** equivalence to the existing noncanonical `Fin 4 → ℝ` coordinate carrier. Its real finrank is 4 and therefore, using the actual pinned Mathlib `finrank_real_of_complex`, its complex finrank is exactly 2. No different complex action or original Gamma9 source was substituted.

## Preserved negative evidence
- Original [D43 R1 RED #44919215004](https://github.com/etblink/math/actions/runs/44919215004): missing `Mathlib.Tactic.Omega` module, preserved archived original artifact #14713114238 and RED memorandum.
- Original [D43 R2 RED #44920630914](https://github.com/etblink/math/actions/runs/44920630914): ill-typed `Module.finrank_fin_fun` missing explicit `ℝ`; downstream sorryAx and skipped consumer. Preserved original artifact #14713813537 and RED memorandum.
- R3 changes only acceptance evidence; not mathematical Lean source or main.
- **Not proved:** selected complex-linear coordinates on `ℂ²`; source-Q-isometry, complex orthonormal frame, equivariant sphere/S³ Hopf quotient and Chern class, or physical BFSS Fock/Gauss/Hamiltonian/hopfion claims.
- Next independent gate: existence of a `ℂ`-linear equivalence `RelationalSourceComplexFour ≃ₗ[ℂ] (Fin 2 → ℂ)` via verified finrank. Prove Q-isometry in a distinct gate, not by converting a dimension equality into metric equality.
