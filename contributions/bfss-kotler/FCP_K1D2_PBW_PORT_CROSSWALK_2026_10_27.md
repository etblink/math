# FCP K1D2 PBW owner-port source/dependency crosswalk — 2026-10-27

**Current state: LOCAL_ONLY / OWNER_CI_BLOCKED. 28 prior accepted owner modules are preserved; 21 new modules are staged with 44 new declaration checks. The complete selected 22-module closure (including accepted S1V0) passes 47 local checks. No new owner module is independently accepted.** This bounded integration sub-branch starts from the accepted 28-module owner parent `d931f88731e5acb07ccd431d2edabfaa6c7b1734`. FCP research source branch `research/openai-math-su2-s1v52-global-lift-scoping-20261019@cc608e2282e1b32bb11bbb64424e4775b28138e2`. Baseline mathematical environment Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Exact source-to-candidate blob mapping

| Stage | Original FCP source SHA | Owner candidate SHA | `#print axioms` roots |
|---|---|---|---:|
| F20B | `6e4c78fd31f9781267659313a8a0edfedd65e9ad` | `63d117da8cb2ad337cfb372946332cb42bdf5390` | 2 |
| D2A | `6797e53e43abf6e94c76612f91617169e224e831` | `3cedc0a0487fc2439a0a1cbc95190faa7e3a3ed2` | 3 |
| D2B | `9a0a119273e3215f05105344ac64f0a9c74853ac` | `fa6c021f752ea1cdb97edc75a1cb2204112983d1` | 1 |
| D2C | `99ab3f78e12a31c365f83c1577db852327d3bc3a` | `3ed038ffa6be357965af5c777ecebf958518fff3` | 2 |
| D2D | `b494be954703d29b9d70ad934546bebf9a55cbcf` | `390b9eb58e9895f29cdbc183f966e2ccf26b6125` | 2 |
| D2E1 | `52b5ce32275839dc2bde947e29ad2e03ed108bb2` | `3ce8bffdbd5c7f9ef880900a2311e675d08d71db` | 2 |
| D2E2 | `ed3b405c1a1f7b33e44199ad5a635c3926d6b721` | `1183b901630d70981d102d803d3d9ed880539d43` | 2 |
| D2E3 | `05e8a4703fcfedb3fbb0d27b9b0c84e655ee130c` | `c1f8568c804c6da574ae39755bc1f5a5ce4a2854` | 1 |
| D2E4 | `96adf2cf80e5dd81c71220e0cb811cf9b8494cf3` | `ca5359c3ee1d9695bc2de16294d21b942d7ff426` | 2 |
| D2E5 | `50943cf5f20a40cb8f65b1e90d6ca738af3bc660` | `31f171b108b06c995824cdb84ad70f26f1060b10` | 1 |
| D2F1 | `1c7b4543ca810a4017767ee79d1a0a5942c130cd` | `4014ee2b0770d70908306652d393ee17aceeb3bf` | 1 |
| D2F2 | `0dc59f0b2b5fe38f761bac4277049498a67d2871` | `eada39fbd5891865e9662a610cf10deb584834da` | 1 |

There are 12 staged candidate Lean sources and 20 `#print axioms` declaration checks. Eleven mathematical bodies following the import declarations are byte-for-byte preserved from those original FCP blobs; only imports and explicit provenance comments changed. E5 was an unqualified FCP candidate and required the statement-preserving proof repair documented below. No original community BFSS files or existing 28 accepted owner contributor files were overwritten.

**Original import-graph boundary.** The original F20B imports F20A's long SU(2) Spin topology ancestry but uses only the source S1V0 definitions and pinned Mathlib PBW basis APIs. The original K1D2A imports K1D1's Spin/exterior transport ancestry but its coordinate-word theorem bodies use only S1V0's exact `Source48Label`/`Source48Vector` and Mathlib contraction. This import-only owner adaptation connects those two module roots directly to the already existing owner S1V0 source and explicit Mathlib modules. All other K1D2 peer dependencies are mapped to owner `OAI.MathematicalPhysics.BFSS.Contrib.Kotler` module paths. Whether that import thinning is legitimate must be established by the fresh owner compiler, rather than assumed from source inspection.

**Scope map:** F20B provides original Clifford/exterior PBW basis; K1D2A/B provide original ordered coordinate word contractions and nonzero erase; K1D2C/D provide original well-order/PBW basis correspondence and empty-unit/erase injectivity; K1D2E1–E5 provide coordinate absence, minimum label, contraction, finite occupancy, and scalar reconstruction; K1D2F1/F2 provide coefficient isolation and no occupied PBW labels given vanishing coordinate contractions.

