# BFSS M4 QTC1 R1 — original-source real / complex one-quarter bridge

Date 2026-11-16 Pacific. **Pre-gate research contract; not a qualified theorem.**
Single branch `integration/bfss-unified-research-20261108`. Never touch `main`.

## Qualified immediate context

QTC0D [#44018395393](https://github.com/etblink/math/actions/runs/44018395393) is strictly GREEN, original Fock endomorphism carrier `Fermion 2 →L[ℂ] Fermion 2`, `Q_x(B)=(1/4:ℂ)•Σ_{p,q}B_{pq}•(x_p*x_q)`, with conditional covariance `[T,Q_x(B)]=Q_x(AB+BAᵀ)` under explicit generator hypothesis. Its original provider artifact #14299603963 SHA-256 `7b19d5dc6d02f14c9ae831382b4d2f8c42d20d5a0ab4ad585d8e8858e9b1a54f` and full log are archived.

Original donor `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean`, source blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`, defines on the ORIGINAL `Source48Label` and normalized original Fock gamma:
```lean
originalSource48BivectorK (B : Matrix Source48Label Source48Label ℝ) : Op :=
  ∑ p, ∑ q, (B p q / 4 : ℝ) •
    (sourceNormalizedGamma p * sourceNormalizedGamma q)
```
This contains **inside-sum real scalar B/4**, in contrast to QTC0D's **outer complex scalar 1/4**.

Accepted donor `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul` shows `(r:ℝ)•X=((r:ℝ):ℂ)•X` on actual original Fock continuous-linear operators. Verified usage in accepted `P3M4LB1S` and `P3M4LB1C1` source proofs. Former also already proves the native skew-adjoint property of the source `K(B)`. No fake `Module ℝ Op`/scalar-tower instance is needed.

## Two mathematical atoms for QTC1 R1

1. On **generic finite index set** `ι` and opaque `w : ι→ι→Op`, `B : Matrix ι ι ℝ`, prove
```text
Σ_{p,q} (B[p,q]/4 : ℝ) • w[p,q]
    = (1/4 : ℂ) • Σ_{p,q} ((B[p,q] : ℝ) : ℂ) • w[p,q].
```
Proof route: use established `originalFockOperator_real_smul_eq_complex_smul` per term; for real `r` establish `((r/4:ℝ):ℂ)=(1/4:ℂ)*((r:ℝ):ℂ)` by explicit `ring` plus `exact_mod_cast` (both methods previously compiled in LB1C1); `smul_smul`; `Finset.smul_sum`. Do *not* expand `Source48Label` or gamma, or commute operators.
2. Bind `w p q := sourceNormalizedGamma p * sourceNormalizedGamma q`, unfold exact **original** `K(B)` and qualified `originalFockQuadratic` and conclude
```lean
originalSource48BivectorK B =
  originalFockQuadratic sourceNormalizedGamma
    (fun p q => ((B p q : ℝ) : ℂ))
```
for **arbitrary real B**, including nonskew; no Lie assumptions and no altered coefficient factor or gamma normalization.

## Strict gate and independent controls

Two source roots and two separately importing consumer roots, original `Fermion 2` carrier and Source48Label, Fin0/Fin1/Fin2/Fin3 generic controls and three independent nonskew/zero normalization controls. Exact source/consumer/workflow blob pins; strict Lean 4.34.1 / pinned Mathlib; cold original Fock source build; 2+2 standard-only axiom reports (allowed `propext`, `Classical.choice`, `Quot.sound`), six auditor mutants. Original provider ZIP and complete Actions job logs preserved on RED or GREEN with independent SHA-256. No `sorry`, `admit`, added `axiom`, `unsafe`, increased recursion/heartbeat budget, or rewriting/generating a mock representation. Never import QTC0B.

**Independent scientific ceiling:** equality of two definitions of the same source Fock generator is not the native `[K(A),K(B)]` bracket. The accepted LB1C1 real skew generator covariance still has to be transported to complex hcov; that is a *separate* QTC2 binding. Neither physical Spin(9) symmetry, Hamiltonian domains, eigenstate existence nor positive-regulator fidelity follows automatically. Two analogous REDs require a method stop and architecture review.
