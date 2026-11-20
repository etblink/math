# RHOPF-P9C3D2G1D10 R1 — original Gamma9 real-four complex structure strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108` (`main` unchanged).  
**Original strict workflow:** [#44785917654](https://github.com/etblink/math/actions/runs/44785917654), attempt 1, SUCCESS, completed at 2026-11-20T17:57:11Z.  
**Exact tested commit:** `468e593b2afe13492122a7569ffd8d1088a3fe89`; job `136460619886`.  
**Original artifact:** [#14654767641](https://github.com/etblink/math/actions/runs/44785917654/artifacts/14654767641).  
**Independently recomputed original ZIP SHA-256:** `9c25e258084d268e867f2dc9192e263b2ff06ae5e73e97194cfd3dd2011bf9f5` — exactly matched both the GitHub artifact digest and original Actions upload log. The embedded `exact-tested-commit.txt` matches `468e593b2afe13492122a7569ffd8d1088a3fe89`.

## Strict qualification

- Source-exact original Gamma9/projector/phase/Circle and accepted G1D9/G1C0 Git blob preflight: PASS.
- Independent original signed-permutation integer fixture: PASS.
- Lean v4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build **9,057 jobs**, PASS.
- Native source Lean compilation with warnings as errors: PASS.
- Independent imported type consumer: PASS.
- All six `#print axioms` outputs for three source definitions/theorems in both native and independent settings contain exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`.
- ZIP inspected independently: six files (`exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `native-real-four-phase-linear-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`) and checksum and commit matched.

## Source-exact mathematical result

```lean
noncomputable def relationalPhaseJFourLinear :
    (Fin 4 → ℝ) →ₗ[ℝ] (Fin 4 → ℝ)

theorem relationalPhaseJFourLinear_apply (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear x =
      relationalRangeContinuousLinearEquivFinFour
        (relationalPhaseJRangeLinear
          (relationalRangeContinuousLinearEquivFinFour.symm x))

theorem relationalPhaseJFourLinear_square (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear (relationalPhaseJFourLinear x) = -x
```

`J₄ = E ∘ J_range ∘ E⁻¹` is a genuine real-linear complex structure on `Fin 4 → ℝ`, transported from exact original 16-real-component Gamma9 phase J and its proven projector rank-four image. Here `E` is the already accepted noncanonical real-linear equivalence from G1C0, not an assumed isometry.

**Scope limitations:** We have not yet established that `J₄` is skew relative to the transported original quadratic form `Q`, nor chosen a compatible orthonormal complex basis for that quadratic form. G1D4–D7 prove a continuous free source-derived circle action on Euclidean S³, but not its equality with the standard scalar Hopf S¹ action. Explicit equivariance/conjugacy, Hopf quotient `S³/S¹≅S²`, Chern number and BFSS original Fock/Gauss/Hamiltonian/physical soliton interpretation remain separate unproved gates.

**Next research:** Reuse the accepted original `J.transpose=-J`, `J.transpose*J=P` and the `Pv=v` property to establish preservation of original dot-self by `J` on im(P), then transfer that metric compatibility to the exact `Q(x)=dot(E⁻¹ x,E⁻¹ x)` on real-four coordinates. Keep a source-exact narrow proof gate with independent consumer.
