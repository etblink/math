# Current research roadmap — maintenance freeze

**Owner-authorized consolidation, November 28, 2026.** No new proof gates or computational experiments while maintenance is active. `main` is the canonical downstream research baseline. See [maintenance register](research/maintenance/README.md) and [research library](research/README.md). The [original 1,261-line roadmap at its frozen commit](https://github.com/etblink/math/blob/3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd/BFSS_ACTIVE_ROADMAP.md) is also retained byte-for-byte in [the historical archive](archive/roadmaps/BFSS_ACTIVE_ROADMAP_2026_11_28.md). Its dated headings are historical, not current instructions.

## Active priority: repository consolidation

1. Preserve original history, source trees and evidence. [Known artifact checkpoint](research/maintenance/artifact-audit/KNOWN_ARTIFACT_RECONCILIATION_CHECKPOINT_V1.json): 341 known originals reconciled (149 in Git, 192 recovered pending binary commit); all 321 receipt-only discovery runs queried, companion FCP provenance resolved. Remaining body-level discovery and qualification reconciliation are open.
2. Catalogue all qualifications, theorem signatures, source adapters, computational receipts and negative results; reconcile stale status labels without changing original receipts.
3. Validate reference resolution, dependency links, workflow and checker compatibility. Review CI triggers before selectively restoring executable workflows.
4. Reassess the research frontier and explicitly end the freeze before staging another native gate.

## Frozen scientific frontier (not an execution order during maintenance)

| Area | Evidence and remaining boundary |
|---|---|
| Common square | CSQ-F2 R1 [#46094976004](https://github.com/etblink/math/actions/runs/46094976004) strict GREEN; every original individual native closed supercharge and literal core closure has natural square equal to original normalized H including domain and action. [Receipt](research/computational/python-first-20261124/bfss-physical-implication/CSQF2_R1_GREEN_QUALIFIED_2026_11_27.md). No existence claim. |
| G16 | G15 last qualified full gate; D0/D1A/D1B0 qualified diagnostics. D1B0 [#43773462950](https://github.com/etblink/math/actions/runs/43773462950) recovered. [Donor inventory](research/computational/python-first-20261124/bfss-physical-implication/G16_RETROSPECTIVE_DONOR_INVENTORY_AND_REUSE_DECISION_2026_11_28.md). Next proposed D1B1 ordered gamma-word adapter only after maintenance and donor review; no duplicate signed-row proof. |
| Reduced witness | Rank two complete 144/144 pairs, 2880/2880 slots; rank three 1180/3888 slots, 228/720 historical aggregate comparisons, 36/144 complete pairs. [Recovery](research/computational/python-first-20261124/bfss-physical-implication/POST_RANK3_LOW_MIXED_INTERRUPTION_RECOVERY_2026_11_27.md), [reuse/compression](research/computational/python-first-20261124/bfss-physical-implication/POST_RANK3_REUSE_AUDIT_AND_COMPRESSION_PLAN_2026_11_27.md). Derived algebraic checks separate from raw occupation replay. |
| Physical existence | Genuine Spin(9) Fock-vector and domain covariance, literal admissibility, positive-regulator Hardy and weighted finite certificate remain open; fidelity implication conditional. No gap, uniqueness or empirical promotion. |
| Other research | SM, SCC/QIT, Hopf, IBI, unification and other tracks remain in scope, with their own qualified/open boundaries. Reconstruct their frontier during maintenance. |

[Scientific knowledge atlas pilot v0.1.5](research/methodology/SCIENTIFIC_KNOWLEDGE_ATLAS_PHYSICAL_EXISTENCE_PILOT.md) (24 extension and 59 base records); [truth-first charter](research/methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md). Canonical M4 W0C2B2 R2 BLOCKED and 27 accepted anchors in the [historical gate registry](BFSS_GATE_STATE.json) remain unchanged; do not infer their closure from other tracks. [Python-to-Lean conversion register](research/computational/python-first-20261124/bfss-physical-implication/PYTHON_TO_LEAN_CONVERSION_REGISTER_2026_11_27.md).

**Scope:** native qualification does not establish physical truth automatically. Preservation, reuse and falsifiability remain governing.
