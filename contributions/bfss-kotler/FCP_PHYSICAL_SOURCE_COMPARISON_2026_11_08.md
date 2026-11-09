# FCP physical-domain source crosswalk — November 8, 2026

**Compared source:** `etblink/Foundational-Convergence-Program@beeb331836bb13a92c275f06f61337a6b97c0ada`
**Unified baseline:** `etblink/math@8ba20e2a1cb870523bbb00b986bb249187045795`

This report compares `507` FCP physical-domain Lean files against the two Kotler Lean source directories on the integration branch. 176 source filenames were not present, 330 matched a different Git blob, and 1 matched byte-for-byte. See `FCP_PHYSICAL_SOURCE_CROSSWALK_2026_11_08.json` for exact source blobs, destination paths and families.

**Do not conflate blob difference with mathematical difference.** The upstream import process rewrites imports, and at least one sampled Hamiltonian proof also changes a local instance declaration. Even a byte-identical source has to pass current dependency and consumer checks before mathematical acceptance in the unified tree.

**Highest-value unported original paths for the current Fock/Spin/physical-form problem:**
- S3A–S3I: original gamma plane rotations, Majorana CAR commutators, Fock-plane generator skewness, gauge-compatible finite flows.
- S3K0–S3K1: true source full-L² action and gauge-physical-space preservation.
- S3L0–S3L5: original source charge covariance and kinetic/cubic transport (large dependency family; do not bulk-port without building an import closure).
- S1/S1V52: original Spin(48) and color-gauge antecedents.
- D2B29: positive closed-form trial vector, explicitly **not** a positive eigenvalue theorem.

**Immediate reusable technique:** Compare original S3C source commutator against the later F1A theorem on literal original CAR carriers; reuse S3F adjoint reversal and finite-sum proof shapes for F1B, but do not assume equivalent declarations or gate status. Audit exact closed physical-domain interfaces before importing S3K/S3L.

No module imported automatically into the active Lean build. No old branch, historical proof, or workflow is modified by this report.

## Documentation-first reconstruction of the actual proof lineage

**Method:** Start with the chronological handoffs, acceptance records and failed-gate analyses, then inspect the exact declarations/commit/CI consumer before using a theorem. A dated note is *historical evidence*, not a perpetually current scientific status.

### What the FCP notes actually connect

1. **S3A–S3K, original rotation prerequisites.** The `S3L_COMBINED_ROTATION_SOURCE_GATE_0_1_0.md` record says source S3B gamma-plane commutators, S3E actual Fock-generator commutators, and S3H–S3K finite fermionic flow/gauge-physical-space preservation precede the combined orbital+fermionic action. It explicitly warns that fermionic-only gauge invariance is not Hamiltonian rotation symmetry. The recovered historical source chain under `research-sources/fcp/physical-spin-source-20261021/` covers S3A–S3K1.
2. **S3L0–S3L5J9, the *kinetic* half.** The early `S3L_QUALIFIED_CHECKPOINT_0_1_0.md` records S3L0/1 green and later stages prospective *as of that checkpoint*. Later `S3L5J9_ACTUAL_SOURCE_KINETIC_FREE_SPINOR_COVARIANCE_ACCEPTED_CHECKPOINT_0_1_0.md` reports strict [run #38164568692](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38164568692) green at `d9310e7d18098ed31533652173a0cf050f03af92`, checking six actual-source kinetic covariance declarations and permitted axioms. This is a source-defined theorem for the *complete kinetic component*, not the full 16-charge column or Hamiltonian.
3. **S3L5K, original *cubic* half.** The `S3L5K1_ACTUAL_SOURCE_CUBIC_POSITION_PAIR_ACCEPTED_CHECKPOINT_0_1_0.md` notes a separately green genuine position-pair commutator ([#38165961844](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38165961844)). The `BFSS_S3L_CUBIC_WEIGHTED_RESPONSE_SOURCE_GAP_AND_NEXT_PROOF_0_1_0.md` identifies the missing weighted operator-response reindex/regroup bridge from K2D3 through K6C to the actual original cubic charge. Distinguish already-proved generic/index/coefficient lemmas from the unqualified concrete assembly. The `BFSS_SU2_S3L_K2C_GATES_1_TO_10_NEGATIVE_KNOWLEDGE_AND_RESEARCH_REDIRECT_0_1_0.md` handoff shows why ten direct tactic variants failed or timed out; do not repeat that implementation architecture without a genuinely new source-preserving interface.
4. **Analytical versus kernel results.** The later `BFSS_ORIGINAL_ALL_SPINOR_GLOBAL_COVARIANCE_AND_FORM_BRIDGE_AUDIT_0_1_0.md` presents a conventional group-lift/all-spinor analytical argument and explicitly says **NO NEW LEAN CERTIFICATE**. `BFSS_HIGH_SPIN_CLOSED_DOMAIN_COMPACTNESS_AND_SPECTRAL_BOUNDARY_AUDIT_0_1_0.md` discusses closed-domain confinement *conditional on source symmetry and branching*, also without a new Lean certificate. Neither changes the strict S3L source-proof status or proves the manuscript's positive-eigenvalue assertion.
5. **Source Hilbert graph and physical Hamiltonian.** `handoffs/FCP_BFSS_S3L_AW_AX_TRUE_PHYSICAL_HILBERT_OPERATOR_SUCCESSION_2026_10_17.md` reports AW/AX exact original complex polarized closed-charge-form and true physical Hilbert input-unitary results at historical green gates, and explicitly separates further natural-domain, density, and source-identity tasks. Compare these with the D2B27–D2B28 original Hamiltonian source; never infer equality of distinct closed realizations without a graph/domain bridge.
6. **Our newer mathematical route.** The math repository's `BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md` and `BFSS_HISTORICAL_GATE_RETRIEVAL_F1B_2026_11_08.md` explain how the source F10R original SO(48) action, F1A original CAR signs, historical S3F star argument and D2B operator package might fit together. These are *prospective connections*. In particular F1A's [run #42533991101](https://github.com/etblink/math/actions/runs/42533991101) does not independently qualify F1B, the global Spin(9) Fock lift, charge symmetry, or closed-form covariance.

### Practical consequence for consolidation

**Do not copy all 176 filename-absent FCP Lean files into the active namespace.** First follow the documented source theorem chain, check whether the same proof was already ported under a revised import path or replaced with a stronger theorem, and select only the smallest needed dependency closure for a mathematical target. Preserve the historical note and red/green record by immutable Git path, instead of duplicating all intermediate attempts.

Suggested reading order for a new proof task: scientific target memorandum → latest dated acceptance/handoff for that target → red/green causal notes → exact theorem and typed dependencies → actual CI run and axiom/consumer check. A green historical result is source-specific, a red elaboration timeout is not a mathematical disproof, and an analytical source argument is not Lean acceptance.

**FCP source note locations (immutable donor):** `etblink/Foundational-Convergence-Program@beeb331836bb13a92c275f06f61337a6b97c0ada`, `experiments/openai-math-su2-physical-domain/` and `handoffs/`. The corresponding compiled source, consumer and pin should be verified at each noted historical qualified commit before adapting it to this branch.
