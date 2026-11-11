# JOIN-0B preparatory memorandum — source transpose and actual Fock adjoint

**Date:** 2026-11-10 (Pacific)  
**Source snapshot:** `etblink/math`, `integration/bfss-unified-research-20261108`, at `168fe73dd1744870e94d5519e2a198650eb1516a`  
**Concurrent gate:** [JOIN-0A strict #42930427007](https://github.com/etblink/math/actions/runs/42930427007), candidate at the snapshot. **No polling, qualification or edits to JOIN-0A in this preparation.**  
**Status:** Type-grounded mathematical derivations and Lean gate specification; **not a newly compiled or qualified Lean theorem**.

## 1. Current exact source interfaces

| Parent | Actual qualified or candidate content | Exact source |
| --- | --- | --- |
| VLY-0A, [#42908736563](https://github.com/etblink/math/actions/runs/42908736563) | `originalSpatialGram (x : Boson 2) : Matrix SpaceIndex SpaceIndex ℝ`, made from `inner ℝ (spatialColor x i) (spatialColor x j)` | [VLY-0A](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean), blob `5633ef2ed7cf182edaee171fb45273d325103b94` |
| Source gamma, prior qualified | `FCP.BFSSGamma9.gamma : SpaceIndex → GammaMatrix`; `gamma_symmetric i`, `gamma_clifford i j` | [SU2RealGammaProbe](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean), blob `b9b8192055c70f0d001d7982669b9823c55562ed` |
| VLY-0B, [#42926845593](https://github.com/etblink/math/actions/runs/42926845593) | `originalGramGammaCoefficient (x : Boson 2) (B : GammaMatrix) : GammaMatrix` via exact `∑ i, ∑ j, M_ij • (gamma_i * B * gamma_j)` | [VLY-0B](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0BOriginalGramGammaCoefficient.lean), blob `e495f780f9ac382ac1e076ef20fa68b33c38f1cd` |
| Original true Fock G1A | `pairedTheta α A : Fermion 2 →L[ℂ] Fermion 2`; `pairedTheta_selfAdjoint`; exact delta-one `pairedTheta_CAR` | [G1A](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean), blob `152204ef15a6569534e0503824a697cb9ae8e4ce` |
| BIL-0C, [#42924009228](https://github.com/etblink/math/actions/runs/42924009228) | `originalColorQuadratic (J : Matrix SpinIndex SpinIndex ℝ) : Fermion 2 →L[ℂ] Fermion 2`, finite color-summed theta products | [BIL-0C](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean), blob `cfd3e1eeed420ce92ca54821816f4a53e073ad4a` |
| F1B donor (qualification must be checked independently before import) | Genuine Fock adjoint composition and star conversion, for a particular source ordered bivector | [F1B](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1BOriginalThetaBivectorSkewAdjoint.lean), blob `75cdfab1c25e961ba777c9788e77a3e6e4ee6d70` |
| JOIN-0A currently candidate | `originalFockGramObservable x B = originalColorQuadratic (originalGramGammaCoefficient x B)`; exact pointwise simultaneous G2A/G4E gauge covariance to be cold qualified | [JOIN-0A](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean), blob `68fd2067b2dcdb6851afed269d25726dd5b634c5` |

Strict qualification belongs to the exact source/consumer commit; no inference from adjacent donor modules, scientific notes, or an uncompleted run. The two lemmas below are source-supported mathematical implications but **have not yet passed a JOIN-0B strict gate**.

## 2. First stronger theorem: Gram–gamma commutes with matrix transpose

Prove the exact original real 16×16 matrix identity **for arbitrary B**, not only skew B:
```lean
theorem originalGramGammaCoefficient_transpose
    (x : Boson 2) (B : GammaMatrix) :
    (originalGramGammaCoefficient x B)ᵀ =
      originalGramGammaCoefficient x Bᵀ
```
Mathematical proof: `M_ij = M_ji` because it is an original **real** inner-product Gram; `gamma_iᵀ = gamma_i` by pinned source `gamma_symmetric`; then
[
(G_x(B))^{\mathsf T}
 =\sum_{i,j} M_{ij}\gamma_j B^{\mathsf T}\gamma_i
 =\sum_{i,j} M_{ji}\gamma_i B^{\mathsf T}\gamma_j
 =G_x(B^{\mathsf T}).
]

**Suggested bounded Lean atom JOIN-0B1:**
1. Local `originalSpatialGram_symm (x)` from `real_inner_comm`, with original `spatialColor` unchanged.
2. General matrix-level lemma `transpose` of nested finite sums / scalar smul, using `Matrix.transpose_mul`, `Matrix.transpose_smul` or entrywise `ext` if library simp fails.
3. Reindex `∑ i, ∑ j` using `Finset.sum_comm`. Avoid unfolding concrete gamma signed-permutation tables.
4. **Distinct independent consumer**: for any real skew `B` satisfying `B.transpose = -B`, show `(G_x B).transpose = -(G_x B)`. This tests a non-identical skewness consequence.

Failure-mode preparation: watch implicit scalar transpose rewrites and `Matrix.IsSymm` versus `transpose = M` representation. The original real Gram is critical; a Hermitian/complex conjugation argument would be a **wrong carrier**.

## 3. Second stronger theorem: original Fock quadratic's star is coefficient transpose

Prove for **arbitrary real** `J : Matrix SpinIndex SpinIndex ℝ`:
```lean
theorem originalColorQuadratic_star
    (J : Matrix SpinIndex SpinIndex ℝ) :
    star (originalColorQuadratic J) =
      originalColorQuadratic Jᵀ
```
Using exact G1A original Hilbert self-adjoint theta,
[
(\theta_{\alpha A}\theta_{\beta A})^*
  = \theta_{\beta A}\theta_{\alpha A},
]
and **real** `J_{αβ}` coefficients, complex conjugation of the casts leaves each coefficient unchanged. Swap `α,β` in the finite 16×16 sums to reach `Jᵀ`. This star identity does **not** require CAR! The CAR is needed later for the distinct symmetric-scalar collapse and precise Fock trace pairing.

**Suggested bounded Lean atom JOIN-0B2:**
1. Start from exact G1A `pairedTheta_selfAdjoint`, and F1B's existing `ContinuousLinearMap.star_eq_adjoint` + `ContinuousLinearMap.adjoint_comp` techniques, without importing F1B's entire unrelated source 48-label chain.
2. Split into a **generic finite weighted transpose/star lemma** on a family of Fock operators `F α β` with `star (F α β) = F β α`. Only then instantiate the concrete original `∑_A pairedTheta α A * pairedTheta β A`. This avoids historical nested `Fin 16` elaboration/heartbeat failures.
3. Explicitly prove `star ((J α β : ℂ) • T)=((J α β : ℂ) • star T)` using the real-coefficient star identity; do **not** silently assume complex-linear `star`. It is conjugate-linear.
4. Independent consumer: for real skew J, `star (Q(J)) = -Q(J)`; then `IsSelfAdjoint ((Complex.I) • Q(J))` if the appropriate Mathlib typeclass and formulation are available. Keep these consequences separate if the proof-engineering cost warrants it.

This is stronger and reusable for **any original real coefficient J**, not merely the configuration-dependent VLY image. Avoid unnecessary reproof of the source CAR or overexpansion of Clifford generators.

## 4. Third small gate: combine the two stronger identities

After JOIN-0B1 and JOIN-0B2 **each** qualify, for an arbitrary real skew B,
[
G_x(B)^{\mathsf T}=-G_x(B),\qquad
Q(G_x(B))^*=-Q(G_x(B)).
]
Therefore
[
\boxed{\big(i\,Q(G_x(B))\big)^*=i\,Q(G_x(B)).}
]
This is a **pointwise self-adjoint operator on original `Fermion 2`**, not self-adjointness of an unbounded original BFSS Hamiltonian on `FullL2 2`.

Use the now-accepted original G2A/G4E JOIN-0A covariance once its gate is green; multiplication by the constant imaginary scalar preserves pointwise gauge covariance.

**Independent consumer**: e.g. `⟪i Q(G_x(B))v,v⟫_ℂ` is real, or the stated source-typed `IsSelfAdjoint` identity, checked apart from a scalar duplication of the main theorem.

## 5. Deliberately separate the boundedness and CAR-trace fronts

The previously preserved [JOIN-0 mathematical memo](../../research/unification/BFSS_JOIN0_SKEW_FOCK_BOUNDED_FIELD_AND_CAR_TRACE_INTERFACE_2026_11_10.md) derives a normalized original-Fock bound
[
\left\|i Q\left(\frac{G_x(B)}{1+\|x\|^2}\right)\right\|_{op}
 \le 24\|B\|_F
]
from direct source color columns, or `216‖B‖_F` using a Gram-only fallback. Those constants are not Lean-qualified. The latter cheaper bound avoids making the color-column identity VLY-0B2 a dependency of an initial boundedness gate.

Further independent CAR-TRACE-0 target on real skew B,C:
[
\mathrm{Tr}_{Fock}(Q(B)^*Q(C))
 = \frac{3\cdot2^{24}}2\, \langle B,C\rangle_F.
]
It would give a scaled faithful embedding of the 120-dimensional real skew coefficient space into original Fock **operators**, not an original Hamiltonian eigenspace. T1's existing original operator trace adapter does **not** already prove this Clifford grade-two orthogonality theorem. Check its separate sources before starting that gate.

## 6. Strict-gate preparation and stop criteria

- **Do not modify or poll JOIN-0A #42930427007.** Its source blob, consumer blob and strict workflow must stay unchanged while under test.
- On confirmed JOIN-0A green, save its exact commit, job, strict artifact and permitted `#print axioms` roots. Promote only that gate.
- Begin **JOIN-0B1** with transpose compatibility and an independent skew consumer, preserving all **96** accepted source/consumer ancestry pins plus two new pins.
- If JOIN-0B1 red, inspect first causal compiler diagnostic and compare proof tactics with earlier FCP S3G/S3G3 finite-sum reindexing; use a minimal one-cause repair.
- Begin **JOIN-0B2** with generic Fock star/transpose identity and separate consumer. Keep source matrix `GammaMatrix` and original `Fermion 2` operator algebra distinct.
- Only after their independent qualification assemble the self-adjoint source-typed field, then pursue normalized boundedness and CAR trace tests.
- No original G1A/BIL/VLY/JOIN definition, accepted source, workflow hardening, frozen pin, FCP main, or upstream `openai/math` source should change as a side effect of preparation.

**Result of this memo:** A shorter, more reusable JOIN-0B proof DAG, preserving the key insight that the general transpose/star identities subsume the special skew conclusions. This memorandum is **preparation**, not a new mathematical or physical acceptance.
