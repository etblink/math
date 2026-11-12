# P2-C4A accepted: original smooth-core integral transfer with explicit integrability

**Date:** November 12, 2026 UTC/Pacific.
**Status:** STRICT GREEN at exact tested commit `b704d126b4bbacd23fee6176f6b7717200ebc266`.
**Branch:** integration/bfss-unified-research-20261108.
**Scientific boundary:** only literal original BFSS SmoothCore 2 integral comparison under TWO EXPLICIT integrability premises. No implicit compact-support discharge, physical reducing sector, closed-domain coercivity, point spectrum or mass gap.

## Immutable acceptance evidence

- [Strict run #43204455519](https://github.com/etblink/math/actions/runs/43204455519) completed SUCCESS on `b704d126b4bbacd23fee6176f6b7717200ebc266`, with exact job ID `131135965385`.
- 8,987 cold Lean build jobs completed successfully; standalone source and independent consumer compiled with warnings treated as errors; the final guard reported `BFSS_P2C4A_ORIGINAL_CORE_INTEGRAL_STRICT_GREEN`.
- Two source theorem axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx` survives the green audit.
- [Evidence artifact #13936369772](https://github.com/etblink/math/actions/runs/43204455519/artifacts/13936369772), SHA-256 `53080c616ff9361b917cdda4cbae65551a4ffc8e6d148e4ed315d0d93de9af5d` as reported by GitHub.
- Accepted P2-C4A source blob `83dc6e4638e93188679defccb59771cdf55efb95`; independent consumer blob `94ff516d7b4b9c9432e9c2705a797d8f115f44ba`; workflow blob `ce50ff2785a494606f557b9f1c1744306aedbc42`.
- Lean `4.34.1`; pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Earlier red [#43201920720](https://github.com/etblink/math/actions/runs/43201920720) failed solely because `add_le_add_left` produced integral+kinetic rather than kinetic+integral. The repair used `add_le_add_right`; no theorem statement, original source definition, or integrability hypothesis changed. Preserve `P2C4A_RED_43201920720_DIAGNOSIS.md`.

## Two accepted declarations

`FCP.BFSSP2C4AOriginalCoreIntegralTransfer.originalMasslessDensity_integral_lower` shows the original lower density integrates below the actual original density, assuming each is `Integrable` with respect to `volume : Measure (Boson 2)`.

`originalMasslessCoreForm_lower_of_integrable` establishes, with those same two premises,

    (1/2) * Σ_p ||coreToL2 (coordinateDerivative_p f)||²
          + ∫ (V_original(X) - C_original ||X||) ||f(X)||² dX
        ≤ originalConcreteAlgebraData.coreForm f.

The kinetic normalization and source field are exactly original, not an auxiliary deformed Hamiltonian or normalized Gram field.

## P2-C4B next proof contract

Source analysis preserved in `P2C4B_INTEGRABILITY_SOURCE_REUSE_2026_11_12.md`: original `DeformedCharge.lean` contains local witnesses `hip` and `hif` of bosonic and fermionic density integrability inside the original averaged-core-energy proof. Copy those proof arguments into a new importable Contrib/Kotler module, specializing at the exact original `concreteAlgebraData` and `h=1,m=0`, without editing historical source code.

The radial moment `Integrable (fun x : Boson 2 => ||x|| * ||f x||²) volume` follows the already-existing `SpectralLinearMomentCompactness.lean` compact-support argument via `BFSSNormalMeasure.square_compact` and `integrable_of_hasCompactSupport`. Combining the three proofs should discharge both P2-C4A integrability premises, giving an **unconditional original SmoothCore 2** lower bound. This next gate remains **UNQUALIFIED** until its own actual strict source+consumer run.

**Hard stop:** unconditional smooth-core lower bounded by nonconfining `V-C||X||` is not a physical positive spectral result. Source-high-spin Fock-vector representation and original closed form transfer remain outstanding.

**Operations:** continue directly on unified integration, no new routine branches; keep separate incidence research branch parked. No main/FCP changes or speculative rewriting of accepted source.
