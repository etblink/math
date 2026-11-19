# RHOPF-P9C3D0 R1 — preflight theorem/definition-kind RED; R2 bounded recovery

**Date:** November 19, 2026
**Canonical branch:** `integration/bfss-unified-research-20261108`
**Original R1 strict run:** [#44614805120](https://github.com/etblink/math/actions/runs/44614805120), attempt 1, conclusion FAILURE.
**Exact tested SHA:** `254f988c48a761f2d08f06815d32193babe33d20`.
**Original retained artifact:** [#14572649268](https://github.com/etblink/math/actions/runs/44614805120/artifacts/14572649268), downloaded and verified ZIP SHA-256 `c96c5263d0926eb9e4f931bff61bc7c76696266fc57e6cf69fdf9d5bd296b104`, identical to GitHub artifact digest. Embedded `exact-tested-commit.txt` matches the exact tested SHA; `toolchain-sha256.txt` present. Original CI job ID `135880504917`.

## Diagnostic distinction

Checkout and exact source/toolchain SHA preflight hash checks passed. The workflow failed BEFORE Lean restoration or compilation with `AssertionError` in the Python source-contract preflight, line 42. The check incorrectly demanded:
`assert re.findall(r'(?m)^theorem (\\S+)',src)==names+['relationalCircleRepresentation']`.

The source intentionally contains three `theorem` declarations:
`relationalCircleMatrix_one`, `relationalCircleMatrix_mul`, `relationalCircleMatrix_orthogonal`,
and two `noncomputable def` declarations:
`relationalCircleMatrix` and `relationalCircleRepresentation`. The fourth expected item is a bundled `Circle →* GammaMatrix` **definition**, not a theorem, so the theorem-only contract check was unsatisfiable despite valid source shape. No Lean theorem was compiled; neither native nor independent axiom status is known for this R1.

## R2 minimal repair

Update ONLY the newly introduced P9C3D0 workflow Python declaration-contract check:

- Demand exactly the three original theorem names.
- Separately demand exactly `relationalCircleMatrix` and `relationalCircleRepresentation` via the regex for `noncomputable def`.
- Keep the four native and independently imported `#print axioms` report expectations, source exact hash pins, original integer gamma fixture, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, strict warnings-as-errors, resource limits, SHA assertions and diagnostic retention unchanged.

No change to original Gamma9 source, source P/J/Q phase laws, new Lean source theorem/definition statements, independently imported consumer, Fock or Hamiltonian. The source mathematical result remains UNQUALIFIED until new original strict GREEN and independent imported consumer and allowed-only root axiom checks pass. Any future native compiler failure will be diagnosed separately, without treating it as a continuation of this preflight failure.

## Scientific boundary

The only candidate claim is a bundled **algebraic** Mathlib `Circle →* GammaMatrix` homomorphism using the previously strictly accepted original Gamma9 phase law and unit-circle orthogonality. Continuity of that map, a group action on vectors, its Hopf-fibration geometry, BFSS Fock-space/gauge/Hamiltonian realization and experimental predictions remain separately unproved. Preserve P9C3C R1 preflight RED, P9C3B1 R1/R2 proof REDs, and prior failed gamma-coordinate routes as distinct negative knowledge.
