# CERT-P0 R1 — source review and prospective native reciprocal Hilbert pairing

Date: 2026-11-14 Pacific. NOT LEAN QUALIFIED; RESEARCH_DESIGN_NOT_STAGED.
Reviewed existing-source ref: 23849e62a9b8fe88a66acaa65e77fc8a000c0974.
C5A R2 #43593756655 accepted at 9f647fc3770b58085be83ce4e579847311badc8a, ten/fourteen reports and 149 pins. Acceptance/checkpoint commit cea7375ba7d54aae955127561ea13e1f22e6f041 predates any CERT-P0 source.

## 1. Post-C5A endpoint review

The [birds-eye synthesis](../methodology/BFSS_PROJECT_BIRDS_EYE_SYNTHESIS_POST_C4C_2026_11_14.md) proposes a conditional fixed-positive-regulator singlet fidelity certificate. This requires the actual weighted pairing
\[
 \langle Tu,y\rangle_K=\langle S_\varepsilon u,B_\varepsilon y\rangle_K.
\]
The next gate implements this interface from the accepted inverse graph. It does not need a new ratio multiplier or an operator at epsilon zero.

| Certificate obligation | Inspected current evidence | Disposition |
| --- | --- | --- |
| Original bounded reciprocal and literal AE semantics | R0B2A + G0B0 accepted originals | DIRECT REUSE; pair using the real original field, no surrogate |
| Pairing in native FullL2 | Pinned L2.inner_def + G0B0 AE; no pairing declaration found in inspected reciprocal modules/inventories | SELECTED smallest new adapter |
| Pairing in actual sixteen-output K | C2B coordinate identity + PiLp.inner_apply | SELECTED lift through finite inner sum; do not assume AY equivalence is an isometry |
| Weighted original charge/output join | C3 graph equality/membership and Mathlib mem_graph_iff | SELECTED concrete consumer of the pairing; retain actual original domain |
| Reciprocal preserves physical FullL2 | G0B3 strict #43565346269 | AVAILABLE separately; no new restricted-operator constructor needed for this pairing gate |
| Physical singlet to spinor covariance | Genuine source Spin(9) lift and all-charge joins remain separate | DEFERRED, not implied by scalar radiality |
| Individual physical supercharge/energy-domain identities | Actual H is normalized column adjoint square; this alone does not assert each Q_alpha squared equals H | DEFERRED explicit source obligation |
| Uniform bounded-reciprocal Hardy and energy-space duality | No original-source qualified theorem located in inspected scope | DEFERRED decisive analytic estimate; boundedness alone is insufficient |

Coverage: live roadmap/state, preserved endpoint synthesis, exact R0B1/R0B2A/G0B0/C2B/C3 sources, G0B3 accepted state/receipt metadata, current Kotler directory and all 498 OperatorDependencies filenames, and pinned Mathlib signatures below. This is not an exhaustive historical-branch theorem census. Local Lean/lake unavailable.

## 2. Exact donors and inspected APIs

| Donor | Exact pin / definition | Use |
| --- | --- | --- |
| Original Core | 9882359ced78b0a3bd7e2f057974bd0a031b3e60 | Boson 2, Fermion 2, FullL2 2 and actual SpinIndex |
| R0B1 | d1cbb8077799236e5e1b82704270bdb9ab9153b4 | originalReciprocalField = inverse complex cast of real radial weight |
| R0B2A | e2a02b551486cfbc2a723f5b5ff0b282177c5e76 | Actual bounded FullL2 reciprocal |
| G0B0 | 670cc600fdc42a03d21de759e8b46b6cb1306874 | AE original-field action |
| C2B | 45aa19082616ae874bf642f336d9a7c5fa1fd6f9 | Actual PiLp output reciprocal and coordinate identity |
| C3 | 6aff6416d341738a1f55e6aaad107f4726f1e34f | Literal inverse-image graph and original charge |
| AY | a9f27a48852ac570aedc8e0ab88d683250e6b138 | Exact original physical input, K and coordinate equivalence |
| Mathlib | d13f23b723b8a846827a245b89c10fc7d3f11612 | L2Space.lean L2.inner_def (line 136); PiL2.lean PiLp.inner_apply (line 104); InnerProductSpace/Basic.lean inner_smul_left/right; Basic/Complex/Basic.lean conj_ofReal/conj_inv (lines 474/728); LinearPMap.lean mem_graph_iff (line 798) |

