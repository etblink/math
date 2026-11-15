# IBI-G0C-SOURCE-SO3-WITNESS — R1 universal original-BFSS witness candidate

**Date:** November 15, 2026 Pacific  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Status:** STAGED_NOT_QUALIFIED; only strict independent CI can accept.

## Exact target and proof structure

Prove the original-source matrix-existence statement:
```lean
theorem originalBFSS_adjoint_hits_every_SO3
 (Q : Matrix (Fin 3) (Fin 3) ℝ)
 (hQ : Q ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
 ∃ g : OAI.BFSSQuantum.GaugeGroup 2,
   FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q
```
**No alternate SU2 spin-cover representation is introduced.** The proof obtains `α,β,γ` from [qualified universal SO3 Euler #43774271484](https://github.com/etblink/math/actions/runs/43774271484) at tested `5c2502e8c30784eb2769114b7dd20c300f9cde3c`, then uses the exact witness `sourceZGauge α * sourceXGauge β * sourceZGauge γ : GaugeGroup 2`.

Two separate orientation adapters compare abstract `rotZ` with qualified original-source `sourceRotZ` and abstract `rotX` with qualified `sourceRotX` by definitional equality. One native source-exact composition theorem uses the **existing** `FCP.BFSSSU2GaugeG3A.adjointColorMatrix_mul` and accepted [Z-image #43755443223](https://github.com/etblink/math/actions/runs/43755443223) / [X-image #43761025397](https://github.com/etblink/math/actions/runs/43761025397).

**Scope qualification:** the existential proves that every SO(3) matrix occurs as an original G3A image; it does not by itself construct the hom `GaugeGroup 2 →* Matrix.specialOrthogonalGroup ...`, because that further requires a separately qualified proof all image determinants equal +1. Earlier determinant-positive work may provide it, but do not infer it from orthogonality alone, nor assert a double-cover kernel or physical/Fock claim.

Independent consumer checks arbitrary proper matrix with exact membership, arbitrary actual `specialOrthogonalGroup` subtype element, and full three-parameter source ZXZ equality. Pinned source original G3A and accepted X/Z images/Euler, pinned Lean 4.34.1/Mathlib, cold build, strict source and consumer, standard-only axiom reports, artifacts. No `sorry`, no new axioms, no STAGED imports, no "source surrogate" allowed.

Do not modify accepted declarations, main, unified integration or frozen FCP. Preserve RED proof diagnostics and stop after two analogous failures.