**Initial twelve-file boundary:** K1C, K1D0, K1D1, S1V38 and the original Spin48 vector-action ancestry were absent from the first batch. The nine source-exact ancestry candidates described below are now locally compiled, while independent owner acceptance remains blocked. No scalar-common-kernel composition, original two-sign Spin kernel classification, covering, global Spin(9) lift, BFSS spectral eigenstate or existence is claimed. No copied file count substitutes for a checked theorem graph.

## Qualification and fail-closed rule

The new `.github/workflows/bfss-kotler-k1d2-pbw-owner-strict.yml` requires all exact source Git blob SHAs, unchanged qualified owner S1V0 and Core, pinned Lean and Mathlib, fresh compilation in dependency order, a real `.olean` per module, the exact `#print axioms` root set, only `propext`, `Classical.choice`, `Quot.sound`, and no Lean source warnings/errors or `sorryAx`. If the gate is red, pending, timed out, missing, or otherwise inconclusive, the original accepted **28** count does not change. Repair findings must remain documented as negative knowledge.

No changes to `etblink/math:main`, the preserved branch `integration/community-20261027-bfss`, FCP, or `mathcommunity/oai-math-revised`; no upstream PR/issue/comment is authorized or created.

## Local reproduction and E5 repair — October 27, 2026

