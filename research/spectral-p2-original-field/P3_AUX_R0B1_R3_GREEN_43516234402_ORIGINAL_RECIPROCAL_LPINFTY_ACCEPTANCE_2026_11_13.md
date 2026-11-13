# P3-AUX-R0B1 R3 — original SU2 reciprocal complex L∞ strict GREEN acceptance

**Date:** November 13, 2026 (Pacific). **Status: ACCEPTED, EXACT STRICT CI GREEN.**
**Classification:** Parallel auxiliary L∞ **factor** prerequisite, **not** the original physical-operator branch's next accepted gate. Original M5BF0 remains the most recent accepted physical-operator gate; R0A remains accepted scalar prerequisite.

## Exact strict qualification

- [Strict GitHub Actions run #43516234402](https://github.com/etblink/math/actions/runs/43516234402), attempt 1, status completed **success** (2026-11-13T22:13:00Z).
- **Exact tested source commit:** `cd9c8e33194af34adc2904f36170715f6695b11b`; job `132198776204`, `reciprocal-l-infty`, all critical steps successful: source/core/toolchain preflight, pinned dependency restoration, cold build, source audit, independent original-source consumer, allowed-axiom audit and artifact upload.
- **Exact source file:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxR0B1OriginalReciprocalLpInfinity.lean`, Git blob `d1cbb8077799236e5e1b82704270bdb9ab9153b4`.
- **Exact independent consumer:** `lean/diagnostics/BFSSP3AuxR0B1OriginalReciprocalLpInfinityIndependentConsumer.lean`, Git blob `5a52d5ff8b05a72bfa1c009442d00883c1509881`.
- **Strict workflow:** `.github/workflows/bfss-p3-aux-r0b1-original-reciprocal-lpinfty-strict.yml`, blob `0e11b47f1ea20a23f786b164d38707e597d5c99a`.
- **Frozen native original Core:** `lean/OAI/MathematicalPhysics/BFSS/Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`. **Accepted R0A source:** blob `a67f8740586588c6d4ee9c9148574c81c14d4937`, strict GREEN [#43510200014](https://github.com/etblink/math/actions/runs/43510200014).
- **Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- **Strict log markers:** `BFSS_P3_AUX_R0B1_PREFLIGHT_PASS` and `BFSS_P3_AUX_R0B1_RECIPROCAL_LPINFTY_STRICT_GREEN`. Source and independent consumer each printed all six root axiom statements. Every declaration has only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, no invalid extra axioms, and no source or independent-consumer compilation errors.
- **Retained CI evidence:** artifact #`14080753528`, `bfss-aux-r0b1-evidence`, 1852 bytes, `sha256:ab37b852997eab0e69c6487bc78ffc04e65d7f1fd9ad9ab476600a5479da57bc`. [Run artifact](https://github.com/etblink/math/actions/runs/43516234402/artifacts/14080753528).
- **Canonical checkpoint acceptance:** The separate [roadmap consistency run #43516384333](https://github.com/etblink/math/actions/runs/43516384333) was GREEN for the **preceding staged** checkpoint `a459e6720cbde46a521bf416ddb7cfb6594ab1e4`; the **current acceptance edit requires its own consistency run**. A roadmap green is not a Lean qualification.

## Exactly accepted six roots

In namespace `FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity`:

1. `originalRadialWeight_continuous` — continuity of the accepted source radial weight on literal `Boson 2`.
2. `originalReciprocalField_continuous` — continuity for `ε>0` of the original complex scalar reciprocal.
3. `originalReciprocalField_norm_le` — uniform norm bound `‖b_ε(x)‖ ≤ ε⁻¹`.
4. `originalReciprocalField_memLp_infty` — actual membership `MemLp b_ε (⊤ : ENNReal) volume` on the original source Lebesgue space.
5. `originalReciprocalLpInf` — actual complex `Lp ℂ (⊤ : ENNReal)` representative on the original source measure.
6. `originalReciprocalLpInf_ae` — representative equal almost everywhere to the original reciprocal field.

Independent consumer anchors the original exact sixteen-charge output **type** `PiLp 2 (fun _ : SpinIndex => FullL2 2)`, not an action of the new factor on that output.

## Negative knowledge: two reds preserved, not erased

- [R1 strict RED #43513258078](https://github.com/etblink/math/actions/runs/43513258078) at `1c36cb17`: real-norm/absolute-value conversion and unavailable exponent notation; [first-causal ledger](P3_AUX_R0B1_R1_RED_43513258078_FIRST_CAUSAL_2026_11_13.md).
- [R2 strict RED #43514755373](https://github.com/etblink/math/actions/runs/43514755373) at `2f419563`: scalar norm proof fixed but `ℝ≥0∞` shorthand parser still failed; [first-causal ledger and two-red method review](P3_AUX_R0B1_R2_RED_43514755373_FIRST_CAUSAL_2026_11_13.md).
- R3 changed only the notation annotations to `(⊤ : ENNReal)`; this resolved parsing while retaining all six original mathematical targets. The two reds remain separate documented computational experiments, not failures of the mathematical result.

## Explicit limitations and next bounded gate

**Not yet constructed or proved:** bounded continuous multiplication `FullL2 2 →L[ℂ] FullL2 2`, coordinatewise `PiLp` bounded multiplier, injectivity of that operator, physical weighted charge `S_ε`, its closed graph or density, `H_ε=(1/16)S_ε†S_ε`, zero-regularization limit, Hardy singlet bound, external source normalization crosswalk, ground-state fidelity, ground-state existence or BFSS gap.

**Next proposed R0B2 (RESEARCH-ONLY until separately staged/qualified):** Reuse the pinned Mathlib `Lp` heterogeneous action for `p=⊤, q=r=2` and the now-qualified exact `b_ε∈L∞` factor, prove the bounded *complex-linear* `FullL2 2` reciprocal multiplication operator, the source AE multiplication equation, norm bound and injectivity. Establish exact underlying `FullL2 2` carrier and Hilbert module structures before adding any finite `PiLp` lift. Avoid introducing a different bosonic configuration space or a convenient abstract substitute.

**Publication and interpretation restriction:** Formal proof of this factor does not imply a positive gap of the original BFSS Hamiltonian, or even the existence of the proposed auxiliary operator.
