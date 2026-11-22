# RHOPF-P9C3D2G1D68A R1 — native strict RED: normalization norm and exact scalar witness

**Pacific date:** 2026-11-21. **Disposition: R1 STRICT RED, D68A UNQUALIFIED.** Exact original [run #44998848711](https://github.com/etblink/math/actions/runs/44998848711), job `137135683471`, attempt 1, exact tested SHA `fd226532c053549fca3b4d368b96700ef2f7f02f`. Original [artifact #14745432760](https://github.com/etblink/math/actions/runs/44998848711/artifacts/14745432760).

## Independent original evidence audit

Downloaded and inspected original five-file ZIP. `ZipFile.testzip() == None`; five intact files; `exact-tested-commit.txt` matches `fd226532c053549fca3b4d368b96700ef2f7f02f`. Independently computed original ZIP SHA-256 `6b0fd1ee01be883de484f4a1ba16c24231d966d7e3903710807e482986edbf99` matches original GitHub published artifact digest. Native source diagnostic log and independent original integer fixture included.

The exact source SHA pins / preflight, original Gamma9 source contract, signed-permutation numeric fixture PASS. Lean 4.34.1 / pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS. All **9,115 dependency jobs** built successfully, including accepted D67. Native D68A source **RED** at lines **33** and **48**. Independent imported type consumer **SKIPPED**. All three native D68A axiom reports contain `sorryAx` because of Lean errors; no D68A declaration is qualified.

## Exact original errors

**Line 33 (normalization norm)**:
```text
error: Type mismatch: After simplification, term
  inv_mul_cancel₀ hn
has type
  ‖↑v‖⁻¹ * ‖↑v‖ = 1
but is expected to have type
  ‖↑‖↑v‖⁻¹‖ * ‖↑v‖ = 1
```
The direct subtype-constructor `refine ⟨..., ?_⟩` followed by `simpa only [norm_smul, norm_inv, norm_norm]` left the cast complex scalar's norm unsimplified.

**Line 48 (projective scalar witness)**:
```text
error: Application type mismatch: argument `rfl` has type ?m.44 = ?m.44
but is expected to have type
  ↑‖↑v‖⁻¹ • ↑v = ↑(relationalCanonicalNonzeroUnitNormalization v)
```
A source-exact instance of a representation/proof elaboration obstacle, not a mathematical counterexample.

## Narrow recovery: reusing D64 GREEN rather than guessing

Frozen accepted D64 source `RHOPFP9C3D2G1D64StandardCircleOrbitProjectivizationSurjective.lean` (**blob `2b5a106728bb1596da6f43694fee05bb0cc53b82`**) qualified this *exact norm-one scalar* using a named `let w : EuclideanSpace ℂ (Fin 2) := ...`, `have hw : ‖w‖ = 1 := by dsimp [w]; simpa only [norm_smul, norm_inv, norm_norm] using (inv_mul_cancel₀ hn)`, then `let y := ⟨w, hw⟩` and `Projectivization.mk_eq_mk_iff'` with the same scalar. R2 may reuse this exact structure within the *new D68A definition*, preserving all accepted earlier proof bytes. The class witness should be explicit about unfolding D68A normalization's value, not rely on an untested bare `rfl`.

This is a **repair candidate**, not an accepted proof. Retain all three new declarations and their statement types, the byte-identical independent consumer, frozen original Gamma9 source/fixture, pinned Lean/Mathlib, warning-as-error, exact axiom checks, and preserved R1 ZIP/logs. No `sorry`, no altered accepted D45–D67 sources, no direct unqualified Homeomorph/inverse continuity claim, no topology transport, no `main` edits.
