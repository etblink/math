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
`.github/workflows/bfss-spin-plane-covariance-integration.yml` qualifies
the previously green spin-plane proof on the aligned branch, with actual
`AlgebraData` and gamma source SHA checks. The separate matrix workflow
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
