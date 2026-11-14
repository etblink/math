# P3-AUX-RAD-C4A R1 — pre-gate evidence receipt: original weighted natural adjoint square

**Date:** 2026-11-14 Pacific. **Decision:** Project Lead GO for one new operator-theory gate; NOT Lean-qualified. **Branch:** integration/bfss-unified-research-20261108. **Reviewed base:** `5d74a3b5abe74dae4d6ba181ae29f0cb76865414`.
This receipt precedes the first new mathematical source/consumer commit. The owner authorized continuation to the next mathematical priority after read-only context recovery.

## Exact contract and purpose

For literal `M : AlgebraData 2`, `G : M.GaugeData`, `hε : 0 < ε`, let
`E = G.physicalSpace`, `K = PiLp 2 (fun _ : SpinIndex => FullL2 2)`,
`Sε = originalWeightedPhysicalChargeColumn M G hε : E →ₗ.[ℂ] K`.
With the existing `originalPhysicalHilbertComplete M G` instance, define only
`Aε = naturalComp Sε.adjoint Sε : E →ₗ.[ℂ] E`.

The six public target roots under `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare` are:
1. `originalWeightedPhysicalAdjointSquare_domain`: for every `u:E`,
   `u ∈ Aε.domain ↔ ∃ hu : u ∈ Sε.domain, Sε ⟨u,hu⟩ ∈ Sε.adjoint.domain`.
2. `originalWeightedPhysicalAdjointSquare_selfAdjoint`: `IsSelfAdjoint Aε` using the actual physical completeness instance.
3. `originalWeightedPhysicalAdjointSquare_closed`: `Aε.IsClosed`.
4. `originalWeightedPhysicalAdjointSquare_domain_dense`: `Dense (Aε.domain : Set E)`.
5. `originalWeightedPhysicalAdjointSquare_energy`: for every `u:Aε.domain`,
   `Complex.re (inner ℂ (Aε u) (u:E)) = ‖Sε ⟨u,naturalComp_domain_le u.property⟩‖^2`.
6. `originalWeightedPhysicalAdjointSquare_nonneg`: the left side above is nonnegative.

The full signatures will remain in the source and literal paired SU2 independent consumer. This is a new natural adjoint square of the **accepted weighted operator**, not a replacement for original `H=(1/16)T†T`.
Normalization by 1/16 and the full weak-representative iff are reserved for RAD-C4B. No maximal pointwise weighted-domain identity, smooth graph-core density, ε=0 conclusion, singlet Hardy inequality, spectral gap, eigenstate or paper-source equivalence is asserted.

## Retrieval actually performed and coverage

Read the canonical roadmap/state and their history at the reviewed base; post-D2R2 route selection; C3DC source, actual paired consumer, exact run/job and two-root logs; C3 graph source; BB/BC/BD/BE complete source; M5BE0 source/consumer/strict workflow and acceptance receipt; the C3DC workflow; evergreen reuse ledger; failure playbook; pre-gate protocol; regulator and Hardy source reviews; monograph spectral join gates.
Traversed the actual current Kotler directory: no weighted C4 adjoint-square source is present. This is source/API inspection through exact GitHub refs, not an exhaustive all-branch/FCP search. Local Lean/lake are unavailable; no local Lean compilation is claimed. Historical FCP and upstream Physlib/Suzuki attribution is inherited from the inspected original donors; no new external source is imported.

## Candidate evidence matrix

| Candidate | Exact source blob / acceptance | Type-level disposition |
| --- | --- | --- |
| Original RAD-C3 `originalWeightedPhysicalChargeColumn_isClosed` | `6aff6416d341738a1f55e6aaad107f4726f1e34f`; strict #43570463487 at `6dfd221d486b74244f34de6fa051d0f2ec9162fa` | DIRECT REUSE: same literal E and K |
| C3DC `originalWeightedPhysicalChargeColumn_domain_dense_unconditional` | `5ed2b3bfc6add8b50e25d43db3252ee7848caed9`; strict #43579923559 at `8f147e99397d5d50fbd5b375dd8ae6f12ff95ec9` | DIRECT REUSE: every ε>0, actual physical input norm |
| BB `originalPhysicalHilbertComplete` | `044eef08490bcd2f15e95bb3cf1287704f5254de`; used by accepted M5BE0 | DIRECT REUSE: source closed physical subtype, no new completeness assumption |
| BC `naturalComp_mem_domain`, `naturalFormalProduct_inner`, `naturalFormalProduct_symmetric` | `a31a2a04c8c63061fa1d3a447283c2ee261d92d6` | DIRECT REUSE generic arbitrary Hilbert E,F and true partial domains; compiled as accepted BE ancestry; selected generic roots to receive explicit new consumer audits |
| BD `naturalAdjointSquare_shift_graph_surjective`, `selfAdjoint_of_formalSymmetry_and_shift_surjectivity` | `9bedf73dded2229062dce43184c7b1bd11b2ef22` | DIRECT REUSE of generic closed+dense graph argument; original-T specialization does not directly prove weighted-S theorem |
| BE `normalizedWeakRepresentative_iff_naturalAdjointSquare`, `selfAdjoint_smul_real` | `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`; BE generic roots audited in M5BE0 #43493125150 | SUCCESSOR ONLY: reserve exact 1/16/weak-form bridge for C4B |
| Original M5BE0/BF0 Hamiltonian | #43493125150 / #43498649514 | PRESERVED BASELINE, not interchangeable with weighted Aε |
| Original invariant SmoothCore | C3DB R4 #43578132553 supplies inclusion only | NEGATIVE CONTROL: input density is not an Sε graph-core theorem |