[Initial independent run 40602151982](https://github.com/etblink/math/actions/runs/40602151982), job `122532676275`, tested `25bf4ff87dcb31f6a490f3b42d00385e677ffe60` and ended **failure**. Nine source modules passed before E5 stopped the sequential gate. E5's original FCP blob `50943cf5f20a40cb8f65b1e90d6ca738af3bc660` had **no qualified source receipt**. Its imports could be thinned correctly while its proof was still unfinished. FCP F1/F2 source gates are separately terminal success, including run `40597125928` at exact FCP SHA `cc608e2282e1b32bb11bbb64424e4775b28138e2`.

The unmodified local build reproduced E5's unknown `Finset.not_mem_empty`, overbroad rewrite of `f` inside its own coefficient, and unused simp argument. The other eleven candidate files compiled strictly, including F1/F2 independently of E5. The repair uses `simp at hh`, removes an unused `Finsupp.single_apply` argument, and transports the proved `hf` through `congrArg B.repr.symm`, avoiding rewriting its scalar parameter. The theorem statement and hypotheses remain byte-identical. A first local repair triggered the `unnecessarySimpa` linter; replacing it with `simp at hh` retained strict warning rejection. This failed local attempt is preserved in the evidence directory and was not pushed.

The repaired full local build freshly compiled accepted S1V0 first (3 pre-existing roots), then all twelve candidates in dependency order (20 candidate roots). Every file produced a nonempty `.olean`; all reported only `propext`, `Classical.choice`, `Quot.sound`; no source warning, error or `sorryAx` remained. Evidence is in [`evidence/k1d2-pbw-2026-10-27/`](evidence/k1d2-pbw-2026-10-27/). Local success does **not** advance the accepted count before the independent owner gate.

Environment: official Lean 4.34.1 release (compiler commit `5045d0056413266e57c625dcd7c365b10e377c52`, archive SHA256 `47bf4bbd78f70c2e9670598ab7124d92b6efb7330ff33e5fbb4030f6fd72e4e4`); Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` with all eight manifest dependency revisions matching clean checkouts. Mathlib's content-addressed cache restored 3,112 required artifacts. Native `lean -DwarningAsError=true` compiled the owner sources directly with explicit output and dependency search paths; no Lake/source/dependency pins were upgraded. The host needs a readlink compatibility shim resolving only `/proc/<own-pid>/exe` to `/proc/self/exe`; it changes no Lean input or proof. GitHub's Linux runner uses the ordinary pinned Lake environment.

The original 28 accepted owner source blobs were compared with parent `d931f88731e5acb07ccd431d2edabfaa6c7b1734` and remain unchanged. The source repair and matching workflow hash are committed together.

## Complete synchronization audit and Project Lead handoff — October 27, 2026

### Result and exact source boundary

The first red was reproducible and repaired locally. Nine necessary original Spin/Clifford ancestry files were added as **candidates**. A final fresh build of the entire selected closure passed **22 modules / 47 declaration checks**, comprising **44 candidate checks in 21 new files** plus **3 previously accepted S1V0 checks**. Every selected `.olean` was recreated; all printed axiom sets were subsets of `propext`, `Classical.choice`, `Quot.sound`; the strict compiler emitted no source warnings, errors or proof holes. The final verifier also compiled an auxiliary file containing the exact `#check @...` declarations, recording actual types and hypotheses separately from proofs.

**Acceptance stays at 28 owner modules. Zero new modules are promoted.** The repaired PBW gate and the new ancestry gate have not run against the local commits because publication was blocked. The original [40602151982](https://github.com/etblink/math/actions/runs/40602151982) failure remains the latest independent owner qualification of this PBW branch.

The live repository review fetched every FCP remote branch and its full history. The newest relevant BFSS branch remains `research/openai-math-su2-s1v52-global-lift-scoping-20261019@cc608e2282e1b32bb11bbb64424e4775b28138e2`; `main@cf06212a57db0ceffad74bd78280a8a240856a17` is dated October 9. A detached source worktree preserves the pre-existing local FCP checkout. The owner clone has full history, correct `etblink/math` fetch/push remotes and a clean initial working tree. GitHub reports owner repository pull/push/admin access; the subsequent publication rejection is a separate approval-policy boundary.

### Machine-readable coverage and exact dependency graph

The authoritative scoped data is [`FCP_SYNC_MANIFEST_2026_10_27.json`](FCP_SYNC_MANIFEST_2026_10_27.json), reproducibly generated by [`tools/build_fcp_sync_manifest.py`](tools/build_fcp_sync_manifest.py). It contains:

- Every selected source path, original module/import list, original Git blob, FCP source SHA, exact tested source-gate SHA, destination path/blob/imports, actual transitive owner dependency closure, root set, adaptation and acceptance class.
- The **336-file original import-syntax graph**, with each node's immutable blob and complete import-name resolution. This graph describes source imports; it does not assert that all 336 files form an independently accepted build.
- The **22-file, unambiguous selected owner closure**, with a topological build order and no unresolved owner imports. The large original import edges are retained in the audit even where a fresh compiler proves they are unnecessary for the selected definitions/theorems.
- An inventory of all **858** current FCP Lean files. The remaining 522 outside the original syntax closure, and 314 historical ancestors outside the selected owner closure, are explicitly **EXCLUDED from this operation**, with no assertion about their source proof acceptance. The legacy 130-file archive is not bulk imported.
- All 28 preserved owner source identities, the five classification definitions, and the failed E5 source version marked **SUPERSEDED**. There are **zero required selected source modules absent**; all 21 new ones are staged pending independent qualification. `ACCEPTED_MISSING` is therefore empty within this selected scope.

The matrix below is a view of that manifest, not a second source of truth. Its dependencies are the **actual owner imports**. Full original imports, long source paths and both blob hashes remain in the machine-readable crosswalk.

| Stage | Direct owner prerequisites | Root checks | Original source qualification | Owner class |
|---|---|---:|---|---|
| S1V0 | Mathlib only | 3 | Prior owner acceptance | ACCEPTED_PRESENT |
| S1V29 | S1V0 | 3 | [39333789056](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39333789056) | CANDIDATE_STAGED |
| S1V30 | S1V29 | 2 | [39335067742](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39335067742) | CANDIDATE_STAGED |
| S1V31 | S1V30 | 3 | [39336266189](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39336266189) | CANDIDATE_STAGED |
| S1V37 | S1V0 | 3 | [39353100636](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39353100636) | CANDIDATE_STAGED |
| S1V38 | S1V37 | 5 | [39354326793](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39354326793) | CANDIDATE_STAGED |
| K1AO | S1V31 | 1 | [40491802270](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40491802270) | CANDIDATE_STAGED |
| K1CO | K1AO | 3 | [40494768705](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40494768705) | CANDIDATE_STAGED |
| K1D0O | K1CO, F20B | 2 | [40497329075](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40497329075) | CANDIDATE_STAGED |
| K1D1O | K1D0O, S1V38 | 2 | [40503702666](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40503702666) | CANDIDATE_STAGED |
| K1D2AO | S1V0 | 3 | [40511851424](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40511851424) | CANDIDATE_STAGED |
| K1D2BO | K1D2AO | 1 | [40513783572](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40513783572) | CANDIDATE_STAGED |
| K1D2CO | K1D2AO, F20B | 2 | [40529606061](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40529606061) | CANDIDATE_STAGED |
| K1D2DO | K1D2AO, F20B | 2 | [40532466604](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40532466604) | CANDIDATE_STAGED |
| K1D2E1O | K1D2CO, K1D2DO | 2 | [40534646714](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40534646714) | CANDIDATE_STAGED |
| K1D2E2O | K1D2CO, K1D2DO | 2 | [40536912614](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40536912614) | CANDIDATE_STAGED |
| K1D2E3O | K1D2E1O, K1D2E2O | 1 | [40542776547](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40542776547) | CANDIDATE_STAGED |
| K1D2E4O | K1D2CO, K1D2DO | 2 | [40542794712](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40542794712) | CANDIDATE_STAGED |
| K1D2E5O | K1D2E4O, K1D2DO | 1 | Unqualified original E5 | CANDIDATE_STAGED |
| K1D2F1O | K1D2E1O, K1D2E3O, K1D2E4O | 1 | [40550171138](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40550171138) | CANDIDATE_STAGED |
| K1D2F2O | K1D2F1O, K1D2E4O | 1 | [40597125928](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40597125928) | CANDIDATE_STAGED |
| F20B | S1V0 | 2 | [39662865914](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39662865914) | CANDIDATE_STAGED |

### Source correspondence and theorem-strength review

Twenty of the twenty-one new files retain byte-for-byte identical mathematical bodies from FCP after `set_option autoImplicit`; only module imports and an explicit provenance comment change. E5 alone has the documented proof repair. The generator separately checks that E5's full theorem statement/hypotheses are identical and that the accepted owner S1V0 label/vector/quadratic definitions match the original source exactly.

The two additional import reductions are explicit: original S1V29's unrelated SO48/quarter-rotation parents are replaced by the actual S1V0 source definitions and pinned Mathlib `SpinGroup`; K1A's continuity-heavy F21A import is replaced by actual S1V31. K1A's statement and proof use S1V31's genuine source action, S1V30's injectivity and native Spin star identities; they require no topology or continuity assumption. Every other ancestry import is mapped to its actual owner peer. The original `Source48Label = Fin 24 × Fin 2`, weighted-sum-squares form, original noncomputable PBW order, all-vector hypotheses, coordinate duals and polar normalization remain unchanged.

The actual new root types are retained in [`evidence/k1d2-pbw-2026-10-27/final-22-module-closure/root-types.log`](evidence/k1d2-pbw-2026-10-27/final-22-module-closure/root-types.log). They show the original Spin action and polar/coordinate contraction assumptions explicitly. No new assumed theorem, shadow source algebra, alternative index order or algebra-map interpretation of `equivExterior` was introduced. Exact source preservation and these compiled type checks support the bounded import reductions; no full reconstruction of all unrelated original historical files is claimed.

Twenty original FCP strict runs were independently read through live run/job metadata and compiler logs. All are terminal success; their exact tested source blobs match the pinned research frontier, and all **43 original source declaration reports** contain only permitted axioms. [`fcp-source-qualification.json`](evidence/k1d2-pbw-2026-10-27/fcp-source-qualification.json) preserves each run, tested commit, job, exact root set and original acceptance markers. This includes F20B's definition and finite-dimensionality theorem as **two checks**, despite its historical marker mentioning one theorem. E5 has no original strict acceptance and is not silently included in those 43 reports. Historical candidate comments in otherwise accepted original files remain source-exact; live immutable gate receipts, rather than comments alone, determine source acceptance.

### Reproduction and independent gate preparation

[`tools/qualify_fcp_sync.py`](tools/qualify_fcp_sync.py) implements the same strict source and root checks locally and under Lake. It checks toolchain/Mathlib pins, all eight Mathlib dependency revisions, all 28 preserved parent source blobs, every selected candidate blob, exact root lists, forbidden proof tokens outside nested comments/strings, direct Mathlib artifacts and complete owner import closure **before** compiling. It removes each target `.olean`, compiles with `-DwarningAsError=true`, checks the resulting object and exact axiom reports, stops at the first causal failure, and records actual root types. It never updates acceptance status.

With the normal pinned owner environment restored, run from the owner repository root:

```sh
cd lean
lake exe cache get
cd ..
python3 contributions/bfss-kotler/tools/qualify_fcp_sync.py --group ancestry --mode lake --log-dir /tmp/bfss-ancestry-evidence
```

For a previously restored standalone pinned Mathlib, `--mode direct --lean-bin <lean-4.34.1>/bin/lean --mathlib-root <pinned-mathlib>` uses the same Lean compiler with explicit search paths. On hosts with the observed executable-alias problem, the optional [`tools/proc_self_compat.c`](tools/proc_self_compat.c) shim can be compiled and supplied with `--preload`; ordinary GitHub runners do not require it. Environment, actual compiled-object hashes and full compiler logs are preserved in [`final-22-module-closure/`](evidence/k1d2-pbw-2026-10-27/final-22-module-closure/). This fresh whole-closure reproduction follows the separate original-batch and nine-ancestor builds; no further repetition is required absent new changes or failures.

The existing `.github/workflows/bfss-kotler-k1d2-pbw-owner-strict.yml` remains pinned to all twelve candidate sources and all twenty PBW checks, with repaired E5 hash `31f171b108b06c995824cdb84ad70f26f1060b10`. The new `.github/workflows/bfss-kotler-spin48-ancestry-owner-strict.yml` independently pins the manifest and verifier, restores the same toolchain/Mathlib, freshly compiles all 22 selected files, demands all 47 checks, emits full compiler/type evidence and archives both success and failure logs. Neither prepared workflow is represented as a new green run.

### Negative-knowledge register

| Evidence | Earliest causal finding | Decision and retained boundary |
|---|---|---|
| Owner run `40602151982`, source `25bf4ff8...` | E5 unknown `Finset.not_mem_empty`, overbroad rewrite of `f`, unused simp argument; `sorryAx` in rejected proof | Reproduced unchanged locally; repaired proof only; preserved failure, original hashes and exact statement. Nine earlier module passes do not accept the whole batch. |
| Original FCP E5 `50943cf5...` | Candidate source had no acceptance receipt | Separate source presence from theorem acceptance. F1/F2 source success does not qualify E5. |
| Local first E5 repair `25b43c1f...` | `unnecessarySimpa` lint rejected `simpa using hh` | Retained failed local evidence; changed to `simp at hh`; no warning suppression and no remote retry. |
| Initial local ancestry attempt | Compilation began before restoration completed; `SpinGroup.olean` and `Inversion.olean` were unavailable | Recorded as an environment sequencing failure, not a proof failure. Waited for restoration, then compiled unchanged source successfully. New verifier preflights all direct artifacts and stops at first failure to avoid cascades. |
| Official Lean launch on this host | `failed to locate application` from executable alias resolution | Used a narrow pre-existing readlink shim; kept official compiler archive, compiler version and every proof input unchanged. |
| Default-branch-only comparison | FCP main stops October 9, while BFSS research frontier is October 27 | Fetched all remote branches, selected and froze actual newest relevant research SHA; did not treat main as comprehensive. |
| Initial full original-import graph | 336 imported files include unrelated gauge, topology and historical construction ancestry | Preserved the exact source graph; admitted only actual source dependencies proven sufficient by a fresh 22-file build. No historical bulk promotion. |
| Verifier review before CI | Standalone Mathlib stores its dependencies under its own `.lake/packages`; the owner Lake workspace stores transitive dependencies under the owner package directory | The verifier now selects the directory by execution mode, and checks that all eight owner lockfile revisions agree with the pinned standalone Mathlib manifest. The final local evidence binds the exact verifier blob. No mathematical source changed. |
| Automatic publication review | Push of source and audit/evidence to the public owner integration branch was rejected for insufficient explicit publication authorization | Kept local commits and all evidence. No alternate API push, force push or indirect remote write attempted; no new owner CI result or acceptance invented. |

### Current branch, blockers and next bounded operation

Owner branch: `integration/fcp-k1d2-pbw-20261027`. Its remote checkpoint remains `25bf4ff87dcb31f6a490f3b42d00385e677ffe60`; the repaired twelve-file batch is local commit `ba5469b465f34a77d087905454f94f02e114b8a3`, followed by the local ancestry/audit commit containing this handoff. Use `git rev-parse HEAD` for that exact local final commit; the final user-facing handoff records it. No history was rewritten. Owner main remains `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`, the pinned community baseline is unchanged, and no upstream PR or other upstream write was made.

**Blocker:** automatic review rejected the authorized-by-handoff push before remote publication. The work is concrete and locally reviewable. Explicit user approval of publishing the prepared commits and evidence to the named public owner branch is the remaining operational step. After publication, inspect the exact tested commit and original logs of both strict owner gates. Only clean terminal success may advance the owner acceptance ledger; the all-closure gate includes the PBW checks, while the dedicated PBW gate preserves that batch's independent scope.

**Next mathematical operation, after prerequisite qualification:** compose F2's no-occupied-label result with the repaired E5 scalar reconstruction on the same exterior algebra, proving the scalar-common-coordinate-kernel statement. Then transport the original Clifford polar kernel using K1D0 and K1D1's original half-single coordinate identity. Pinned Mathlib's `changeForm_algebraMap` supplies the required scalar compatibility; `equivExterior` is real-linear and is not assumed multiplicative. These compositions have not been promoted or attempted as new accepted declarations in this blocked cycle.

Full Spin(48) kernel classification and the two-sign theorem, the negative central Spin representative's separate ancestry, covering, global Spin(9) lift/invariance, and BFSS spectral existence remain independent obligations. This audit does not resolve them or claim the whole FCP empirical/research program is synchronized.