No generic Hilbert-space theorem, reciprocal map, physical Hilbert space or adjoint is rebuilt.

## 3. Fixed source contract

Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxCertP0OriginalReciprocalHilbertPairing.lean
Namespace: FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing
Imports: existing G0B0 and C3; pinned Mathlib L2Space and PiL2.
Four named roots:
- originalReciprocalField_conj
- originalReciprocalFullL2CLM_inner
- originalReciprocalHilbertOutputCLM_inner
- originalWeightedChargeGraph_pairing

1. The literal original reciprocal field is fixed by complex conjugation (pure real inverse).
2. For f,g in actual FullL2 2,
   inner(B_epsilon f,g)=inner(f,B_epsilon g), epsilon>0.
   Use L2.inner_def, integral_congr_ae, both actual AE action identities and inner scalar rules. No pointwise representative equality is assumed.
3. Same pairing for actual K=PiLp 2 (SpinIndex -> FullL2 2), via its finite sum and C2B coordinate identity. No norm transport through the product equivalence.
4. For actual original M,G, t in the original charge domain, z,y in K, and ((t:E),z) in actual S_epsilon.graph,
   inner(T t,y)=inner(z,B16_epsilon y).
   Recover exact T graph point, reconcile domain witnesses using Subtype.ext, then apply native K pairing. No maximal weighted domain or entire domain invariance is assumed.

This graph result is the concrete next consumer: it is precisely the pairing used before Cauchy–Schwarz in the endpoint argument. No positivity/Hardy bound or individual-supercharge spectral identity is asserted.

## 4. Strict independent native acceptance

Consumer: lean/diagnostics/BFSSP3AuxCertP0OriginalReciprocalHilbertPairingIndependentConsumer.lean
Workflow: .github/workflows/bfss-p3-aux-cert-p0-original-reciprocal-hilbert-pairing-strict.yml
Consumer imports candidate plus original G4J. Exercise all four roots on literal original data, original FullL2 norm/measure and actual paired physical-domain charge graph; include physical-input FullL2 pairing. Print four new + four donor roots in exact order.

Freeze all transitive existing OAI imports to reviewed 23849e62a9b8fe88a66acaa65e77fc8a000c0974. Explicit Core/G4J/R0A/R0B1/R0B2A/G0B0/C2A/C2B/AY/C3 pins; only new source and consumer differ. CI measures actual closure count.
Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Cold OAI source plus native G4J prerequisite, fresh warning-as-error source and independent consumer; four/eight reports and standard axioms only; preserve manifest/logs. Budgets and allowed package notices unchanged.

## 5. Falsifiers and decisions

Wrong conjugation/inner-slot orientation; pointwise equality substituted for AE; assumed isometry of AY's equivalence; different output carrier; lost T-domain witness; missing actual graph premise; native consumer failure or disallowed axiom/warning prevents qualification.
After two related compiler reds isolate the exact source interface. Preserve first causal diagnostics and all earlier C5A red/green evidence.

GREEN qualifies native real reciprocal pairing and its original graph consequence only.
No new restricted physical operator, full Spin(9) covariance, Hardy estimate, energy-space inverse identity, fidelity certificate, zero mode, zero-regulator limit or spectral gap is proved by this gate.
Commit this receipt before the first new proof/consumer.

## Exact launch binding — 2026-11-14 Pacific

Source review/preregistration committed at `1dc1420a4d50a671c50e2445d2aeaa7a7dbc3d1c` before candidate source/consumer. [Strict #43621045697](https://github.com/etblink/math/actions/runs/43621045697) tests exact `e06545070752572665f87759fe450063109da870`, job #132526575723. Source `f3b4645d85cd611b48cc6f480857659c0b5934c2`, consumer `e1f5e395550146370e8d17387ff00d35f2c4fbc2`, workflow `701f3dbb94829234a6e833a36b0fd8fd2dd2b825`. Checkout/preflight pending at launch binding; administrative #43621045557 separate. **UNQUALIFIED until full native source/paired graph consumer and exact four/eight reports pass.**
