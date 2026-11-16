# BFSS M4-LB1S — full original 48×48 K(A) skew-adjointness: staged

**Date:** 2026-11-16 Pacific. **Working branch:** `integration/bfss-unified-research-20261108` ONLY, per owner. **Decision:** staged/unqualified until a genuinely cold strict source + independent-consumer run passes and its exact SHA/axioms/artifact are recorded.

## Exact source and input
The qualified [LB0 R3 #43811766549](https://github.com/etblink/math/actions/runs/43811766549) gave three original 24×2-paired `sqrt(2)` Majorana bivector CAR/adjoint declarations with three independent consumers, six standard-only axiom reports. We preserve the original Fock-vector carrier `Fermion 2` and noncommutative Fock operator multiplication; no synthetic matrix/Fock representation.

The new source declares, literally:
```lean
noncomputable def originalSource48BivectorK
    (A : Matrix Source48Label Source48Label ℝ) :
      Fermion 2 →L[ℂ] Fermion 2 :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    (A p q / 4 : ℝ) •
      (sourceNormalizedGamma p * sourceNormalizedGamma q)
```
This is the intended K(A) = (1/4) ∑ A[p,q] Γ_p Γ_q over exact **real** source coefficients; the coefficient is NOT flexible. Source theorem `originalSource48_matrixSkew_entries` binds genuine matrix transpose-skewness to `∀ p q, A p q=-A q p`. For skew A, off-diagonal bivectors are skew-adjoint by qualified LB0; diagonal A[p,p]=0. Termwise physical-star invariance plus Mathlib's star finite-sum formula proves `star (K(A)) = -K(A)`, if the new source compiles. Zero-matrix sanity included.

## New strict experiment

- [LB1S R1 #43840918666](https://github.com/etblink/math/actions/runs/43840918666), head at workflow source-pin fix `41c3bbac3bd5732535a4123cf63e54586b64678d`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean`, source Git blob `1b65187efb3a793e527dc4ee36191e7ba1ee7279`.
- Independent `lean/diagnostics/BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivectorIndependentConsumer.lean`, Git blob `b66be3f0097dbb0a2747e58f7ff21b1bf1d7a1d8`.
- Frozen donor `P3M4LB0OriginalSource48MajoranaBivectorCAR.lean`, Git blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`; original gamma/carriers `SU2BFSSSource48NormalizedFockGammaProbe.lean` `7abc03723b3111e4a03389b722054e50d6a9bf30`, `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` `98889cb8607ccc64091165fbca585acb898b9ddc`.
- New workflow `.github/workflows/bfss-m4-lb1s-original-source48-skew-bivector-strict.yml`: correct actual LB1S cold `mod`, `src`, `obj`, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact source/consumer/donor blob checks, original Fock carrier, warning-as-error, **five native source + four independent consumer** standard-only `#print axioms` reports, zero `sorryAx`.
- Original first workflow push [#43840856415](https://github.com/etblink/math/actions/runs/43840856415) was automatically cancelled by same-workflow concurrency when a *workflow-only* donor pin correction landed. This was not a mathematical CI result and is NOT promoted.

## Subsequent commutator, NOT YET PROVED

A second finite-sum gate LB1C should use exactly the **qualified** LB1S `originalSource48BivectorK`, without redefining or rescaling. Using accepted LB0 `[Γ_pΓ_q,Γ_k]=2δ_{qk}Γ_p-2δ_{pk}Γ_q`, linearity and real skew entries:
```text
[K(A),Γ_k] = (1/2) ∑_p A[p,k]Γ_p
             - (1/2) ∑_q A[k,q]Γ_q
           = ∑_p A[p,k]Γ_p .
```
Proof controls: explicit finite-sum index collapse using `Finset.sum_eq_single` and additive Fock algebra; NO `linear_combination` multiplication tactic on noncommutative operators; no unproved commuting of Γ. Preserve the literal 1/4 normalization and the original paired `Source48Label`. Once both LB1S and LB1C are qualified, examine the actual `F10BB` source `so(9)→so(16)` and original 16-to-48 transport; do not infer a global Fock-vector Spin9 group unitary, charge domain invariance, physical singlet, mass gap or ground state.

**Stop rule:** if LB1S R1 RED, preserve exact first Lean error and source/consumer axiom reports, job and artifact digest *before* any bounded source/CI repair. All updates and CI evidence stay on unified; `main` untouched.
