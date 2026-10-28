# K1D9 — actual negative central Spin48 membership

## Independent strict acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED — 56 scoped contributor modules and 59/59 checked declaration roots.** [Owner strict run #40626355158](https://github.com/etblink/math/actions/runs/40626355158), job `122612087375`, attempt 1, terminal `completed/success`, exact tested commit [`eeffeade763346c5a8a1278224ef492fb3da48a3`](https://github.com/etblink/math/commit/eeffeade763346c5a8a1278224ef492fb3da48a3). The verified original ancestry and K1D3–K1D8 57 ancestor roots all passed, followed by two freshly compiled K1D9 declarations. Terminal marker: `FCP_K1D9_NEGATIVE_CENTRAL_MEMBERSHIP_STRICT_PASS modules=1 roots=2`. Both root axiom lists contain only `propext`, `Classical.choice`, `Quot.sound`; no new source warnings or errors. [Immutable workflow evidence artifact 12789558908](https://github.com/etblink/math/actions/runs/40626355158/artifacts/12789558908) preserves the complete compiler and root-type record.

The repaired source successfully establishes unconditional `(-1 : CliffordAlgebra source48Quadratic) ∈ spinGroup source48Quadratic` using exact source coordinate vectors and real Clifford generator units. The original [red #40624928666](https://github.com/etblink/math/actions/runs/40624928666) and its elaboration timeout remain part of the negative-evidence history; neither of its failed theorem declarations was retroactively accepted.

**Still unproved:** the constructed negative-central Spin element acts trivially on every original Source48Vector, the reverse inclusion and the exact two-sign group kernel equality, covering, global Spin(9), and BFSS spectral assertions. Old CANDIDATE status below is the deliberately preserved pre-qualification record.

### Archived pre-acceptance evidence and candidate charter


## Gate 1 failure and source-exact repair (2026-10-28 UTC)

**Gate 1 RED, NOT ACCEPTED:** [run 40624928666](https://github.com/etblink/math/actions/runs/40624928666), job `122607455739`, tested `94e12fb04d5250228d3422f3f3b80bc83483ac45`. All 57 accepted ancestor roots passed independently. The new source failed at original lines 41–43 (Lean deterministic `isDefEq` timeout) and the first theorem declaration at line 26 (`whnf` timeout), each at 400000 heartbeats. The second theorem's unknown-first-theorem error and phantom axiom report are downstream of the first failure, not independent proof acceptances. [Failed-run artifact 12788708833](https://github.com/etblink/math/actions/runs/40624928666/artifacts/12788708833) preserves exact compiler evidence.

**Repair candidate (same two theorem statements):** replace eager `change` expansion of `lipschitzGroup Q` into the full `Subgroup.closure` on source `Cˣ` with direct uses of `Subgroup.subset_closure` applied to exact original Clifford generator witnesses; increase per-module elaboration heartbeats to 900000 as an auxiliary budget, **not** as evidence of correctness. Re-pin the source and verifier in the strict workflow. No new axioms, sorry, hidden group-membership assumption, or surrogate representation. New source Git blob: `d3f25e766279f1452c69608d420ed3689508d8ba`. New verifier blob: `339115c21cdf28881e942c77bfe5b604f04c826d`.

**Fail-closed rule:** neither the original failed proof nor the repair candidate counts toward acceptance without a completed, source-exact, independently inspected strict green job. Baseline remains 55 modules / 57 selected roots. The negative central vector-action claim and full two-sign kernel equality remain separate, unproved obligations.

### Original pre-Gate-1 candidate charter


**STATUS: UNQUALIFIED CANDIDATE.** Baseline remains **55 accepted scoped contributor modules / 57 selected declaration roots**, through independently qualified K1D8 [run 40623452807](https://github.com/etblink/math/actions/runs/40623452807), exact tested SHA `7e3cb0d2aacd96d522a945f094656638ef072a75`. The parent owner research branch `research/fcp-k1d8-two-sign-upper-bound-20261027` has documentation-only acceptance head `e891b38755c142fcf4d3d4ee179ef16f04599fcf`.

K1D9 is isolated on new owner descendant `research/fcp-k1d9-negative-spin-20261027`.

## Goal and exact Mathlib scope

K1D8 established that an element of `spinGroup source48Quadratic` with trivial action on all original 48 real vectors has **Clifford value one or negative one**. It did *not* prove the reverse inclusion of negative one in the actual Spin group. To close that distinction, K1D9 targets only the actual group membership of negative Clifford one. It does not target the action, two-sign kernel equality or covering.

The pinned Mathlib `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` defines:
- `lipschitzGroup Q` by `Subgroup.closure` of actual Clifford units lying in the range of the original `CliffordAlgebra.ι Q`;
- `pinGroup Q` as the image of that Lipschitz subgroup into the Clifford algebra intersected with `unitary`;
- `spinGroup Q` as `pinGroup Q` intersected with the actual `CliffordAlgebra.even Q`.

Pinned source `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` supplies `CliffordAlgebra.ι_sq_scalar`. We construct units from original `ι Q v` and `ι Q (-v)` for `Q v=1`; their product is negative Clifford one. This is a **source-generated** argument, not a postulated spinor/covering fact. The source form `FCP.BFSSS1V0.source48Quadratic` is the original weighted sum of 48 unit squares; the candidate also supplies a concrete source unit-coordinate vector.

## Two candidate Lean roots

File `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D9OriginalSpin48NegativeCentralMembershipProbe.lean`, exact Git blob `6e9c986e422fb4352969a8a6bb2b0d7e0e1455e2`.

- `FCP.BFSSS1V52K1D9.sourceSpin48_neg_one_mem_of_unitVector`: given an actual source vector `v` satisfying `source48Quadratic v=1`, prove `(-1 : CliffordAlgebra source48Quadratic) ∈ spinGroup source48Quadratic` using actual Lipschitz, unitary and even membership.
- `FCP.BFSSS1V52K1D9.originalSourceSpin48_neg_one_mem`: establish the above conclusion **unconditionally** by instantiating an original coordinate unit vector.

The second theorem is a distinct obligation: a hypothetical unit vector is not evidence that the source quadratic form actually has one.

## Exact-source CI contract

Verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d9.py`, Git blob `8da2cf3fa90249a4f29d18fcea6e8a665929b799`; strict workflow `.github/workflows/bfss-kotler-k1d9-negative-central-owner-strict.yml`. The new job pins compiler Lean 4.34.1 and Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`; independently requalifies all **57 accepted roots**, then demands fresh K1D9 compilation, real `.olean`, exactly 2 axiom reports, source token scan (no sorry/admit/sorryAx/axiom), theorem type evidence, and only permitted `propext`, `Classical.choice`, `Quot.sound`.

**Fail closed.** On red, preserve exact compiler diagnostics and treat this as an unaccepted candidate. Do not alter its theorem statements to make CI green. A green and independently inspected run would qualify **the membership roots only**, increasing accepted scoped modules to 56. The trivial-action converse and group-level two-sign equality would remain open.

## Future review boundary

Keep source and failure history in owner-controlled research branches. The full future community PR must be a clean, minimal, independently qualified dependency bundle based on then-current `mathcommunity/oai-math-revised:main`, with proper automated-assistance disclosure and explicit owner authorization. No PR, upstream write or owner `main` merge is part of this candidate.
