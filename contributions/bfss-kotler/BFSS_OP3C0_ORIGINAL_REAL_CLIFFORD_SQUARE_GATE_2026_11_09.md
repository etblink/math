# BFSS OP3-C0 — original real Clifford generator-square diagnostic

**Date:** 2026-11-09  
**Working branch:** `integration/bfss-unified-research-20261108`  
**Initial HEAD:** `cd558f19a28179029c1690178229e3bd0d7f5ff1`  
**Status:** **CANDIDATE; not qualified until exact strict CI accepts source and independent consumer.**  
**Toolchain:** Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.  
**Methodology:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md); [OP3-C direct-lift investigation](BFSS_OP3C_DIRECT_CLIFFORD_LIFT_INTERFACE_INVESTIGATION_2026_11_09.md).

## 1. Decision: bypass the blocked isometry-equivalence wrapper

The original paired-label real Spin(9) representation `source9SpinOriginalPaired48OrthogonalHom : spinGroup source9Quadratic →* Matrix.orthogonalGroup Source48Label ℝ` exists in previously accepted F10F/F10R source. Its *actual* `Source48Vector` action preserves the *actual* original `source48Quadratic` by accepted [OP3-B1 #42675821883](https://github.com/etblink/math/actions/runs/42675821883).

Both [OP3-B2 #42678500270](https://github.com/etblink/math/actions/runs/42678500270) and [#42680558526](https://github.com/etblink/math/actions/runs/42680558526) failed to package the same action into the additional `IsometryEquiv` structure through Lean recursion, despite the latter producing a preliminary permitted-axiom report for the separated ordinary real `LinearEquiv`. Therefore **OP3-B2 remains HOLD**; the source mathematics need not be rebuilt or altered.

Pinned Mathlib `CliffordAlgebra.lift` accepts a linear generator map `f` satisfying the exact square relation `f(v)*f(v)=algebraMap ℝ C (source48Quadratic v)`. The present OP3-C0 gate proves **only that prerequisite**, not the lift or any Spin group action on the algebra.

## 2. Smallest original-source dependency ladder

Set `Q := source48Quadratic`, `V := Source48Vector`, `C := CliffordAlgebra Q`, and let `R_g` be the matrix underlying the **existing** original source Spin(9) → O(48) group homomorphism on the accepted G1A paired labels. No alternative 48D representation, different Clifford convention, rescaled Majorana or replacement source Hamiltonian is introduced.

For an arbitrary source orthogonal matrix `A` with original O(48) membership:

```text
CliffordAlgebra.ι Q (A.mulVec v) * CliffordAlgebra.ι Q (A.mulVec v)
  = algebraMap ℝ C (Q (A.mulVec v))    -- pinned CliffordAlgebra.ι_sq_scalar
  = algebraMap ℝ C (Q v)               -- accepted OP3-B1
```

Define the small original real-linear generator interface
`f_g := (CliffordAlgebra.ι Q).comp ((R_g).mulVecLin)`.

It must evaluate on the genuine source vector as
`f_g v = CliffordAlgebra.ι Q (R_g.mulVec v)`, preserving the **same source orientation** as the original F10R group map. Its square then satisfies exactly the input of `CliffordAlgebra.lift Q ⟨f_g,h_g⟩`.

The preferred direct-lift route uses the pinned `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` `ι_sq_scalar`/universal property and `Mathlib/LinearAlgebra/Matrix/ToLin.lean` `Matrix.mulVecLin_apply` (both independently inspected on the exact Mathlib revision). No `QuadraticMap.Isometry`, `QuadraticForm.IsometryEquiv` or finite 48-mode sum is needed by this test.

## 3. Four strictly bounded root declarations

Source file: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C0OriginalRealCliffordGeneratorSquare.lean`.

1. `FCP.BFSSOP3C0OriginalRealCliffordSquare.orthogonal_source48_clifford_generator_square`: square of the genuine original Clifford generator at `A.mulVec v` for any actual source orthogonal matrix A.
2. `FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap`: original real-linear composite `ι Q ∘ₗ R_g.mulVecLin`, not an algebra homomorphism.
3. `FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_apply`: pointwise original source generator evaluation. This is not full all-vector equality between independently named representations.
4. `FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_square`: the original Spin(9) source generator square needed for a later `lift`.

Separate independent consumer: `lean/diagnostics/BFSSOP3C0OriginalRealCliffordSquareIndependentAudit.lean`, importing source at the exact `CliffordAlgebra source48Quadratic`, `Source48Vector`, `Source48Label`, `spinGroup source9Quadratic`, and full original O(48) type. Each of four roots is printed in both source and consumer.

## 4. New fail-closed acceptance

Dedicated workflow: `.github/workflows/bfss-op3c0-original-real-clifford-generator-square-strict.yml`. It checks **12 exact original-source and independent-consumer Git blob pins**, the exact Lean/Mathlib toolchain, source import list and root list. The strict gate cold-builds accepted original F10R and OP3-B1 parents plus new OP3-C0; separately compiles source and independent consumer at warning-as-error; rejects errors, `sorryAx`, unapproved warnings or unapproved axioms, requiring exactly **four** root reports in **each**. Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Diagnostic artifact retains tested commit and logs and labels every downstream unqualified goal `False`.

**Green:** Accept only the original real Clifford generator square, the true source generator linear map and evaluation and its square. The accepted source does **not** include `CliffordAlgebra.lift`; it is the input to that later construction. Next proposed small gate is the direct source real Clifford `AlgHom` and its `lift_ι_apply`, followed by separate identity/composition/inverse gates.

**Red:** Preserve first causal compiler error. A local coercion, namespace or matrix-linear-map identity mismatch can receive one bounded targeted repair with an unchanged statement. If recurrence is still an isometry-like elaboration problem, stop and reconsider `lift`/linear-map interfaces rather than increasing `maxRecDepth` or `maxHeartbeats`. Do not change source geometry or declare a mathematical obstruction from a proof-engineering limit.

## 5. Scientific scope

OP3-C0 is a **necessary algebraic interface for constructing an exact original Clifford action**, not itself a group action. OP3-C1 must prove the direct real `AlgHom` and generator covariance; OP3-C2 must prove the identity, same-order multiplication and inverse for **the original Spin(9)**. Complexification through the real-to-complex source `CliffordAlgebra.equivBaseChange ℂ Q`, the accepted M3I Fock operator `AlgEquiv`, and later physical star/adjoint, central parity, continuity, gauge and original Hamiltonian-domain issues remain separate. The analytical full-operator fiber weight bound remains `M=12` and all original-source spectral claims remain conditional at this stage.

## OP3-C0 strict GREEN #42685719690 — original direct-lift prerequisite qualified

**Verified 2026-11-09.** [Run #42685719690](https://github.com/etblink/math/actions/runs/42685719690), attempt 1, tested source commit `e45fc7e4f8e917682310628a2da1f5f877eb9475`, job `129391878312`, terminal **SUCCESS**. All 12 exact original BFSS, prior theorem, new source, and independent consumer Git blob pins passed; Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; cold OP3-B1/OP3-C0 source built; separately compiled original-carrier consumer; exactly **four** printed declaration roots in each source/consumer axiom audit. Only `propext`, `Classical.choice`, and `Quot.sound` permitted, with no `sorryAx` or unacceptable warnings. Receipt `OP3C0_ORIGINAL_REAL_CLIFFORD_SQUARE_INDEPENDENT_STRICT_PASS`, artifact [#13705607471](https://github.com/etblink/math/actions/runs/42685719690/artifacts/13705607471), ZIP SHA256 `3c84abf216f29428accdcb36f23906957198f66a7a473e5610287494b1a35134` (runner-reported, not separately downloaded).

**Exactly admitted:** `orthogonal_source48_clifford_generator_square`, `source9Spin_originalClifford_generatorLinearMap`, `source9Spin_originalClifford_generatorLinearMap_apply`, `source9Spin_originalClifford_generatorLinearMap_square` in `FCP.BFSSOP3C0OriginalRealCliffordSquare`, at the original source group, same paired `Source48Label`, and original real `source48Quadratic`. OP3-B2 remains HOLD after two independent recursion reds. Neither the full Clifford `AlgHom` nor Spin group law/automorphism or Fock physical/spectral result was proved.

**Next bounded candidate:** [OP3-C1 direct real Clifford universal lift](BFSS_OP3C1_ORIGINAL_REAL_CLIFFORD_UNIVERSAL_LIFT_GATE_2026_11_09.md). It imports the now accepted source square, uses pinned `CliffordAlgebra.lift`, and independently verifies the real `AlgHom` and source generator covariance. **CANDIDATE until its own strict gate completes.**
