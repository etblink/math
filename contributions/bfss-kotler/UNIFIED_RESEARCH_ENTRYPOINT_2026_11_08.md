# Unified BFSS research branch — entry point

**Branch:** `integration/bfss-unified-research-20261108`
**Parent research baseline:** `d3e524c0b660cec8f55f42ae1fb6019ae5afd7b7`

The aim is one source-faithful mathematical research branch suitable for future proof reuse and eventual curated upstream contribution. This branch preserves the full inherited BFSS research worktree, carries the v0.4.0 OperatorDependencies closure as source copies, and now includes selected immutable FCP source copies under `research-sources/fcp/`. Historical refs and original repositories have not been edited.

## Project Lead fast recovery — November 10, 2026

**Start with the [evergreen qualified-proof reuse and failure ledger](BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md)** and its [machine-readable evidence crosswalk](BFSS_PROJECT_LEAD_QUALIFIED_REUSE_MAP_2026_11_10.json). They reconcile historical FCP strict acceptances, original source files copied into this branch, current-tree qualification and open gates. Older checkpoints below are preserved **as-of notes**, not always the latest gate status. In particular the historical S3G/S3G2/S3G3 original Fock gauge-bilinear proofs are already pinned in `research-sources/fcp/physical-spin-source-20261021/`; do not rederive them without first comparing their source signatures. The active C48–VLY–BIL proof DAG is [here](BFSS_C48_VLY_BIL_INTEGRATION_BOUNDARY_PROOF_DAG_2026_11_10.md). Follow the exact source and CI receipt, not a dated heading.

## Proof-first gate policy — adopted November 12, 2026

Before beginning NEW mathematical Lean proof work, complete the [Pre-Gate Evidence Receipt protocol](BFSS_PRE_GATE_EVIDENCE_RECEIPT_PROTOCOL_2026_11_12.md). Reuse original source declarations, exact historical green receipts and typed source interfaces before proposing a new proof. See the [P2-C4B filled historical-source reuse receipt](../../research/spectral-p2-original-field/P2C4B_PRE_GATE_SOURCE_REUSE_RECEIPT_2026_11_12.md) for an example: original MassiveMoments integrability and ProfileEnergy aggregation were overlooked during seven source reds, while the isolated M0 source theorem eventually compiled with clean axioms and its first consumer failed only a linter warning. This is a GO/HOLD research checkpoint, not an additional CI or theorem qualification. The dated status below remains historical; query current exact CI before acting.

## Latest research checkpoint (2026-11-09)

- **Latest independently qualified:** [P2b-B1 original complexified Clifford-generator physical-star #42754462733](https://github.com/etblink/math/actions/runs/42754462733) GREEN on exact tested commit `cd38c01c3f007f269c05ca95e17df4100ccab548`, with 47 frozen source/consumer pins, independent cold compilation and only three permitted foundational axioms. [B0 original-Fock adjoint sum #42752159572](https://github.com/etblink/math/actions/runs/42752159572) GREEN at `505f1adbeae12ededdd8b0d7bf30535a4e9fb76b`. Full operator physical-star and Hamiltonian/spectral results remain **OPEN**.
- **Additional accepted root:** [P2b-B2a scalar/product physical-star #42757429782](https://github.com/etblink/math/actions/runs/42757429782) GREEN at exact tested commit `de7e1a268cc875a715ad07c5c3157273934ff49f`, 47/47 frozen pins, three original-Fock source/consumer roots with only three allowed foundational axioms.
- **Current global-star candidate:** [P2b-B2 complete physical-star retry #42759465245](https://github.com/etblink/math/actions/runs/42759465245) is **UNQUALIFIED until its own run passes**; initial [#42759235198](https://github.com/etblink/math/actions/runs/42759235198) failed *only* a mismatched consumer `#print axioms` source-name preflight, corrected in manifest commit `f21db5d7`. The original full operator-star source and independent consumer are frozen with 51 source/consumer Git blobs; it combines B0/B1/B2a using pinned four-case Clifford induction and exact M3I surjectivity. [Exact B2a receipt, B2 candidate and T1 trace API memo](BFSS_P2BB2A_SCALAR_PRODUCT_AND_T1_ORIGINAL_TRACE_ROUTE_2026_11_09.md) includes full evidence and limitations.
- **Parallel T1 trace discovery (read-only):** pinned Mathlib directly provides `Module.End.toContinuousLinearMap` (actual bounded/linear Fock algebra equivalence) and `LinearMap.trace_map` (endomorphism-algebra trace invariance). These may eliminate the previously contemplated matrix-unit or left-regular trace work; BFSS specialization has not been qualified.
- **Recover chronological context:** [Upstream proof reuse, verified branch ancestry and historical gate outcomes](BFSS_UPSTREAM_REUSE_AND_UNIFIED_BRANCH_CHRONOLOGY_2026_11_09.md); [P2b-B1 four-red/B0-green/B1-green forensic history](BFSS_P2BB1_ORIGINAL_FOCK_COMPLEXIFIED_GAMMA_PHYSICAL_STAR_GATE_2026_11_09.md). The historical `Next work` section at the end describes the branch's original integration tasks, not the current proof gate.

## Find work quickly
- Active Lean: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`
- Operator source closure: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/`
- Existing research/negative-knowledge documentation: `contributions/bfss-kotler/`
- Branch locator: `contributions/bfss-kotler/BFSS_CROSS_REPO_BRANCH_LOCATOR_2026_11_08.json`
- Topic route index: `contributions/bfss-kotler/BFSS_CROSS_REPO_TOPIC_ROUTES_V1.json`
- FCP research copies: `research-sources/fcp/`
- Historical v0.4.0 conflicts: `research-sources/math/v040-conflicts/OperatorDependencies/`
- Source transfer note: `contributions/bfss-kotler/UNIFIED_INTEGRATION_SOURCE_IMPORT_2026_11_08.md`

## Source pins
- Integrated BFSS base: `d3e524c0b660cec8f55f42ae1fb6019ae5afd7b7`
- v0.4.0 donor: `fa00aa36e770ca516f57b41f5b02229a5033d50f`
- FCP Clifford/Fock donor: `beeb331836bb13a92c275f06f61337a6b97c0ada`
- FCP main program-record donor: `cf06212a57db0ceffad74bd78280a8a240856a17`

## Boundaries
Consolidation of source files is not mathematical acceptance. Original CI/axiom results belong to their exact tested source commits; the unified active build is not yet independently qualified as a whole. This is an incremental integration, not a claim that every one of the 99 branch snapshots has been copied. Keep historical failures, original Fock normalization, central signs, physical domains, and missing theorem obligations visible. No positive-eigenvalue or BFSS mass-gap result is claimed.

## Next work
Source-compare remaining FCP branch-specific materials against the integrated files; transfer unique research artifacts without name collisions; then perform targeted Lean import/consumer/axiom verification and fix incompatibilities as needed.
