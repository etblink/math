# P3-AUX-RAD-C3 R1 — prospective original physical sixteen-charge weighted inverse-image graph

**Date:** 2026-11-13 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Frozen parent:** `1206a9b990c7b99db47585a3d8c0ab8619d37c72`. **Branch:** `integration/bfss-unified-research-20261108`.

## Precise original-source scope

Let `M:AlgebraData 2` and `G:M.GaugeData`, specialized by the consumer to actual `pairedAlgebraData/pairedGaugeData`. Let `E=G.physicalSpace` (literal original Gauss-space) and `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)` (original AY Hilbert column output). Let `T=originalMinimalPhysicalHilbertChargeColumn M G : E→ₗ.[ℂ]K`, proven closed in original AY source (blob `a9f27a48852ac570aedc8e0ab88d683250e6b138`); let `B16ε:K→L[ℂ]K` be exact accepted RAD-C2B #43568618192 (blob `45aa19082616ae874bf642f336d9a7c5fa1fd6f9`), bounded and injective.

Define `Gε=(T.graph).comap ((LinearMap.id:E→ₗ[ℂ]E).prodMap B16ε.toLinearMap)`. Its membership is exactly `(u,z)∈Gε ↔ (u,B16ε z)∈T.graph`. The original `T` is single-valued, so `(0,z)∈Gε` implies `B16ε z=0`; the accepted RAD-C2B injectivity gives `z=0`. Hence the Mathlib `Submodule.toLinearPMap` identifies a true partial charge `Sε` with `Sε.graph=Gε`. Its closedness follows because `Gε` is the continuous preimage of the **already accepted original closed AY graph**.

## Prespecified five roots

1. `originalWeightedPhysicalChargeGraph`
2. `originalWeightedPhysicalChargeGraph_mem_iff`
3. `originalWeightedPhysicalChargeColumn`
4. `originalWeightedPhysicalChargeColumn_graph_eq`
5. `originalWeightedPhysicalChargeColumn_isClosed`

Native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3OriginalPhysicalWeightedChargeGraph.lean`; independent consumer `lean/diagnostics/BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraphIndependentConsumer.lean` with **actual original paired gauge source**, not merely a function-space proxy. Strict workflow `.github/workflows/bfss-p3-aux-rad-c3-original-physical-weighted-charge-graph-strict.yml`: preserved parent source hashes, AY and RAD-C2B exact blob pins, original G4J paired witness blob pin, Lean 4.34.1 and Mathlib d13f23b7; cold compile, independent paired-source consumer, five-root standard-axiom audits `[propext, Classical.choice, Quot.sound]`, artifact preservation. If red, classify first-causal source/elaboration/proof/consumer fault without implying the hypothesis false; do not update the original accepted source blobs.

## Stop and next obligations

Successful graph/closedness is **not** dense domain, not identification with the maximal pointwise radial multiplication of `T`, not original physical Spin9 singlet or Hardy input, not auxiliary gap or fidelity, and not an epsilon-zero closure result. Subsequent separate gates must build a source core range witness `Tu ∈ Ran(B16ε)` to establish density, and prove a.e. radial weighting / maximal weighted domain on the true AY charge.
