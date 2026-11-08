# BFSS repository dependency and housekeeping audit — Phase B baseline

**Date:** 2026-11-08  
**Branch:** `research/bfss-original-gamma-faithfulness-20261107`  
**Inspected baseline:** `22767adb51188d0e1f0ef6ff2be708225f5257b9`  
**Method:** GitHub read-only directory inventories and selected exact source-file reads; this audit file is documentation only.  
**Scope limit:** This is a **sampled import census**, not a complete transitive import graph, compile-time profile, dead-code proof, or repository-wide garbage collection authorization.

## Executive finding

The repository has enough BFSS research artifacts that a navigation catalogue and explicit status vocabulary are immediately worthwhile. **Do not initiate bulk renames, source moves, workflow deletions, or a single large umbrella module.** First map exact dependencies and qualification. Preserve original upstream manuscript and site contracts.

### Direct directory inventories (one branch, not recursive)

| Directory | Files/direct entries | Interpretation |
| --- | ---: | --- |
| `lean/OAI/MathematicalPhysics/BFSS/` | 75 direct Lean files; one `Contrib` subdirectory | Original BFSS core |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/` | 341 direct Lean files | Active and historical source/candidate proofs; not 341 qualified theorems |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/` | 4 direct Lean files | Only these four files on **this branch**; a separate pinned snapshot contains many more |
| `contributions/bfss-kotler/` | 333 direct entries before new navigation files | Research memoranda, gate records, manifests and historical provenance |
| `.github/workflows/` | 331 direct workflow files | Broad history of independent and strict BFSS gates; **not** proof of 331 active required workflows |

**Classification caution:** A coarse filename grouping suggested roughly 207 Spin9/geometry-named, 38 Fock/CAR-named, 80 physical/gauge-named and 16 other files under Kotler; categories overlap semantically and are not authoritative. Do not use them as proof of duplication.

## Sampled exact import edges

These were inspected from source content, not inferred from filenames.

