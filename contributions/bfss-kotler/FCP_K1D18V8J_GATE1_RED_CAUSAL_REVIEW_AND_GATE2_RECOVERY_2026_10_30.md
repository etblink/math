# Project Lead — V8J Gate 1 RED: unreachable tactics, bounded Gate 2 recovery

**Research local date:** 2026-10-30 PDT. **Disposition:** `GATE1_RED_PRESERVED__GATE2_UNQUALIFIED`.

## Exact original immutable failed run

- [V8J Gate 1 #41161824014](https://github.com/etblink/math/actions/runs/41161824014), attempted once, `completed/failure`, tested SHA **`e8f2c088861eda2ff550c75a2c773dc8cbc8b860`**, job **`124420822283`**.
- Source-exact candidate file `SU2BFSSPairedSpin9FourIndexDiagonalBoundaryProbe.lean`, original Git blob **`90d99fe7fcf5a7b194a45186705f761e858be700`**.
- Source and pinned Lean/Mathlib/gamma/Fock/V8H preflight **PASS**; dependency restore **PASS**; original V8H ancestor compilation **PASS**. Failure first occurred in `Fresh compile exact V8J source with warnings as errors`; independent theorem-type gate was **SKIPPED**. Do **not** count four declarations as accepted from this red run.
- Actual Lean diagnostics:
  - `SU2BFSSPairedSpin9FourIndexDiagonalBoundaryProbe.lean:39:58: error: this tactic is never executed`.
  - `SU2BFSSPairedSpin9FourIndexDiagonalBoundaryProbe.lean:45:58: error: this tactic is never executed`.
- Both messages came from the final `abel` in `all_goals simp [zeroDiagonalFourIndexRHS, ...] <;> abel` after `simp` already closed all goals. The strict `-DwarningAsError=true` gate correctly rejected the unreachable tactic. Four allowed `#print axioms` reports appearing later in the same compiler log **do not override** that nonzero compile result.
- Red compiler artifact [#13028175367](https://github.com/etblink/math/actions/runs/41161824014/artifacts/13028175367) retained, SHA256 **`d6acf3f12bdf404b2fcc20af057d9d307787cc6be5dfd38ca04f37b370661e2a`**, size 623 bytes. Preserve this as negative procedural knowledge.

## Minimal source-preserving correction

- Removed the unnecessary `<;> abel` only on source lines 39 and 45. Both theorem statements, hypotheses, if-then-else four-index RHS, matrix type, gamma source, paired label equivalence, and `by_cases` proof structure **unchanged**.
- Corrected candidate Git blob **`d0fba846741de21848820f46a179d7cc0251c113`**. Only companion workflow change is replacing the old literal source Git blob pin with this new blob. No proof limits, axioms, tooling versions, or named accepted sources were changed.
- Atomic two-file proof/workflow correction committed **`66695a35fbebba270b37a063f077f158937725d7`**. [V8J Gate 2 #41162392473](https://github.com/etblink/math/actions/runs/41162392473) was triggered for exactly that SHA. **Gate 2 must independently complete green**, with fresh compiler, four exact proposition `example`s, four `#print axioms`, and preserved artifact, before qualification.

## Git tree assembly negative procedural knowledge

A correction Git tree was initially created using an earlier root tree as its base, even though its parent commit was the newer research HEAD. The first corrective commit `66695a35...` therefore unintentionally **omitted an accepted V8I handoff document**. This was identified by mandatory `compare_commits` review, not by waiting for user feedback.

The original accepted V8I document was immediately recreated byte-for-byte at the same path, with its original Git blob **`2fabe20c4f5594bad569509c80f66a564606bbed`**, restoration commit **`1a7765392550eed14f0a50540036bc866fb2a5a2`**. Comparison of the entire current restored branch `1a776539...` against red baseline `e8f2c088...` reports **exactly two changed files**: V8J Lean source (two redundant tactic removals), V8J strict workflow (one source hash). No accepted theorem or prior acceptance document is missing from the restored branch.

**New safeguard:** Never create a Git tree using a base tree fetched from a different commit than the intended parent. Before publishing a commit, verify parent SHA and its own tree SHA correspond. Immediately check full `compare_commits` diff after any write, not only the intended paths. Avoid low-level Git tree assembly when a simple safe update path is available unless atomic multi-file write is necessary; preserve any inadvertent deletion in the incident record.

## Mathematical frontier

V8A–V8I remain accepted, **16 strict-qualified roots**. V8J proposes four new preliminary diagonal-boundary roots on the same original 48-label zero-diagonal interface; these are **UNQUALIFIED** until strict Gate 2 passes. The full universal `so(9)` four-index commutator, global Spin9/Spin48 group lift, original Fock operator construction and physical BFSS spectral claims remain separate unproved obligations.

This document is an incident/recovery record and must not be mistaken for new theorem acceptance.
