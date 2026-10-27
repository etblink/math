# BFSS integration into etblink/math — 2026-10-27

**Scope:** owner-controlled staging branch only; no upstream pull request, issue,
comment, or modification was made in `mathcommunity/oai-math-revised`.

## Immutable reference points

| Reference | Git SHA / source |
| --- | --- |
| Revised community baseline | `mathcommunity/oai-math-revised@2a6ea33834056b87356e0e06bf9cbc2ea028b213` |
| Owner canonical main (unchanged at initiation) | `etblink/math@fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` |
| Private alignment branch | `etblink/math:integration/community-20261027-bfss` |
| Original mathematical repository | `openai/math` |
| Lean | `leanprover/lean4:v4.34.1` |
| Pinned Mathlib | `d13f23b723b8a846827a245b89c10fc7d3f11612` |
| Original BFSS core blob | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` |
| Original gamma-word blob | `d12051e70de679f5458dbd456667a32c7b407ce4` |

The aligned branch was initialized **directly at the exact community commit**.
Unlike an approximation based only on `README.md` or manuscript counts, this
retains the complete corresponding upstream Git tree (manuscripts, notes,
source formalizations, catalogues, and build infrastructure). A later update of
the community repository is **not** implicitly incorporated; a new explicit
pinned alignment decision is required. No force update of existing owner
branches or changes to `etblink/math:main` occurred.

At this snapshot the revised catalogue describes **721 manuscripts across 373
families**, versus **719 manuscripts across 372 families** on the owner's prior
canonical main. This is a provenance/catalogue difference, *not* evidence that
any claimed mathematics has been independently proved.

## First import batch (exact-content copies; branch-local)

| Module path under `lean/OAI/MathematicalPhysics/BFSS/` | Git blob SHA | Original branch | Acceptance boundary |
| --- | --- | --- | --- |
| `SpinPlaneCovariance.lean` | `c262821f5532953048c9b2f3ecfbc04fa3b73f43` | `contrib/kotler-bfss-spin-plane-covariance` | Prior branch strict [run 38120296827](https://github.com/etblink/math/actions/runs/38120296827) **green**; aligned-branch independent rerun required |
| `Contrib/Kotler/SU2ColorCrossProbe.lean` | `f2d6ca5a5bfb9de262c1128b15ddc407631d6c98` | `contrib/kotler-bfss-consolidated-prep` | **Unqualified** until independent aligned-branch strict gate |
| `Contrib/Kotler/SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | `contrib/kotler-bfss-consolidated-prep` | **Unqualified** until independent aligned-branch strict gate |

All three transferred files match the source branches by Git blob identity,
preserving import paths, theorem statements, author provenance, license notices,
and proof source. Underlying `OAI.BFSSQuantum` definitions are credited to
their original authors. Original community BFSS files are unchanged.

