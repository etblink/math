# V7V strict Gate 1 red — unsupported Subgroup.closure_le.mpr; Gate 2 candidate

Project Lead negative knowledge; 2026-10-30 UTC. Do not overwrite the red source or weaken the algebraic theorem.

## Gate 1 independently verified failure
- Run https://github.com/etblink/math/actions/runs/41120165526, job 124284568895, attempt 1, exact tested commit 1d4ce32203988f8c7fd494a1be8688b5cf0cf5dc. Fresh warning-as-error source compilation failed in the NEW V7V proof.
- Failed V7V exact Git source blob 4aeb1b81f708e140dc08236de75f08b88a764aa2; retained evidence artifact 13008223607, sha256:007360bd6a704edd93fa183c3d8d53ef05b3722dced00855aa8740f1a6bf6865.
- Exact SHA source pins and 164 declaration lexeme checks PASSED; pinned Lean 4.34.1 and Mathlib dependencies PASSED; 37 accepted modules/81 sealed ancestry roots PASSED; independent full 164-root type/axiom audit SKIPPED after compilation failure.
- First causal error line 58:10 unknown identifier `Subgroup.closure_le.mpr`. Secondary line 59:10 `No goals to be solved`. The two V7V `sorryAx` diagnostics are consequences of incomplete elaboration, NOT accepted axioms or a counterexample.
- Accepted V7A used `rw [Subgroup.closure_le]` with the same exact pinned source subgroup closure API. Avoid treating this Iff lemma as a field `.mpr` on a theorem constant in this elaboration context.

## Gate 2 source-exact correction — CANDIDATE
- Replace only `apply Subgroup.closure_le.mpr` with `rw [Subgroup.closure_le]` in the second le_antisymm direction, keeping the following `intro s hs` and original source-defined kernel element proof unchanged.
- New V7V source Git blob 72026717e806eee1fa2a2f8ba9726a0e92e07b8b; workflow exact hash pin updated and no other strict workflow requirement modified.
- Both original theorem statements, two root names, source form source48Quadratic, original sourceSO hom, K1D11 negativeCentral, all existing imports and proof limits/linter settings unchanged.
- Strict Gate 2 must fresh-compile 51 original source modules, independently audit 164 exact types/axioms, validate sealed 81 ancestor roots, only allow propext/Classical.choice/Quot.sound, reject sorryAx and preserve compiler/axiom artifact. No acceptance on static preflight or partial green.
- If next gate is red, preserve exact SHA, artifact and FIRST causal compiler diagnostic and repair only what follows from evidence.

## Scope boundary
- Accepted V7S unconditional algebraic surjectivity, V7T exactly two distinct preimages, V7U original source Spin quotient-by-kernel group isomorphism. V7V generated-negative-central kernel equality is UNQUALIFIED pending Gate 2.
- No continuous/topological Spin48-to-SO48 covering, global Spin9 lift, BFSS spectral theorem or physical convergence claim follows.

Governance: research branch only; accepted Lean sources, main, FCP canonical provenance and upstream community untouched.