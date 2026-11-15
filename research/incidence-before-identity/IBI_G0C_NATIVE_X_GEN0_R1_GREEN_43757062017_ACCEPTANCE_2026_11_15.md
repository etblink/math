# IBI-G0C-X-GEN0 — exact original BFSS source R1 GREEN acceptance

**Decision date:** 2026-11-15 Pacific  
**Research branch:** `research/bfss-incidence-unified-20261114`  
**Status:** **GREEN_QUALIFIED for native SU(2) X-axis generator membership, coercion, zero identity**.  
**Not qualified:** original-source X-axis (SO(3)) adjoint image, arbitrary-(SO(3)) Euler decomposition, global surjectivity, kernel classification, physical/Fock or spectral results.

## Tested-commit receipt

- [Strict GitHub Actions run #43757062017](https://github.com/etblink/math/actions/runs/43757062017), `completed/success`, first attempt, exact tested code `34a93dae68577726cb8099b58d7f7cc47b815be6`; job `132943349513` all required steps completed successfully.
- Original source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CNativeXGenerator.lean`, Git blob `def779ebf09a2f1ac11ed1449c64b5b7d013a1ed`.
- Independent consumer `lean/diagnostics/BFSSIBIG0CNativeXGeneratorIndependentConsumer.lean`, Git blob `7b7f4d3f84e5764b6ec158f960823734dad89147`.
- Workflow `.github/workflows/bfss-ibi-g0c-native-x-generator-strict.yml`, Git blob `a008d7c0c0fa0a3590bf1878ab01d354e5bf7f02`.
- Frozen accepted dependency `IBIG0CInversePauli.lean` Git blob `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`, and additionally verified accepted `IBIG0CZImage.lean` blob `e4623ef2e7ce825575a73f96e087bee17c4872ab`. No accepted Lean source bytes were changed.
- Original source pins, Lean `leanprover/lean4:v4.34.1`, and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` passed.
- Cold build `9018/9018`, separate strict warning-as-error original source and independent consumer both passed.
- Log markers: `BFSS_IBI_G0C_NATIVE_X_GEN0_PREFLIGHT_PASS`, `BFSS_IBI_G0C_NATIVE_X_GEN0_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- `#print axioms` for `sourceXMatrix_mem_specialUnitary`, `sourceXGauge_coe` and `sourceXGauge_zero` contained only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`, `admit`, additional axiom or disallowed warning.
- Independent consumer tests arbitrary source `β : ℝ` coercion, source `X(0)=1`, and inverse/star identity of this exact native gauge family.
- [Preserved artifact #14179251346](https://github.com/etblink/math/actions/runs/43757062017/artifacts/14179251346), size 4,982 bytes per GitHub API. Log's ZIP SHA-256 is `a73d28f5bd2e24ef1024c66a1299cfce6578ad33a749a6aaa0a71cbe725b137a` (GitHub-reported, not independently downloaded/rehashed).

## Exact accepted theorem scope

The actual original upstream BFSS `GaugeGroup 2` contains

```lean
def sourceXMatrix (β : ℝ) : ColorMatrix 2 :=
  !![(Real.cos (β / 2) : ℂ), -Complex.I * (Real.sin (β / 2) : ℂ);
     -Complex.I * (Real.sin (β / 2) : ℂ), (Real.cos (β / 2) : ℂ)]
```

and `sourceXGauge β` is a genuine element of `GaugeGroup 2`. This uses the ordinary real half-angle with negative-`i` phase, chosen to match **positive X-axis rotation** under the standard Pauli convention. The image equation itself is *not* yet proved.

## Next admissible gate

**G0C-X-IMAGE:** establish the full original-source matrix equation

```lean
FCP.BFSSSU2GaugeG3A.adjointColorMatrix
    (FCP.BFSSIBIG0CNativeXGenerator.sourceXGauge β) =
  !![1, 0, 0;
     0, Real.cos β, -Real.sin β;
     0, Real.sin β, Real.cos β]
```

with a separate native finite Pauli-trace calculation, exact input/output indexing and independent sign checks `(2,1) = sin β`, `(1,2) = -sin β`. It must use only accepted BFSS source interfaces and a **new** independently qualified strict workflow; do not import QICLean's Lean 4.36.0-rc1 package or its unqualified external theorems. Afterwards prove arbitrary (SO(3)) ZXZ decomposition, including gimbal lock, before final native BFSS surjectivity witness.

This is an evidence-only acceptance commit distinct from exact tested Lean bytes. Freeze G0B1, Pauli trace, inverse-Pauli, Z-generator, Z-image, and X-generator. No unified integration, `main` or FCP edits. Preserve negative knowledge and apply stop rule after analogous failures.
