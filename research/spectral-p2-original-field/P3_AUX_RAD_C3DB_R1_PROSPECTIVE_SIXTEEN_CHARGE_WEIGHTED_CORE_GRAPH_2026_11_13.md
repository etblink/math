# P3-AUX-RAD-C3D-B R1 — prospective exact original physical smooth-core graph inclusion

**Date:** 2026-11-13 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Baseline:** `2dd2550f31076a89bb8626aadebdc55a1dc1479c`.

## Scope and route

Original `M:AlgebraData 2`, `G:M.GaugeData`; independent consumer instantiates the exact original `pairedAlgebraData` and `pairedGaugeData`. Input `E=G.physicalSpace`, output `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`. The accepted RAD-C3 original closed partial weighted charge is `Sε : E→ₗ.[ℂ]K` whose exact graph means `(u,z)∈graph(Sε) ↔ (u,B16ε z)∈graph(T)`. Accepted C3D-A strict #43572123886 supplies an exact native original `FullL2` weighted witness for every original `g:SmoothCore 2`, with `Bε [wεg] = coreToL2 g`.

Define `zε = J.symm (fun α => originalWeightedCoreFieldL2 ε (M.charge α f)) : K` for each original `f:SmoothCore 2`, where `J` is AY's actual `PiLp` equivalence. By accepted RAD-C2B component equation and C3D-A cancellation, prove `B16ε zε = WithLp.toLp 2 (M.chargeVector f)`, with **no changed charge operator or Fock carrier**.

For `f : G.invariantCore`, original AU `originalMinimalCoreGraph M G` contains `(coreToL2 f.val, M.chargeVector f.val)`; it therefore lies in the original AY minimal closed physical graph after the existing source rebasing. Using the accepted RAD-C3 graph equality and `mem_iff`, show `(⟨coreToL2 f.val,f.property⟩,zε)∈graph(Sε)` and infer literal domain membership.

**Exact roots:** `originalWeightedChargeCoreOutput`, `originalWeightedChargeCoreOutput_reciprocal`, `originalWeightedChargeCoreGraph_mem`, `originalWeightedChargeCore_mem_domain`.

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.lean`. **Independent consumer:** `lean/diagnostics/BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraphIndependentConsumer.lean`. **Strict workflow:** `.github/workflows/bfss-p3-aux-rad-c3db-original-physical-weighted-core-graph-strict.yml`; immutable original Core, AY, AU, AZ, C3, C3D-A donor blobs and pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, cold source and concrete original SU2 consumer, four-root standard-axiom audit, evidence artifact.

## Stop lines and next gate

Neither this gate nor the accepted C3D-A proves dense physical weighted domain. After strict qualification, C3D-C should invoke the already accepted original D2B10C Haar closure `G.coreNormClosure = G.physicalSpace` and the same `Subtype.dense_iff` transport proof used in H5E8AZ, replacing its older core domain lemma with this C3D-B weighted-core domain lemma. No maximal field multiplication identity, bounded inverse, epsilon-zero limit, Hamiltonian adjoint, auxiliary gap or BFSS mass-gap claim is admitted.
