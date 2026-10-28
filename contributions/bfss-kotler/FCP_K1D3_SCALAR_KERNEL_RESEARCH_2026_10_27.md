# K1D3 scalar common-kernel — bounded independent qualification

## Independent owner acceptance and branch governance — 2026-10-28 UTC

**CURRENT STATUS: STRICT OWNER CI ACCEPTED (2/2 new theorems).** [Run #40614683436](https://github.com/etblink/math/actions/runs/40614683436), job `122574292503`, completed with conclusion `success` (attempt 1), exact tested SHA [`48037c4a6099a4e3ef5d7171a43164778e386109`](https://github.com/etblink/math/commit/48037c4a6099a4e3ef5d7171a43164778e386109). The workflow independently requalified all **22 ancestry modules / 47 roots**, then compiled both K1D3/K1D4 source files strictly, producing marker `FCP_K1D3_SOURCE_SCALAR_COMPOSITION_STRICT_PASS modules=2 roots=2`. Only axioms `propext`, `Classical.choice`, `Quot.sound`; no source warnings/errors or `sorryAx`. It uploaded artifact [`12783904075`](https://github.com/etblink/math/actions/runs/40614683436/artifacts/12783904075). The scoped qualified contributor count advances from **49 to 51**. The previous CANDIDATE status and prospective CI contract below are historical; they are superseded by this exact receipt.

**Branch roles (read-only preservation until a deliberate integration decision):**

| Owner branch | Role | Decision |
|---|---|---|
| `main` | Fork baseline | Do not merge research or rewrite without explicit owner decision |
| `integration/community-20261027-bfss` | Community-aligned checkpoint; 28 accepted contribution modules | Keep as fixed provenance checkpoint |
| `integration/fcp-k1d2-pbw-20261027` | Accepted import/PBW/Spin48 ancestry checkpoint; 49 scoped modules | Keep as stable qualified parent; no new proof work here |
| `research/fcp-k1d3-scalar-kernel-20261027` | Accepted extension with 2 new scalar compositions; 51 scoped modules | Advance future work in named descendants; preserve tested SHA |
| `contrib/kotler-bfss-consolidated-prep` | Legacy 131-Lean-source preparation archive | **Quarantine**; no blanket merging; classify by accepted theorem and dependency |
| `contrib/kotler-bfss-spin-plane-covariance` | Historical small spin-plane proof lane; owner draft PR #1 | Keep separate for independent review; do not silently fold into larger integration |

**Upstream submission policy:** The intended review destination is `mathcommunity/oai-math-revised`, a sibling fork of `openai/math`. At review, its main tip is `2a6ea33834056b87356e0e06bf9cbc2ea028b213`. GitHub's cross-fork comparison finds the current owner research branch 94 commits ahead / 0 behind that exact upstream tip and 130 changed files, many internal workflow/audit files. **Do not submit this research branch directly.** When authorized, create a fresh `proposal/` or `contrib/upstream-` branch *from the then-current* `mathcommunity/oai-math-revised:main`, port the smallest self-contained qualified dependency bundle(s), and independently compile and audit them against the actual target tree. Prepare a reviewable theorem map, precise scope/limitations, reproducible Lean instructions, and cite exact owner CI evidence. Exclude internal trigger-only commits, bulk compiler logs, superseded experimental files, and unrelated artifacts from the PR delta. Preserve full negative evidence in the owner research record with public links.

The upstream [README](https://github.com/mathcommunity/oai-math-revised/blob/main/README.md) and [PR template](https://github.com/mathcommunity/oai-math-revised/blob/main/.github/pull_request_template.md) ask contributors to **disclose substantial LLM, proof-assistant, or software assistance** and document any manuscript-specific changes under `preprints/<paper>/NOTES.md` where applicable. Respect that request. The original owner draft PR [#1](https://github.com/etblink/math/pull/1) is not an upstream PR, remains separate, and must not be merged implicitly.

**Authorization boundary:** No upstream PR, upstream issue/comment, owner `main` merge, or experimental archive promotion has been authorized. An upstream PR requires a separate explicit owner go-ahead. The immediate next theorem target is **source-exact Clifford scalar transport** via pinned Mathlib `changeForm_algebraMap`, before any two-sign Spin(48) kernel claim.

### Historical pre-CI plan

The original candidate and gate-readiness notes below preserve the pre-success chronology; they must not be mistaken for the current status.


**Current state: CANDIDATE / OWNER STRICT CI NOT YET QUALIFIED.**
Owner research branch: `research/fcp-k1d3-scalar-kernel-20261027`.
Parent accepted import checkpoint: `integration/fcp-k1d2-pbw-20261027@4fb719fa729e5cea1c6c21999d8bfcbb7984a8ef`.
That checkpoint admits 49 modules in its bounded scope, supported by the exact-source PBW and Spin48 ancestry strict runs [40611734249](https://github.com/etblink/math/actions/runs/40611734249) and [40611734284](https://github.com/etblink/math/actions/runs/40611734284) on SHA `25a8de278788ef251cc6076784191717fd6bb2bb`.

## Exact proof objectives

1. **K1D3 exterior composition**, source blob `04c477227d2a535e01abe0e01ea1ae57ff116321`, one declaration root: `FCP.BFSSS1V52K1D3.originalExteriorScalar_of_all_coordinateContractions_zero`. If every original Source48 coordinate contraction of the genuine exterior-algebra element vanishes, then the element is scalar. Directly compose the accepted F2 no-occupied-labels result with the *statement-preserving repaired* E5 scalar reconstruction; no new coefficient-contraction lemma is invented.
2. **K1D4 original Spin48 exterior consequence**, source blob `271865855ec72fc428fe29aa005392273fad165f`, one declaration root: `FCP.BFSSS1V52K1D4.originalSourceSpin48_trivialAction_exterior_scalar`. The accepted K1D1 original half-unit polar-to-coordinate identity produces exactly the hypotheses of K1D3 for the exterior image of a genuine source Spin48 vector-action kernel element.

Actual upstream owner parents:
- F2 `eada39fbd5891865e9662a610cf10deb584834da`
- repaired E5 `31f171b108b06c995824cdb84ad70f26f1060b10`
- original K1D1 `7e91352f3d3134b54bbc4e26e0caf702c36f2fa0`.

The original 48 real labels and source-defined quadratic form are unchanged. Neither result treats `CliffordAlgebra.equivExterior` as an algebra homomorphism. The *image in the exterior algebra* being scalar is not yet the same as a proved *Clifford scalar*, until explicit preservation of scalar algebra maps under the real-linear equivalence is qualified.

## Verification contract

The new source-exact strict owner workflow `.github/workflows/bfss-kotler-k1d3-scalar-kernel-owner-strict.yml` pins both source Git blobs and verifier `281a07aeb0a4137a9106930da18f4c6f4cd84035`. With the same Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, it requalifies the accepted 22-module/47-root ancestry closure, then freshly compiles the two new candidate sources with warning-as-error, genuine compiled `.olean` outputs, exact two-root axiom checks (only `propext`, `Classical.choice`, `Quot.sound`) and type evidence. Evidence is archived for both success and failure.

**Fail closed.** A failed, missing, partial or still-running gate does not increase the 49-module accepted count. If only K1D3 compiles in an unsuccessful batch, it is a useful debugging observation, not independent acceptance of the complete new gate.

## Explicit unresolved obligations

- Prove transport of the scalar conclusion back through the exact `CliffordAlgebra.equivExterior` real-linear equivalence using the pinned Mathlib `changeForm_algebraMap` theorem; do not assume it preserves multiplication.
- Establish actual original Spin(48) kernel membership as the two central signs, including the separately tracked negative central representative and exclusion of other scalar Spin elements.
- Keep covering theory, global Spin(9) construction, BFSS spectral questions, and all other physical existence claims separate.
- Do not modify `main`, the parent accepted branch, FCP, or upstream `mathcommunity/oai-math-revised`.

This record is scoped to a new, proof-level extension of the already qualified 21-module owner import. It neither bulk-imports FCP's historical archive nor asserts synchronization of the entire research program.
