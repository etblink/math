# RHOPF-P9C3D2G1D19 R1 — original Gamma9 polarized Q preserved by J4 strict GREEN

**Date:** 2026-11-20 Pacific. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Branch:** `integration/bfss-unified-research-20261108`; original Gamma9 and `main` unchanged.  
**Original strict run:** [#44822101317](https://github.com/etblink/math/actions/runs/44822101317), attempt 1 SUCCESS; **exact tested commit** `4c8291ece66b8a7b3b964465e347fe74e3e6116d`; job `136585289038`.  
**Original CI artifact:** [#14672668792](https://github.com/etblink/math/actions/runs/44822101317/artifacts/14672668792).  
**Independently recomputed original ZIP SHA-256:** `7e505ff14408e054d06de75fbf0beb999c816c9adc5d07e7d48a0d2b014a282f` (matches GitHub artifact and original Actions upload). Embedded `exact-tested-commit.txt` matches.

## Strict evidence
- Frozen original Gamma9/P/J/Circle, original accepted D11/D18 and independent Gamma9 integer fixture hash preflight: PASS.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original accepted dependencies **9,066 jobs** built successfully.
- Native source and independently imported consumer warning-as-error compilations: PASS.
- Two native and two independent axiom reports: only `[propext, Classical.choice, Quot.sound]`; no `sorryAx` or compiler error.
- ZIP independently downloaded, SHA-256 recomputed and six entries inspected: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-polar-quadratic-j-invariance-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Mathematical scope

```lean
noncomputable def relationalSourcePolarQuadratic
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeCoordinateDotSelf (x + y) -
   relationalRangeCoordinateDotSelf x -
   relationalRangeCoordinateDotSelf y) / 2

theorem relationalSourcePolarQuadratic_J4_invariant
    (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
      relationalSourcePolarQuadratic x y
```

This equality follows directly from original source J4 real linearity and original Q-preservation, without asserting an isometry between the noncanonical E and ordinary coordinate dot. It establishes **only** invariance of the polarized source form, not yet bilinearity or positive-definiteness. Next prove polar form equals transported original spinor dot product and use it to qualify real bilinearity and definiteness, then a metric-compatible complex structure and basis. No Hopf quotient, Chern number, physical Fock/gauge/Hamiltonian or stable hopfion follows.
