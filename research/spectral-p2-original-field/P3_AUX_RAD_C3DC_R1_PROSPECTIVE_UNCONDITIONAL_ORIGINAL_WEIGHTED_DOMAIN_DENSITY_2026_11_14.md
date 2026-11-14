# P3-AUX-RAD-C3D-C R1 — prospective source-exact weighted physical Hilbert domain density

**Date:** 2026-11-14 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Baseline:** `0d12a0d4a57f23754cfc1341c37ecaf07335d345`.

## Source and proof obligations

Accepted [RAD-C3DB R4 #43578132553](https://github.com/etblink/math/actions/runs/43578132553) establishes the literal original gauge-invariant smooth-core inclusion `originalWeightedChargeCore_mem_domain M G hε f` for arbitrary `M:AlgebraData 2`, `G:M.GaugeData`, `ε>0`, `f:G.invariantCore` on native physical input `G.physicalSpace`, with original AY sixteen-charge output, strict artifact #14107950306. Exact accepted original C3DB source blob `623035a7bfd1578b52e7f9364bfd1cd8133f1cbb`.

The conditional density root faithfully reuses the original H5E8AZ `Subtype.dense_iff`, original smooth core range inclusion into the physical domain, and `closure_mono`. The unconditional density root discharges only `G.coreNormClosure = G.physicalSpace` via original D2B10C `sourceCoreNormClosure_eq_physical_unconditional M G`, blob `7b116f1efa2dd62cc5188b3ff2d2cf38ecd7bd9a`.

**Exactly two roots:** `originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq`, `originalWeightedPhysicalChargeColumn_domain_dense_unconditional`.

**True original source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.lean`. **Independent concrete paired SU2 consumer:** `lean/diagnostics/BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensityIndependentConsumer.lean`. **Strict pin/axiom workflow:** `.github/workflows/bfss-p3-aux-rad-c3dc-original-weighted-physical-domain-density-strict.yml`. Genuine `pairedAlgebraData` and `pairedGaugeData`; no surrogate field, no deformed `charge`, no changed original SU2 fixed space. Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original donor pins as in the workflow; exact source and consumer success; only `propext, Classical.choice, Quot.sound`, no `sorryAx`.

## Boundaries

A strict green will prove `Dense ((originalWeightedPhysicalChargeColumn M G hε).domain : Set G.physicalSpace)` in **physical Hilbert input norm** for each `ε>0`. It will not mean original SmoothCore is a **graph-norm core** for Sε or determine the maximal domain; nor prove bounded inverse, epsilon zero closability, Hardy inequality, auxiliary spectral gap, fidelity, or BFSS mass gap. These require separate gates. If red, preserve first-causal logs before repair; no blind heartbeat increase. R4's success of a polymorphic N helper is recorded, but the current theorem quantifiers are genuinely N=2.

**Follow-up:** optional small nonzero native weighted-domain witness (reuse original M3W0D0), then generic H5E8BC/BD/BE closed/dense operator framework applied to Sε on its actual original Hilbert carriers, only with distinct new strict qualification.
