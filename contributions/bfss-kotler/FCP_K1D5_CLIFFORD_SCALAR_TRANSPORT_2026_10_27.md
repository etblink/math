# K1D5 — original Clifford scalar transport

**State: CANDIDATE, pending independent owner strict CI.**
Research descendant branch: `research/fcp-k1d5-clifford-scalar-20261027`.
Accepted owner ancestor: `research/fcp-k1d3-scalar-kernel-20261027@ff7f1c025ad12097c145016975de9ef875e146ed`.
Previously qualified contributor modules: **51**, with K1D3/K1D4 independently accepted by [run 40614683436](https://github.com/etblink/math/actions/runs/40614683436) (exact tested SHA `48037c4a6099a4e3ef5d7171a43164778e386109`). No current acceptance promotion is made before a new independent gate.

## Exact new proof obligations

File: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D5OriginalCliffordScalarTransportProbe.lean`, pinned Git blob `afea20ff18e9ea7d03fc5dba5aa3c32fa0b830e5`.

1. `FCP.BFSSS1V52K1D5.originalSource_equivExterior_algebraMap` proves the source-defined real-linear Clifford-to-exterior equivalence maps each original Clifford scalar `algebraMap ℝ C c` to its matching exterior scalar `algebraMap ℝ E c`.
2. `FCP.BFSSS1V52K1D5.originalSourceSpin48_trivialAction_clifford_scalar` combines K1D4's accepted exterior-scalar consequence with **injectivity of the actual source `CliffordAlgebra.equivExterior Q`**, proving each original Spin(48) vector-action kernel element is a scalar in the genuine Clifford algebra.

**Pinned Mathlib source evidence.** `leanprover-community/mathlib4@d13f23b723b8a846827a245b89c10fc7d3f11612`, `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`, contains `changeForm_algebraMap` (at approximately line 269), `changeFormEquiv` and `equivExterior` (approximately lines 333–355). The former explicitly preserves the scalar algebra map, while the latter is a *real-linear* equivalence. No algebra equivalence or multiplication preservation is assumed. Existing qualified K1D0 uses the same exact `changeFormEquiv_apply` rewrite.

## Strict gate and acceptance

Workflow: `.github/workflows/bfss-kotler-k1d5-clifford-scalar-owner-strict.yml`.
Standalone verifier: `contributions/bfss-kotler/tools/qualify_fcp_k1d5.py`, Git blob `a41f6aaf497eeb2c3cebb2382592fa4ecb50effd`.

The gate pins Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; freshly requalifies 22 original ancestor modules / 47 declaration roots and K1D3/K1D4 / 2 roots; then demands fresh K1D5 compilation, a real `.olean`, exact two `#print axioms` reports, theorem-type checks, no source warnings or errors, and no `sorry`, `admit`, `sorryAx`, or added axioms. Only `propext`, `Classical.choice`, and `Quot.sound` may appear.

**Admit only after a clean independent gate** on the exact tested SHA and review of compiler logs. If red, preserve the failure and revise on this research branch; do not change theorem statements merely for a green check. Only an accepted gate can change 51 to 52 accepted scoped owner contributor modules.

## Unproved / excluded claims

A scalar Clifford representative is not yet classified as `+1` or `-1` under the original Spin group membership hypotheses. The separately tracked negative central representative, converse sign inclusions, covering and global Spin(9) lift, and BFSS spectral existence remain separate obligations. A future original two-sign kernel theorem requires *actual Spin membership* and scalar norm/unit arguments, not a leap from the exterior scalar result. No bulk import of the FCP archive and no replacement of the accepted import snapshots.

## Upstream review discipline

`etblink/math` is a fork of `openai/math`; the intended eventual community contribution is to `mathcommunity/oai-math-revised`, a sibling fork. Keep this research branch and its full compiler history as owner evidence. Upon **future explicit approval**, prepare a clean `contrib/upstream-*` branch from the then-current community `main`, cherry-picking/recreating only qualified theorem/dependency files and concise reproducibility instructions. Requalify against the upstream tree, disclose substantial LLM/proof-assistant assistance in accordance with the upstream README, and avoid bundling internal CI-trigger and provenance files into the upstream diff. Do **not** open a PR, modify upstream, or merge owner `main` without owner authorization.
