# P2-C3 accepted — literal source smooth-core energy and pointwise lower density

**Recorded:** 2026-11-12 UTC / 2026-11-11 Pacific.
**Repository:** etblink/math, integration/bfss-unified-research-20261108.
**Qualification:** STRICT SOURCE + DISTINCT CONSUMER; exact tested SHA 617647694fe9e9b99fe27c753c52a989332b0775.
**Scientific ceiling:** smooth-core energy IDENTITY and POINTWISE density bound only; no physical closed-domain coercivity, reducing high-Spin sector, eigenpair or mass gap.

## Audited evidence

- [Successful strict run #43177398705](https://github.com/etblink/math/actions/runs/43177398705), job `131044874080`, conclusion SUCCESS, 617647694fe9e9b99fe27c753c52a989332b0775.
- [Artifact #13924718468](https://github.com/etblink/math/actions/runs/43177398705/artifacts/13924718468) `bfss-p2c3-original-core-density-617647694fe9e9b99fe27c753c52a989332b0775-1`; archive SHA-256 `e031d689adf6d4609d0b01c180f08b049657c284154943dfc14dfd1a72cebbaa` as reported by the GitHub job log.
- New source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSP2C3OriginalMasslessCoreDensity.lean` exact Git blob `0fbffd6ac17ffe4059cb553728545532481ac951`.
- Independent consumer `lean/diagnostics/BFSSP2C3OriginalMasslessCoreDensityConsumer.lean` blob `bf7b9201d47305315279654712c4f04f18f357c4`.
- Strict workflow `.github/workflows/bfss-p2c3-original-core-density-strict.yml` blob `3a1dd0ea21c4ccf649f397d7af089473462fe79a`.
- Inherited already-accepted P2-C2 source field growth module `BFSSP2C2OriginalMasslessGrowthBinding.lean` blob `59a2dcc84ff36beddca12a440ab01b21b6c64cef`, and original massless source core energy `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`.

The source-pin preflight, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore, **all 8,986 cold build jobs**, distinct consumer compilation with warnings treated as errors, standard-only axiom reports, and evidence artifact upload passed. The gate printed `BFSS_P2C3_ORIGINAL_CORE_DENSITY_STRICT_GREEN`. No custom axioms, apologies or admitted statements were used. The two reported theorem axiom lists were exactly `[propext, Classical.choice, Quot.sound]`.

## Accepted source result, exact level

Let `M0=FCP.BFSSSU2Full.concreteAlgebraData` on the actual original SU(2) Boson 2, Fermion 2 carriers, and `C0=M0.fermionGrowthConstant`.

1. `originalMasslessCoreForm_energy`: exact normalized smooth-core source identity

       M0.coreForm f = (1/2)*Σ_p ||coreToL2(coordinateDerivative_p f)||²
                       + ∫ (V_M0(X)*||f X||² + inner_R(f X, B_M0(X)(f X))) dX.

2. `originalMasslessCoreDensity_lower`: for every original X and z,

       (V_M0(X)-C0*||X||)*||z||²
          <= V_M0(X)*||z||² + inner_R z (B_M0(X) z).

Distinct source consumer imported these declarations, checked the concrete original energy identity and the weaker radial-only lower bound using genuine original source potential nonnegativity.

These are NOT statements about the auxiliary normalized Gram/Fock field, a replacement Hamiltonian, a closed physical form, a high-weight reducing sector, or spectral existence.

## Immediate bounded next step, P2-C4

Integrate the P2-C3 pointwise inequality over the **actual original SmoothCore 2** and combine with `originalMasslessCoreForm_energy` to obtain

       M0.coreForm(f) >= (1/2)*Σ_p ||coreToL2(coordinateDerivative_p f)||²
                       + ∫ (V_M0(X)-C0*||X||)*||f X||² dX.

**Do not skip integrability.** The direct source-typed Lean proof must establish enough continuity and compact-support facts to invoke `integral_mono`, or use an explicitly stated integrability-premise gate as a bounded intermediate followed by the source compact-support discharge.

The differentiable polynomials in the actual original `PotentialBasis` and original source field, together with smooth-test-function compact support, should provide the needed integrability, but this has not been compiler-qualified at this checkpoint.

Even a fully qualified P2-C4 smooth-core estimate would be only a lower bound of a nonconfining potential on commuting valleys. The next physical obstacles are a genuine original Fock-**vector** Spin(9) action and gauge-compatible reducing high-weight sector, transverse oscillator exclusion, and form-domain transfer to historical original physical `(1/16)T†T`. None is declared proved here.

## Repository discipline

Carry the next gate directly on the unified integration branch. Preserve the incidence-before-identity exploratory branch independently, and leave FCP and main unchanged. New strict results need their own exact source/consumer closure and green receipt. Preserve any red's first causal error before repair.
