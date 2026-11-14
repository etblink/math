# P3-AUX-RAD-C3D-C R1 — strict GREEN original physical weighted sixteen-charge dense domain

**Date:** 2026-11-14 Pacific. **Classification:** LEAN_QUALIFIED / exact native original SU2 physical Hilbert source, not a spectral gap or emergent-gravity result.

## Exact strict acceptance

- [Run #43579923559](https://github.com/etblink/math/actions/runs/43579923559) attempt 1, completed success; tested SHA `8f147e99397d5d50fbd5b375dd8ae6f12ff95ec9`, job `132402429648`; independent [roadmap-consistency #43579923532](https://github.com/etblink/math/actions/runs/43579923532) independently GREEN at same exact source SHA (administrative only).
- Native Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.lean`, blob `5ed2b3bfc6add8b50e25d43db3252ee7848caed9`; true independent original `pairedAlgebraData/pairedGaugeData` consumer `lean/diagnostics/BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensityIndependentConsumer.lean`, blob `dd3a97a4381a52695c9f4de0b4d8501c23d48fac`; strict workflow `.github/workflows/bfss-p3-aux-rad-c3dc-original-weighted-physical-domain-density-strict.yml`, blob `9fef73a7efab084d9e2925eece7dc7d896b04cc2`.
- Frozen donor/source and toolchain preflight PASS with `BFSS_P3_AUX_RAD_C3DC_PREFLIGHT_PASS`; Lean 4.34.1; pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; true cold source build PASS; independent original paired SU2 consumer PASS.
- **Exactly two roots** `FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq`, `FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_unconditional` both printed **only** `[propext, Classical.choice, Quot.sound]` in source and independent original consumer. No `sorryAx`; terminal `BFSS_P3_AUX_RAD_C3DC_ORIGINAL_WEIGHTED_PHYSICAL_DENSITY_STRICT_GREEN` present in job logs.
- [Evidence artifact #14108247917](https://github.com/etblink/math/actions/runs/43579923559/artifacts/14108247917), 12,727 bytes; published digest `sha256:bbaa274a86e87166fc392785011674be167481d34acf29d6029d8e901197ba34` (GitHub metadata and logs; ZIP not independently rehashed).

## What qualifies mathematically

Let `M:AlgebraData 2`, `G:M.GaugeData`, `hε:0<ε`, `E=G.physicalSpace`, `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`, `Sε=originalWeightedPhysicalChargeColumn M G hε : E→ₗ.[ℂ]K`. The conditional theorem uses accepted C3DB R4 core inclusion and original AZ `Subtype.dense_iff` / `closure_mono` proof architecture to show `Dense Sε.domain` if `G.coreNormClosure=G.physicalSpace`. The unconditional theorem uses original D2B10C Haar `sourceCoreNormClosure_eq_physical_unconditional M G`; therefore `Dense (Sε.domain:Set E)` for **every** `ε>0` and arbitrary literal original `M,G` at SU2 rank 2.

With independently accepted RAD-C3 original source `Sε.IsClosed` strict #43570463487, **the actual original SU2 physical sixteen-charge weighted operator Sε is both closed and densely defined for ε>0**. No new claim about `ε=0`.

## Important limitations and research handoff

This is density in the **original physical Hilbert input norm**. It does not certify the invariant SmoothCore as a **graph-norm core**, maximal weighted pointwise multiplication domain equality, original unregulated Hamiltonian identity, regulator convergence, Hardy confinement, auxiliary spectral gap, ground-state eigenvalue, or BFSS mass gap. These must be independent gates.

Near-valley exact Python control, separately [preserved computational memo](../computational/BFSS_SU2_EXACT_GRAM_LOVELOCK_DIMENSIONAL_FORWARD_RESEARCH_2026_11_14.md), shows bosonic-potential-only radial coercivity fails; cannot infer the full operator's spectral behavior from that algebraic negative control either. Later original BC/BD/BE adjoint-square machinery may transfer to dense closed `Sε` if exact imported proof interfaces and original source carrier match are separately certified. No automatic theorem promotion.

**Governance:** All prior RED R1–R3 C3DB receipts and C3DB R4 GREEN acceptance remain untouched. No `main` changes; this commit is checkpoint/receipt only, source+consumer/workflow bytes unaffected.
