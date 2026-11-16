import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48NormalizedFockGammaProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48FockGammaSelfAdjointProbe

/-!
# P3-M4-LB0 — original Source48 CAR bivector infinitesimal microgate

Start with EXACT normalized original 24×2 Majorana operators in the
ACTUAL Fermion 2 Fock space. The sources are the original normalized
sqrt(2) CAR and physical-Hilbert-adjoint gamma, not surrogate gammas.

This first bounded step proves the triple commutator formula for a
SINGLE ordered Majorana bivector and skew-adjointness for distinct
indices. It does not yet prove the skew-matrix-summed K(A) identity,
a Lie homomorphism, a global Spin9 Fock-vector unitary, physical charge
domain covariance or any spectral conclusion.

No unbounded heartbeats; warning-as-error cold pinned CI and an
independent original-source consumer are required before acceptance.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48FockGammaSelfAdjoint

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Original source CAR implies an exact triple commutator on
literal Source48Label, without assuming the gamma factors commute.
The scalar factors retain the source square-one normalization. -/
theorem originalMajorana_bivector_commutator_CAR
    (p q k : Source48Label) :
    (sourceNormalizedGamma p * sourceNormalizedGamma q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      sourceNormalizedGamma p *
          ((if q = k then (2 : ℂ) else 0) • (1 : Op)) -
        ((if p = k then (2 : ℂ) else 0) • (1 : Op)) *
          sourceNormalizedGamma q := by
  have hq := sourceNormalizedGamma_pairwise_CAR q k
  have hp := sourceNormalizedGamma_pairwise_CAR p k
  calc
    (sourceNormalizedGamma p * sourceNormalizedGamma q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      sourceNormalizedGamma p *
          (sourceNormalizedGamma q * sourceNormalizedGamma k +
            sourceNormalizedGamma k * sourceNormalizedGamma q) -
        (sourceNormalizedGamma p * sourceNormalizedGamma k +
          sourceNormalizedGamma k * sourceNormalizedGamma p) *
          sourceNormalizedGamma q := by
            noncomm_ring
    _ = sourceNormalizedGamma p *
          ((if q = k then (2 : ℂ) else 0) • (1 : Op)) -
        ((if p = k then (2 : ℂ) else 0) • (1 : Op)) *
          sourceNormalizedGamma q := by rw [hq, hp]

/-- Scalar normalization of the source CAR bivector commutator.
This is the exact summand required for the proposed K(A) proof. -/
theorem originalMajorana_bivector_commutator
    (p q k : Source48Label) :
    (sourceNormalizedGamma p * sourceNormalizedGamma q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      (if q = k then (2 : ℂ) else 0) • sourceNormalizedGamma p -
        (if p = k then (2 : ℂ) else 0) • sourceNormalizedGamma q := by
  rw [originalMajorana_bivector_commutator_CAR]
  have hL (x : Op) (a : ℂ) :
      x * (a • (1 : Op)) = a • x := by
    rw [mul_smul_comm]
    simp
  have hR (x : Op) (a : ℂ) :
      (a • (1 : Op)) * x = a • x := by
    rw [smul_mul_assoc]
    simp
  rw [hL, hR]

/-- The physical Fock adjoint of a product of two distinct
sqrt(2)-normalized original Majoranas equals its negative. This is
NOT a claim about the Clifford odd-generator star convention. -/
theorem originalMajorana_bivector_skewAdjoint
    (p q : Source48Label) (hpq : p ≠ q) :
    star (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      -(sourceNormalizedGamma p * sourceNormalizedGamma q) := by
  have hcar :
      sourceNormalizedGamma p * sourceNormalizedGamma q +
        sourceNormalizedGamma q * sourceNormalizedGamma p = (0 : Op) := by
    calc
      sourceNormalizedGamma p * sourceNormalizedGamma q +
          sourceNormalizedGamma q * sourceNormalizedGamma p =
          (0 : ℂ) • (1 : Op) := by
            simpa [hpq] using (sourceNormalizedGamma_pairwise_CAR p q)
      _ = (0 : Op) := zero_smul ℂ (1 : Op)
  calc
    star (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      ContinuousLinearMap.adjoint
        (sourceNormalizedGamma p * sourceNormalizedGamma q) :=
      ContinuousLinearMap.star_eq_adjoint _
    _ = sourceNormalizedGamma q * sourceNormalizedGamma p := by
      change ContinuousLinearMap.adjoint
        (sourceNormalizedGamma p ∘L sourceNormalizedGamma q) =
          sourceNormalizedGamma q ∘L sourceNormalizedGamma p
      rw [ContinuousLinearMap.adjoint_comp,
        (sourceNormalizedGamma_selfAdjoint q).adjoint_eq,
        (sourceNormalizedGamma_selfAdjoint p).adjoint_eq]
    _ = -(sourceNormalizedGamma p * sourceNormalizedGamma q) := by
      calc
        sourceNormalizedGamma q * sourceNormalizedGamma p =
            (sourceNormalizedGamma p * sourceNormalizedGamma q +
              sourceNormalizedGamma q * sourceNormalizedGamma p) -
                sourceNormalizedGamma p * sourceNormalizedGamma q := by
              abel
        _ = -(sourceNormalizedGamma p * sourceNormalizedGamma q) := by
              rw [hcar]
              simp

#print axioms originalMajorana_bivector_commutator_CAR
#print axioms originalMajorana_bivector_commutator
#print axioms originalMajorana_bivector_skewAdjoint

end
end FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR
