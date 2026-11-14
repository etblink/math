# P3-AUX-RAD-C4C R1 — pre-gate evidence receipt: exact original weighted kernel preservation

**Date:** 2026-11-14 Pacific. **Decision:** Project Lead GO after verified C4B acceptance.
**Branch:** integration/bfss-unified-research-20261108. **Reviewed existing-source baseline:** `b78b3d4583955e892e8cac0d151850541f9367db`.
This source-reuse receipt is committed before the first C4C theorem/consumer commit. No new mathematical qualification is implied.

## Exact contract and single principal obligation

For literal `M:AlgebraData 2`, `G:M.GaugeData`, `hε:0<ε`, E=G.physicalSpace, K=PiLp 2 (SpinIndex→FullL2 2), retain the actual original AY charge T, accepted inverse-graph weighted charge Sε, normalized weighted Hε and original BE H=(1/16)T†T.
The target is equality of Mathlib's **actual partial-linear-map kernel submodules of E**:
```lean
(originalWeightedPhysicalNormalizedAdjointSquare M G hε).ker =
  (originalMinimalPhysicalNormalizedHamiltonian M G).ker
```
Kernel membership includes the operator's domain. No standalone set of formal solutions is substituted.

Nine individually audited roots under `FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation`:

| Root | Full mathematical contract / domain |
| --- | --- |
| mem_ker_iff_graph_zero | For T:E→ₗ.[ℂ]F, x:E, x∈T.ker iff (x,0)∈T.graph |
| oneSixteenth_ker | For T:E→ₗ.[ℂ]F, ((1/16:ℂ)•T).ker=T.ker |
| naturalAdjointSquare_graph_zero_iff | For densely defined T between the actual Hilbert types, with complete E, (x,0)∈(naturalComp T.adjoint T).graph iff (x,0)∈T.graph |
| naturalAdjointSquare_ker | Same hypotheses: (naturalComp T.adjoint T).ker=T.ker |
| originalWeightedPhysicalCharge_graph_zero_iff | For every literal M,G,hε,x:E, (x,0)∈Sε.graph iff (x,0)∈T.graph, with the literal native PiLp output zero |
| originalWeightedPhysicalCharge_ker_eq_original | Sε.ker=T.ker as submodules of E |
| originalWeightedNormalized_ker_eq_charge | Hε.ker=Sε.ker on their full natural domains |
| originalNormalizedHamiltonian_ker_eq_charge | Original BE H.ker=T.ker, not a historical proxy operator |
| originalWeightedNormalized_ker_eq_originalH | Hε.ker=H.ker by the preceding exact joins |

The first two generic helpers need only complex modules. The adjoint helper explicitly needs Dense T.domain and actual physical completeness at native use. Mathlib's adjoint has a junk-value branch when density fails; do not remove the premise. Native source definitions carry their source completeness instance, exactly as in accepted C4A/C4B.

## Retrieval performed and evidence matrix

Actually read current AGENTS, roadmap/state, registry; exact C4B source/consumer/workflow, run/job/20 axiom reports and artifact metadata; C3 inverse graph source; complete BC/BD/BE and BA density; M5BE0 acceptance; earlier forward kernel/regulator memo; actual OperatorDependencies inventory; older D2B19 positive-square source; and pinned Mathlib `LinearAlgebra/LinearPMap.lean`. This is exact-ref inspection, not an exhaustive historical/FCP branch census. Local Lean/lake are unavailable.

| Donor / candidate | Exact source evidence | Disposition |
| --- | --- | --- |
| Mathlib LinearPMap.ker / mem_ker_iff / mem_graph_iff | Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, LinearAlgebra/LinearPMap.lean lines 137–148 and 794–801 | DIRECT REUSE; kernel witness uses x=↑y, graph uses ↑y=x, so preserve equality orientation |
| Mathlib smul_domain / smul_apply | Same pin, lines 429–433 | DIRECT REUSE; only nonzero fixed scalar 1/16 needed, cancellation uses 16 |
| C3 graph_eq / graph_mem_iff | blob 6aff6416d341738a1f55e6aaad107f4726f1e34f; strict #43570463487 | DIRECT REUSE of literal inverse graph: Bε0=0 |
| BD mem_graph_naturalComp | blob 9bedf73dded2229062dce43184c7b1bd11b2ef22; inspected original source | DIRECT REUSE of exact relational composition with both domain layers; explicitly audit its root in the new consumer |
| Mathlib adjoint_isFormalAdjoint + inner_self_eq_zero | Exact generic Hilbert pairing already consumed by accepted C4A | DIRECT REUSE; use abstract T before concrete source, no re/norm rewrite |
| BA originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional | blob 3ab254088e3fa2aea7622807b6b10e7eabc6fc8a; source BA/Haar, consumed in accepted M5BE0/BF0 | DIRECT REUSE for original T |
| C3DC weighted density | blob 5ed2b3bfc6add8b50e25d43db3252ee7848caed9; strict #43579923559 | DIRECT REUSE for Sε |
| C4B normalized weighted definition | blob 0fe927b9709bd0e359aafb691aca086c6e4a5c46; strict #43587088274 at 08afa5c57b1f90daa621b938e778bb2ffb7770a2 | DIRECT REUSE, accepted full domain and 1/16 factor |
| Original BE H and actual BB adjoint definition | BE 0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5; M5BE0 #43493125150 | DIRECT REUSE of unweighted original H; retain original carrier and natural product |
| D2B19 positive-square source | blob 29a4170b125929179d57e779348ee9f7935b4643; declarations inspected | METHOD ONLY; generic pairing/positivity, no ready kernel declaration in this file |

## Novelty / smallest proof

No new charge, graph, adjoint, physical Hilbert space, dynamics, projection or kernel definition.
Missing interfaces are the exact kernel/zero-graph conversion, fixed nonzero normalization cancellation and natural product kernel equality, each used by both original T and actual Sε (concrete second consumers justify the small generic helpers).

Natural-product forward direction: a zero graph point gives y with (x,y)∈T.graph and (y,0)∈T.adjoint.graph. Unpack actual domain witnesses, use genuine adjoint pairing to obtain ⟨y,y⟩=0, then y=0. Reverse: (x,0)∈T.graph and (0,0)∈T.adjoint.graph give a natural-product graph point.
This avoids the concrete re/inner norm rewrite that failed in C4A R1.
C3's native inverse-graph zero pairs coincide because the bounded reciprocal is linear, Bε0=0; no global inverse on arbitrary outputs is assumed.
Use the generic helpers twice, once for Sε and once for T, then join the native kernel equalities. Never assume domain invariance or zero-state existence.

## Independent acceptance plan

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4COriginalWeightedKernelPreservation.lean`, importing only accepted C4B (its native existing dependencies already contain the required APIs).
Consumer `lean/diagnostics/BFSSP3AuxRADC4COriginalWeightedKernelPreservationIndependentConsumer.lean`, importing new source and original G4J paired data.
Workflow `.github/workflows/bfss-p3-aux-rad-c4c-original-weighted-kernel-preservation-strict.yml`.

Source prints nine named roots. Consumer independently exercises all nine contracts on original paired SU2 data, plus the literal FullL2/Fermion/Boson anchor; prints nine new + seven native donor/prerequisite roots. Freeze complete transitive OAI closure to reviewed baseline; explicitly pin original Core/G4J/AY/BA/BC/BD/BE/C3/C3DC/C4A/C4B. Only the two new candidate files differ.
Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; cold OAI source, fresh warning-as-error source and independent literal paired consumer; exact root order and axioms limited to [propext, Classical.choice, Quot.sound]; persist logs/manifest. CI measures the actual pin count; do not invent one.

## Falsifiers, negative knowledge and decision

A domain-free formal kernel, dropped density premise, accidental epsilon-zero quantifier, wrong scalar cancellation, reversed graph equality, substitute original H, failure in the actual source consumer, disallowed axiom or forbidden warning blocks acceptance.
C4A R1's rewrite/instance diagnostic and six proof letI warnings remain preserved. Use proposition-proof let and generic typed interfaces; do not raise proof budgets, weaken the theorem or disable warnings. After two related reds, stop tactic permutations and isolate the actual missing interface.

GREEN: record exact tested SHA, pins, source/consumer roots and receipt; only then discuss native positive-ratio/domain/form stability or projection packaging.
RED: retain accepted C4B/C4A and original H, preserve first causal layer, repair only that layer.
**No promotion:** nonzero kernel, existence/uniqueness/dimension of zero modes, a ground-state construction, singlet Hardy gap, spectral gap, maximal-domain/graph-core identity, regulator limit or source-paper equivalence.
