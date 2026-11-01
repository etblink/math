# F10AQ Gate 2 accepted; F10AR source native bracket orientation and zero candidate
Date 2026-11-01. Owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`, accepted parent `bd8395e969591449423a77253044a00cc829f3d4`.

## F10AQ qualification
[Run #41361468721](https://github.com/etblink/math/actions/runs/41361468721) SUCCESS on exact parent SHA, attempt 1. Original-source/F10E/F10AJ–F10AQ hash pins, frozen Lean v4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, F10AP ancestry build, fresh warnings-as-errors source Lean compiler, FOUR independent declaration-type and root-axiom audits PASS. Final marker `V10H_F10AQ_FOUR_ARBITRARY_FORK_RIGHT_TYPES_AXIOMS_PASS`. Only permitted axioms `propext`, `Classical.choice`, `Quot.sound`; no sorryAx. [Artifact #13105142975](https://github.com/etblink/math/actions/runs/41361468721/artifacts/13105142975), ZIP SHA256 `0297e2af168d53d618859db548279b82879d488fa0aaee6bc9522efdf17fb425`.

F10AQ qualified matrix/native so(16,R) bracket identities for ANY original source pairwise distinct a,b,c: `[γaγb,γaγc]=-2γbγc` and `[γaγc,γbγc]=-2γaγb`. This extends accepted F10AP universal chain bracket `[γaγb,γbγc]=2γaγc` beyond canonical ordering.

## Gate 1 retained negative evidence
[Run #41360255466](https://github.com/etblink/math/actions/runs/41360255466), SHA `9ad17ac27301a8e152ffa3edb8769e56ca58dd38` RED: two `unknownIdentifier` errors on `source9OriginalGamma_anticommute` because `open FCP.BFSSPairedSpin9DetFixture` was missing in the source. The failed Lean error state emitted `sorryAx` and was not accepted. Gate 2 restored the namespace opening without changing a theorem's type or proof. Failed artifact #13105786072, ZIP SHA256 `490b9cbeb6a9828b5a3c5456e7d42fb05924bfc6f3ed84abfb5b98df7bb77c23`.

## F10AR — FOUR unqualified exact theorem candidates
1. Reversing FIRST original gamma pair in a native so(16,R) Lie bracket negates the bracket, using F10AP source-exact reversal and `neg_lie` from pinned Mathlib.
2. Reversing SECOND original pair negates bracket, using `lie_neg`.
3. Disjoint arbitrary oriented original pair products have zero native Lie bracket when all cross labels distinct, using accepted F10AN original real-matrix commutator theorem and Subtype.ext; no assumption a<b or c<d.
4. Every arbitrary original oriented pair has zero native self bracket using `lie_self`.

All source gamma words from F10AP are EXACT originals, not surrogate matrices. This is an orientation-zero bridge for the next exhaustive 36x36 canonical pair bracket formula. It does not prove any full 36x36 classification or native `so(9)->so(16)` LieHom; even Clifford image 256 PBW independence/injection, global Spin lifts, Fock action and BFSS physics remain OPEN.

Strict gate pins exact original gamma, F10E, F10AJ–F10AQ and candidate blobs, frozen Lean/Mathlib, accepted F10AQ ancestry rebuild, fresh warning-as-error Lean, independent exact four theorem types and allowed root axioms, SHA-bound preserved logs. No more axioms/sorry, resource-limit or linter changes, accepted-source edits, main merge or upstream PR.