| Source file | Direct import(s) seen | Interpretation |
| --- | --- | --- |
| `BFSS/Core.lean` | `Mathlib` | Foundational original source carriers and smooth-charge model; broad Mathlib import is pre-existing |
| `BFSS/FormCompactness.lean` | `Mathlib`; `BFSS.FormClosure` | Existing **quadratic** moment theorem; not a drop-in linear-moment proof |
| `Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean` | `...F10QSourceSpinOrientationDetOneProbe` | Source 48-label SO homomorphism, **algebraic only** |
| `Kotler/SpectralSourceNineAxisCoordinateEquivalence.lean` | `...SpectralSourceNineAxisCoordinateExtension`; `Mathlib.Topology.Algebra.ContinuousMonoidHom` | Candidate interface for original target H ≃ SO(8); [qualified gate](https://github.com/etblink/math/actions/runs/42498367504) at exact earlier source SHA |
| `Kotler/SU2BFSSSource48FockCliffordUniversalLiftProbe.lean` | `...SU2BFSSSource48AllVectorFockCliffordSquareProbe`; `Mathlib.LinearAlgebra.CliffordAlgebra.Basic` | Explicitly exploratory and **not strict-qualified**; source square is a parent |
| Separate `OperatorDependencies/SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean` | `...SU2BFSSG4K1PhysicalSpaceCoreProbe` | Source at pinned **different commit**, not present as such in active branch; pointwise nonzero radial profile does not prove nonzero L² class |

The immediate bottleneck is **status and source-carrier binding**, not simply directory size. A facade importing a candidate cannot make it qualified.

## Proposed module contracts (no modules created in this audit)

### Contract G — source geometry

Inputs: exact source Spin(9), gamma and original 48-label representations.  
Exports: named source SO(48) homomorphism; central-sign theorem; axis stabilizer projection and H ≃ SO(8) coordinate interface.  
Explicit exclusions: global Fock-vector unitary lift; Spin(8) classification not yet source-bound; spectral assertions.

### Contract F — original Fock and CAR

Inputs: exact `Fermion 2`, original 48 labels and Majorana normalization.  
Exports, **only after qualification**: CAR square, adjointness, quadratic Lie implementer, Cartan bounds and Clifford star-algebra bridge.  
Explicit exclusions: source Spin(9) lift until independently proved; no surrogate Fock type or changed Clifford normalization.

### Contract P — physical operators

Inputs: original `Core`, `GaugeCore`, sixteen charges, closed physical charge/form operators.  
Exports, **only after qualification**: original gauge-physical Hilbert space and charge-output covariance; exact closed form, natural domain and self-adjoint Hamiltonian.  
Explicit exclusions: abstract unitary equivalence without original-domain identification.

### Contract S — spectral research

Inputs: qualified G/F/P interfaces, original smooth-core form, finite growth bound, representation-sector nonvanishing and compactness.  
Exports: conditional inequalities first; only then source-exact reducing-sector coercivity and compact resolvent.  
Explicit exclusions: claiming full BFSS mass gap or transferring Fock-vector `M=6` to operator-fiber `M=12`.

**Interface implementation rule:** Add a facade only after a consumer proves the imported exact declarations and its transitive ancestry is manageable. An import-only facade may improve discoverability, but cannot reduce Lean's transitive compilation cost by itself. Do not introduce `import Mathlib` in a new facade unless measured and necessary.

## Garbage collection: candidates, not deletion targets

1. **Old strict workflows:** candidate for *inventory and grouping*, not immediate removal. Before retiring a workflow, record its last exact green run, source SHA, consumer root, manifest and any evidence-retention obligations. Historical failure/qualification records must remain findable.
2. **Superseded diagnostic probes:** annotate with successor theorem and explicit failure mechanism. Move only if import paths, manifests, tests and archived source hashes can be updated without breaking reproducibility; prefer leaving historical paths intact.
3. **Duplicated research memoranda:** add a canonical index entry and mark older reports historical; don't discard distinct negative results.
4. **Unqualified source ports:** retain as exploratory with exact dependency and blocked theorem; don't expose them via a stable qualified facade.
5. **Generated build artifacts:** inspect tracking and ignore rules before proposing removal; never delete unexamined files from the repo or rewrite Git history.

**Decision:** No destructive GC is justified by the current evidence. Repository size alone is not proof of redundancy.

## Phase B continuation: executable future audit checklist

The next read-only or locally scripted audit should produce a machine-readable inventory from a **full Git tree at an exact commit** (the GitHub directory API was sufficient only for this sampled census):

- `path, blob_sha, size, import_edges, namespace, public_declarations, #print_axioms inventory`.
- `gate_workflow, run_id, tested_sha, source_root, consumer_root, manifest, dependency_pin, qualification_status`.
- `downstream_importers`, including tests and workflows that reference a path by literal filename.
- `status`: QUALIFIED_AT_COMMIT / CANDIDATE / EXPLORATORY / CONDITIONAL / REJECTED / SUPERSEDED / UNKNOWN.
- `candidate_action`: retain / index / extract facade / repair / retire-after-owner-review.
- Exact runtime benchmarks before and after any facade/ancestor change; never assume an import wrapper is faster.

Graph checks: cycles (should be impossible in successful Lean imports), duplicate theorem *statements* versus different source carriers, high in-degree ancestors, isolated unreferenced modules, strict-workflow references, and stale source hash pins. Treat an unreferenced module as **candidate for investigation**, not automatic garbage.

### Bounded follow-up experiment

The first candidate is **OP0–OP1** (generic gauge-fixed projection invariance) from [the feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md). Its diagnostic should import only pinned Mathlib projection/star-algebra APIs, then be independently consumed. Do not begin with a full BFSS source graph or a physical spectrum claim.

The parallel main-line candidate remains **F1** (source-exact 48-Majorana Lie implementer), using [the original Fock memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md). The choice between OP3–OP4 and F3 must be based on measured source-qualification and import costs.

## Upstream and provenance boundaries

The repository's root `AGENTS.md` says not to rename or move `preprints/<paper>/` directories; links, citations and `lean/formalization.yaml` depend on their names. `CONTENTS.md` and the site generator are upstream contracts. Keep BFSS changes scoped to contribution docs and later authorized source modules.

Preserve original strict source/consumer/axiom checks and cold builds. No `sorryAx`, untracked assumptions, new axioms, hidden cache shortcuts, workflow relaxations or acceptance inferred from a green ancestor. The Git repository history and exact qualified workflow are canonical evidence; these new indices are navigation aids.

## Phase decision

- **Phase A navigation:** implemented in [BFSS Project Map](BFSS_PROJECT_MAP_2026_11_08.md).
- **Phase B sampled read-only audit:** this file; **complete transitive graph remains outstanding**.
- **Phase C facade extraction:** deferred pending full import graph and bounded independent consumer.
- **Phase D garbage collection:** deferred pending evidence and explicit review.

**Change scope:** This audit adds only documentation. No Lean module, workflow, manifest, dependency pin, manuscript, or source file is moved, modified or deleted.


---

## Decision addendum — retrieval-first housekeeping gates H1/H2 (2026-11-08)

**Status:** OWNER-ALIGNED PROJECT-LEAD STRATEGY; **NOT YET EXECUTED**. This section supersedes earlier *next-step* language in this historical audit where it conflicts with the current priorities. It does **not** reinterpret past qualification or claim any new Lean theorem.

**Recorded against branch HEAD before this documentation change:**
`50d7352734fb99f6c06612fa1e235be4360ff955`, `research/bfss-original-gamma-faithfulness-20261107`.

### Decision and reason

The next bottleneck is **research retrieval, provenance, proof-interface visibility, and durable qualification bookkeeping**, not cosmetic directory layout. We will invest in structured organization *before* a costly expansion of OP2's original-Fock dependency ancestry, while preserving forward mathematical momentum. The shortest immediate edit is not necessarily the most effective long-term procedure.

Observed at the 2026-11-08 audit:
- `etblink/math` had 25 enumerated remote branches; `etblink/Foundational-Convergence-Program` had 74: 99 branch heads in the dated cross-repository locator.
- The existing [full BFSS import graph](BFSS_IMPORT_GRAPH_FULL_2026_11_08.json) inventories **420** modules, **597** internal direct import edges, **306** outside-inventory imports and **20** with zero internal downstreams at its frozen baseline. This is an import graph, **not** an exhaustive qualification/dead-code index.
- The active branch contained **334** GitHub workflow files and **344** direct entries in `contributions/bfss-kotler/` (**307** Markdown and **34** JSON files). Counts are snapshots, not evidence of redundancy.
- [BFSS Project Map](BFSS_PROJECT_MAP_2026_11_08.md) and [Cross-repository Branch Locator](BFSS_CROSS_REPO_BRANCH_LOCATOR_2026_11_08.json) now aid discovery, but they do **not** answer full theorem-level, cross-branch source-lineage, or historical-failure queries.
- A state-drift example: this audit's earlier Phase B language says a complete import graph remained outstanding; the later frozen graph now exists. Preserve the original historical statement, but prefer this newer status addendum for current routing.

### H1 — evidence/retrieval completeness (first bounded organizational gate)

**Deliverable:** a small, reproducible, searchable cross-repository artifact and theorem registry, whose records have typed provenance rather than copied scientific conclusions.

Minimum records for any important result:
`artifact_id / kind / owner_repo / ref / exact_commit / source_path / declaration / source_carrier / dependency_roots / source_blobs / consumer_path / qualification_workflow / run_id / run_attempt / tested_sha / Lean+Mathlib pins / axioms_status / evidentiary_status / supersedes / failure_mode / location_url / evidence_digest`.

Records must distinguish **verified at exact commit**, **candidate**, **unqualified**, **rejected**, **historical**, **not scanned**, and **unknown**. The registry must not infer an accepted theorem from a green ancestor or from mere file existence. CI artifact retention is limited; preserve enough durable hashes, metadata and links to reconstruct the original decision even when uploaded artifacts expire.

**Validation:** a future project session—whether our next conversation or a later Project Lead instance—given *only* the registry and its pointers, can recover the project's exact evidence without relying on prior chat context:
1. The exact OP0 and OP1 theorems, original source and independent consumers, tested commits and strict runs (OP0 [#42516531636](https://github.com/etblink/math/actions/runs/42516531636), OP1 warning-clean [#42518687725](https://github.com/etblink/math/actions/runs/42518687725)).
2. The original `Fermion 2` and `GaugeGroup 2` types, and the pinned **separate** original SU(2) gauge/vacuum candidate at `fa00aa36e770ca516f57b41f5b02229a5033d50f`, without pretending it exists on this active branch.
3. A documented red attempt's first causal diagnostic, bounded correction and subsequent accepted run.
4. One known negative result or rejected representation route, with the reason and source.
5. An unresolved theorem, its missing exact-source premise, and the status of that premise.

**Acceptance:** each query returns a resolvable path and immutable commit anchor; records have independent verification against Git/CI; unknowns are shown, not filled by guesses. Measure retrieval completeness and time/calls against the existing branch locator baseline, and report misses. No wholesale indexing of every theorem is required to qualify the **pilot**.

### H2 — dependency and lifecycle classification (second bounded gate)

**Deliverable:** an evidence-backed map of (a) OP2's smallest **exact** original-Fock/gauge transitive import closure across the separate snapshot, (b) reusable G/F/P/S interfaces, and (c) workflow, document and branch life-cycle states. Start with the known 420-module BFSS import graph; add qualified source roots, independent consumers, exact tested commits, and workflow references. Inventory GitHub ref topology without merging, rebasing or deleting branches.

**Validation:** identify a minimal OP2 candidate dependency cut, likely expensive imports, which prerequisites are actually available and qualified on this branch, and which must be independently requalified. Explicitly classify stale documentation; do not overwrite historical assertions with a fabricated current state. Produce a bounded recommendation for `retain / index / annotate superseded / refactor-with-proof / investigate for eventual retirement` **without executing destructive retirement**.

**Acceptance:** the OP2 entry gate becomes answerable from verified source data: which exact original Fock action, which carrier and gauge conventions, which transitive ancestors, which qualification evidence and where it is missing. No formal theorem is promoted by this documentation gate alone.

### Governance and STOP boundaries

- **Never modify `etblink/math:main`.** The repository is a downstream contribution to an upstream project outside the owner's control; do not treat its default branch as our organizational landing page.
- The current BFSS research branch remains a bounded workbench; FCP's `main` remains canonical for **FCP's own** scientific register and program routing, **not** for BFSS Lean proof status.
- Do not merge, rebase, rewrite history, delete branches, bulk rename/move Lean modules, retire strict workflows, or alter upstream manuscript, formalization or site contracts as part of housekeeping.
- Do not import or rename the separate OperatorDependencies snapshot wholesale. Preserve exact original CAR, Fock, Spin(9), central signs, sixteen charges and physical closed-form carriers. Keep **Fock-vector M=6** distinct from **operator-fiber M=12**.
- Do not quietly adopt `etblink/Project-Continuity-Research` as a live control plane: its documented `CCP0_SEMANTIC_FEASIBILITY = PASS` does not authorize live integration. A lightweight BFSS-specific **read-only retrieval pilot** may be assessed before a separate architecture/integration decision.
- Record costs and utility; avoid creating a manually maintained registry that drifts from Git and CI. Generate or validate indexes against exact Git objects and available run evidence; retain negative knowledge.
- Any destructive cleanup, upstream PR, cross-repo write or new live automation requires its own scoped assessment and authorization. This decision is not such authorization.

### Scheduling and decision checkpoints

Proceed in small units: **H1 pilot** → assess retrieval improvement → **H2 OP2 ancestry/lifecycle audit** → return to **OP2 or F1** with evidence-based source choice. Mathematical research may continue in parallel without claiming unqualified results; housekeeping must serve the science, not replace it.

**Success metric:** someone unfamiliar with prior chat history can locate the *correct source*, recover its assumptions, know what passed and failed at the *exact tested commit*, and identify the next genuine proof obligation with substantially less reconstruction.

**Preservation scope for this addendum:** documentation-only strategy and acceptance criteria. No source, workflow, pin, proof, original upstream file, branch ref (other than this documentation commit), or published work is changed.


---

## H1 pilot qualification result — 2026-11-08

**Disposition:** **H1 BOUNDED PILOT ACCEPTED**, based on [strict registry run #42522165588](https://github.com/etblink/math/actions/runs/42522165588), SUCCESS, attempt 1, exact tested commit `4c1e088ac0b68ffdcbe01f242e7d638b3f6553f6`. This is an **evidence retrieval/verification gate**, not a new BFSS mathematical theorem or a comprehensive repository census.

**Artifacts on research branch only:**
- [BFSS_H1_EVIDENCE_REGISTRY_V1.json](BFSS_H1_EVIDENCE_REGISTRY_V1.json) — 10 curated, typed evidence records spanning qualified OP0/OP1, original BFSS carriers, separate OP2 vacuum candidate, red CI history, rejected Cl9 shortcut, unresolved OP2 premise and FCP source/state snapshots.
- [BFSS_H1_COLD_START_TESTS_V1.json](BFSS_H1_COLD_START_TESTS_V1.json) — six independent-context questions with expected record IDs and explicit top-K budgets.
- [h1_evidence_registry.py](tools/h1_evidence_registry.py) — stdlib-only, read-only local search, structural/epistemic checks, cold-start tests and GitHub remote blob/run/digest checks.
- [BFSS H1 strict gate](../../.github/workflows/bfss-h1-evidence-registry-strict.yml) — source and fixture SHA-256 receipts, local check, remote check, and search smoke tests, scoped to this research branch.

**Observed acceptance evidence from actual workflow logs:**
```text
STATIC PASS: 10 uniquely pinned, typed records
COLD-START PASS: 6/6 defined queries returned all required records
REMOTE PASS: 15 pinned source files, 3 exact CI runs, 2 available evidence digests
```
All workflow steps succeeded, including the standalone search smoke tests. OP0's accepted run is #42516531636 at `93e58dab8d077306250e7fb1140dc1dc1a5dd8c2`, and corrected warning-clean OP1 is #42518687725 at `44ea6b8001209d92f0e023a7f30f5125cde127e9`. The registry does not promote other source candidates.

**Navigation baseline compared with H1 pilot (not equivalent sample populations):**
- Old cross-repo branch locator: **11** selected entry points, **0** pinned source blob hashes, **0** independent-consumer fields, **2** run IDs, **0** explanatory failure-mode fields.
- New H1 pilot: **10** selected records, **10** pinned primary source blobs, **2** independent-consumer/strict qualification references, **2** accepted gate runs, **3** explanatory failure/blocker records (one historical CI red, one rejected route, one open prerequisite). Additional related-source blobs are verified remotely.
- H1's six predefined retrieval queries found every specified record within the stated top-K ranking budget. After checkout, each local query requires **no network request**; remote source/evidence validation deliberately does use GitHub API calls.
- A same-query wall-clock speed comparison with manual branch browsing was **not measured**. The improvement claim is therefore **field/evidence coverage and tested retrieval completeness for this pilot**, not a general time-saving or comprehensive discoverability metric.

**Use on a local checkout:**
```bash
python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --check --cold-test
python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --search 'OP2 original SU2 Fock gauge binding'
python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --check --remote  # optional: export GITHUB_TOKEN beforehand
```
The token is optional for public GitHub access but avoids anonymous rate limits. Never print or commit tokens.

**Limits / STOP:** Ten records are not 420 modules or 99 branch histories. Keyword ranking is a small explicit index, not a semantic theorem prover or exhaustive search. A verified GitHub blob means the cited bytes exist at the pinned commit; it does not upgrade a candidate to a qualified theorem. The two artifact SHA-256 digests are durable metadata but the actual uploaded artifacts have expiration dates. Recovery across genuinely interrupted or context-reset future project sessions, and historical-failure coverage beyond the example, remain untested. No new live Project Observatory control plane is authorized.

**Next bounded objective:** H2 source closure and lifecycle classification. Start by mapping the exact pinned OP2 original-gauge/vacuum ancestry, then join that closure to the existing 420-module graph and gate evidence. Record missing modules and unqualified premises rather than bulk-importing or treating absences as failures. Continue to prohibit edits to `etblink/math:main`, FCP mutations, deletes, broad workflow retirements, source moves, and history rewrites without separate authorization.


## H1 project-user clarification — optimize for our future selves (2026-11-08)

**Owner intent:** H1/H2 bookkeeping exists to make **our own future work** easier: rapid reorientation after a chat interruption, context-window loss, model/tool transition, a long break, or resumption from a different branch. No independent human researcher test is required or planned as an H1/H2 acceptance condition. A human-readable entry point remains useful, but it is not the target validation population.

**Operational acceptance test:** a future session with no privileged conversational history should be able to find the exact current branch and scientific state, recover source declarations and ancestors, distinguish accepted from conditional/negative results, inspect the relevant green/red run evidence, and resume the smallest justified next unit without repeating old investigations. Favor deterministic, machine-readable lookup, provenance checks, succinct recovery instructions, and tests for stale/contradictory status. Do not add process or documentation whose maintenance cost outweighs demonstrated future-session value.

**Effect on H1:** the six existing cold-start registry tests remain valid as synthetic future-session tests. The verified H1 run #42522165588 and its exact-source acceptance are unchanged; no independent human usability claim was or is made. For H2, assess reduced retrieval friction and unnecessary repeat work for our future sessions rather than organizing around hypothetical external handoffs.

**Governance:** maintain the prohibition on modifying `etblink/math:main`; do not modify FCP or Project Continuity repositories, import unrelated proofs, or merge/delete branches to achieve this clarification.


---

## H2 bounded acceptance — OP2 source closure and workflow lifecycle evidence (2026-11-08)

**Disposition:** **H2 BOUNDED SOURCE/WORKFLOW INVENTORY ACCEPTED.** This is an organizational/source-verification outcome, **not** an OP2 Lean proof, an integration acceptance, or authorization for workflow/branch retirement. Its purpose is rapid recovery by our future project sessions, not independent human testing.

### A. Exact source-verified original Fock and SU(2) ancestry

- Frozen graph: [BFSS_H2_OP2_PINNED_ANCESTRY_V1.json](BFSS_H2_OP2_PINNED_ANCESTRY_V1.json), generated by [h2_op2_ancestry.py](tools/h2_op2_ancestry.py). The independent [frozen source replay #42523263158](https://github.com/etblink/math/actions/runs/42523263158) passed at commit `35a12288c463bdd18065ba2b6cb7d215f66fdcc2`; graph SHA-256 `d73b8dd0bf5d448a4bfb583f6de30fb3fcde54b12be8d22dfdee5502cc45a95e`.
- Root: `SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe` in the `OperatorDependencies` namespace on the separate pinned snapshot `fa00aa36e770ca516f57b41f5b02229a5033d50f`.
- Exact within-namespace transitive closure: **38 distinct Lean files**, **38 import edges**, maximum recorded import depth **20**; all 38 were **absent** on our active research branch baseline `f0f4d5aa9bf992b87f01f5cc9cfb3dcc7f745c4a`. The directed graph is reachable and acyclic. Each node has a pinned original Git blob SHA-1 verified from downloaded source bytes.
- Seven immediate imports **outside** that namespace were independently inspected at the two exact snapshots and are bitwise **identical** there:

| Immediate boundary module | Git blob SHA-1 (both snapshots) |
| --- | --- |
| `OAI.Analysis.Laughlin.Exterior.SpinAction` | `ab42b15ded2461c26edf24468f397c4c36fcfb57` |
| `OAI.Analysis.Laughlin.Exterior.SpinUnitary` | `a44e3319b3d6f4bdfff6ad5188c75fccc2d58762` |
| `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2ColorCrossProbe` | `209b3808222730ca5e817d83ed32253a67513f7f` |
| `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2FermionF2B2ThetaProbe` | `bc8fc9209fa2b907f0b372300868bc730b5fb5bd` |
| `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe` | `b9b8192055c70f0d001d7982669b9823c55562ed` |
| `OAI.MathematicalPhysics.BFSS.CovariantFields` | `a2a5430550524a57f2fb7d519169050053e886bb` |
| `OAI.MathematicalPhysics.BFSS.GaugeCore` | `e4990dadf1d8bde849e351467282ab3f14989c3b` |

**Scope boundary:** identical immediate imports do **not** establish a fully identical recursive transitive import closure outside `OperatorDependencies`, nor do they qualify the 38-module source as compilable on the active branch. Import ancestry/source existence alone are not theorem proof evidence.

**Improved OP2 candidate cut:** `SU2BFSSG4EFermionHilbertUnitaryProbe`, defining the genuine original `fermionGaugeUnitaryHom : GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)`, has an audited **26-module** within-namespace ancestor closure. The full K2A vacuum/radial-profile source has **38**. The earlier G4-B source already defines `fermionVacuum` and proves `fermionGaugeLinearEquiv_vacuum`; K2A's nonzero vacuum proof is a small application of `fockAlgebraToBFSS.injective` and `one_ne_zero`. Thus a **candidate staged OP2a** imports/qualifies only the original G4-E unitary representation (26-source closure), then separately reconstructs a tiny original-vacuum witness from the already imported G4-B predecessor, **without** necessarily importing the 12 additional K2A/radial source modules. This optimization is **not yet compiled or independently qualified**.

**Next mathematical acceptance boundary:** exact source on `Fermion 2`; no carrier replacement, change to Majorana normalization, or assumed Spin(9) Fock lift. OP2a must provide an independently consumed true `GaugeGroup 2` endomorphism/continuous action satisfying OP0's operator map interface, with original gauge action equality and pinned dependency/axiom/warning checks. OP2 vacuum nonzero remains a distinct next obligation. OP3–OP6 and original Hamiltonian spectral conclusions stay OPEN.

### B. Workflow and branch lifecycle, non-destructive

- Frozen generated inventory: [BFSS_H2_WORKFLOW_SOURCE_INDEX_V1.json](BFSS_H2_WORKFLOW_SOURCE_INDEX_V1.json), generated by [h2_workflow_index.py](tools/h2_workflow_index.py); [frozen replay #42524327310](https://github.com/etblink/math/actions/runs/42524327310) passed on commit `8e3ef2b867f6e6913140e0295f3142b7720bde51`, SHA-256 `29a3620591054d43e30bb4cdec9aa360a2eca09ed316ecde1c2a68e57727a7f7`.
- **337** workflow YAML files indexed by path, exact Git blob SHA and lexical source-path references: **336** with `bfss-` filename prefix and **one** other; **335** include at least one detected source reference, covering **561** distinct literal source paths; **zero** unresolved literal paths at the exact replay checkout. There is only **one** literal workflow reference into the local `OperatorDependencies` subtree, pointing to pre-existing K9 source files, not the separate missing G4-E import root.
- **All 337** are classified `PRESENT_UNASSESSED`. This is a source-text index, not a semantic YAML parser or a comprehensive run-history/retention audit. Zero missing literal paths does not imply no hidden dynamic paths, redundant workflows, or valid retirement candidates.
- Current `etblink/math` remote ref categories at audit: **18 research**, **2 integration**, **2 contribution**, **2 contrib**, and **1 main** (25 total); the earlier dated cross-repository locator contains **74** FCP branches. Branch naming is not evidence of a branch's scientific maturity or that it can be deleted.
- Decision: **retain** all existing workflow/branch refs; **index** them; mark supersession only after inspecting exact source consumers, run history and downstream users. No bulk deletion, movement or upstream/default-branch edits. Existing H1/H2 read-only indexes are a more valuable first optimization than cosmetic consolidation.

### C. Successful and failed operational methods

1. The first interactive attempt to fetch the entire OP2 dependency graph exceeded a response orchestration tool-call limit, producing no usable graph; **not a mathematics result**. The bounded, pinned, independently replayable GitHub Actions walker succeeded and should be reused for large remote source crawls.
2. Initial workflow index candidate passed source generation but a frozen replay failed because its own output file did not exist at generation time. The next patch accidentally introduced literal escaped newlines into a comment, causing a Python `NameError`. Both are **bookkeeping/engineering errors**, not failures of BFSS. The eventual source-only correction and frozen replay passed at #42524327310.
3. Prevent recurrence: normalize generated-file self-references explicitly, validate patch line breaks and Python syntax before expensive gates, and fail closed on a mismatched frozen snapshot. Preserve exact red runs #42524110865 and #42524190259 as lessons, not as false proof failures.
4. H1 was extended to index both H2 artifacts and verify their exact source-audit run IDs. The [expanded H1 run #42524474547](https://github.com/etblink/math/actions/runs/42524474547) passed at `799a0d70cc0674222e13efd9b90c62a4826016af`: **12 typed records, 8/8 future-session retrieval cases, 21 pinned source files, 5 exact CI runs, 2 retained evidence digests**. Earlier H1 counts in historical sections are preserved as historical checkpoints.

### H2 closure decision

H2's bounded, reproducible source/dependency and workflow-source/lifecycle **inventory** is complete and accepted. **No destructive garbage collection is justified** by this evidence. The next bounded science task is to assess the 26-module **original source G4-E unitary carrier** as an OP2a import/consumer candidate against its exact external ancestors, rather than importing the 38-module K2A endpoint wholesale. If that gate expands unexpectedly or exposes an incompatible carrier/normalization, record the negative result and compare the F1 direct-CAR route instead.

**Governance confirmation:** `etblink/math:main` remains out of bounds. FCP and Project Continuity repositories were not modified. All H2 artifacts were added to the dedicated BFSS research branch.
