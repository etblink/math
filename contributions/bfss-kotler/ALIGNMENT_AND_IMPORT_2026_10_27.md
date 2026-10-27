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
