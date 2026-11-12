# M0 strict green acceptance — run #43242308459 — original actual-density interface

**Accepted:** 2026-11-12. **Status:** fully strict GREEN, narrowly for the one original source theorem below.
**Run:** https://github.com/etblink/math/actions/runs/43242308459
**Job:** `131265710270`, successful in all substantive stages.
**Exact tested commit:** `7eac35443797bd00e9b9574f4199ea64a751c29f`.
**Original source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSP2C4BOriginalActualDensityInterfaceMicrogate.lean`, Git blob `68b20c8d6cc0b752ceda20cfd3eb6bdba93c315f`.
**Independent consumer:** `lean/diagnostics/BFSSP2C4BOriginalActualDensityInterfaceConsumer.lean`, Git blob `5936073b1007dc1fdaed685f95d226cfa00ee7cc`.
**Strict workflow:** `.github/workflows/bfss-p2c4b-density-interface-strict.yml`, blob `8dabcc4125ddbe737fe8cae92d1ac19f752a006d`.
**Artifact:** https://github.com/etblink/math/actions/runs/43242308459/artifacts/13955098518
**GitHub-reported ZIP SHA-256:** `f688e9ab8b8ff5f94e3ab9639aa42db33f60547c45d112927ed3b5f1debbddea`.

## Exact acceptance

The source `FCP.BFSSP2C4BOriginalActualDensityInterfaceMicrogate.originalActualDensity_eq_sourceSum` shows for every actual `f : SmoothCore 2` that P2-C4A's `originalActualDensity f` equals the sum of two functions built from the original `FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0` and `deformedFermionField 1 0`. This is the original massless h=1, m=0 source density and exact source Fock field; no surrogate.

The job completed exact source/consumer Git preflight, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, a cold 8,988-job source build, explicitly warning-as-error source elaboration, two independent original-SmoothCore consumer examples (whole-function and pointwise), and source root axiom audit. The marker `BFSS_P2C4B_M0_DENSITY_INTERFACE_STRICT_GREEN` is present. The source root uses only `[propext, Classical.choice, Quot.sound]` and no `sorryAx`. The immutable artifact digest and tested SHA match GitHub's run.

**Scope firewall:** This accepts only the M0 original-density *function identity*. It does NOT itself establish any density integrability, unconditional massless energy lower bound, original closed physical form, a Spin(9) reducing sector, positive eigenpair, mass gap, GUT or ToE.

## Pre-Gate-receipted next step

The existing Pre-Gate Evidence Receipt `P2C4B_PRE_GATE_SOURCE_REUSE_RECEIPT_2026_11_12.md` authorized the next proof only after this full M0 green. Directly reuse the original public `AlgebraData.bosonic_core_integrable` and `fermion_core_integrable` from `MassiveMoments.lean` (blob `2fd223d0da1a85c3be52bb2b9c68f4f12d10957e`) after rewriting by this **now qualified** exact M0 identity. Preserve P2-C4B's six public theorem statements and four previously clean proof bodies; keep the independent C4B consumer and source-form normalization unchanged. Strict C4B CI must independently green at its own tested SHA, with source+consumer and all six axiom roots, before claiming that the integrability hypotheses are discharged. The older seven C4B reds and three M0 consumer/preflight reds remain negative-knowledge evidence.

**Branch:** unified only; no rewrites of `main`, FCP or earlier source-history bytes.
