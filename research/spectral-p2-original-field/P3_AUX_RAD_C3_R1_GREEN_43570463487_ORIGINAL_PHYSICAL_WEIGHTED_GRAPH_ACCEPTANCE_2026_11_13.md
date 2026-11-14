# P3-AUX-RAD-C3 R1 — exact native original physical weighted charge graph STRICT GREEN ACCEPTANCE

**Date:** 2026-11-13 Pacific. Run finished 2026-11-14T07:31:27Z. **Classification: LEAN_QUALIFIED, ORIGINAL PHYSICAL GRAPH ONLY.**

## Source / consumer frozen receipt

- [Strict run #43570463487](https://github.com/etblink/math/actions/runs/43570463487), attempt 1, exact tested commit `6dfd221d486b74244f34de6fa051d0f2ec9162fa`, job `132373515273`, completed **success**.
- Native original physical input `G.physicalSpace`, original AY Hilbert output `PiLp 2 (fun _ : SpinIndex => FullL2 2)`; source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3OriginalPhysicalWeightedChargeGraph.lean` blob `6aff6416d341738a1f55e6aaad107f4726f1e34f`.
- Independent concrete `pairedAlgebraData,pairedGaugeData` consumer `lean/diagnostics/BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraphIndependentConsumer.lean` blob `4b63c34a6e4bf3fe3a381976f750f0d03fd50052`.
- Strict workflow `.github/workflows/bfss-p3-aux-rad-c3-original-physical-weighted-charge-graph-strict.yml` blob `d869b67e7a4f94a8f9278e56c991825f2132aa6c`.
- Original-source hashes, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, preflight, cold build, native source and native paired SU(2) consumer, exact five-root axiom audit all passed.
- Exact five declarations: `FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph`, `FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph_mem_iff`, `FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn`, `FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_graph_eq`, `FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_isClosed`.
- Both source and consumer root audits allow only `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or compiler errors.
- Strict emitted marker: `BFSS_P3_AUX_RAD_C3_ORIGINAL_WEIGHTED_PHYSICAL_GRAPH_STRICT_GREEN`.
- [Evidence artifact #14104512490](https://github.com/etblink/math/actions/runs/43570463487/artifacts/14104512490), 9,843 bytes, published SHA256 `197d451fc63b250a34a498d9fe3c880a0b6b5c1b555ced641583cf23dd12a2f7`. Inspected metadata/logs; ZIP bytes were not independently downloaded and rehashed.
- [Roadmap consistency #43570463439](https://github.com/etblink/math/actions/runs/43570463439) passed at the exact tested source commit; separate historical acceptance #43570138055 also passed.

## Mathematics actually qualified

Let `T=originalMinimalPhysicalHilbertChargeColumn M G` on exact physical Hilbert input `E=G.physicalSpace` with actual original sixteen-output `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`, source AY accepted. The accepted RAD-C2B `B16ε : K→L[ℂ]K` is bounded and injective. For every `ε>0`, the **literal inverse-image graph**

`Gε := (T.graph).comap ((LinearMap.id:E→ₗ[ℂ]E).prodMap B16ε.toLinearMap)`

is a `ℂ`-submodule with exact membership `(u,z)∈Gε ↔ (u,B16ε z)∈T.graph`. Original AY vertical uniqueness and RAD-C2B injectivity prove single-valuedness. This yields the actual partial `LinearPMap` `Sε : E→ₗ.[ℂ]K`, exact graph equality, and **closedness** as the continuous preimage of the accepted original closed AY graph.

## Stop boundaries / why next density gate is necessary

No density for `D(Sε)` is asserted by RAD-C3. No proof that unweighted `D(T)` is contained in `D(Sε)`. Nor does it prove a globally bounded inverse, maximal radial multiplication domain, quadratic form, Hardy bound, singlet auxiliary gap, self-adjoint Hamiltonian or BFSS mass gap.

[Forward-research density plan](P3_AUX_RAD_C3D_FORWARD_RESEARCH_ORIGINAL_WEIGHTED_DOMAIN_DENSITY_2026_11_13.md) identifies necessary compact support output range witness: each original `SmoothCore` field `g` has weighted field `wε g ∈ FullL2 2` since multiplication by a continuous scalar preserves compact support. Accepted original reciprocal AE multiplication plus scalar cancellation imply `Bε[wε g]=coreToL2 g`. Prove that as **RAD-C3D-A** first. Then use source `M.charge α f` for all sixteen `α` to obtain the exact graph core domain witness (RAD-C3D-B); then invoke original D2B10C Haar core closure = physical (RAD-C3D-C). Separate source/consumer strict qualification and no assumptions for each step.

TD-C1A original native all48 covariance remains RED_UNQUALIFIED. Original M5BF0 accepted disposition remains untouched.
