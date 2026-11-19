# RHOPF-P9C1C1A R3 — strict GREEN original Gamma9 common-action equalizer qualified

**Date:** November 19, 2026.
**Branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44571452613](https://github.com/etblink/math/actions/runs/44571452613), attempt 1, SUCCESS.
**Exact tested commit:** `de4c3aed8ba34694b82759a320b5816cfac4e33c`.
**Decision:** **ACCEPT** all four original native theorems, subject to exact tested source identity below.

## Evidence

- Frozen original Core/Gamma9/qualified predecessor source/hash contract and independent integer fixture: PASS.
- Exact pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Native original-source compilation with warnings as errors: PASS.
- Separate independent exact-typed imported Lean consumer with warnings as errors: PASS.
- 4 original native and 4 independent consumer `#print axioms` reports: **only** `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or compiler errors.
- Downloaded original [artifact #14555272255](https://github.com/etblink/math/actions/runs/44571452613/artifacts/14555272255). ZIP SHA-256 `12856ce18d0f5d160d33a9b009b4f1c4f7ee59f299daecaee74ff13337393501`, equal to GitHub original digest. ZIP `exact-tested-commit.txt` matches the original SHA; independently inspected native/consumer axiom reports, original integer fixture and pinned dependency build log.

## Exact qualified source statements

- `relationalProjector_fixed_of_common_action`: if the three original gamma bivector actions K13/K25/K46 agree on a real original 16-spinor vector, the original projector P fixes it.
- `relationalProjector_range_iff_common_action`: `v ∈ range(toLin'(P)) ↔ K13 *ᵥ v = K25 *ᵥ v ∧ K13 *ᵥ v = K46 *ᵥ v`.
- `selectedBasisFixed_of_common_action`: **conditional** on source K13/K25/K46 agreement for each of e0,e1,e8,e9.
- `selectedCoordinatePlane_eq_projector_range_of_common_action`: **conditional** indexed four-plane equality under the same unproved source finite basis-action hypothesis.

Combined with P9C1B1 R2 rank 4 and P9C1C0 R2, this proves the coordinate-independent common-action equalizer is four-dimensional over ℝ. The exact identification of its image with literal original spinor basis indices 0,1,8,9 remains UNPROVED in native Lean.

## Negative knowledge and obligations

R1 strict [#44535995764](https://github.com/etblink/math/actions/runs/44535995764) remains RED due to missing `open scoped Matrix` for `*ᵥ` notation. R2 strict [#44568940095](https://github.com/etblink/math/actions/runs/44568940095) remains RED due to two rewrite-order errors: indiscriminate `rw [← Matrix.mulVec_mulVec, hw]` targeted expansion of KA rather than the projector witness. R3 passed only after splitting witness substitution from matrix-vector composition at both locations; no theorem change or resource override. Retain all prior P9A1B large-matrix/private-scope/two-cell REDs.

Do not promote the four indexed original-source basis-action witnesses from finite integer fixture to Lean without source-exact compilation/independent audit. Even proving them would establish representation geometry only, not a global Fock Spin9 implementer, physical Hamiltonian conservation, protected 3D Hopfion or Standard Model prediction. The three original gamma bivectors are inequivalent on the full 16-spinor carrier despite their equality on the relational sector.