## Novelty and smallest proof

No new general von Neumann, graph-projection, Riesz, Clifford, Spin or gauge construction.
The genuine missing interface is the specialization of the **generic** BC/BD closed+dense adjoint-square chain to this exact new Sε. The original source-specific T†T theorem has the wrong operator for direct use.
Self-adjointness follows by applying BC formal symmetry with Mathlib's genuine `adjoint_isFormalAdjoint`, then BD shift surjectivity using accepted Sε closedness and density. Closedness and dense natural Aε domain follow from that self-adjointness. Energy/nonnegativity use BC's exact pairing on the true natural domain.

## Negative knowledge and controls

- C3DB R1–R3 reds and R4 generic-N repair remain intact; do not unfold large concrete AU core witnesses in this gate.
- M5BE0 R1 #43489563180 failed because the BB completeness namespace was missing. Open the actual BB namespace explicitly in source and independent consumer.
- TD-C1A generic controls passing does not establish native joins. Test actual original pairedAlgebraData/pairedGaugeData, not only variable T.
- Never assume Sε preserves its own domain; `naturalComp` encodes both membership layers.
- No heartbeat/recursion escalation, source changes, new axioms, or conversion of the operator-norm column carrier into a Hilbert space.
- An unsuccessful Lean proof is RED_UNQUALIFIED, not mathematical falsification. After two same-cause reds, stop and inspect exact goal/interfaces.

## Minimal independent acceptance

Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4AOriginalWeightedNaturalAdjointSquare.lean`.
Consumer: `lean/diagnostics/BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquareIndependentConsumer.lean`.
Workflow: `.github/workflows/bfss-p3-aux-rad-c4a-original-weighted-natural-adjoint-square-strict.yml`.

Freeze all transitive existing OAI imports against reviewed base `5d74a3b5abe74dae4d6ba181ae29f0cb76865414`; separately check exact BB/BC/BD, original Core/G4J, accepted C3/C3DC blobs. Only the two new candidate files may differ in this import closure. Let CI measure the actual closure count; do not invent one.
Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Cold target build, fresh warning-as-error source and independent literal paired SU2 consumer, exact six new source roots and thirteen consumer reports (six new + five generic BC/BD + accepted closedness/density), all with axioms contained in [propext, Classical.choice, Quot.sound]; fail on sorryAx/errors/unexpected warnings; persist manifest/logs.
No prospective result is qualified by this receipt or by administrative CI.

## Decisions after the run

GREEN: record exact SHA/run/source/consumer/axioms and then prepare C4B normalized weak-form associated operator; keep graph-core/maximal-domain and source-paper matching separate.
RED: preserve first causal failure and unchanged predecessor evidence before a bounded repair. Do not alter original source Hamiltonian, old donor bodies, qualified Sε or its density.
The old top-level M5 baseline and historical decisions are preserved. The existing route-selection and new auxiliary experiment fields describe this pending priority; no broad checkpoint/schema cleanup accompanies this mathematical gate.

## Launch binding — no hypothesis or source change

Strict [#43583785009](https://github.com/etblink/math/actions/runs/43583785009) started at exact source SHA `f7e6db3f05569403c47774655a17aabfaa4c656c`; initial administrative [#43583784919](https://github.com/etblink/math/actions/runs/43583784919) is independent. Original pre-gate receipt commit `ce4e981a70ffc59080fc356212bb2cc4e6e337b4` is the parent of that first source commit. Source `63561999a01e09638063d7efeb4ca057239f32f8`, consumer `820ec0bd4a0255d2564dc05b72bc488b1dabf4d0`, workflow `979ffcd0cf2cc47981e75903d2ba601cfcf661e0` unchanged. No verdict or import-closure count is assumed from launch.

## Subsequent R1 result and forward research

Strict #43583785009 completed RED; see [first-causal receipt](P3_AUX_RAD_C4A_R1_RED_43583785009_ENERGY_REWRITE_AND_INSTANCE_STYLE_2026_11_14.md). The preregistration and original tested source remain preserved at their cited commits. [Forward normalization, kernels and positive-regulator analysis](P3_AUX_RAD_C4B_FORWARD_RESEARCH_NORMALIZATION_KERNEL_AND_POSITIVE_REGULATOR_STABILITY_2026_11_14.md) is research only and changes no original hypothesis.
