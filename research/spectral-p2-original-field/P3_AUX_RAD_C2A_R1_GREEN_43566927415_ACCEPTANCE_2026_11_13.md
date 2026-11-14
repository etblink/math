# P3-AUX-RAD-C2A R1 — strict GREEN original FullL2 reciprocal injectivity

**Date:** 2026-11-13 Pacific (run completed 2026-11-14T06:47:40Z). **Verdict: EXACT NATIVE LEAN QUALIFIED.** The acceptance is for an original Fock-valued `FullL2 2` theorem, not the generic function-space surrogate.

## Independent qualification

- [Run #43566927415](https://github.com/etblink/math/actions/runs/43566927415): attempt 1, exact tested `656535418ed12198360ded1deefc5f5647993f7d`, `completed/success`, job `132362688785`.
- Cold source rebuild, frozen original-source preflight, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, independent original `FullL2 2` consumer and exact one-root standard axiom audit passed.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC2AOriginalReciprocalFullL2Injectivity.lean`, blob `64905d174965632d19e6bd04d334538018692b16`.
- Independent consumer `lean/diagnostics/BFSSP3AuxRADC2AOriginalReciprocalFullL2InjectivityIndependentConsumer.lean`, blob `3151e3089f38e0e715bce306c2a90c8c1eddd678`.
- Workflow `.github/workflows/bfss-p3-aux-rad-c2a-original-reciprocal-full-l2-injectivity-strict.yml`, blob `7e0faa6258b214cbd51aa8479abc28069bfcca0a`.
- Exact root `FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity.originalReciprocalFullL2CLM_injective` has axioms `[propext, Classical.choice, Quot.sound]` only in source and consumer.
- Logs contain `BFSS_P3_AUX_RAD_C2A_ORIGINAL_RECIPROCAL_FULLL2_INJECTIVITY_STRICT_GREEN`, no `sorryAx` or errors.
- [Evidence artifact #14102703049](https://github.com/etblink/math/actions/runs/43566927415/artifacts/14102703049), 7,457 bytes, published `sha256:30dc8fc4b9b9b1d7b700d6c3e9df30cade0728825e9c1fc229339e4a36c48106`. Metadata and job logs reviewed; artifact ZIP was not independently downloaded/rehashed.

## Mathematical assertion

`∀ {ε : ℝ}, (hε : 0 < ε) → Function.Injective (originalReciprocalFullL2CLM hε)` on the **source's actual** `FullL2 2`. Given equal original bounded reciprocal outputs, apply `Lp.ext` to the accepted G0B0 AE original scalar field formula for both inputs and the original R0A identity `originalRadialWeight_complex_mul_inv` to cancel at almost every `Boson 2` configuration. It neither defines nor relies on an unbounded inverse map.

## Explicit exclusions / next obligation

No claim that the reciprocal is surjective, has bounded inverse, preserves the *projection* onto `physicalSpace`, or gives a closed/spectral weighted auxiliary operator. Its inverse on its dense range is expected unbounded. G0B3 original physical-space invariance remains separately accepted at #43565346269; the independent roadmap registry repair at [#43567044249](https://github.com/etblink/math/actions/runs/43567044249) passed.

**Next:** RAD-C2B native sixteen-coordinate `PiLp 2 (fun _ : SpinIndex => FullL2 2)` bounded lift, exact coordinate equation and injectivity using this RAD-C2A root and the actual AY `originalMinimalHilbertOutputEquiv`. After that RAD-C3 inverse-image closed graph of the original AY physical-input charge, with domain/density treated separately.
