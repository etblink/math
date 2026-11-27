# NAG0 R1 — original individual native physical operator — GREEN_QUALIFIED

2026-11-27 Pacific. Qualification of exact candidate f6aba5342b36e131c02df093782b2dd4e2fd6eba on integration/bfss-unified-research-20261108.

- Run: https://github.com/etblink/math/actions/runs/46047069230 (job 140668861668; completed success).
- Artifact: https://github.com/etblink/math/actions/runs/46047069230/artifacts/15223668167; 25,441 bytes; SHA-256 a9eb0ed448261d7587100dfc051da1469160cbae17afaf386180ca66c53168b2, independently recomputed from downloaded ZIP, equal to GitHub digest.
- ZIP tested-sha.txt matches exact candidate; preflight.log: BFSS_NAG0_SOURCE_EXACT_PREFLIGHT_PASS.
- Tested blobs: source bb65935668afc14b927b6d409af025611e3e040f; consumer 3f21151efed4d17d397b938ed2c1fe4fd91b0701; workflow 0141f0fd5312c6a764aeeaebb0342913c412692a.
- Native source build completed successfully (9177 jobs); strict independent consumer passed. All six named NAG0 roots and two independent roots were found in downloaded transcripts, each using only propext, Classical.choice, Quot.sound. No error:, sorryAx, unsolved goals, or unknown identifier in either transcript. Workflow success implies required strict GREEN sentinel check passed; sentinel itself was not stored in these logs.
- Lean 4.34.1; pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 verified by successful exact workflow. Artifact environment hashes: lean-toolchain d5edba4e4b8faad9c1baeadb265716d20d03be4d1a2647dc5e35b0c0325bea7b; lake-manifest.json cf6105a25d9dca2f166b241d9191bd12c7e13305890dc9c4d0952351cccc0794. Lake emitted pre-existing package-local-change warnings in consumer transcript; no Lean error, and no inference of a globally pristine dependency tree is made beyond checked pins.

## Qualified scope
For actual paired SU2, every spin label now has a native closed LinearPMap on the literal original physical Hilbert space, with graph exactly the physical-coordinate comap of the original individual closed core graph. Generic graph identification/closedness is under the equal-core-norm premise, discharged for the paired data by ICD-C0. Independent consumers confirm concrete graph and closedness. No adjoint, density, ESA, spectral existence or fidelity claim follows at this gate.

## Next bounded obligation (proposed NAG1; not qualified)
Reuse ICD-C0 paired_component_graph_iff and paired_common_domain, AU originalMinimalClosedGraph_le_full, and UGC2 closed_graph_physical_output. For any individual ambient closed graph pair with physical input, lift to the joint graph, embed in fullClosedGraph, and infer physicality of the component. Then NAG0 paired_individual_graph_iff and LinearPMap.mem_domain_iff yield exact equality of native individual and AY joint domains, in both directions. D2B10C sourceCoreNormClosure_eq_physical_unconditional provides density of original invariant core; core graph inclusion then yields density of each native domain after an explicit subtype topology bridge. LOC6C physical_closed_graph_iff_weak is the later adjoint bridge. Keep density, adjoint equality, and core closure/ESA explicitly separate if needed.

No changes to the qualified Lean sources or workflow. BFSS_GATE_STATE.json was not overwritten because the connector returned no content in both UTF-8 and base64; this standalone receipt is the append-only qualification evidence and state reconciliation remains pending.
