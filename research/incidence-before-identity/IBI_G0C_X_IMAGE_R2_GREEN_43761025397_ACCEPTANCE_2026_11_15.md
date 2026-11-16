# IBI-G0C-X-IMAGE R2 — strict source-exact GREEN acceptance

**Decision date:** November 15, 2026 Pacific  
**Research branch:** `research/bfss-incidence-unified-20261114`  
**Verdict:** **GREEN_QUALIFIED** for the full original BFSS (SU(2)) X-generator adjoint-image theorem, with row/column sign controls.

## Original, exact qualification evidence

- [GitHub Actions run #43761025397](https://github.com/etblink/math/actions/runs/43761025397), `completed/success`, attempt 1, exact tested source commit `751056876b0f59e0ffb8b1afbc7cbdf67ea29665`, job `132955654951` all required steps passed.
- Original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CXImage.lean`, Git blob `999a0c66110431d1c92aaaf6ca37b21f253a9501`.
- Independent consumer `lean/diagnostics/BFSSIBIG0CXImageIndependentConsumer.lean`, Git blob `5b52c1c1ae18f9b9cb9eaba97f72191b6bf4b030`.
- Strict workflow `.github/workflows/bfss-ibi-g0c-native-x-image-strict.yml`, Git blob `7cc38845b54103866f32de3313ba7d38dcf28f8e`.
- Frozen qualified ancestors: X generator `IBIG0CNativeXGenerator.lean` blob `def779ebf09a2f1ac11ed1449c64b5b7d013a1ed`; Z image `IBIG0CZImage.lean` blob `e4623ef2e7ce825575a73f96e087bee17c4872ab`; inverse Pauli `IBIG0CInversePauli.lean` blob `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`; Pauli trace `IBIG0CPauliTrace.lean` blob `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`.
- Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Native cold build `9019/9019`, separate source/consumer strict `-DautoImplicit=false -DwarningAsError=true` both passed.
- Preflight marker `BFSS_IBI_G0C_X_IMAGE_PREFLIGHT_PASS`; terminal audited marker `BFSS_IBI_G0C_NATIVE_X_IMAGE_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- `#print axioms` for `sourceXPauli_trace_rotX` and `originalAdjointColorMatrix_sourceX_eq_rotX` reported only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` or other unexpected axiom.
- Independent source consumer checked arbitrary β complete 3x3 matrix and both asymmetric sign tests `(2,1) = sin β`, `(1,2) = -sin β`.
- [Evidence artifact #14180452000](https://github.com/etblink/math/actions/runs/43761025397/artifacts/14180452000), size 5027 bytes according to GitHub API, artifact ZIP SHA-256 `6ff0b46688d884819e58e71507e63bd0268e4310a28cb14936bb1ce65b1d205c` from GitHub Actions log (not independently rehashed).

## Precise original BFSS theorem

```lean
theorem originalAdjointColorMatrix_sourceX_eq_rotX (β : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (FCP.BFSSIBIG0CNativeXGenerator.sourceXGauge β) =
    !![1, 0, 0;
       0, Real.cos β, -Real.sin β;
       0, Real.sin β, Real.cos β]
```

The native generator is `sourceXGauge β : OAI.BFSSQuantum.GaugeGroup 2`, and the 3x3 matrix is the ORIGINAL source `FCP.BFSSSU2GaugeG3A.adjointColorMatrix`. No textbook stand-in group or representation was substituted. Entries use output rows and input columns, and the scalar trace derivation uses exact original source Pauli coefficients.

The separate accepted Z image, X image, and G3A multiplication theorem now support future ZXZ witness composition, **conditional on proving** a general (SO(3)) ZXZ decomposition. They do not themselves establish surjectivity.

## Preserve negative knowledge and run-number correction

- [R1 #43759815797](https://github.com/etblink/math/actions/runs/43759815797) remains `completed/failure` at tested SHA `a1edd04bc4b19d6b78c3fdd0e5808f312d0a62d8`. Cold `lake build` completed and both theorem axiom reports were allowed, but strict source compilation failed `IBIG0CXImage.lean:82:24` due to unused `neg_zero` argument under `linter.unusedSimpArgs`; independent consumer was not reached.
- [R1 diagnostic](https://github.com/etblink/math/blob/751056876b0f59e0ffb8b1afbc7cbdf67ea29665/research/incidence-before-identity/IBI_G0C_X_IMAGE_R1_RED_43759815797_DIAGNOSTIC_2026_11_15.md) and its [artifact #14179769451](https://github.com/etblink/math/actions/runs/43759815797/artifacts/14179769451) are retained.
- R2 changed **only** the proof's `simp only` list by removing `neg_zero`, plus the exact source SHA in workflow and RED diagnostic. The theorem statements, original gauge action, consumer and ancestor source files were unchanged.
- Never relabel R1 GREEN merely because repaired R2 passed.

## Immediate Project Lead next gate

**SO3-ANGLE0:** an independent `Mathlib`-only circle-angle existence lemma, with a cold compiler run and separate consumer. Then **SO3-EULER:** all (Qin SO(3)) admit a `rotZ α * rotX β * rotZ γ` decomposition, including `sin β=0` (both ±1) cases, before final source-exact witness. The independent [forward-research memorandum](https://github.com/etblink/math/blob/710edbc88b976a7c59d3e18572f49616d6fa20c9/research/incidence-before-identity/IBI_G0C_SO3_EULER_FORWARD_RESEARCH_2026_11_15.md) records the donor, formulas and stress tests.

**Governance:** This is an evidence-only acceptance commit above the tested source. Freeze G0B1, Pauli trace, inverse Pauli, Z generator, Z image, X generator and X image. No changes to unified integration, `main`, or frozen FCP. Full G0C surjectivity and all physical/spectral conclusions remain OPEN.
