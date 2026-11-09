# BFSS OP3-C1 — direct original real Clifford universal lift

**Date:** 2026-11-09  
**Working branch:** `integration/bfss-unified-research-20261108`  
**Planning baseline:** `e45fc7e4f8e917682310628a2da1f5f877eb9475`  
**Status:** OP3-C0 **QUALIFIED**, OP3-C1 **CANDIDATE / NOT YET QUALIFIED**.  
**Toolchain:** Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.  
**Guardrails:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md) and [direct Clifford route investigation](BFSS_OP3C_DIRECT_CLIFFORD_LIFT_INTERFACE_INVESTIGATION_2026_11_09.md).

## 1. OP3-C0 verified receipt and exact limits

[Run #42685719690](https://github.com/etblink/math/actions/runs/42685719690), attempt 1, exact tested commit `e45fc7e4f8e917682310628a2da1f5f877eb9475`, job `129391878312`: **SUCCESS**. The complete gate passed 12 exact original-source and consumer Git blob pins, Lean 4.34.1/pinned Mathlib restoration, cold OP3-B1 and OP3-C0 compilation, independently compiled original-carrier consumer, and **four exact root reports in both source and independent consumer**. Only `propext`, `Classical.choice`, `Quot.sound` appeared as permitted axioms. Receipt `OP3C0_ORIGINAL_REAL_CLIFFORD_SQUARE_INDEPENDENT_STRICT_PASS`; artifact ID `13705607471` and runner-reported ZIP SHA256 `3c84abf216f29428accdcb36f23906957198f66a7a473e5610287494b1a35134` (artifact was not independently downloaded).

Accepted exact declarations in `FCP.BFSSOP3C0OriginalRealCliffordSquare`:
- `orthogonal_source48_clifford_generator_square`: source `CliffordAlgebra.ι source48Quadratic (A.mulVec v)` obeys the *same original* `Q(v)` Clifford square for any original orthogonal 48-real A.
- `source9Spin_originalClifford_generatorLinearMap`: genuine original source `Source48Vector →ₗ[ℝ] CliffordAlgebra source48Quadratic` from the F10R group matrix composed with `ι Q`.
- `source9Spin_originalClifford_generatorLinearMap_apply`: evaluates that map to `ι Q (R_g v)` on original vectors.
- `source9Spin_originalClifford_generatorLinearMap_square`: exact `f_g(v)²=Q(v)·1`, the sole missing mathematical premise of the pinned `CliffordAlgebra.lift` direct universal property.

These theorems show **no OP3-B2 isometry wrapper was mathematically necessary** for the square relation. Both OP3-B2 reds remain valid negative proof-engineering findings. OP3-C0 did **not** construct any Clifford `AlgHom`, `AlgEquiv`, original Spin action, star/continuity or spectral theorem.

## 2. OP3-C1 minimum dependency ladder and proof design

The exact source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C1OriginalRealCliffordDirectUniversalLift.lean` imports **only** OP3-C0 and uses the already inspected `Mathlib.LinearAlgebra.CliffordAlgebra.Basic` universal construction.

For `g : spinGroup source9Quadratic`, define
```text
source9Spin_originalRealCliffordAlgHom g
  : CliffordAlgebra source48Quadratic →ₐ[ℝ]
      CliffordAlgebra source48Quadratic
  := CliffordAlgebra.lift source48Quadratic
       ⟨source9Spin_originalClifford_generatorLinearMap g,
        source9Spin_originalClifford_generatorLinearMap_square g⟩
```

**Three candidate roots:**
1. `source9Spin_originalRealCliffordAlgHom`: a *real Clifford algebra endomorphism for each original Spin(9) element* via the previously qualified OP3-C0 source square. No group action theorem is bundled with the family.
2. `source9Spin_originalRealCliffordAlgHom_generator`: apply `CliffordAlgebra.lift_ι_apply` on the original `ι Q v`, recovering the OP3-C0 real-linear source generator exactly.
3. `source9Spin_originalRealCliffordAlgHom_generator_covariance`: combine item 2 with accepted OP3-C0 source-axis/all-real-vector generator map evaluation to get `Φ_g (ι Q v) = ι Q (R_g.mulVec v)`, using precisely the original paired `Source48Label` matrix and `Source48Vector`.

This is a genuine *original-source real Clifford* construction. There is no new quadratic form, new 48D representation, reindexed surrogate Hilbert space, `IsometryEquiv` package, ad hoc normalization, or 48-mode finite sum.

## 3. Independent strict acceptance and red/green decisions

Independent original-carrier consumer:
`lean/diagnostics/BFSSOP3C1OriginalRealCliffordUniversalLiftIndependentAudit.lean`. It imports the exact new theorem, checks `CliffordAlgebra source48Quadratic →ₐ[ℝ] CliffordAlgebra source48Quadratic` with an explicit local alias, then checks exact original generator and paired-label matrix covariance statements; prints all three fully qualified roots.

Dedicated workflow:
`.github/workflows/bfss-op3c1-original-real-clifford-universal-lift-strict.yml`. The workflow freezes **13 exact original parent/new source and consumer Git blobs**, original Lean/Mathlib pins, imports and root enumeration, source cold build, independent consumer cold Lean check and exact permitted-axiom audit in source and consumer. Reject `sorryAx`, errors, original-source warnings, altered theorem roots, and axioms outside `propext`, `Classical.choice`, `Quot.sound`. Preserve tested commit and diagnostic artifact.

**If GREEN:** Promote **only** the original real Clifford `AlgHom` family and exact generator covariance. OP3-C1 closes the construction step of the real Clifford homomorphism but *does not yet* qualify that `g↦Φ_g` respects the Spin(9) identity, group multiplication, or inversion. The next bounded gate must establish `Φ_1 = AlgHom.id`, `Φ_(gh) = Φ_g.comp Φ_h` by the actual source F10R matrix `MonoidHom`, `Matrix.mulVec_mulVec`, and `CliffordAlgebra.hom_ext`. Only then prove inverse and package `AlgEquiv`.

**If RED:** Inspect the first causal compiler error; distinguish `CliffordAlgebra.lift` API or definitional reduction from scalar/label mismatch. The source input square remains independently qualified. Permit only a diagnosed bounded repair. Do not increase recursion/heartbeat budgets, reintroduce OP3-B2, postulate the group law, or mutate the original Clifford/Fock interface. Preserve exact red evidence.

## 4. Limits of the scientific claim

Original source group actions on the real Clifford algebra, base-change to `CliffordAlgebra (source48Quadratic.baseChange ℂ)`, transport through accepted M3I `ℂ`-`AlgEquiv`, and genuine original Fock operator star-adjoint/continuity/central-parity/gauge/closed-Hamiltonian/spectrum claims remain independent future obligations. The parallel whole-operator fiber bound is **M=12**, and no spectral claim follows from the real Clifford universal lift.
