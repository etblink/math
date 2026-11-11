# NORM-0B ninth strict red — cumulative method audit and typed scalar-interface recovery

**Date:** November 10, 2026 (Pacific; CI November 11 UTC)
**Repository/branch:** `etblink/math` / `integration/bfss-unified-research-20261108`
**Parent/tested commit:** `936162c99053eabae501f64d12c597d2351019ab`
**Scientific status:** STRICT RED; proposed consumer micro-repair is UNCOMPILED until new independent CI. No source mathematics or original BFSS physics changed.

## 1. Exact latest evidence and first cause

[Run #42977121959](https://github.com/etblink/math/actions/runs/42977121959) completed FAILED, job `130378674511`, 2026-11-11 07:20:51 UTC. Artifact ID `13836611806`, ZIP SHA-256 `e1dd2f0f16e230e123338bb9205969fd290a9a35db5a32446bc9708b3b706e9c`.

The `NORM0B_ORIGINAL_106_BLOB_CLOSURE_PASS` marker established exact preflight for 104 previously qualified parent blobs plus two candidate NORM-0B blobs. Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. All 9068 source build jobs compiled and all four new source roots reported only `propext`, `Classical.choice`, `Quot.sound`. First independent consumer `originalColorQuadratic_neg_from_real_smul` again compiled with permitted-only axioms.

**Only failing consumer:** `originalFockGramObservable_zero_B`. At line 55, tactic `rw [smul_zero]` failed to find occurrence `?a • 0` in the displayed goal `↑(originalSpatialGram x i j) • 0 = 0`. Crucial follow-on diagnostics: *target expression is not type-correct under `implicit` transparency*, with `function expected originalSpatialGram x i`. This implicates elaboration and reducibility of the source `Matrix SpaceIndex SpaceIndex ℝ` coefficient nested inside the concrete `ContinuousLinearMap` scalar action, not a false `smul_zero` identity. The `sorryAx` printed for the one failed consumer is an error-recovery artifact, not an accepted proof.

## 2. Full NORM-0B red chronology (do not collapse failure mechanisms)

| Run | First causal failure | Lesson retained |
| --- | --- | --- |
| [42958105950](https://github.com/etblink/math/actions/runs/42958105950) | Source Q add/zero nested-sum simplification failed and returned unused arguments | Change to a **typed original Fock operator family**, explicit 3-stage `calc`, inner/outer sum laws |
| [42960271760](https://github.com/etblink/math/actions/runs/42960271760) | Source Q(0) scalar-zero `simp` made no progress | Stop generic simplifier retries |
| [42962539629](https://github.com/etblink/math/actions/runs/42962539629) | Source Q(0) from real-smul still had `0 • Q(0)` | Prove Q(0)=0 by already compiling **Q-additivity and additive cancellation**, not 0-smul |
| [42964853683](https://github.com/etblink/math/actions/runs/42964853683) | Source four roots compiled; 2 independent consumer failures: neg scalar and nested double-sum zero | Source freeze, consumer-only work |
| [42967369254](https://github.com/etblink/math/actions/runs/42967369254) | First consumer -1 scalar mismatch, second consumer missing Gram namespace | Explicit typed real-to-complex calc; open actual VLY-0A namespace |
| [42970882167](https://github.com/etblink/math/actions/runs/42970882167) | First consumer qualified-by-compilation; `SMulZeroClass ℂ ?m.34` stuck in second | Bare `exact smul_zero coeff` did not fix implicit operator type |
| [42972917456](https://github.com/etblink/math/actions/runs/42972917456) | Second consumer leaf `simp only [smul_zero]` made no progress | No more literal simp variants |
| [42975284760](https://github.com/etblink/math/actions/runs/42975284760) | Explicit `show ... from smul_zero coeff` left `?m.59` rather than the concrete `ContinuousLinearMap.instSMul` | Expected-type annotations alone did not determine lemma's hidden operator type |
| [42977121959](https://github.com/etblink/math/actions/runs/42977121959) | `change` then `rw [smul_zero]` rejects match; target ill-typed under implicit transparency when parsing source Matrix entry | Separate the matrix coefficient from the scalar-zero proof before applying a concrete original operator lemma |

**Distinguish statuses:** source compiled with standard axioms but NORM-0B entire gate remains RED. No source theorem or physical model counterexample was produced in these runs. A strict green on the new exact tested SHA remains required.

## 3. Recovered historical successful methods

- **F1A:** green [#42533991101](https://github.com/etblink/math/actions/runs/42533991101) after typed CAR/CLM scalar and composition API bridges replaced broad `noncomm_ring`/`simp`; preserve physical `{θ,θ}=δI`.
- **F1F C3:** green [#42651438879](https://github.com/etblink/math/actions/runs/42651438879) only after symbolic transport was separated from exact Fock source identity, instead of expanding huge concrete definitions.
- **Stabilizer continuity:** consumer-only repair after full source success [#42435908276](https://github.com/etblink/math/actions/runs/42435908276); exact typed target-isometry bridges after consumer red [#42444640879](https://github.com/etblink/math/actions/runs/42444640879).
- **BIL-0B / JOIN-0B3:** preserve literal original `Fermion 2` operators; source/diagnostic boundaries and imported namespaces are distinct. JOIN-0B3 [source and consumer](../../lean/diagnostics/BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer.lean) use a typed `F α β : Fermion 2 →L[ℂ] Fermion 2` and explicit stages.
- **Methodology:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), [Proof-DAG First](BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md), [failure playbook](BFSS_LEAN_PROOF_REUSE_AND_FAILURE_PLAYBOOK_2026_11_08.md), and [bounded-execution protocol](BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md) all emphasize source identity, tiny typed lemmas, exact first causal diagnostics, honest claim tiers and stop rules.

## 4. API-verified recovery implementation

**Pinned Mathlib source:** `Mathlib/Algebra/GroupWithZero/Action/Defs.lean`, at exact `d13f23b723b8a846827a245b89c10fc7d3f11612`, declares

```lean
@[simp]
theorem smul_zero (a : M) : a • (0 : A) = 0 :=
  SMulZeroClass.smul_zero _
```

where `A` is an implicit type parameter and a `SMulZeroClass M A` instance must be synthesized. The target type should be **bound explicitly at the interface**, not inferred while simultaneously elaborating `originalSpatialGram x i j` and a concrete CLM.

Proposed private consumer helper (no mathematical-source edits):

```lean
private theorem originalFockOperator_smul_zero (c : ℂ) :
    c • (0 : Fermion 2 →L[ℂ] Fermion 2) = 0 := by
  exact smul_zero (A := Fermion 2 →L[ℂ] Fermion 2) c
```

Proposed leaf in the already established two nested `Finset.sum_eq_zero` proof:

```lean
  let c : ℂ := ((originalSpatialGram x i j : ℝ) : ℂ)
  change c • (0 : Fermion 2 →L[ℂ] Fermion 2) = 0
  exact originalFockOperator_smul_zero c
```

This changes the **architecture**, not just another tactic: prove a source-compatible scalar-zero lemma on a *coefficient-independent* actual Fock-operator carrier, and only then instantiate the semireducible Matrix entry as a typed complex scalar. No dangerous rewrites on the Gram expression are needed; the lemma is not a surrogate operator model.

- Previous consumer blob: `6775e7a6840a02062201d640cb06ae0e30deb7cf`
- Candidate consumer blob: `3b9c7eb015e188d58e1225fcbd944939baf4c3b5`
- Previous workflow blob: `0cba6b44fd3a40ccf95f95d192e42ef78fc09388`
- Candidate workflow blob: `51c5c563dd9a89d341102d6c82e7c2f1fe7627ec`
- Frozen original mathematical source blob: `78cf0db748fc7d98bcd1f6c2629d75742c6d8097`
- Exactly **one** manifest hash updated among 106; all 104 previously accepted ancestral blobs and four source theorem statements untouched. First consumer proof, import closure, both original consumer theorem contracts, six `#print axioms` roots, warning-as-error, cold source/consumer builds, Lean/Mathlib pins and evidence artifact retained unchanged.

## 5. Decision rule: no more blind retries

The above is a **single evidence-driven architectural test**. Locally compiled Lean is unavailable in this research execution environment, so do not assert success on source inspection alone. A fresh full 106-pin strict GREEN is required to promote NORM-0B. If it fails at the isolated scalar helper, stop and run a **focussed diagnostic** printing `#check @smul_zero`, the actual `SMulZeroClass ℂ (Fermion 2 →L[ℂ] Fermion 2)` instance and `trace_state` on that specific goal (with no speculative consumer changes). If it fails only during Matrix substitution, use a separate coefficient `let`/lemma interface and record the exact kernel elaboration failure. Do not launch NORM-0C until NORM-0B qualifies.

**Physics ceiling:** No original `FullL2 2` multiplier, gauge-physical domain preservation, source Hamiltonian covariance, positive eigenvalue, whole-sector confinement, mass gap, or three fermion generations are established by this gate.
