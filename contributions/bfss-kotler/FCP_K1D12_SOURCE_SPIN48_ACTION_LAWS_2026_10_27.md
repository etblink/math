# K1D12 — exact original Spin(48) real-vector action laws

## Independent strict acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED — 59 scoped contributor modules, 67/67 selected declaration checks.** Independent [strict run #40632924482](https://github.com/etblink/math/actions/runs/40632924482), job `122633242128`, attempt 1, completed `success` on exact source-tested SHA [`8f587c246e77783abad13d70d0e4d9fbee14c6c3`](https://github.com/etblink/math/commit/8f587c246e77783abad13d70d0e4d9fbee14c6c3). The workflow recompiled all **65 previously accepted declaration roots** and freshly compiled the two K1D12 declarations. Terminal marker `FCP_K1D12_SOURCE_SPIN48_VECTOR_ACTION_LAWS_STRICT_PASS modules=1 roots=2`. Both root axiom reports contain only `propext`, `Classical.choice`, `Quot.sound`; there are no Lean source warnings/errors or `sorryAx`. [Immutable compiler and root-type artifact #12792194240](https://github.com/etblink/math/actions/runs/40632924482/artifacts/12792194240) is preserved.

**Precisely proved:** for the genuine original S1V31 Spin48 action on `Source48Vector`, real scalar-linearity `sourceSpin48VectorAction s (r • v) = r • sourceSpin48VectorAction s v`, and multiplicativity `sourceSpin48VectorAction (s*t) v = sourceSpin48VectorAction s (sourceSpin48VectorAction t v)`. Source-defined S1V31 additivity and K1D11 identity/trivial-action kernel were previously accepted.

**Not yet qualified:** a packaged group homomorphism into real linear equivalences, quadratic isometry, special orthogonal image, surjectivity/covering, global Spin9, and BFSS spectral existence. The candidate wording below is a retained historical pre-CI record, not a current status.

**Runtime note:** The run took approximately 12m 07s; pinned Lean/Mathlib dependency restoration and fresh ancestry qualification remained mandatory. No qualification rule was relaxed.

### Archived pre-qualification handoff


**STATE: RESEARCH CANDIDATE — NOT YET STRICT QUALIFIED.** This is an owner-controlled descendant `research/fcp-k1d12-action-laws-20261027` of qualified parent `research/fcp-k1d11-exact-kernel-20261027@1436eede86656509e95a57c033fe5ead46a91230` (documentation-only acceptance record).

## Accepted ancestry

K1D11 passed [independent strict run #40631762187](https://github.com/etblink/math/actions/runs/40631762187), job `122629519879`, at source-tested SHA `bde1b50da7719eafc05ae015c8b1490c8aa896c1`. This established the **exact two-sign pointwise kernel** of the original source Spin48 action and distinctness of the two genuine group elements. The selected accepted baseline is now **58 contributor modules, 65 strict declaration roots**, with no unpermitted axioms.

The original S1V31 source `sourceSpin48VectorAction` takes the unique real vector represented by actual Clifford-generator conjugation. Its accepted `sourceSpin48VectorAction_add` proves additivity. K1D10's accepted Clifford-star bridge and K1D11's exact pointwise-fixer theorem do not separately establish the action composition law or real scalar-linearity; these are the new obligations.

## Two new source-exact roots

Candidate file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D12OriginalSpin48VectorActionLawsProbe.lean`, pinned Git blob `f86c202f3a727d5f931c068656662e550de240c9`.

1. `FCP.BFSSS1V52K1D12.originalSourceSpin48VectorAction_smul` establishes that the exact source Spin action commutes with **real scalar multiplication**, using the original injective generator and pinned Mathlib `ConjAct.unitsSMulCommClass'`.
2. `FCP.BFSSS1V52K1D12.originalSourceSpin48VectorAction_mul` establishes that `sourceSpin48VectorAction (s*t) v = sourceSpin48VectorAction s (sourceSpin48VectorAction t v)` for the **genuine original Spin48 subtype**, transported through the source Clifford generator using `spinGroup.toUnits`, `ConjAct.toConjAct`, and their true multiplicative homomorphisms.

The method does not introduce a surrogate action, rely on an assumed Clifford algebra inverse, infer multiplicativity of the scalar-only `equivExterior`, or alter S1V31.

**Not yet established:** a separately bundled Spin48 → real-linear automorphism representation (although additivity already holds), preservation of the source quadratic form, determinant +1, surjectivity onto SO(48), topology/covering, global Spin9, BFSS spectra. The K1D11 pointwise stabilizer should not be silently relabeled as a homomorphism kernel until such a map exists.

## Independent acceptance contract

Strict workflow `.github/workflows/bfss-kotler-k1d12-source-spin48-action-laws-owner-strict.yml`, source-pinned verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d12.py` (Git blob `1cf3727c6292352d392e4d8a38c37b6933613577`), Lean 4.34.1, and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Requalify **all 65 accepted roots** (original 22-module/47-root ancestry, K1D3/K1D4 2 roots, K1D5–K1D10 12 roots, K1D11 4 roots); then independently compile the new K1D12 module with warning-as-error, a nonempty `.olean`, exact two declaration axiom reports, root type checks, and only `propext`, `Classical.choice`, `Quot.sound`. Preserve stdout/stderr logs and results as GitHub artifacts on success or failure.

**Fail closed:** any red or incomplete gate is negative evidence, not acceptance. Only an independently reviewed terminal green on the exact source SHA may advance this scope to **59 accepted contributor modules and 67 selected roots**.

## Runtime, branch roles, and community PR boundary

The K1D11 green gate ran roughly 9m 26s; environment restoration and complete ancestor requalification remain deliberate safety gates, with any future optimization separately qualified. Maintain one authoritative research handoff per theorem; frozen accepted parent branches serve as audit checkpoints, not giant upstream PR payloads. The eventual PR to `mathcommunity/oai-math-revised` requires explicit owner authorization and a new minimal independently requalified submission branch from then-current community `main`, with substantial proof/software assistance disclosed. Do not merge the owner's `main`, open an upstream PR, or modify the upstream repository at this stage.
