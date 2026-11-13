# P3-M2C0 — prospective pre-gate source/evidence receipt: actual original bounded operator L² to genuine Fock-vector L² columns
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC. **Owner:** BFSS Project Lead.
**STATUS: PROSPECTIVE RESEARCH RECEIPT; NOT A LEAN QUALIFICATION.** This document must be committed before any M2C0 theorem source or independent consumer.
**Canonical branch/head at source analysis:** `integration/bfss-unified-research-20261108`, `6b4e12dc2c436d25c6e5f8de4fd535aac88a4b76`.

## 1. Exact original-source mathematical statement
Use `F := Fermion 2`, `X := Boson 2`, `μ := (volume : Measure (Boson 2))`, `E := F →L[ℂ] F` with original **operator norm**, `OriginalFockOperatorLp := Lp E 2 μ`, and `Vι := PiLp 2 (fun _ : ι => Lp F 2 μ)`.
For `[Fintype ι]` and `b : OrthonormalBasis ι ℂ F`, the narrowly proposed adapter is
```lean
originalFockOperatorLpColumnsEquiv
  (b : OrthonormalBasis ι ℂ (Fermion 2)) :
  OriginalFockOperatorLp ≃L[ℂ]
    PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 (volume : Measure (Boson 2)))
```
via accepted B2 `OriginalFockOperatorLp ≃L[ℂ] OriginalFockHSFieldLp ι` composed with accepted M2B1 `OriginalFockHSFieldLp ι ≃ₗᵢ[ℂ] Vι` converted to `≃L[ℂ]`. A source theorem should assert for every `i : ι` and `f : OriginalFockOperatorLp`: `((originalFockOperatorLpColumnsEquiv b f) i : Lp F 2 μ) =ᵐ[μ] fun x => (f x) (b i)`. A third source theorem can simply expose the symmetric inverse `f` class from the existing equivalence; no new abstract inverse proof.

**Nonclaims:** no isometry between original operator-norm L² and finite HS Hilbert columns; no new operator-norm instance; no original source gauge-invariant fixed-subspace equality, no Spin9 central-sign or source Hamiltonian domain, no spectral positive eigenpair or mass-gap result.

## 2. Source retrieval/evidence matrix (actual SHA and exact type)
| Source | Exact evidence | Fit |
|---|---|---|
| B2 `originalFockOperatorLpHSContinuousEquiv` and `..._apply_ae` | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2B2B2OriginalOperatorLpContinuousEquiv.lean`, exact blob `7bab48f3da13633049afe94100bcde80e2be0c27`, [strict #43371757607](https://github.com/etblink/math/actions/runs/43371757607), SHA `e95886123e78015351c9fffa73a0e5f2b4d986fc` | **Exact original operator L² continuous donor**, includes a.e. actual source Fock evaluation on the HS field |
| M2B1 `originalFockHSFieldColumnsEquiv μ` and `originalFockHSFieldColumnsEquiv_apply_ae μ` | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2B1OriginalFockHSFieldColumns.lean`, exact blob `e51e9db6d99adfdd9b077ffb846aef6155fecac6`, [strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031) | **Exact HS-field genuine Fock-vector L² column isometry**; use with *actual* `μ` = original Boson 2 volume |
| B0 `originalFockOperatorHSContinuousEquiv_apply_basis` | `P3M2B2B0OriginalFockOperatorHSContinuousEquiv.lean`, blob `3344283458bce762149d2ef00c445b1608bdb725`, [strict #43364964618](https://github.com/etblink/math/actions/runs/43364964618) | **Exact original source basis-value law** `e_b(T) i = T(b i)`; reduce final a.e. column coordinate to genuine original operator evaluation |
| Mathlib `LinearIsometryEquiv.toContinuousLinearEquiv` | `Mathlib/Analysis/Normed/Operator/LinearIsometry.lean` pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, lines **601–617** (`@[coe] def`; `coe_toContinuousLinearEquiv`) | **Verified exact pinned constructor** for converting M2B1 `≃ₗᵢ[ℂ]` to `≃L[ℂ]`; no new transported norm |
| Mathlib `ContinuousLinearEquiv.trans` and `symm_apply_apply` | Pinned Mathlib standard `ContinuousLinearEquiv` APIs already used in B0/B2 | **Type/interface candidate:** verify orientation in independent consumer; do not infer that this is a Hilbert isometry |
| P3D5 source full Fock Hilbert columns | M2B1 inherited original `P3D5B4BOriginalFockL2ColumnEquiv.lean`, accepted M1 D5B4B [#43343959865](https://github.com/etblink/math/actions/runs/43343959865) | Qualified ancestor, not new source. Avoid re-enumerating `Fin (2^24)`. |

## 3. First causal red history, scope limitations and falsifiers
Review included current canonical B2 acceptance, B2 and M2B1 source, independent genuine Fock consumer, current active roadmap, pinned Mathlib `LinearIsometryEquiv.toContinuousLinearEquiv`, old M2A duplicate manifest-key and opaque-def failure, M2B2A gate suffix parser RED, and the administrative B2 acceptance watchdog #43374782343 RED for missing the `active.workflow_tested_head_sha` metadata field (repaired at `6b4e12dc`). **No exhaustive source search over every archived FCP branch was conducted**; earlier historical qualified reuse ledgers remain referenced, not imported as proof authority.
Falsifiers: (1) original bounded-operator norm silently replaced by HS field norm; (2) constructor of converted M2B1 `≃L` type does not match B2 codomain; (3) representative equality merely for a convenient HS surrogate rather than original `(f x) (b i)`; (4) using everywhere equality for a.e. classes; (5) concrete Fock 2^24 enumeration blows up elaboration; (6) independent original consumer missing or axiom audit fails.

## 4. Minimal bounded microgate / CI independent consumer
**GO source-only M2C0:** two exact imports (`Mathlib.Analysis.Normed.Operator.LinearIsometry` and accepted B2+M2B1 sources as needed). Define one named continuous source operator-to-column equivalence by `.trans` and `.toContinuousLinearEquiv`, one a.e. source column evaluation theorem by filter-upwards from B2/M2B1 and B0 source basis law, and at most one source Lp inverse law. **No new general finite-dimensional Lp or gauge formalism.**
Consumer must check exact `Fermion 2 →L[ℂ] Fermion 2` field source, `Boson 2` volume, a concrete `EuclideanSpace.basisFun` ONB with `OriginalFockIndex := Fin (2^(8*colorDim 2))`, both continuous inverse identities, at least one forward original basis a.e. equality and source `#print axioms` repeated under full names. Independent consumer should not import any new unqualified proof.
Strict workflow should inherit **92 unchanged exact B2 predecessor pins** and only add a new M2C0 source and consumer (**94 unique pins**), pinned Lean 4.34.1 and Mathlib d13f23b7, cold warning-as-error Lean build, independent consumer, allowed axioms only (`propext`, `Classical.choice`, `Quot.sound`), source/consumer/run artifact digest. Distinct run and tested SHA required. No cache/frozen-main changes.

## 5. Project Lead GO/HOLD
**CONDITIONAL GO** for that one bounded M2C0 composite and original-source a.e. theorem after this receipt is committed, without waiting for a fresh unproved general categorical theory. **HOLD** M2C1 norm constants, M3 left-output gauge fixed-space equality, M4 Spin9, M5 BA–BH current-port requalification, M6–M8 spectral work as separate gates. On RED, preserve first causal proof/preflight failure; after two analogous reds inspect normalized actual types rather than repeatedly escalating tactics.
