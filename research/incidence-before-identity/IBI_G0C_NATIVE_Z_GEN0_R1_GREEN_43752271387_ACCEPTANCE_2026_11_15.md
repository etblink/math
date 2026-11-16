# IBI-G0C-Z-GEN0 — R1 strict GREEN acceptance

**Date:** 2026-11-15 (Pacific)  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Verdict:** **GREEN_QUALIFIED for native SU(2) Z-generator membership and zero identity.**  
**Not qualified:** adjoint (SO(3)) Z-axis image, native X-axis image, Euler factorization over arbitrary (SO(3)), surjectivity, kernel classification, physical/Fock/spectral conclusions.

## Frozen exact qualification

- [Run #43752271387](https://github.com/etblink/math/actions/runs/43752271387): `completed/success`, first attempt, exact tested commit `109de3b51f52a1e8bff9e3925fd134f7bf141f77`.
- [Job #132928621825](https://github.com/etblink/math/actions/runs/43752271387): all required steps `completed/success`.
- Native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CNativeZGenerator.lean`: Git blob `4aa7884124fb1cc6497aaa78f8b4e6995c158338`.
- Independent consumer `lean/diagnostics/BFSSIBIG0CNativeZGeneratorIndependentConsumer.lean`: Git blob `b9d0a6de325264b6851cd328f4476082fd4442b4`.
- Workflow `.github/workflows/bfss-ibi-g0c-native-z-generator-strict.yml`: Git blob `62595f25f25eae277c9a2f6b8c9509e2d2b25efb`.
- Frozen input parent source `IBIG0CInversePauli.lean`: Git blob `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`, independently qualified at [run #43750250997](https://github.com/etblink/math/actions/runs/43750250997).
- Pinned Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Native cold build `9018/9018`, separate warning-as-error source and consumer both completed successfully.
- Preflight marker `BFSS_IBI_G0C_NATIVE_Z_GEN0_PREFLIGHT_PASS`; terminal marker `BFSS_IBI_G0C_NATIVE_Z_GEN0_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- `#print axioms` for `sourceZMatrix_mem_specialUnitary`, `sourceZGauge_coe`, `sourceZGauge_zero` contained only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Independent consumer confirms (i) native matrix coercion, (ii) exact identity (Z(0)=1), and (iii) existing inverse/star theorem for this native gauge family.
- [Evidence artifact #14177252047](https://github.com/etblink/math/actions/runs/43752271387/artifacts/14177252047), size 4,984 bytes per GitHub REST. Job log reports artifact ZIP SHA-256 `51c75aab6cc00da9729e927d81ed0ca0971bb649c983fa3867ee1e28851cd8aa` (not independently downloaded/rehashed).

## Exact accepted statements and next theorem

The exact original BFSS `GaugeGroup 2` (definitionally `Matrix.specialUnitaryGroup (Fin 2) ℂ`) contains the witness

```lean
sourceZMatrix (θ : ℝ) : ColorMatrix 2 :=
  !![Complex.exp (-(θ / 2) * Complex.I), 0;
     0, Complex.exp (θ / 2 * Complex.I)]

sourceZGauge (θ : ℝ) : GaugeGroup 2
```

`sourceZMatrix_mem_specialUnitary θ`, `sourceZGauge_coe θ`, and `sourceZGauge_zero` are fully qualified. **No** global continuity statement or (SO(3)) image equality was proved by this gate.

The next proposed source-exact image contract:

```lean
FCP.BFSSSU2GaugeG3A.adjointColorMatrix
    (FCP.BFSSIBIG0CNativeZGenerator.sourceZGauge θ) =
  !![Real.cos θ, -Real.sin θ, 0;
     Real.sin θ, Real.cos θ, 0;
     0, 0, 1]
```

is **OPEN** until a separate strict native source gate passes an independent consumer. Verify all index directions and signs; the historical native source-positive-`i` quaternion Z(a) convention has the opposite angle parameter (a=-θ/2).

The external [QICLean EulerAngles.lean](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean) offers a finite-component proof strategy but is pinned to Lean 4.36.0-rc1, not our accepted 4.34.1. Treat it as independent donor research, not as qualified source. Older `S1V52L7C3/C4/C5/L7C7` and `S1V52L9C3` modules remain staged/unqualified unless individually independently verified.

**Governance:** This acceptance document is an evidence-only commit above the exact tested code. The accepted theorem/source, independent consumer and workflow blobs are frozen. No changes to unified integration, main or frozen FCP. Full (SU(2)	o SO(3)) surjectivity remains OPEN.
