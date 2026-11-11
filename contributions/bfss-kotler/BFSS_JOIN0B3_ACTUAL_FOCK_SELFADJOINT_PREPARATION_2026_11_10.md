# BFSS JOIN-0B3 — exact-source preparation for the real skew Fock field

**Research snapshot:** 2026-11-10 Pacific, `etblink/math`, integration branch at `c763b2a9c61e446260fb87e1839b3096494f8fc0`.
**Status:** SOURCE-VERIFIED PROOF PLAN; **NO NEW LEAN SOURCE OR STRICT QUALIFICATION**. While [JOIN-0B2 repair #42938833425](https://github.com/etblink/math/actions/runs/42938833425) is in progress, do not poll it or alter its source/consumer/workflow. Its current repaired consumer remains unqualified until its distinct green receipt.

## 1. Exact parents and resulting stronger theorem

- **JOIN-0A accepted**, [strict #42930427007](https://github.com/etblink/math/actions/runs/42930427007), blob `68fd2067b2dcdb6851afed269d25726dd5b634c5`: `originalFockGramObservable x B := originalColorQuadratic (originalGramGammaCoefficient x B)`, actual original `Boson 2` / `Fermion 2` pointwise SU2 gauge covariance.
- **JOIN-0B1 accepted**, [strict #42934871831](https://github.com/etblink/math/actions/runs/42934871831), source blob `4070cbb2b8e6538bb5c328651f8df5a2c77a4bf5` and independent consumer blob `09205d8f236fc9438414cebfecaf68248f679a0a`: `(originalGramGammaCoefficient x B)ᵀ=originalGramGammaCoefficient x Bᵀ` for ALL real B, and skew preservation as separately qualified consumer.
- **JOIN-0B2 current repaired candidate**, source blob `4c96a53f494ab0bd9891b686510aa59ea4e14044` had **already cold-compiled** with only permitted axioms during RED [#42936821963](https://github.com/etblink/math/actions/runs/42936821963); current consumer repair blob `15c890aece6ad0b326c61b24005184e906f245a0` remains under strict verification. B2 source states `star (originalColorQuadratic J)=originalColorQuadratic (Jᵀ)` for ALL real spinor coefficient matrices J. Successful source compilation of a red run does NOT qualify B2 or its consumer.

**JOIN-0B3 central theorem should be stronger than pointwise skewness alone:**
\[
\boxed{\operatorname{star}(\mathcal O_B(x))=\mathcal O_{B^{\mathsf T}}(x)}
\qquad\forall x:\mathrm{Boson}\ 2,\quad B:\mathrm{GammaMatrix}.
\]
This is immediate by composing the two general transpose identities on exact original carriers:
\[
\operatorname{star}\left[Q(G_x(B))\right]
=Q\!\left(G_x(B)^{\mathsf T}\right)
=Q\!\left(G_x(B^{\mathsf T})\right).
\]

## 2. Minimal source theorem skeleton (not yet Lean compiled)

Use exactly these source imports AFTER B2 green. The declaration has no new CAR axioms, source gamma expansion, eigenvectors, or physical operator domains.

```lean
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0AOriginalBosonFockGaugeCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B1OriginalGramGammaTranspose
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

set_option autoImplicit false
namespace FCP.BFSSJOIN0B3OriginalSkewFockSelfAdjoint
noncomputable section
open Matrix OAI.BFSSQuantum
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSJOIN0B1OriginalGramGammaTranspose
open FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

theorem originalFockGramObservable_star_transpose
    (x : Boson 2) (B : GammaMatrix) :
    star (originalFockGramObservable x B) =
      originalFockGramObservable x (Bᵀ) := by
  change star (originalColorQuadratic
      (originalGramGammaCoefficient x B)) =
    originalColorQuadratic (originalGramGammaCoefficient x (Bᵀ))
  rw [originalColorQuadratic_star_transpose,
      originalGramGammaCoefficient_transpose]

#print axioms originalFockGramObservable_star_transpose
end
end FCP.BFSSJOIN0B3OriginalSkewFockSelfAdjoint
```

The proof reuses B1 and B2 *source* theorem roots, not their private helpers or diagnostic-only consumer modules.

## 3. Distinct independent consumer: genuine Fock self-adjointness for skew B

Statement should be genuinely stronger than merely rewriting the central transpose theorem:

\[
\boxed{B^{\mathsf T}=-B\quad\Longrightarrow\quad
\operatorname{IsSelfAdjoint}\bigl((i:\mathbb C)\bullet\mathcal O_B(x)\bigr).}
\]

A robust proof separates THREE issues:

1. **Input sign:** `G_x(-B)=-G_x(B)` by the original Gram–gamma finite sum definition and `mul_neg`, `neg_mul`, `smul_neg`. This is an algebraic lemma for ALL real B, not a new Clifford theorem.
2. **Fock coefficient sign:** `Q(-J)=-Q(J)` directly from the BIL-0C definition; the repaired B2 consumer uses the exact tactic `simp [originalColorQuadratic, neg_smul]`. Do not import the B2 diagnostic source merely to reuse its private helper. Derive the same elementary coefficient identity locally, or generalize later in its own proved source.
3. **Star and i:** from the new source theorem and `Bᵀ=-B` obtain `star(O_B(x))=-O_B(x)`. Use the precise Mathlib lemma `skewAdjoint.mem_iff` to construct skew-adjoint membership, then use **`IsSelfAdjoint.I_smul_of_mem_skewAdjoint`** for self-adjointness of the complex-`i` multiple.

Pinned Mathlib evidence checked at `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Mathlib/Algebra/Star/SelfAdjoint.lean`, line 564: `skewAdjoint.mem_iff : a ∈ skewAdjoint A ↔ star a = -a`; lines 633–636 `isSelfAdjoint_smul_of_mem_skewAdjoint`.
- `Mathlib/Analysis/RCLike/Basic.lean`, lines 767–780: `RCLike.I_mem_skewAdjoint` and `IsSelfAdjoint.I_smul_of_mem_skewAdjoint`. This lemma is *exactly* the needed sign/scalar bridge and avoids manual `star Complex.I` simplification.
- `Mathlib/Algebra/Star/Basic.lean`: `star_smul`, `star_neg`; `Mathlib/Algebra/Star/BigOperators.lean`: `star_sum`.

Potential consumer skeleton (compile independently; imports source JOIN-0B3 and source BIL/VLY definitions, NOT diagnostic B1/B2 modules):

```lean
private theorem gramGamma_neg (x : Boson 2) (B : GammaMatrix) :
    originalGramGammaCoefficient x (-B) =
      -originalGramGammaCoefficient x B := by
  simp [originalGramGammaCoefficient, mul_neg, neg_mul, smul_neg]

private theorem quadratic_neg (J : Matrix SpinIndex SpinIndex ℝ) :
    originalColorQuadratic (-J) = -originalColorQuadratic J := by
  simp [originalColorQuadratic, neg_smul]

private theorem observable_neg (x : Boson 2) (B : GammaMatrix) :
    originalFockGramObservable x (-B) =
      -originalFockGramObservable x B := by
  change originalColorQuadratic (originalGramGammaCoefficient x (-B)) =
    -originalColorQuadratic (originalGramGammaCoefficient x B)
  rw [gramGamma_neg, quadratic_neg]

theorem originalFockGramI_isSelfAdjoint
    (x : Boson 2) (B : GammaMatrix) (hB : Bᵀ = -B) :
    IsSelfAdjoint ((Complex.I : ℂ) • originalFockGramObservable x B) := by
  have hskew : star (originalFockGramObservable x B) =
      -originalFockGramObservable x B := by
    rw [originalFockGramObservable_star_transpose, hB,
      observable_neg]
  exact IsSelfAdjoint.I_smul_of_mem_skewAdjoint
    ((skewAdjoint.mem_iff).2 hskew)
```

This is a tactical sketch, not a compiled proof; check notation, namespace and import availability in the first B3 cold gate. If the consumer encounters nested-negation simp failure, use explicit sum-congruence and `neg_smul` as in the B2 second RED analysis; do not weaken source or axiom controls.

## 4. Exact new strict-gate ancestry: 102, not 98

The two existing strict manifests were *actually compared* at source snapshot `c763b2a9...`:

| Source manifest | Frozen entries | Difference relative to other |
| --- | ---: | --- |
| JOIN-0B1 strict | 98 | 2 B1 source/consumer blobs |
| JOIN-0B2 current strict | 98 | 2 B2 source/consumer blobs |
| Identical common accepted pre-JOIN-0B roots | 96 | No hash conflicts |
| Unique B1+B2 union | **100** | 96+2+2 |
| Proposed JOIN-0B3 with its own source+consumer | **102** | 100+2 |

The two already-stage files in B2 are unqualified until the running B2 repair gate passes. On its success, build the new manifest by **deduplicating by exact path** and ASSERTING each shared hash matches; never copy only the latest B1 or B2 98-pin manifest and forget the other two files. Pin both independent consumer files even though neither is a Lean import of the new B3 source. Exact branch commit/source sha, cold Lean 4.34.1, pinned Mathlib, `#print axioms` limited to `propext, Classical.choice, Quot.sound`, forbidden source-trick checks, independent consumer and immutable proof artifacts.

**STOP RULE:** If B2 is red, repair **B2 only**, do not launch B3; any prior B2 source build without consumer green is not a qualified import ancestor. Do not edit already qualified B1 source or workflow. This preparatory memorandum by itself is **not** permission to claim a B3 theorem.

## 5. Scope, significance, and later work

- The real skew 16×16 coefficient carrier has dimension 120. B1 proves the original Gram–gamma map preserves it; B2 if fully green will prove true Fock-star transport. The resulting `(i:ℂ) • Q(G_x(B))` is a **pointwise self-adjoint bounded operator on original finite Fermion 2**, for each x. The adjective "bounded" is pointwise on the finite-dimensional Fock carrier, **not uniform in x**.
- Combined with already accepted JOIN-0A, constant scalar multiplication preserves pointwise SU2 gauge covariance. No new gauge-invariance proof is necessary for this one scalar.
- This establishes neither a source-defined bounded multiplication operator on `FullL2 2` nor invariance of the physical supercharge graph/domain, charge anticommutator, closed quadratic form or BFSS Hamiltonian. Pointwise gauge covariance and Fock self-adjointness are not enough to infer any physical spectrum.
- Uniform normalized field bounds `G_x(B)/(1+T(x))`, original source CAR trace pairing/scaled 120D faithful Hilbert–Schmidt embedding, direct Kx three-color expression and quartic-potential moment formulas remain independent future gates.
- Do not infer three particle generations or NFC Hopf topology from this star/transpose gate. Preserve the experimental topology questions as separate candidate-neutral research, not theorem statements.
