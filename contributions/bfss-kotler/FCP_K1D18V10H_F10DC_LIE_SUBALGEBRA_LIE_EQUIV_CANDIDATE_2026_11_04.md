# F10DC candidate — actual derivative-range Lie packaging

**Status:** CANDIDATE / NOT YET QUALIFIED  
**Date:** 2026-11-04  
**Repository:** `etblink/math`  
**Write target:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`

## Question

Can the already established actual identity-chart derivative range be given its canonical ambient Clifford-commutator `LieSubalgebra` structure, and can the existing native real-linear equivalence be packaged as a genuine `LieEquiv` without changing its values or inverse?

This is deliberately a packaging step. It should consume the exact F10DB closure and bracket-preservation interfaces rather than reproduce the bracket calculation.

## Exact parent checkpoint

F10DB's strict workflow [#41913435697](https://github.com/etblink/math/actions/runs/41913435697) completed successfully on tested commit `abedd367f58f34054ba9bb9a4e2507a4eb1ba576`. The current branch head at candidate preparation is `0d9b530d0703886eeded0017b81a0767934d2bbe`, whose parent is that tested commit; the current head adds the F10DB acceptance record.

Exact F10DB source and independent-audit blobs:

- `SU2BFSSPairedSpin9V10HF10DBDerivativeRangeCommutatorClosure.lean`: `12c3397a06a6e9ef634c69bae075c20564bb1e4c`
- `FCP_K1D18V10HF10DBIndependentAudit.lean`: `19e04f3e39986081154adccfb35e3f9d1db62407`

The accepted environment remains Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Candidate construction

1. Define `source9IdentityChartDerivativeLieSubalgebra` on the exact existing `source9IdentityChartDerivativeRange` submodule. Its only bracket-closure premise is discharged by F10DB's `source9IdentityChartDerivativeRange_commutator_mem`.
2. Define `source9NativeSkewDerivativeRangeLieEquiv` from the existing `source9NativeSkewDerivativeRangeEquiv`. Its bracket law is discharged by F10DB's `source9NativeSkewDerivativeRangeEquiv_commutator`.
3. Keep the subtype conversions explicit in the forward and inverse functions. Do not alter the original range values, native source space, source label ordering, or half-bivector normalization.

## Candidate files and immutable blobs

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DCDerivativeRangeLiePackaging.lean`
  - blob `0231391e37f7c72ae1dfcd3e4ee6670869a1d800`
- Independent audit: `lean/diagnostics/FCP_K1D18V10HF10DCIndependentAudit.lean`
  - blob `cd72a540378e7b7e29a6637f1bd43fa0267f40a9`
- Strict workflow: `.github/workflows/bfss-kotler-v10h-f10dc-derivative-range-lie-packaging-strict.yml`
  - blob `6f8c32a896cd99dcd5f02814443609efb1b9c8ff`

The workflow pins the full F10DB accepted ancestry, F10DB source and audit blobs, exact candidate blobs, Lean/Mathlib revisions, and the tested F10DB commit. It rebuilds the DA ancestry, freshly compiles the exact F10DB parent, compiles F10DC with warnings treated as errors, then runs an independent consumer audit.

## Acceptance requirements

- Fresh source compilation and nonempty native object.
- Exact two declaration names and complete independent type/axiom audit.
- Only `propext`, `Classical.choice`, and `Quot.sound` permitted in reported axiom dependencies.
- No `sorryAx`, authored proof holes, unauthorized axioms, source diagnostics, or relaxed resource/linter settings.
- Independent checks of the unchanged underlying submodule, ambient/subtype bracket, native linear values, inverse, and LieHom law.
- Preserve exact candidate source, audit, workflow, logs, and terminal outcome.

No F10DC declaration is counted as a new accepted root unless the exact strict workflow and independent audit complete successfully.

## Boundaries

Even if the gate passes, this is only a Lie-algebra packaging result. It does **not** establish:

- closure under ordinary Clifford multiplication or an associative/unital subalgebra;
- identification with the source manifold tangent space;
- translated chart compatibility or a source manifold/Lie-group structure;
- global Spin(9) integration, covering, target surjectivity, or a group-level lift;
- any additional BFSS physical, gauge-domain, or spectral conclusion.

A red compiler or audit result must be classified at its earliest causal diagnostic. A type/subtype mismatch is an interface failure to investigate, not a mathematical counterexample. A missing closure proof or failed exact bracket equality would be a different and materially stronger result.
