# IBI-G0C-SO3-EULER R1 — abstract universal ZXZ qualification

**Decision date:** 2026-11-15 Pacific  
**Research branch:** `research/bfss-incidence-unified-20261114`  
**Verdict:** **GREEN_QUALIFIED** for arbitrary proper orthogonal 3×3 matrices; **not** yet original BFSS `GaugeGroup 2` universal image or codomain det+1 statement.

## Exact qualified record

- [GitHub Actions run #43774271484](https://github.com/etblink/math/actions/runs/43774271484), `completed/success`, attempt 1, tested code `5c2502e8c30784eb2769114b7dd20c300f9cde3c`; job `132996851612`, all required steps `completed/success`.
- Abstract source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Euler.lean`, Git blob `ffc6fb6449800a533015cdc7b648bc5d85037ac0`.
- Independent consumer `lean/diagnostics/BFSSIBIG0CSO3EulerIndependentConsumer.lean`, Git blob `cb8d9fc06f374cc458348267a0d5dcc656c4b02f`.
- Strict pinned workflow `.github/workflows/bfss-ibi-g0c-so3-euler-strict.yml`, blob `6b272dcac1352047ac7ec93626cba05aefdb30e4`.
- Accepted pure-Mathlib angle prerequisite `IBIG0CSO3Angle.lean`, blob `2bc7521a8f417ddd8e0e74370d3d014ddb200e2a`; accepted original BFSS X image blob `999a0c66110431d1c92aaaf6ca37b21f253a9501`, Z image blob `e4623ef2e7ce825575a73f96e087bee17c4872ab`; accepted sources not modified.
- Frozen Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Native cold build `8925/8925`; strict `-DautoImplicit=false -DwarningAsError=true` source and independent consumer passed. Exact preflight `BFSS_IBI_G0C_SO3_EULER_PREFLIGHT_PASS` and final marker `BFSS_IBI_G0C_SO3_EULER_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- `#print axioms FCP.BFSSIBIG0CSO3Euler.sourceSO3_euler_decomp` reported only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, additional axioms or strict-lint blockers.
- Independent consumer separately checks arbitrary matrix `M` with `M ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ` and arbitrary `Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ`. These are universal targets, not just parametrized Euler matrices.
- [Evidence artifact #14184749662](https://github.com/etblink/math/actions/runs/43774271484/artifacts/14184749662), size 1556 bytes per GitHub API; job log reported ZIP SHA-256 `c5d884fe4b11282bb7dbc752dde50971052c145aeeb90a23bb5fe8d6e13d637d` (not independently rehashed).

## Exact accepted theorem and donor boundary

```lean
theorem FCP.BFSSIBIG0CSO3Euler.sourceSO3_euler_decomp
  (M : Matrix (Fin 3) (Fin 3) ℝ)
  (hM : M ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
  ∃ α β γ : ℝ, M = rotZ α * rotX β * rotZ γ
```

The proof is source-independent `SO(3)` finite geometry. It handles `sβ = sqrt (1-M22²)`, both cases `sβ = 0` and `sβ ≠ 0`, orthogonality, determinant-one cofactors, and all nine matrix entries. It imports only the accepted angle helper, **not** any BFSS gauge or physical module.

Constructive proof adapted with copyright and Apache-2.0 notice from [LionSR/QICLean EulerAngles.lean](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean) at pinned source commit `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac`. The QICLean code itself is **not** a trusted import; native toolchain independently qualified this adapted proof.

## Next proof interface and limits

Next target original source-specific BFSS image:
```lean
∀ Q : Matrix (Fin 3) (Fin 3) ℝ,
    Q ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ →
    ∃ g : OAI.BFSSQuantum.GaugeGroup 2,
      FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q
```
Construct explicit witness `sourceZGauge α * sourceXGauge β * sourceZGauge γ` from accepted original source Z/X images and `adjointColorMatrix_mul`; prove exact abstract/local rotation equality as separate adapters. Ensure source `ColorIndex 2` is definitionally `Fin 3` and preserve rows=output, columns=input. This is the **onto-SO3 existence** statement; to promote a genuine hom to `SO(3)`, any all-input `det=+1` codomain membership must be independently accepted and bound as well. No physical/Fock/spectral conclusions follow.

An acceptance record alone must not count as strict qualification of the new source-specific theorem. Freeze all accepted Lean bytes, including this Euler proof. Do not edit unified integration, `main` or frozen FCP.
