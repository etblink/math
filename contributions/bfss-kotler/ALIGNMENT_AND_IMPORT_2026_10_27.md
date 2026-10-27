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
