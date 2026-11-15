# Forward research: recovered original physical charge-output closure

Date: 2026-11-15. Source snapshot: `98d0321f91c86e1482a88cbee7ccb4f9f743fbf3` on integration/bfss-unified-research-20261108.

Status: source and historical qualification audit; proposed native adapter is not compiled or qualified. G13 run [43743787307](https://github.com/etblink/math/actions/runs/43743787307) is left unchanged. No new proof gate is launched by this memo.

## Decision

The physical charge-output prerequisite has a substantially shorter source route than the November 14 inventory suggested. D3B already proves that every original charge preserves the actual gauge-invariant smooth core. D2A already extends output physicality to every vector in the original gauge-restricted closed joint-charge graph. BF identifies the current AU/AY graph with exactly that source graph.

The D3B, D2A, D1 and BF donor files match the historically compiled and axiom-audited source bytes. The next bounded task is to connect their statements in the current native AY/paired interface, with the current full import closure pinned and independently consumed. Reproving the closed-set argument or assuming a separate independent-Fock matching witness would add unnecessary work for this particular obligation.

This recovers an existing source result; it does not establish the individual-supercharge energy identity, essential self-adjointness, Spin(9) charge covariance, a Hardy estimate, or a fidelity certificate.

## 1. What the original source actually proves

D3A proves kinetic gauge covariance using a finite orthogonal basis-contraction identity and the actual derivative transformation on G.invariantCore. D3B combines this with the original potential-multiplier covariance and the exact original/deformed charge equality. In namespace FCP.BFSSSU2PhysicalDomainD3B:

```lean
theorem sourceOriginalCoreCharge_mem_physicalSpace
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (α : SpinIndex) (f : G.invariantCore) :
    coreToL2 (M.charge α f.val) ∈ G.physicalSpace

theorem sourceOriginalCoreCharge_mem_invariantCore
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (α : SpinIndex) (f : G.invariantCore) :
    M.charge α f.val ∈ G.invariantCore
```

These use the genuine source M.charge, G.invariantCore and G.physicalSpace. They require the source AlgebraData/GaugeData structure, but no extra independent CAR realization, fiber equivalence J, per-charge energy identity, Spin(9) representation, or individual closed-charge self-adjointness.

D2A already contains the exact analytic passage needed here:

```lean
theorem sourceClosedGaugeGraph_output_physical
    {ψ : FullL2 N} {y : SpinIndex → FullL2 N}
    (hp : (ψ, y) ∈ G.deformedModelGraph 1 0)
    (α : SpinIndex) :
    y α ∈ G.physicalSpace
```

Its proof constructs the closed set Cα = {p | p.2 α ∈ G.physicalSpace}. Evaluation after the second projection is continuous and G.physicalSpace is closed. D3B places the original invariant-core graph inside Cα. Closure minimality then places the entire source closed graph inside Cα.

D2A also proves sourceOriginalRestrictedClosedGraph_all_physical. Thus output membership is established on the actual minimal closed joint-charge graph, rather than being only a smooth-core statement or an assumption about a maximal differential realization.

## 2. The bridge to the accepted native graph

AU defines originalMinimalClosedGraph as the closure of the original invariant-core graph built from M.chargeVector. AY rebases the input to G.physicalSpace and the output to sixteen-component PiLp 2 of FullL2.

BF supplies:

- originalMinimalClosedGraph_eq_exactSourceGaugeGraph;
- originalMinimalPhysicalHilbertChargeGraph_mem_source_iff;
- originalMinimalPhysicalHilbertChargeColumn_graph_eq_sourceRebased.

The middle statement sends literal AY graph membership to membership in G.deformedModelGraph 1 0 after the physical inclusion and originalMinimalHilbertOutputEquiv. Composing it with D2A gives the following prospective adapter contract:

> For every p in originalMinimalPhysicalHilbertChargeGraph M G and every α, the α coordinate of originalMinimalHilbertOutputEquiv p.2 belongs to G.physicalSpace.

The native coordinate form should follow from the exact PiLp equivalence evaluation. Specialize to pairedAlgebraData/pairedGaugeData without additional representation-matching parameters.

This is a proposed current consumer, not a new Lean-qualified declaration. The accepted M5BF0 checkpoint independently binds the actual paired source graph and normalized original Hamiltonian; its scope remains unchanged.

## 3. Historical qualification recovered, with a current-dependency boundary

[Full-contribution run 42095440280](https://github.com/etblink/math/actions/runs/42095440280), attempt 1, tested 0ca22c72345f949c03bcdae8a44d30334e60c42c. Job 127484109414 completed successfully.

The decoded job logs were independently read in this audit. They record:

- fresh D3A and D3B compilation at targets 365/795 and 366/795;
- fresh D2A compilation at target 400/795;
- BFSS_MODULE_COMPILE_SUMMARY: 795 passed, 0 failed, 0 blocked;
- BFSS_BUNDLE_AXIOM_REPORT_PASS: 2924 declarations;
- BFSS_COMPLETE_CONTRIBUTION_BUILD_PASS.

The pinned workflow runs build_bundle.py without diagnostic mode. That runner removes selected old objects, compiles with autoImplicit=false and warningAsError=true, and runs Audit.lean. check_bundle.py checks the exact source-blob inventory, audit/index agreement, complete report set and allowed axioms {propext, Classical.choice, Quot.sound}. Historical Audit.lean explicitly includes both D3A roots, all five D3B roots and all four D2A roots.

The historical manifest still describes the earlier failed run 42075189629 in its latest_strict_run field. That field is an as-of receipt, not evidence against the later success: the exact later run metadata, tested workflow and decoded completion logs establish the recovered qualification above. The historical evidence artifact was not downloaded or independently rehashed in this audit.

The following selected donor blobs agree between the historical manifest and the current source directory:

| Donor at current pinned snapshot | Historical = current Git blob |
| --- | --- |
| [SU2BFSSPhysicalDomainD3AKineticGaugeContractionProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD3AKineticGaugeContractionProbe.lean) | `f7c62fd77655a67e06b4c727c30186858877a2e6` |
| [SU2BFSSPhysicalDomainD3BFullChargeGaugePreservationProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD3BFullChargeGaugePreservationProbe.lean) | `532648ee147e218aba4e69ae2f79dd7da63cd9a8` |
| [SU2BFSSPhysicalDomainD1RestrictedSourceGraphProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD1RestrictedSourceGraphProbe.lean) | `01c33519d617209ac589eb4cdc71db400778e8ec` |
| [SU2BFSSPhysicalDomainD2AClosedPhysicalGraphProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2AClosedPhysicalGraphProbe.lean) | `56edc9a394cf59149e040c05c76f7bdf65991984` |
| [SU2BFSSPhysicalDomainL6H5E8AUOriginalMinimalClosedChargeLinearPMapProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AUOriginalMinimalClosedChargeLinearPMapProbe.lean) | `389bd4318cbc389db226691bbccecaa78c6c6c3e` |
| [SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean) | `a9f27a48852ac570aedc8e0ab88d683250e6b138` |
| [SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe.lean) | `fd137fc6f62f42d96bcf6ff3eb9355839a59d562` |
| [FCPM4F9H3AOriginalPairedPhysicalChargeOutputConstraint.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/FCPM4F9H3AOriginalPairedPhysicalChargeOutputConstraint.lean) | `f17959846d354156de73ca623683ac69ac21aa21` |
| [FCPM4F9H3B2OriginalAYNativePhysicalHilbertChargeColumn.lean](https://github.com/etblink/math/blob/98d0321f91c86e1482a88cbee7ccb4f9f743fbf3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/FCPM4F9H3B2OriginalAYNativePhysicalHilbertChargeColumn.lean) | `416eac54f8fd917df8e23c9f81c8b565e124d979` |

**Matching donor files do not imply a matching entire import closure.** Comparing all 498 current OperatorDependencies entries against the historical manifest finds five changed files. Four are the G4K9A/B/C/D charge/potential dependency chain, which lies in D2A's historical transitive closure. The fifth is S1V52M3H. Exact old/current hashes are preserved in the [accompanying diagnostic JSON](diagnostics/P3_AUX_CERT_RECOVERED_PHYSICAL_OUTPUT_SOURCE_AUDIT_2026_11_15.json).

Therefore this memo records historical qualification and a strong source reuse route. It does not promote the current untested D2A-to-AY adapter or claim the current full dependency graph is byte-identical to the historical graph. A fresh narrow qualification must bind the actual current transitive closure.

Several donor headers still say prospective or uncompiled. They are historical source comments; they neither erase the later run nor supply current qualification by themselves.

## 4. Why the H3A matching assumptions are avoidable here

H3A's pairedOriginalMinimalPhysicalHilbertChargeGraph_outputs_physical already has a source-only conclusion, but its proof signature requires an independent finite-dimensional CAR representation, color/gamma matches and a fiber intertwiner J. Those hypotheses must not be erased merely because the conclusion names only the original source.

H3B2 constructs a native physical-output graph without those witnesses. Its domain-equivalence theorem invokes H3A and inherits the matching assumptions. Graph construction alone does not prove unchanged domain.

D3B → D2A → BF provides an alternative proof of the particular output-membership premise directly from the original source gauge data. This may remove the independent matching dependency from a new domain-equivalence adapter. It does not discharge the separate independent/source representation equivalence project.

## 5. What output membership buys, and what remains

Write E = G.physicalSpace, F = FullL2 N, K = PiLp 2 (sixteen copies of F), and T for the accepted native closed joint-charge column. Output membership permits a literal restriction of its values to E in every coordinate, giving a column T_hat into PiLp 2 (sixteen copies of E).

The proposed construction must prove T = J T_hat with J the componentwise isometric inclusion, the exact same domain, closedness of the restricted graph, and equality of output inner products. Then the normalized weak form (1/16) inner(Tu,Tv) is unchanged, so its associated normalized Hamiltonian is unchanged. No new Hamiltonian definition is needed merely to establish output membership.

These are analytical deductions and future adapter obligations, not newly compiled results.

| Endpoint obligation | Status after this audit |
| --- | --- |
| Original charges preserve invariant smooth core | Direct D3B source; historical strict build and audit recovered |
| All closed joint-charge outputs are source-gauge-physical | Direct D2A source; historical strict build and audit recovered |
| Same assertion in current native AY/paired signature | Short D2A/BF composition identified; fresh adapter/consumer qualification pending |
| Literal physical-output restriction with unchanged domain/form/H | Precise construction available; domain/equality adapters still to qualify |
| Each original charge has energy equal to the normalized total form | Still open in this audit; normal-ordering infrastructure alone does not supply the full identity |
| Individual closed-charge domains coincide with the joint column domain | Not implied by physical outputs; still requires an energy/domain argument |
| Individual charge self-adjointness and square/resolvent identity with original H | Separate open spectral/domain obligation |
| Genuine physical Spin(9), reducing spinor sector and singlet-to-spinor covariance | Separate highest-priority forward-research obligations |
| Sector Hardy, actual-domain extension and informative singlet trial energy | Still required for the certificate |

In particular, H = T†T/16 and physical outputs do not prove Qα² = H. Coordinate projection of a closed column need not be closed on the column domain. Symmetry or a closed coordinate realization does not itself prove self-adjointness. The prior memo's exact per-charge core norm identity would provide much stronger graph-norm control, but even then the self-adjointness/resolvent step remains separate.

No inference from gauge preservation to Spin(9) covariance is made: these concern different group actions.

## 6. Bounded follow-through

After the running G13 verdict is handled, retain the immediate full rotation/tau-norm algebra sequence. The highest forward-research allocation remains physical symmetry and energy/domain feasibility.

For the output subproblem, a prospective narrow gate should:

1. Pin and freshly compile the current D3A/D3B/D2A/BF transitive closure, retaining existing signs, normalization, domains and resource discipline.
2. Independently consume the generic D2A closure theorem and its native AY/actual paired specialization, with no independent-Fock matching witness.
3. If a physical-output column is needed by the next endpoint contract, prove unchanged domain and inclusion/value equality first; then preserve inner products and the accepted weak form.
4. Audit all resulting roots and source-shaped native consumers. A hypothetical physical-output predicate or an extra unproved domain equality is not an acceptable substitute.

No parallel CI, Lean source, workflow, gate checkpoint or active G13 proof is changed by this research note. Historical receipts and failed approaches remain preserved.

Related research: [averaged-resolvent and charge-closure contract](P3_AUX_CERT_FORWARD_RESEARCH_AVERAGED_RESOLVENT_AND_CHARGE_CLOSURE_2026_11_14.md). This note refines that memo's physical-output inventory; it does not relax its energy, self-adjointness or Spin(9) assumptions.
