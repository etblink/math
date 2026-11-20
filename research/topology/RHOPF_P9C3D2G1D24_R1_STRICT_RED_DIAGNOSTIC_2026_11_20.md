# RHOPF-P9C3D2G1D24 R1 — original native strict RED, diagnostic preserved

**Date:** 2026-11-20 Pacific. **Disposition:** REJECTED_NATIVE_RED.  
**Branch:** `integration/bfss-unified-research-20261108`. `main` and original source Gamma9 unchanged.  
**Original CI:** [run #44834708777](https://github.com/etblink/math/actions/runs/44834708777) FAILED attempt 1; job `136628062420`; **exact tested commit** `343ce04fe75cfc9fd364632c61d3cf485e7d5d25`.  
**Original artifact:** [#14678616667](https://github.com/etblink/math/actions/runs/44834708777/artifacts/14678616667).  
**Independently recomputed SHA-256:** `618262c31cf5e378ac53fba5808652b1cb935cce506244446185f34d352f3b01`, matching GitHub artifact metadata and original uploader output. Embedded `exact-tested-commit.txt` matches `343ce04fe75cfc9fd364632c61d3cf485e7d5d25`. Five original ZIP files: exact tested commit, integer fixture consumer, original native failed compilation/axiom log, qualified accepted dependency build and toolchain hashes.

## Observed

Original frozen Gamma9 and proof scope preflight **PASS**. Pinned Lean 4.34.1 / Mathlib restoration **PASS**. Existing source dependency build **9,071 jobs PASS**. Original native D24 **RED**. Independent imported consumer **SKIPPED**.

Source `RHOPFP9C3D2G1D24OriginalGammaSourceInnerCore.lean`:
1. Line 37: `inner := relationalSourceBilinForm` has type `LinearMap.BilinForm ℝ (Fin 4 → ℝ)`, but Mathlib's `Inner` field expects the raw binary function `(Fin 4 → ℝ) → (Fin 4 → ℝ) → ℝ`. Use `fun x y => relationalSourceBilinForm x y`.
2. Line 32: Lean `warn.classDefReducibility` warns a class-typed `noncomputable def` is semireducible. Mark with `@[instance_reducible]` while **not** registering a global class/typeclass instance or altering existing coordinate norms.
3. Line 75: `rfl` at the evaluator failed to identify the core's `inner` with the bundled bilinear form, in the presence of the invalid core declaration. Re-test after correcting the field before changing proof shape.

`#print axioms` includes `sorryAx`. No D24 declaration accepted from R1. Previous accepted D14–D23 remains qualified.

## Bounded R2 recovery

Only change D24's inner-product-core adapter to explicitly eta-expand the `inner` field and mark this standalone class-valued definition `@[instance_reducible]`. Re-run native and separately imported consumers with all 3+3 strict axiom reports and original ZIP integrity. Do **not** disable class reducibility warning, add axioms, change any theorem signature or change original Gamma9, source E, transported Q, D20–D23, Lean toolchain, global class instances or `main`.

If native R2 is RED, preserve original artifact again, assess exact diagnostic, and stop after bounded corrections. Physical Fock, Hopf quotient and charge remain OPEN.
