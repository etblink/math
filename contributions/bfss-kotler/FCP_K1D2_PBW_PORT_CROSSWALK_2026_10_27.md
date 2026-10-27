# FCP K1D2 PBW owner-port source/dependency crosswalk — 2026-10-27

**State: CANDIDATE — initial owner gate failed; repaired full local batch passes, independent owner CI pending.** This bounded integration sub-branch starts from the accepted 28-module owner parent `d931f88731e5acb07ccd431d2edabfaa6c7b1734`. FCP research source branch `research/openai-math-su2-s1v52-global-lift-scoping-20261019@cc608e2282e1b32bb11bbb64424e4775b28138e2`. Baseline mathematical environment Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

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

**Not included or claimed:** K1C, K1D0, K1D1, S1V38 and the intervening original Spin48 vector action/GaugeGroup ancestry; the final composition to a Spin(48) kernel theorem; original two-sign Spin kernel classification, covering, global Spin(9) lift, BFSS spectral eigenstate or existence. This is an independent *exterior/PBW lemma lane*, not a full original transitive FCP ancestry import. No copied file count can substitute for a checked theorem graph.

## Qualification and fail-closed rule

The new `.github/workflows/bfss-kotler-k1d2-pbw-owner-strict.yml` requires all exact source Git blob SHAs, unchanged qualified owner S1V0 and Core, pinned Lean and Mathlib, fresh compilation in dependency order, a real `.olean` per module, the exact `#print axioms` root set, only `propext`, `Classical.choice`, `Quot.sound`, and no Lean source warnings/errors or `sorryAx`. If the gate is red, pending, timed out, missing, or otherwise inconclusive, the original accepted **28** count does not change. Repair findings must remain documented as negative knowledge.

No changes to `etblink/math:main`, the preserved branch `integration/community-20261027-bfss`, FCP, or `mathcommunity/oai-math-revised`; no upstream PR/issue/comment is authorized or created.

## Local reproduction and E5 repair — October 27, 2026

[Initial independent run 40602151982](https://github.com/etblink/math/actions/runs/40602151982), job `122532676275`, tested `25bf4ff87dcb31f6a490f3b42d00385e677ffe60` and ended **failure**. Nine source modules passed before E5 stopped the sequential gate. E5's original FCP blob `50943cf5f20a40cb8f65b1e90d6ca738af3bc660` had **no qualified source receipt**. Its imports could be thinned correctly while its proof was still unfinished. FCP F1/F2 source gates are separately terminal success, including run `40597125928` at exact FCP SHA `cc608e2282e1b32bb11bbb64424e4775b28138e2`.

The unmodified local build reproduced E5's unknown `Finset.not_mem_empty`, overbroad rewrite of `f` inside its own coefficient, and unused simp argument. The other eleven candidate files compiled strictly, including F1/F2 independently of E5. The repair uses `simp at hh`, removes an unused `Finsupp.single_apply` argument, and transports the proved `hf` through `congrArg B.repr.symm`, avoiding rewriting its scalar parameter. The theorem statement and hypotheses remain byte-identical. A first local repair triggered the `unnecessarySimpa` linter; replacing it with `simp at hh` retained strict warning rejection. This failed local attempt is preserved in the evidence directory and was not pushed.

The repaired full local build freshly compiled accepted S1V0 first (3 pre-existing roots), then all twelve candidates in dependency order (20 candidate roots). Every file produced a nonempty `.olean`; all reported only `propext`, `Classical.choice`, `Quot.sound`; no source warning, error or `sorryAx` remained. Evidence is in [`evidence/k1d2-pbw-2026-10-27/`](evidence/k1d2-pbw-2026-10-27/). Local success does **not** advance the accepted count before the independent owner gate.

Environment: official Lean 4.34.1 release (compiler commit `5045d0056413266e57c625dcd7c365b10e377c52`, archive SHA256 `47bf4bbd78f70c2e9670598ab7124d92b6efb7330ff33e5fbb4030f6fd72e4e4`); Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` with all eight manifest dependency revisions matching clean checkouts. Mathlib's content-addressed cache restored 3,112 required artifacts. Native `lean -DwarningAsError=true` compiled the owner sources directly with explicit output and dependency search paths; no Lake/source/dependency pins were upgraded. The host needs a readlink compatibility shim resolving only `/proc/<own-pid>/exe` to `/proc/self/exe`; it changes no Lean input or proof. GitHub's Linux runner uses the ordinary pinned Lake environment.

The original 28 accepted owner source blobs were compared with parent `d931f88731e5acb07ccd431d2edabfaa6c7b1734` and remain unchanged. The source repair and matching workflow hash are committed together.