The separate strict workflow
`.github/workflows/bfss-spin-plane-covariance-integration.yml` requalifies
the previously green spin-plane proof on the aligned branch, with actual
`AlgebraData` and gamma source SHA checks. Its branch-local self-trigger was
corrected in commit [`808af155`](https://github.com/etblink/math/commit/808af155f35be3f4b86139cdb85820e128da9998) and
[aligned strict run 40553748437](https://github.com/etblink/math/actions/runs/40553748437)
was initiated. Do not count this run as a new green until it terminates. The separate matrix workflow
`.github/workflows/bfss-kotler-finite-algebra-integration.yml` compiles the
two standalone finite-algebra modules and checks source blob identities,
toolchain and parent imports, `.olean` existence, prohibited `sorryAx`, and
printed Lean axiom dependencies. Initial matrix run
[40553427306](https://github.com/etblink/math/actions/runs/40553427306)
was initiated; do not infer theorem acceptance from a queued or in-progress run.

## Earlier large-batch negative knowledge

The existing `contrib/kotler-bfss-consolidated-prep` branch contains an
import-closure selection of **130** contributed BFSS modules, made from
`FCP@b60baa806dab3f0b296229a78f70e07b787544ab`. It is an important
staging archive **not** an accepted 130-module upstream port. The prior
[run 38154133028](https://github.com/etblink/math/actions/runs/38154133028)
failed during the **Mathlib source/build-cache restoration** step, before
compilation of the entire transferred source set. Its staging workflow was
green, but that is infrastructure-only evidence.

Do not copy the entire old candidate batch into an accepted production
namespace or claim it has been verified. The FCP source branch advanced
substantially afterward, including source-exact PBW/Spin work. Future batches
must compare each original FCP source, current accepted root and dependency
closure with the archived import-renamed copy, and compile in bounded stages.

## Next admission stages

1. Await terminal strict evidence for the aligned first batch; classify red
   results as environment, source-interface, axiom, or genuine mathematical
   failure using the first causal compiler error.
2. Reconcile late FCP modules against frozen original
   `etblink/math@adc7f124` interfaces on this community-aligned branch,
   preserving original label order and all 48-real-Majorana conventions.
3. Add import-closed verified modules incrementally, with source-hash-qualified
   compilation, exact axiom audit, precise authorship, and a claim-scope ledger.
4. Keep the original BFSS spectral existence theorem, full global Spin(9)
   lift, and original Spin(48) kernel classification separately unproved
   unless their exact mathematical statements become independently qualified.
5. Move to owner `main` or create an owner-side review PR only after
   successful gates and review. **No PR of any kind to `mathcommunity` is
   authorized without a separate explicit owner instruction.**

## Authorship and mathematical status

This branch is an independent contribution to an existing mathematical source,
not a modification of the original source authorship and not a claim of
mathematical or physical verification beyond individually accepted Lean
declarations. Compilation correctness, theorem strength, and physical
existence are separate questions. The files are supplied with their existing
Apache-2.0 SPDX authorship notices.

## Project Lead continuation — October 27, 2026

This continuation reused the existing owner integration branch; it did NOT create
another branch, modify canonical main, or create any PR or issue at mathcommunity.

### First alignment gate results and negative knowledge

- The aligned SpinPlaneCovariance strict [run 40553748437](https://github.com/etblink/math/actions/runs/40553748437)
  completed **success**. Job 122364121661 emitted the exact
  KOTLER_BFSS_SPIN_PLANE_COVARIANCE_PINNED_PASS marker after compiling the
  unchanged pinned original Core and GammaWords, the transferred contributor
  source, checking all six expected theorem declarations and permitted axioms.
- The finite algebra [run 40553427306](https://github.com/etblink/math/actions/runs/40553427306)
  completed **red** in both matrix entries after fresh Lean compilation.
  RealGamma compiled with six expected allowed-axiom outputs and **no Lean
  source warnings**. It failed because Lake reported patch-induced dependency
  working-tree warnings and the gate misidentified these environment messages
  as compiler warnings. ColorCross compiled with 22 allowed-axiom outputs but
  had genuine unused simp/tactic linter warnings.
- The Gamma transferred source Git blob remains unchanged at
  b9b8192055c70f0d001d7982669b9823c55562ed. The Color source was
  minimally proof-cleaned without theorem-statement changes: original blob
  f2d6ca5a5bfb9de262c1128b15ddc407631d6c98 to new candidate
  209b3808222730ca5e817d83ed32253a67513f7f.
  [Source commit](https://github.com/etblink/math/commit/4a0c070f8d47f13122dc05b136a012314284c019).
- [Strict workflow correction](https://github.com/etblink/math/commit/b5f99d13c83d86a38862f06a7d63dcb3b47053e9)
  now distinguishes line-numbered Lean source warnings from Lake environment
  notices; parses multiline axiom outputs; enforces exact print-root count,
  declaration-name correspondence, allowed axioms, and nonempty compiled
  objects. Exact cleaned Color source hash is pinned. The corrected matrix
  [run 40556721475](https://github.com/etblink/math/actions/runs/40556721475)
  was initiated. Neither matrix module is promoted until its terminal strict
  job is verified. The intermediate
  [40556591916](https://github.com/etblink/math/actions/runs/40556591916)
  used the superseded verifier, not independent final qualification.

### Second bounded port: finite Fock transport, admission pending

The source-exact owner-archived module
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2FermionFockProbe.lean
was copied from owner branch contrib/kotler-bfss-consolidated-prep
without textual modification, Git blob
3fcd159f2f920b62433fa95d6eb2ad2ea3a4273a.
[Port commit 82bcb536](https://github.com/etblink/math/commit/82bcb536002842f23e3bac6159543844a8120be0).

It imports the real original BFSS Core and
ContinuumCoulomb.ManyBody.FockNorm modules and transports a 24-mode
fermionic Fock Hilbert space to the actual original Fermion 2 Hilbert type.
The scoped creator/annihilator CAR and adjoint declarations are NOT a
complete physical BFSS construction or spectral existence result.

The new [Fock strict gate](https://github.com/etblink/math/blob/integration/community-20261027-bfss/.github/workflows/bfss-kotler-fock-transport-integration.yml)
pins original Core and exact Fock source hashes, Lean 4.34.1, Mathlib d13f23b,
compiles actual parent modules, checks a fresh .olean, and demands exactly
five theorem roots with only the permitted Lean axioms and no sorryAx or
Lean-source warnings. [Run 40557148102](https://github.com/etblink/math/actions/runs/40557148102)
was initiated; 0 Fock roots accepted pending terminal strict qualification.

### Merge and external communications boundary

This owner integration branch starts at the exact community baseline commit,
not at the owner's older canonical main. Do not merge it blindly into main.
The archived 130-module candidate batch remains unqualified for a bulk port;
continue with small source-exact import-closed gates. No upstream community
PR or other upstream write is authorized without a new explicit owner order.

## Project Lead CI adjudication and bounded cross-mode import, October 27, 2026

All operations stayed on owner branch integration/community-20261027-bfss. No upstream
PR, issue, or source write; canonical owner main remains unchanged.

### Terminal evidence

1. [Aligned spin-plane 40553748437](https://github.com/etblink/math/actions/runs/40553748437):
   strict SUCCESS; source-genuine compiled proof and exact original source pins.
2. [Aligned gamma/color matrix 40556721475](https://github.com/etblink/math/actions/runs/40556721475):
   both matrix entries completed SUCCESS with strict compiler, warnings and
   permitted-axiom checks. Marker strings: KOTLER_BFSS_SU2RealGammaProbe_STRICT_ONE_MODULE_PASS
   and KOTLER_BFSS_SU2ColorCrossProbe_STRICT_ONE_MODULE_PASS.
   Prior red runs 40553427306/40556591916 are superseded and remain in history.
3. [Initial Fock transport 40557148102](https://github.com/etblink/math/actions/runs/40557148102):
   RED. Fresh source compilation succeeded with five requested declared
   theorem roots, only propext/Classical.choice/Quot.sound, and a real Lean
   linter warning at line 108: unused Complex.star_def in majorana0_selfAdjoint.
   Strict warning-as-error rightly rejected the module. No Fock root accepted.
4. Exact minimally repaired Fock source changed Git blob
   3fcd159f2f920b62433fa95d6eb2ad2ea3a4273a to
   dbe9241436c7d3633547e559bccd5fe1fd82de9a.
   [Proof commit 672f6d22](https://github.com/etblink/math/commit/672f6d22ba7eb888e5fff5f0cafb477dcd4813ce)
   removes only the unused simp argument, retaining every statement and
   original import. [Workflow pin f521be4a](https://github.com/etblink/math/commit/f521be4a0c1021db0c6432d53f54097efe3eb47b);
   strict [40558967036](https://github.com/etblink/math/actions/runs/40558967036)
   initiated. Interim 40558938222 triggered before matching workflow pin and
   is superseded. Do not count Fock until fully qualified.

### Fifth source module: cross-mode CAR F2 (strict verification pending)

Owner-archived SU2FermionF2Probe.lean copied without alteration from
contrib/kotler-bfss-consolidated-prep into the contributor namespace.
Exact Git blob aa99b37d433b3a7b8881291e7a2b2003ea35b158, port
[commit c44efebf](https://github.com/etblink/math/commit/c44efebfb1a7c77fce6c73c5c4dbb283fec11c86).
It depends only on the actual repaired Fock module and proves finite-mode
cross CAR and Majorana identities, not spectral existence.

An independent cross-mode CI workflow was added in
[commit f86dd6ee](https://github.com/etblink/math/commit/f86dd6eebfda0440516205cfc8b29b08a96f1020).
It checks exact source SHA identities (Core, Fock, F2), pinned Lean and
Mathlib, compiles original source parents, separately strictly checks five
Fock roots and six F2 roots with actual .olean objects, exact printed
declarations, source-diagnostic freedom, and allowed axioms.
[Strict run 40559163074](https://github.com/etblink/math/actions/runs/40559163074)
initiated. F2 admits zero roots until this run terminates green. If it
fails, preserve first causal evidence and retry only with a bounded repair.

The aligned branch derives from the pinned community commit, not from the
older owner main: do not fast-forward or force-update owner main. No
mathcommunity upstream PR is authorized.

### Verified intermediate pin failure; procedural correction

[Run 40558938222](https://github.com/etblink/math/actions/runs/40558938222)
terminated RED specifically at "Enforce exact mathematics and candidate module
pins": the proof source had been committed before the corresponding pin update.
It never reached Lean. This is a **controlled integrity failure**, not a
failed theorem. The subsequent pin-matched run 40558967036 is the real proof
qualification attempt. To avoid unnecessary red CI churn during later edits,
commit a source correction and its workflow hash update atomically (Git tree
transaction), or explicitly suppress source-only gates during the short
two-commit update. Retain immutable source hashes and NEVER weaken preflight
to conceal mismatches.

### Fock five-root qualification and F2 single-warning successor

- [Fock strict run 40558967036](https://github.com/etblink/math/actions/runs/40558967036)
  completed **SUCCESS**, job 122382517933, emitting the exact
  KOTLER_BFSS_FOCK_TRANSPORT_FIVE_ROOTS_STRICT_PASS marker.
  The pinned source blob dbe9241436c7d3633547e559bccd5fe1fd82de9a
  compiled to an actual .olean; all five requested theorem roots had
  only allowed Lean axioms and zero source warnings/errors/sorryAx.
  These five source-typed results are now accepted *on the owner
  community-aligned integration branch*, not on mathcommunity or owner main.
- [First F2 strict run 40559163074](https://github.com/etblink/math/actions/runs/40559163074)
  was **RED** at the cross-mode CAR module, after independently compiling
  and revalidating its qualified Fock parent. The F2 Lean compiler
  produced six intended axiom-report declarations, but a real source warning
  at F2 line 103 rejected unused Complex.star_def in
  majorana1_selfAdjoint. It is a proof-hygiene warning, not a mathematical
  counterexample; no F2 theorem root was accepted.
- Corrected only that unused simp argument in F2 source without changing
  any theorem statement or imports. Old F2 blob
  aa99b37d433b3a7b8881291e7a2b2003ea35b158; new source
  93d7ae00d4ee21ce59ab137c349590e2c496ff38.
  The exact source and workflow pin were committed **atomically**, removing
  the guaranteed stale-pin red intermediate run seen in earlier work.
  [Atomic commit 41d62de1](https://github.com/etblink/math/commit/41d62de136d85cb96da7c2b97ae6b579bf704611);
  successor [strict run 40560600629](https://github.com/etblink/math/actions/runs/40560600629)
  initiated. Until terminal success, F2 has **zero** accepted roots.
- No upstream PR, owner main update, unproved physical BFSS spectral claim,
  or change to the pinned community source tree.

### F2 cross-mode six roots accepted; F2B imaginary Majorana next gate

[Cross-mode strict run 40560600629](https://github.com/etblink/math/actions/runs/40560600629),
job 122388254403, TERMINAL GREEN, independently recompiled qualified Fock
and F2. The Fock report contained five expected roots; the F2 report
contained **six** expected source declarations with only
propext, Classical.choice and Quot.sound, no Lean warning, error or sorryAx,
and exact actual compiled Lean objects. The decisive log marker is
KOTLER_BFSS_CROSS_MODE_CAR_SIX_ROOTS_STRICT_PASS.
Thus the corrected F2 source blob
93d7ae00d4ee21ce59ab137c349590e2c496ff38 is formally accepted
on the **owner integration branch only**; the prior source-hygiene red remains
negative knowledge.

Next source-exact archived F2B1 probe:
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2FermionF2BProbe.lean.
The sole imported owner archive parent is F2. Blob
de356c4c6a2f73f8d18de6700fe638c617225f4d was copied unaltered,
preserving authored theorem statement and license. The single root
majorana1_car is the same-mode normalized complementary imaginary
Majorana CAR, not the full different-mode CAR, original Spin48 kernel or
spectral existence. The new distinct owner-only workflow
bfss-kotler-majorana1-self-car-integration.yml requalifies Fock (5),
F2 (6), and F2B1 (1) in dependency order with pinned toolchain,
original source blob, exact candidate hashes, fresh compiled .olean and
strict axiom/diagnostic audits. **F2B1 is PENDING, zero new accepted
roots until its own terminal green**.

The new candidate and its strict workflow are added in a single
Git commit using base-tree source pinning, preventing the known
source-before-hash workflow red. No upstream PR, no change to
canonical owner main or original community BFSS sources.

### Next bounded candidate: real Majorana full-mode pair CAR (F2B2a)

After qualified Fock/F2, the exact archived SU2FermionF2BProbe.lean is the
F2B1 same-mode imaginary Majorana bridge. Its new strict run 40561955237
revalidates Fock/F2 then tests one same-mode CAR root. The present
iteration does not claim it accepted before the terminal job.

The next import-closed source, SU2FermionF2B2Probe.lean, from the owner's
archived 130-module staging branch has Git blob
d932e4fad64ffdecb06826f784e28826af2a3952 and imports only F2B1.
Its ONE root majorana0_car_all is the pairwise **real-real** Majorana
CAR for any two of 24 modes, with delta-one normalization, not the
complex or mixed 48-generator CAR or physical spectrum. Independent
strict workflow bfss-kotler-majorana-real-allmode-integration.yml
revalidates Fock (5), F2 (6), F2B1 (1) and then this candidate (1)
with source pins and accepted compiler/axiom evidence.

Both the staged source and strict gate are added atomically. Until
this exact run completes successfully the real all-mode proof adds
ZERO accepted theorem roots. If F2B1 is red, repair its first causal
compiler diagnostic before promoting either result.

### Bounded Majorana CI run references

- F2B1 same-mode imaginary Majorana candidate: [strict run 40561955237](https://github.com/etblink/math/actions/runs/40561955237) (candidate exact blob `de356c4c6a2f73f8d18de6700fe638c617225f4d`). Pending terminal Lean source/axiom verification at checkpoint.
- F2B2a real-real all-mode Majorana candidate: [strict run 40562198520](https://github.com/etblink/math/actions/runs/40562198520) (candidate exact blob `d932e4fad64ffdecb06826f784e28826af2a3952`). Pending terminal Lean source/axiom verification at checkpoint.

Both jobs use independent workflows with exact parent blob checks and source-exact theorem roots. Neither contributes accepted roots until its own strict success.

### F2B1/F2B2a GREEN, F2B2b next exact archived candidate

The F2B2a real all-mode [strict run 40562198520](https://github.com/etblink/math/actions/runs/40562198520),
job 122393904614, TERMINAL SUCCESS: strict original Fock five-root,
F2 six-root, F2B1 one-root, and F2B2a one-root gate markers appeared
in the original Lean compiler job, with four fresh nonempty compiled
objects, zero Lean source warnings/errors/sorryAx, and only permitted
propext/Classical.choice/Quot.sound axioms.

Accepted original 24-mode fermion statements on this owner branch:
F2B1 majorana1_car (imaginary *same* mode) and F2B2a majorana0_car_all
(real-real, *any* mode pair). This is NOT full 48-label CAR, a global
Spin(48) kernel classification or BFSS spectral theorem.

Next archive-exact owner candidate source:
SU2FermionF2B2ImagProbe.lean, Git blob
71e0002c8e1f23a1522abd301bdc7f50a3b58214,
importing only SU2FermionF2B2Probe.lean, root majorana1_car_all.
The candidate is imaginary-imaginary CAR for *all* 24-mode pairs.
Mixed real-imaginary CAR remains a separate obligation.
The new owner-only workflow
bfss-kotler-majorana-imag-allmode-integration.yml
strictly requalifies all four ancestor stages and then its single
new root. Source, workflow and audit are committed in ONE Git tree
transaction with exact original and candidate SHA pins. F2B2b
acceptance remains ZERO until this new strict gate terminates green.
Neither mathcommunity nor canonical owner main is modified.

### Strict source-labeling boundary for later global BFSS claims

The accepted old F2 source at
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2FermionF2Probe.lean
defines its thetaLabelEquiv by composition using
Fintype.equivFin on the 16-by-3 domain and on the 24-by-2 codomain.
It proves a genuine bijection, and the CAR identities for the resulting
Majorana operators are valid as *those specifically defined operators*.
However, the definition does NOT expose the later explicit
spin-pair/color-mode ordering of pairedTheta used by the FCP program.
Thus a future successful 48-index theta CAR for this older
thetaCandidate is **not** itself an identification with source-exact
pairedTheta, original Majorana generators, or a global Spin(9)
physical lift. That identification demands an explicit permutation /
source-order crosswalk, separately qualified in Lean. No replacement
ordering may be silently treated as identical.

This is a scope safeguard, not a claim of counterexample or failure
of the CAR itself. Keep the unproved original source identification
separate from the now-qualified finite CAR algebra.

### Mixed distinct-mode candidate staged; independent CI gate not yet installed

The fifth-stage imaginary all-mode gate [40563502045](https://github.com/etblink/math/actions/runs/40563502045) is **TERMINAL SUCCESS**. The original compiler log records the five independent stage PASS markers, including `KOTLER_BFSS_IMAG_MAJORANA_ALL_MODE_ONE_ROOT_STRICT_PASS`. The source-exact `FCP.BFSSFermionF2B2Imag.majorana1_car_all` depends only on `propext`, `Classical.choice`, and `Quot.sound`. No source warnings, errors or `sorryAx`.

The next candidate was imported byte-for-byte from owner archive `contrib/kotler-bfss-consolidated-prep`: `SU2FermionF2B2MixedProbe.lean`, Git blob `526abb5d59547075709a52c1e0d44a30a8b5222f`, at [commit 2ebe2260](https://github.com/etblink/math/commit/2ebe2260ab17eca58e4cc095dc1d56ca5147381a). It imports only the strictly qualified imaginary all-mode parent and contains one proposed root, `majorana01_car_ne`, for **distinct-mode** mixed real/imaginary Majorana anticommutation. It has **zero newly accepted roots**.

The attempted write of a new exact-source strict CI workflow was blocked by the repository action safeguard before any workflow commit. Preserve this as an **infrastructure limitation**, not a Lean compiler red and not a theorem failure; do not promote the staged candidate or weaken the proven warning/axiom controls. A distinct verified workflow with the original Core, Fock/F2/F2B1/F2B2/F2B2Imag and mixed-source blobs, original dependencies, real `.olean`, Lean source-warning policy and one exact `#print axioms` root is still required. No new workflow was installed.

Owner canonical `main` and `mathcommunity/oai-math-revised` remain unmodified. No upstream PR was created.

### Mixed Majorana strict gate recovery and diagonal staging

The previous infrastructure boundary is superseded: a standalone owner-only strict workflow for the already staged distinct-mode candidate was successfully committed at [ceae27c5](https://github.com/etblink/math/commit/ceae27c56c779f311ae382f4072a5e0be4e9699a). [Run 40565636078](https://github.com/etblink/math/actions/runs/40565636078) was initiated. It pins the original BFSS Core, exact imaginary-all-mode parent and mixed-source blobs; restores the frozen Lean 4.34.1 / Mathlib d13f23b environment, builds the actual import closure, checks fresh nonempty compiled source, an exact single printed root `FCP.BFSSFermionF2B2Mixed.majorana01_car_ne`, and only the permitted Lean axioms with no source error/warning/sorryAx. **The source remains an unaccepted candidate until terminal green.**

A second exact owner-archive source `SU2FermionF2B2MixedDiagProbe.lean` (Git blob `d9d137fb01ae96d3d4828337a079aae861246508`) was staged atomically with a separate new same-mode strict workflow in [commit 151017cd](https://github.com/etblink/math/commit/151017cd630b51f98f8f93ace17bbd323849eee8). It imports the preceding distinct-mode source and targets only `FCP.BFSSFermionF2B2MixedDiag.majorana01_car_self`, **the same-mode** mixed CAR. The original generated workflow contained a duplicated wrong source-pin path and wrong declaration identifier. That initial source-integrity bug was corrected in [commit e6417df6](https://github.com/etblink/math/commit/e6417df68d3c93704d54396a4d4edd4e1483ba82), retaining full warnings/axioms checks. [Run 40565903133](https://github.com/etblink/math/actions/runs/40565903133) is the corrected strict gate; prior 40565824919 is superseded and must not be used for theorem acceptance.

Both candidate proofs remain **unaccepted** until terminal independently examined Lean runs. Neither new run should be conflated with the later `majorana01_car_all` theorem, original pairedTheta ordering, or a physical BFSS spectral theorem. Original community files, the owner canonical main branch and upstream mathcommunity PR state are unchanged.

### Indexed CAR admission chain staged (no premature acceptance)

Four sequential exact-source qualification gates are now active on this owner-only research branch:

| Gate | Run | Candidate root | Exact source blob | State at staging |
| --- | --- | --- | --- | --- |
| Mixed distinct-mode | [40565636078](https://github.com/etblink/math/actions/runs/40565636078) | `FCP.BFSSFermionF2B2Mixed.majorana01_car_ne` | `526abb5d59547075709a52c1e0d44a30a8b5222f` | pending |
| Mixed same-mode | [40565903133](https://github.com/etblink/math/actions/runs/40565903133) | `FCP.BFSSFermionF2B2MixedDiag.majorana01_car_self` | `d9d137fb01ae96d3d4828337a079aae861246508` | pending |
| Mixed all-mode | [40566255546](https://github.com/etblink/math/actions/runs/40566255546) | `FCP.BFSSFermionF2B2MixedAll.majorana01_car_all` | `71a174e955b5849e0309af15ddf2f2af437a4e2f` | pending |
| 48-index Majorana CAR | [40566511949](https://github.com/etblink/math/actions/runs/40566511949) | `FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car` | `98c41a0e617b70799b8c5280f9be95cd299a0bbd` | pending |

Each module is an unmodified owner-archived proof candidate, qualified only by its own independent source-hash-pinned Lean 4.34.1 / Mathlib d13f23b build, original BFSS Core pin, fresh actual compiled object, no Lean source warnings/errors/sorryAx, exact single printed theorem root and allowed axioms. Every gate imports its previous candidate and therefore has an explicit dependency chain, but **an upstream dependency is not promoted merely because a downstream source was staged**. Do not count additional roots until their own terminal strict run is reviewed.

The initial same-mode gate 40565824919 was **red for our generated CI preflight typo**, not a proof diagnosis. The checker was corrected in run 40565903133, preserving warning-as-error and axiom controls.

The eventual indexed CAR result, if accepted, applies to the exact `majoranaCandidate : Fin 24 × Fin 2 → BFSSOp` in these old formalizations. It is NOT an automatic source-label identification with later `pairedTheta`, a two-sign Spin(48) kernel, a Spin(9) lift, or BFSS spectral existence. Those obligations remain independent. No changes to canonical owner `main` or `mathcommunity`; no upstream PR.

### Distinct-mode mixed CAR strict acceptance (2026-10-27)

[Run 40565636078](https://github.com/etblink/math/actions/runs/40565636078), job `122406015667`, TERMINAL **GREEN**. Exact archived `SU2FermionF2B2MixedProbe.lean` Git blob `526abb5d59547075709a52c1e0d44a30a8b5222f` compiled against the actual source import chain, with fresh nonempty `.olean`, exact `FCP.BFSSFermionF2B2Mixed.majorana01_car_ne` proof root, permitted `propext, Classical.choice, Quot.sound` axioms and no Lean source warning, error or `sorryAx`. The log emitted `KOTLER_BFSS_MIXED_DISTINCT_MODE_ONE_ROOT_STRICT_PASS`. This is one new accepted root in the owner integration branch: real–imaginary Majorana anticommutation for `i ≠ j` only.

Separate [same-mode run 40565903133](https://github.com/etblink/math/actions/runs/40565903133), [all-mode run 40566255546](https://github.com/etblink/math/actions/runs/40566255546) and [48-index run 40566511949](https://github.com/etblink/math/actions/runs/40566511949) were still awaiting terminal verification at the time of this entry. Do not promote downstream claims from the accepted distinct-mode theorem alone.

### Same-mode mixed Majorana CAR strict acceptance

[Corrected run 40565903133](https://github.com/etblink/math/actions/runs/40565903133), job `122406942444`, completed **SUCCESS**. The original Lean compiler emitted the exact `FCP.BFSSFermionF2B2MixedDiag.majorana01_car_self` axiom report with `[propext, Classical.choice, Quot.sound]` and marker `KOTLER_BFSS_MIXED_SAME_MODE_ONE_ROOT_STRICT_PASS`. The exact archived source blob was `d9d137fb01ae96d3d4828337a079aae861246508`; the strict gate required nonempty compiled `.olean`, no `sorryAx`, no Lean source errors or warnings and the exact declaration name. Thus the same-mode mixed CAR adds exactly **one accepted root**. Earlier [40565824919](https://github.com/etblink/math/actions/runs/40565824919) failed at its mistaken source-hash preflight path; it remains preserved as CI-generation negative knowledge, not a compiler refutation.

The distinct-mode and same-mode mixed Majorana cases are now *both* independently qualified. The separate all-mode composition [40566255546](https://github.com/etblink/math/actions/runs/40566255546) and 48-index case [40566511949](https://github.com/etblink/math/actions/runs/40566511949) are still independent pending gates at this checkpoint.

### Mixed all-mode and indexed CI log-path failure: mathematical result versus strict acceptance

The initial [mixed all-mode run 40566255546](https://github.com/etblink/math/actions/runs/40566255546) terminated **RED** after compiling the genuine `FCP.BFSSFermionF2B2MixedAll.majorana01_car_all` theorem; the original Lean log printed only the allowed three axioms. The *post-compiler audit script* then raised `FileNotFoundError` because the script attempted `/tmp/mixed-car-strict.log`, whereas Lean output had been tee'd to `/tmp/mixed-all-strict.log`. No red Lean proof was observed. Nevertheless, do not count the root as strictly accepted from this run: audit and workflow must jointly pass.

The inherited indexed workflow had the same literal log-path mismatch (its actual tee filename is `/tmp/indexed-majorana-strict.log`). Both workflows were fixed in one atomic [commit 4272fc6c](https://github.com/etblink/math/commit/4272fc6c4c20fc2e63ba48648661bed88b10bc35), changing only the audit log readers. Original mathematical source blobs, source hash pins, actual compiled-object checks, warning-as-error and permitted-axiom policies are unchanged. Corrected [all-mode run 40567705519](https://github.com/etblink/math/actions/runs/40567705519) and [indexed run 40567705405](https://github.com/etblink/math/actions/runs/40567705405) were initiated.

The older indexed run 40566511949 used the incorrect script and is superseded even if its Lean source compilation is diagnostic. **No all-mode or indexed theorem root is accepted until the corrected full strict run reaches completed/success with exact source and declaration checks.** This incident illustrates the need for end-to-end path consistency checks in generated CI workflows before publication.

### Indexed CAR deprecation warning repair, unaccepted until full new gate

Superseded [indexed run 40566511949](https://github.com/etblink/math/actions/runs/40566511949) was **RED**. Its genuine Lean compiler printed `FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car` depending only on the permitted axioms, but reported **ten real source deprecation warnings**: four `if_pos` uses (suggested `ite_eq_left`) and six `if_neg` uses (suggested `ite_eq_right`). The run also inherited the now-fixed wrong audit log path. Therefore it did not qualify the theorem.

[Atomic source-and-CI commit f7604a05](https://github.com/etblink/math/commit/f7604a050164ccfa697da5a5a3bb456be43fb330) replaced only those ten deprecated theorem-name references in `SU2FermionF2B2IndexedProbe.lean`, leaving the complete original source theorem statement and all imports unchanged, and updated the exact workflow SHA pin in the same commit. Original indexed blob `98c41a0e617b70799b8c5280f9be95cd299a0bbd` changed to candidate `ff91c3e92369b7abd9cb861ec1cbbbd91f8d2293`. [New strict run 40568086683](https://github.com/etblink/math/actions/runs/40568086683) initiated.

The intermediate [40567705405](https://github.com/etblink/math/actions/runs/40567705405) still uses the old indexed source and must not be cited as acceptance evidence. Keep the new indexed theorem pending until the corrected run's exact compiled source/axiom/warning checks are independently terminal green.

### Archived thetaCandidate CAR field imported behind indexed source gate

[Owner-only commit 4b0be120](https://github.com/etblink/math/commit/4b0be120582f1de03878847ebd28ea1b8d06fabb) atomically introduced exact owner-archive `SU2FermionF2B2ThetaProbe.lean`, unchanged source Git blob `bc8fc9209fa2b907f0b372300868bc730b5fb5bd`, and a new strict source-hash-pinned workflow. Its sole proposed root is `FCP.BFSSFermionF2B2Theta.thetaCandidate_CAR`, the actual BFSS `AlgebraData 2` `theta_CAR` field signature **for the older `thetaCandidate` indexed by the existing `thetaLabelEquiv`**. It depends only on `SU2FermionF2B2IndexedProbe.lean` and preserves the exact old index map.

[Strict run 40568416897](https://github.com/etblink/math/actions/runs/40568416897) was initiated with original Core source pin, exact updated indexed-parent blob `ff91c3e92369b7abd9cb861ec1cbbbd91f8d2293`, this theta source blob, Lean 4.34.1/Mathlib d13f23b, actual import-closure compilation, fresh `.olean`, single exact printed root, no source errors, warnings or `sorryAx` and only three permitted axioms.

**Zero thetaCandidate_CAR roots are accepted until the strict job terminates green.** Even after acceptance this does not identify the `Fintype.equivFin`-indexed theta family with the FCP source-exact paired-spin `pairedTheta`; that is a separate source-label permutation proof and physical Spin lifting remains unproved. No upstream or owner-main write.

### Corrected all-mode and indexed strict runs accepted

- [Mixed all-mode run 40567705519](https://github.com/etblink/math/actions/runs/40567705519), job `122413287392`, TERMINAL **SUCCESS**, verified source-exact declaration `FCP.BFSSFermionF2B2MixedAll.majorana01_car_all`, axiom output `[propext, Classical.choice, Quot.sound]`, no Lean source errors/warnings/sorryAx, actual new `.olean`, and `KOTLER_BFSS_MIXED_ALL_MODE_ONE_ROOT_STRICT_PASS`. The source blob remains the unchanged owner-archived `71a174e955b5849e0309af15ddf2f2af437a4e2f`. One genuinely new accepted owner-integration theorem root.

- [Indexed 48 Majorana run 40568086683](https://github.com/etblink/math/actions/runs/40568086683), job `122414638261`, TERMINAL **SUCCESS**, verified `FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car` with only the same allowed Lean axioms, zero source warnings/errors/sorryAx, actual compiled `.olean`, and `KOTLER_BFSS_INDEXED_48_MAJORANA_ONE_ROOT_STRICT_PASS`. The *proof source* is the compiler-directed deprecation-cleaned SHA `ff91c3e92369b7abd9cb861ec1cbbbd91f8d2293`, **without changing the theorem statement**. One additional genuinely new accepted owner-integration root.

These two independent gates bring the contributed branch subtotal to **twelve qualified modules**. The source-exact 48-pair CAR is for the existing `majoranaCandidate` indexed by `Fin 24 × Fin 2`. It is NOT a proof that its current `thetaLabelEquiv` agrees with later `pairedTheta`/F20B order, nor a kernel/Spin lift or BFSS spectral theorem. Subsequent original thetaCandidate CAR proof has its own pending run `40568416897`.

### Original thetaCandidate CAR field strict acceptance

[Run 40568416897](https://github.com/etblink/math/actions/runs/40568416897), job `122415777438`, completed **SUCCESS** with the exact `FCP.BFSSFermionF2B2Theta.thetaCandidate_CAR` theorem rooted in the old accepted `thetaLabelEquiv` construction. The original Lean compiler log emitted only `[propext, Classical.choice, Quot.sound]` and `KOTLER_BFSS_ORIGINAL_THETA_CANDIDATE_CAR_ONE_ROOT_STRICT_PASS`. The source is the original imported archive blob `bc8fc9209fa2b907f0b372300868bc730b5fb5bd`, with no Lean source errors/warnings/sorryAx and nonempty compiled `.olean`. This gate adds **one accepted original-field CAR theorem root** on this owner branch, bringing the current contributed-module total to **thirteen strictly qualified BFSS modules**.

Important remaining math: this theorem is an actual original `AlgebraData 2` CAR **field-type** for this `thetaCandidate`. It does not establish a complete `AlgebraData 2` inhabitant (irreducibility and other fields separately owed), the exact source-ordered `pairedTheta` label mapping, global Spin(48) kernel classification, Spin(9) lift, or BFSS spectral existence. No upstream PR or source edits on `mathcommunity` were made.

### G1A source-label crosswalk — explicit permutation gate

The independent FCP source [SU2BFSSG1APairedThetaProbe.lean](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/experiments/openai-math-su2-concrete-potential/SU2BFSSG1APairedThetaProbe.lean), Git blob `4f8fbf05a35c1d625746931b7ff0361b7ffc2ec4`, defines the exact source `spinPairEquiv`, `colorModeEquiv`, and `pairedLabelEquiv` via two `finProdFinEquiv` packings. The older thetaCandidate `thetaLabelEquiv` uses `Fintype.equivFin`. No equality of these maps is asserted.

The new `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2PairedThetaLabelCrosswalkProbe.lean` reproduces those three *literal G1A index formulas* in a standalone contributor namespace, defines an explicit permutation `pairedToOldLabel := pairedLabelEquiv.trans thetaLabelEquiv.symm`, and proposes four independent roots: label crosswalk correctness, operator reindexing to the accepted old `thetaCandidate`, paired-family CAR, and paired-family self-adjointness. It does not prove the whole original G1A AlgebraData import closure, source Spin48 two-sign kernel, global Spin9 lift, irreducibility or spectral existence.

Its strict own-branch workflow `.github/workflows/bfss-kotler-paired-theta-label-crosswalk-strict.yml` pins source blobs, Lean 4.34.1, Mathlib d13f23b and original BFSS Core; builds actual accepted thetaCandidate ancestry; compiles the new Lean module to a fresh `.olean`; checks all four exact axiom-root declaration names and only `propext`, `Classical.choice`, `Quot.sound`, without source diagnostics or `sorryAx`. Until a full terminal green, **no crosswalk theorem is accepted**. No upstream PR, owner main change or community original file edit.

### G1A paired source crosswalk accepted and concrete even/odd bridge staged

[Strict run 40573189822](https://github.com/etblink/math/actions/runs/40573189822), job `122432557293`, TERMINAL **SUCCESS**. The original compiler output reports the four exact `FCP.BFSSPairedThetaLabelCrosswalk` theorem roots: `pairedToOldLabel_correct`, `pairedTheta_eq_reindexed_old`, `pairedTheta_CAR`, `pairedTheta_selfAdjoint`; each depends only on `propext, Classical.choice, Quot.sound`. The strict workflow compiled an actual fresh source `.olean` with zero Lean source warnings, errors or `sorryAx` and emitted `KOTLER_BFSS_PAIRED_LABEL_CROSSWALK_FOUR_ROOTS_STRICT_PASS`. Source exact G1A index formulas blob `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e` now belongs to **one accepted additional module**, bringing subtotal to **fourteen strictly qualified owner-branch BFSS modules**.

Mathematical interpretation: `pairedToOldLabel = pairedLabelEquiv.trans thetaLabelEquiv.symm` is an explicit proven permutation, NOT an identification of the two original map definitions. This bridges old accepted 48 Fock Majoranas to the G1A-paired indexed candidate. It does not import/verify the entire independent FCP G1A `AlgebraData` witness, complete source provenance across repos, or global Spin48/Spin9 / spectral claims.

Next exact original G1A even/odd spin-pair mode-selection theorems are staged as `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2PairedThetaConcreteModesProbe.lean` (new blob `ff6f9cf0fb497e8df57ece023b631afe406532f4`) and `.github/workflows/bfss-kotler-paired-theta-concrete-modes-strict.yml` (workflow blob `f28728c3b7bfe97bef3a344025f38f7773ba217c`). Its four roots `pairedLabel_even`, `pairedLabel_odd`, `pairedTheta_even`, `pairedTheta_odd` prove both components of each spin pair use the same color mode, with real/imaginary Majoranas respectively. The workflow pins the accepted crosswalk source and all ancestor identities, compiles the actual parent, then requires exact four theorem reports, fresh `.olean`, permitted axioms and no source diagnostics. **The second module remains UNACCEPTED until terminal strict green.** No upstream PR and owner main unchanged.

### G1A even/odd strict candidate run identity

The independent second-stage four-root G1A even/odd source-mode gate is [run 40574827766](https://github.com/etblink/math/actions/runs/40574827766), triggered by atomic proof/workflow/audit commit `41ac178374e6e3d81ea6085b3be53756dd8f3be2`. It must qualify its exact `SU2PairedThetaConcreteModesProbe.lean` source blob `ff6f9cf0fb497e8df57ece023b631afe406532f4` under the already accepted crosswalk blob `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e`. Until terminal compiler + axiom success the four even/odd roots are pending, with accepted contributed-module count remaining fourteen.

### Standalone original Source48 Clifford-axis geometry intake

The independent FCP original [S1V0 source](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS1V0StandaloneOrthogonalGeometryProbe.lean), source Git blob `22f3101b243a7b7857d9597b547322174d9281c8`, defines the actual source-size `Source48Label := Fin 24 × Fin 2`, `Source48Vector := Source48Label → ℝ`, weighted quadratic form, and orthogonal two-plane complement. It is a *standalone original-index geometry lane*, not an identification with BFSS Fock operators, group actions or source Clifford rotor.

Its complete Lean source was copied byte-for-byte into `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V0StandaloneOrthogonalGeometryProbe.lean` and independently gated via `.github/workflows/bfss-kotler-source48-geometry-strict.yml`. The strict workflow pins exact original source blob and toolchain, compiles fresh `.olean` using Lean 4.34.1/Mathlib d13f23b, requires exactly three declaration reports: `sourcePlane_decomposition`, `sourcePlaneComplement_ortho_first`, `sourcePlaneComplement_ortho_second`, no source warning/error/sorryAx and only the permitted axioms. **This adds no accepted theorem roots until terminal strict success.**

This parallel source-axis lane is intentionally separate from the qualified G1A paired-label index permutation. The next source-geometry target is FCP S1V5's exact sourceBlockColorLabel axes, followed by a source-exact bridge to the G1A paired labels, without adopting any unproved Spin48/Spin9 physical claim. No upstream PR / owner main modification.

### Accepted G1A even/odd source mode theorem family

[Strict run 40574827766](https://github.com/etblink/math/actions/runs/40574827766), job `122438327746`, TERMINAL SUCCESS. The imported G1A source formula module `SU2PairedThetaConcreteModesProbe.lean` blob `ff6f9cf0fb497e8df57ece023b631afe406532f4` compiled, producing a real `.olean`, four exact theorem reports `FCP.BFSSPairedThetaConcreteModes.pairedLabel_even`, `.pairedLabel_odd`, `.pairedTheta_even`, `.pairedTheta_odd`. Each reports only `propext, Classical.choice, Quot.sound`; there are no Lean warnings, errors or `sorryAx`. The decisive marker is `KOTLER_BFSS_PAIRED_EVEN_ODD_FOUR_ROOTS_STRICT_PASS`. This admits ONE additional BFSS module, bringing qualified owner integration branch total to **fifteen**.

The separately staged original Source48 Clifford geometry [run 40575551223](https://github.com/etblink/math/actions/runs/40575551223) was started against the complete unmodified FCP S1V0 blob `22f3101b243a7b7857d9597b547322174d9281c8`. It is still unaccepted until its independent strict gate succeeds. Its successor FCP S1V5 block/color axes is prepared off-branch with only the import path updated; do not stage the successor before S1V0 qualifies.

### Original S1V0 Source48 geometry red: four source hygiene warnings

[Strict run 40575551223](https://github.com/etblink/math/actions/runs/40575551223), job `122440895675`, completed **RED** specifically at the strict Lean warning audit, not at a missing proof. Lean compiled the original source and printed all three expected declarations depending only on `propext`, `Classical.choice`, `Quot.sound`. Four source warnings were confirmed: unused `hb` in the first orthogonality theorem, unused `ha` in the second, unused `sub_zero` in the first proof, unused `zero_mul` in the second. These are proof hygiene, not mathematical counterexamples.

The minimally corrected source retains all three theorem statements, their genuine original `Source48Label` and quadratic definitions, and all imports. The two unused binder names are prefixed with `_`; the two inert simp arguments are deleted. Exact original FCP blob `22f3101b243a7b7857d9597b547322174d9281c8`; cleaned candidate `65db1f822b86bfbf400957a0aaa94784d6cb7a39`. Source and strict workflow source pin were changed **in one atomic commit**, preserving warning-as-error and exact permitted-axiom validation. Until the replacement strict gate passes, S1V0 contributes **zero accepted roots**. No upstream PR / owner-main changes.

### S1V0 qualified; S1V5 exact block/color source-axis candidate imported

[Qualified S1V0 run 40576686825](https://github.com/etblink/math/actions/runs/40576686825), job `122444882506`, TERMINAL **SUCCESS**, actual compiled object and exactly three source theorems: `sourcePlane_decomposition`, `sourcePlaneComplement_ortho_first`, `sourcePlaneComplement_ortho_second`; all have only `propext, Classical.choice, Quot.sound`, no Lean warnings, errors or `sorryAx`. The decisive original CI marker was `KOTLER_BFSS_SOURCE48_GEOMETRY_THREE_ROOTS_STRICT_PASS`. Admits one new module: total **16 strictly qualified owner branch BFSS modules**.

Next FCP S1V5 source is imported from [the source repository](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe.lean), original blob `6d15a3a76625b3677f132c544f71e5d5eb1dc93c`. The **only source modification** in owner math port blob `12230c84dc5913ae8dd875abe22b079ee19d419f` is substituting the original standalone S1V0 relative import with its exact contributor module import path. The `S1V5` definitions and five printed theorem statements/proofs are unchanged.

Source and independent source-hash-pinned strict workflow `.github/workflows/bfss-kotler-source48-block-color-axes-strict.yml` (blob `4e5bb5de0cd0df3122fd221543b23863697169c4`) are committed atomically. This gate builds the accepted **corrected** S1V0 parent blob `65db1f822b86bfbf400957a0aaa94784d6cb7a39`, checks the exact 48-real mode/color source labels and coordinate axes with five `#print axioms` declarations, a newly compiled nonempty `.olean`, no source errors/warnings/sorryAx and only permitted axioms. **S1V5 remains unaccepted until its own terminal green**. The downstream S1V7 source-label equality is prepared but must await S1V5 qualification; source-label geometry and 48-Majorana Fock operator action are distinct obligations. No upstream mathcommunity PR or owner main update.

### S1V5 current verification and prepared S1V7 source-label bridge

The exact original S1V5 block/color source-axis module (only import path rebased) has source blob `12230c84dc5913ae8dd875abe22b079ee19d419f`. Its standalone five-root strict [run 40577765764](https://github.com/etblink/math/actions/runs/40577765764) was started from atomic source/workflow/audit commit `38c2a64bee9b9137a77d7c3a95765d9e38d26b90`, against accepted S1V0 source `65db1f822b86bfbf400957a0aaa94784d6cb7a39`. Gate terminal result remains necessary for admission.

Prepared but **NOT yet committed** downstream original FCP S1V7 source adaptation: original blob `ac7955db39a08abc987f28a3ed6dd71b878a1b76`, prepared etblink/math blob `218a419500ca208a2bc26e1528a11b62fa3802f0`. Only two relative import lines and the namespace opening are adapted to the accepted contributor definitions; both theorem statements/proofs are unchanged. Prepared independent source-pinned workflow blob `2d146d36194907e69141e37c86324901208cd7e5` explicitly imports qualified S1V5 and G1A paired index crosswalk; two required roots are `sourceColorModeEquiv_eq_original` and `sourceBlockColorLabel_eq_original_paired`. These blobs are NOT branch-admitted and are not verification evidence until S1V5 qualifies and the S1V7 workflow is actually committed and run.

Source geometry and labels do not prove the original Spin48 Clifford Fock intertwiner or BFSS spectral existence. No upstream mathcommunity PR and no changes to owner main.

### S1V5 first strict gate red: single unused simp argument, repaired without theorem changes

[Run 40577765764](https://github.com/etblink/math/actions/runs/40577765764), job `122448657035`, TERMINAL **RED** at its warning-as-error validator, after fresh original source compilation and five exact permitted-axiom declarations. The single Lean source warning is line 87 unused `Pi.single_apply` in `sourceBlockColorAxis_other`. This was not a mathematical refutation or missing Lean proof, but is correctly a strict-gate failure; **zero S1V5 roots accepted from the red run**.

The repaired S1V5 module deletes only this inert simplifier argument; its definitions, theorem statements, dependencies and remaining proof steps are identical. The prior source blob `12230c84dc5913ae8dd875abe22b079ee19d419f` becomes candidate `fad0eab5014aa038ddb0bf8411b0e81c358e7908`, with exact source hash updated atomically in the strict workflow. The replacement run remains the admission authority. FCP original source blob `6d15a3a76625b3677f132c544f71e5d5eb1dc93c` is preserved as archival provenance, not confused with the warning-cleaned module. Downstream S1V7 label equality remains unqualified until the new S1V5 gate is terminal green.

### Project Lead successor chain and source-hash preflight, current gate

S1V5 exact-source strict run [40577765764](https://github.com/etblink/math/actions/runs/40577765764) was RED for one *genuine* unused `Pi.single_apply` simp argument at source line 87. It had already compiled and emitted all five source-typed permitted-axiom reports. This is proof hygiene, not an absent mathematical proof. Repaired module Git blob `fad0eab5014aa038ddb0bf8411b0e81c358e7908` deletes only that simp argument, and the source-hash-pinned workflow was updated atomically at [commit f83bf074](https://github.com/etblink/math/commit/f83bf0746ab7155274f9eff04cf206d9eeef1ba7). Qualifying replacement [run 40579339667](https://github.com/etblink/math/actions/runs/40579339667) is the required independent terminal authority. S1V5 remains unaccepted pending that run; do not use previous run's mathematical compiler output to claim a green strict gate.

On terminal S1V5 success, the next **source-exact label bridge** is the FCP `S1V7` candidate: `SU2BFSSPhysicalDomainS1V7OriginalSourceSixteenBlockLabelBridgeProbe.lean`. Prepared source Git blob `218a419500ca208a2bc26e1528a11b62fa3802f0`, modifying only two original relative import names and namespace opening. Prepared source-pinned strict workflow blob `d5582f7416dd5617df1fb31af41d69331a2562e8`, which now pins the repaired S1V5 blob `fad0eab5014aa038ddb0bf8411b0e81c358e7908` plus accepted G1A paired-label crosswalk. Two proposed roots: `sourceColorModeEquiv_eq_original` and `sourceBlockColorLabel_eq_original_paired`. These blobs are **prepared, not committed or accepted**.

If S1V7 also qualifies, a further *operator-index* crosswalk `SU2BFSSSource48FockIndexBridgeProbe.lean` has prepared candidate blob `6d732c1acea271b7aba948c95755ac73d2d0fc0a` and workflow blob `16225643f47822eada27cda5af1679e0a59904cd`, one proposed root `sourceBlockColorMajorana_eq_G1APairedTheta`. This identifies operators indexed by the original source label, **not** an original Clifford representation, Spin(48) kernel, global Spin(9) lift or spectral existence. Keep all descendants gated and regenerate their parent pins if any parent source changes.

Do not import the near-duplicate FCP `S1V52L9D0` label bridge solely to increase green counts: the first value comes from genuinely resolving the S1V7 equivalence and source-indexed Fock operator identification. No upstream PR and canonical owner main unchanged.

### Original Source48 S1V5 strict green and source-exact S1V7 candidate

[Corrected run 40579339667](https://github.com/etblink/math/actions/runs/40579339667), job `122454203621`, completed **SUCCESS** on exact source blob `fad0eab5014aa038ddb0bf8411b0e81c358e7908`. Lean freshly compiled the actual FCP S1V5 block/color source input and proved the five audited declarations (`sourceColorModeEquiv`, `sourceBlockColorEquiv`, `sourceBlockColorLabel_injective`, `sourceBlockColorAxis_self`, `sourceBlockColorAxis_other`) with only `propext, Classical.choice, Quot.sound`, no Lean source warning/error or `sorryAx`. Marker `KOTLER_BFSS_SOURCE48_BLOCK_AXES_FIVE_ROOTS_STRICT_PASS`. This admits exactly **one new qualified module**: **17 BFSS contributor modules** on owner integration branch. Do not double-count definitions as mathematical theorems: this gate audits two equivalence definitions plus three theorem statements.

S1V7 was staged using the FCP original [source-label bridge](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS1V7OriginalSourceSixteenBlockLabelBridgeProbe.lean) original blob `ac7955db39a08abc987f28a3ed6dd71b878a1b76`. Contributor source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V7OriginalSourceSixteenBlockLabelBridgeProbe.lean`, blob `218a419500ca208a2bc26e1528a11b62fa3802f0`, adapts only its two relative imports and the namespace open to the already accepted G1A crosswalk and original S1V5; theorem statements and proofs are preserved. Its two statements are `sourceColorModeEquiv_eq_original` and `sourceBlockColorLabel_eq_original_paired`, directly identifying the FCP original Source48 block/color mode packing with the true G1A paired labels.

The separate source-hash-pinned `.github/workflows/bfss-kotler-source48-g1a-label-equality-strict.yml`, workflow blob `d5582f7416dd5617df1fb31af41d69331a2562e8`, restores exact Lean 4.34.1 / Mathlib d13f23b, verifies original Core, S1V0, accepted S1V5 and G1A crosswalk blobs, builds both actual parents, compiles the two new declarations and requires a fresh `.olean`, exactly two qualified axiom reports, no source warnings/errors/sorryAx and only the three permitted axioms. **S1V7 remains unaccepted until terminal strict success.** The already prepared operator-index bridge is a later separate obligation, not a source Clifford representation intertwiner. No upstream mathcommunity PR or canonical owner-main write.

### S1V7 strict qualification run and concrete operator-index successor

The source-exact S1V7 block/color paired-label bridge was atomically staged with its separate two-root workflow at [commit f6637f9b](https://github.com/etblink/math/commit/f6637f9bc81349bb6947d505286a4e43d5144e36). The [strict gate run 40580511969](https://github.com/etblink/math/actions/runs/40580511969) was initiated. Its source SHA is `218a419500ca208a2bc26e1528a11b62fa3802f0` (only exact original FCP imports and namespace rebase); the original `S1V5` parent is strictly qualified at run 40579339667. Until its own terminal green, S1V7 has **zero** accepted roots.

Prepared but NOT committed next `SU2BFSSSource48FockIndexBridgeProbe.lean`, Git blob `6d732c1acea271b7aba948c95755ac73d2d0fc0a`, with independent strict workflow blob `16225643f47822eada27cda5af1679e0a59904cd`. Its sole target `sourceBlockColorMajorana_eq_G1APairedTheta` states `majoranaCandidate (sourceBlockColorLabel (j,s) A) = pairedTheta (spinPairEquiv.symm (j,s)) A`, using the accepted G1A pairedTheta source formula and *pending* S1V7 index equality. This is an operator **indexing** theorem, not original Clifford algebra representation intertwining. The dependent candidate shall be gated only if S1V7 passes, with source and strict verifier committed atomically and exact parent pins retained. No upstream PR and no change to owner main.
