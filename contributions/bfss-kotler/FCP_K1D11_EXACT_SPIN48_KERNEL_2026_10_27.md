# K1D11 — exact two-sign pointwise kernel of original source Spin(48) vector action

## Gate 1 red and source-exact correction — 2026-10-28 UTC

**Gate 1 RED (not accepted):** [run #40630400313](https://github.com/etblink/math/actions/runs/40630400313), job `122625180094`, exact tested SHA [`a097b67280b8730e08506a895791b24ba7aaf8a8`](https://github.com/etblink/math/commit/a097b67280b8730e08506a895791b24ba7aaf8a8). All **61 previously accepted roots requalified**. The K1D11 source emitted axiom reports for all four declarations with only `propext`, `Classical.choice`, and `Quot.sound`, but strict `-DwarningAsError=true` rejected a single deprecated lemma at source line 72: `Set.mem_setOf_eq` has been deprecated and must be replaced by `Set.mem_ofPred_eq`. [Immutable failed-run compiler artifact #12791264149](https://github.com/etblink/math/actions/runs/40630400313/artifacts/12791264149) is preserved. A red run never qualifies any declaration, even with good axiom reports.

**Gate 2 repair, not yet independently accepted:** one source token replacement `Set.mem_setOf_eq → Set.mem_ofPred_eq`. All four theorem statements, actual original Spin48 vector action, exact parent source files, proof structure, and permitted axiom policy remain unchanged. Re-pin the source Git blob `d954d2afe6fbf751314d6a36c84b1d4c9783d1d1` and verifier blob `c0167a1f0a2bd1d2ff45249108a4ef12f5f377e6`. No stale-verifier waiver, banned axiom, or replacement claim. Require a new completed strict gate for any acceptance.

**Accepted baseline remains 57 scoped contributor modules / 61 selected declaration roots** until an independent completed green at the corrected source SHA.

### Archived original candidate charter


**State: RESEARCH CANDIDATE; new strict CI not yet qualified.** Parent qualified owner branch: `research/fcp-k1d10-negative-action-20261027`. New branch: `research/fcp-k1d11-exact-kernel-20261027`.

## Accepted source-exact ancestry

**57 scoped owner contributor modules / 61 selected declaration roots** qualified through K1D10 [strict run #40629007863](https://github.com/etblink/math/actions/runs/40629007863), tested exact SHA `009a4b4524c8199f0eea71912dd745acbf1f143c`. The new K1D10 identity bridge makes the source-defined real vector action equal to Clifford-star conjugation, and constructs `-1` as a genuine Spin element with trivial action. Earlier accepted K1D8 gives the reverse **upper bound** that all trivial-action elements have original Clifford values `+1` or `-1`. K1D9 gives unconditional actual negative central subgroup membership. K1D7 proves faithfulness of the original real Clifford scalar embedding.

Historical K1D9 and K1D10 red gate/compiler failures are preserved in their original owner handoffs and strict-run artifacts. No former failure is erased by green qualification.

## New source and proof targets

Candidate module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D11OriginalSpin48ExactTwoSignKernel.lean`, Git blob `37876177639a3dd0e0bab7bad1d21e4ebb1f1a3d`.

The source defines `originalSourceNegativeCentral : spinGroup source48Quadratic` from the accepted K1D9 true membership theorem and stages four new exact-source declaration roots:

1. `originalSourceSpin48_one_trivialAction`: the *actual* Spin identity fixes all source real vectors, via original S1V30 generator injectivity and K1D10 star conjugation.
2. `originalSourceSpin48_trivialAction_iff_two_signs`: a genuine source Spin element fixes every source vector **if and only if** it is either the identity or `originalSourceNegativeCentral`. Crucially, this is equality of elements **in the actual Mathlib Spin subtype**, not merely equality of Clifford values.
3. `originalSourceSpin48_pointwiseKernel_eq_two_sign_set`: equality between the exact pointwise-fixer set in the original source Spin group and the two explicitly constructed Spin elements.
4. `originalSourceSpin48_one_ne_negativeCentral`: the two genuine members are distinct; proof uses the exact original faithful Clifford real scalar inclusion from K1D7.

**Scope distinction:** A pointwise action stabilizer is mathematically meaningful without any separately constructed `Spin(48) → SO(48)` group homomorphism. This source does **NOT** claim a group-homomorphism kernel or topological double-covering theorem, and does not prove global Spin(9) lift, source-color/Fock index alignment, or BFSS spectral existence. No physical statements are promoted.

## Strict CI acceptance contract

Workflow `.github/workflows/bfss-kotler-k1d11-exact-spin48-kernel-owner-strict.yml` pins the candidate source, strict verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d11.py` (blob `5b4afa88f13ea8d09e1eb9af76874ba6d93fcaa4`), pinned Lean 4.34.1, Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612` and exact original ancestor hashes. It independently recompiles the **61 accepted declaration roots** in the 22-module original ancestry and K1D3–K1D10, then compiles the new K1D11 module with warning-as-error and nonempty `.olean`; checks exact **four** new declaration reports, theorem types and only the permitted `propext`, `Classical.choice`, `Quot.sound` axioms; rejects sorry/admit/axiom/sorryAx and Lean source errors/warnings, and archives compiler and failure evidence.

**Fail closed:** No new theorem or count promotion unless a terminal independent GitHub success at the exact source SHA has its compiler logs and declaration-level axiom reports verified. A verified green would raise the scoped owner count from 57 to **58 modules**, and selected roots from 61 to **65**. A red would preserve exact diagnostics and keep both acceptance counts unchanged.

## Runtime and eventual upstream review

Prior K1D10 gate took 11m 54s. Pinned dependency restore and fresh ancestry accounted for most of its wall time. Continue freshness and compiler provenance requirements; consider separate version-pinned cache optimization only with an independent equivalence/acceptance check. Maintain canonical owner evidence, short-lived research branches and frozen acceptance parents. Future upstream PR to `mathcommunity/oai-math-revised` requires **separate explicit authorization**, a clean reviewable branch derived from the then-current community `main`, and disclosure of substantial LLM/software assistance. No upstream PR or owner `main` merge is authorized here.
