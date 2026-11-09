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

## Documentation-first family reconstruction: Clifford/Fock, native Hamiltonian, Spin48

**Evidence review, 2026-11-08.** This section draws on later FCP acceptance audits, original handoffs, checked historical Actions runs, and a sampled source/ported-file comparison. It supersedes any earlier *status inference* in this report, without changing the original records. It is an integration strategy, **not** a new Lean qualification.

### A. Original Fock and gauge representations: distinct interfaces

- The original G1A/F2 family provides paired theta operators on the literal `Fermion 2`, preserving delta-one CAR and the real 48-label normalization. G4E and G4H construct the original exterior/occupation Fock SU2 gauge action and source theta covariance; G4J supplies concrete original `GaugeData`.
- Historical S1P0/S1P1 [strict run #39162832661](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39162832661) qualified the source-real Cl(48) quadratic action and universal-algebra homomorphism, **not** a global Spin48 lift.
- The original S1V27 [strict run #39329185740](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39329185740) qualified a real 48-matrix equality for a *specific historical SU2 quarter rotation* versus the independently constructed Spin48 rotor's vector conjugation. This does **not** prove equality of Spin48 elements: the double-cover central sign is an explicit unresolved normalization issue. The contemporaneous S1V28 document says a continuous SO48 base-hom gate was then pending. Inspect later acceptance evidence before treating that status as current.
- FCP S1V52 M3G/M3H original Clifford/Fock finite-dimensional rank/faithfulness results have historical gate leads; M3I on source snapshot `beeb3318` explicitly labels its Clifford-to-Fock algebra equivalence **strict-eligible but UNQUALIFIED** at the snapshot. The port of M3I exists in the integration `OperatorDependencies` tree, but presence is not a substitute for a successful M3I gate. The exact M3I definition/theorem text from `namespace` onward matches its FCP snapshot; only import paths differ.
- **Missing actual bridge:** identify the independently formulated manuscript's irreducible Clifford module, its uniquely normalized SU2/Spin48 lift and Fock action, and its smooth and physical Hilbert spaces with the source-native `Fermion 2` and `GaugeData`. An SO48 matrix identity, a Clifford algebra universal map, or Fock gauge covariance individually cannot provide the needed global group element/lift and phase.

Useful documents: `audits/OPENAI_MATH_BFSS_SU2_INDEPENDENT_MANUSCRIPT_SPIN48_PHASE_BRIDGE_SOURCE_BOUND_RESEARCH_2026_10_17.md`; `audits/OPENAI_MATH_BFSS_SU2_S1P0_S1P1_UNIVERSAL_CLIFFORD48_ACTION_GATE1_ACCEPTANCE_2026_10_18.md`; `audits/OPENAI_MATH_BFSS_SU2_POST_S1V27_GLOBAL_SPIN48_LIFT_SOURCE_TOPOLOGY_OBLIGATIONS_2026_10_19.md`, all in `etblink/Foundational-Convergence-Program`.

### B. Original source physical Hamiltonian: *completed historical equality chain*

Chronological records make clear that the early AW/AX and AZ handoffs were later **superseded for specific operator obligations** by subsequent source-compiled results:

| Original theorem family | Historical strict run and typed result | Scope |
| --- | --- | --- |
| AZ | [#39065429555](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39065429555): core inclusion and *conditional* domain density | The core-norm closure condition was still explicit. |
| BA | [#39079626713](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39079626713): **unconditional** original physical Hilbert charge domain density, jointly co-compiling original Haar/core equality | The AZ condition is discharged at actual N=2. |
| BE | [#39088799248](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39088799248): original normalized `(1/16) T†T` self-adjoint Hamiltonian on its natural domain and exact weak-form characterization | Does not yet identify the separately defined D2B28 operator. |
| BF | [#39092193590](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39092193590): original AY minimal closed restricted charge graph equals source `G.deformedModelGraph 1 0` and paired specialization | Not an equality of the unrestricted `fullClosedGraph`. |
| BG | [#39093937250](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39093937250): original AY native physical 16-charge `LinearPMap` equals historical D2B17, **graph and domain included** | Does not alone assert adjoint or Hamiltonian equality. |
| BH | [#39096180117](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39096180117): actual original/native adjoints, natural `T†T`, normalized self-adjoint Hamiltonian and historical D2B28 paired Hamiltonian **equal on their full operator domains** | Still source-native; independent manuscript representation and spectral statements remain separate. |

Historical green statuses above were also checked using actual GitHub run resources at the noted exact source commits; accepted axioms in records are subsets of `propext`, `Classical.choice`, `Quot.sound`. This audit does **not** rerun those jobs or reproduce the archived build artifacts.

**Copy decision:** BA, BE, BF, BG and BH already exist in `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/` in the integration tree. **Do not copy or recreate them again.** They were upstream-ported and therefore have different Git blobs from the original FCP source. The sampled BG theorem body from `namespace` onward matches source exactly; BH differs additionally by a local `letI : CompleteSpace G.physicalSpace` → `let : CompleteSpace G.physicalSpace` line. That instance-elaboration change demands new Lean qualification rather than treating the old green BH gate as an unchanged certificate. The remaining ported modules must likewise be checked individually or by a reproducible semantic/typed diff and independent consumer, not assumed identical.

### C. Kinetic/combined symmetry versus the complete original sixteen-charge column

The chronological S3L documents qualify the *original kinetic* free-spinor covariance at [#38164568692](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38164568692), source commit `d9310e7d18098ed31533652173a0cf050f03af92`. The **weighted cubic** operator-response reindex/regroup from K2D3 to K6C remained a separately recorded bottleneck in its handoff, with the failed K2C tactic repetitions an explicit negative research result. The later conventional group-lift/covariance analysis is marked **not Lean certified**. None permits inferring source closed-domain covariance or a spectrum/mass-gap theorem without additional work.

Historical S3L5J9 and S1V27 do **not** occur under their original filenames in the two integrated Kotler Lean directories at this checkpoint. This is a *filename observation*, **not** proof that equivalent results do not exist elsewhere under another declaration. Before importing them, search the current formal statements and the FCP cross-repository topic index.

### D. Most economical next research actions

1. **Requalify the already-present BF–BH and related operator closure as needed** with the current pinned Lean/Mathlib source and an independent consumer: test *actual* `let`/instance differences before advertising the unified branch as accepted.
2. **Focus original Spin/Fock bridge work on real missing interfaces**, not on regenerating the existing CAR, source gauge action, or native Hamiltonian. Use the F1A historical strict gate and S3F source proof shapes to target F1B skewness and the full 48-label infinitesimal action with correct central signs.
3. **Audit prior S1V27 and later source SO48/topological-lift work** before any copy. Preserve the distinction between matrix equality, Spin48 element equality, a continuous group lift, and phase-normalized action on the original Fock space.
4. **Treat S3L kinetic and cubic sectors separately** and reuse their accepted source coefficient/transport theorem shapes; do not repeatedly elaborate the known K2C monolithic concrete expressions.
5. **Only after** the literal source Spin/Fock/action and original sixteen-charge covariance have been demonstrated, use the already-established BH native Hamiltonian identity to transport the symmetry through the exact closed form, and only then pursue highest-weight or spectral conclusions.

**Conclusion:** The major native physical-operator identity is not missing. The genuinely risky boundary is source-to-independent Clifford/Spin implementation and the exact closed-form symmetry connection. Prior notes let us distinguish these, saving substantial duplicated proof work.
