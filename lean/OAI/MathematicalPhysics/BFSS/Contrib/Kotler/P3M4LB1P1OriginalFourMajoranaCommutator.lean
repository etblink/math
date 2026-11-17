import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB0OriginalSource48MajoranaBivectorCAR
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L2AbstractOriginalFockCovarianceLeibniz
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P0BOriginalSource48SkewPlaneNormalization

/-!
# BFSS M4 LB1P1 — four original Majoranas, no arbitrary K(A) expansion

First a conditional four-term commutator lemma for opaque original Fock
operators. Then specialize only four original normalized Gamma labels
using accepted LB0 triple commutators and LB1L2 product covariance.

All repeated labels are allowed. This is NOT the skew-matrix K Lie
homomorphism, a Spin9 group action, or a physical spectral conclusion.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P1OriginalFourMajoranaCommutator
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Conditional noncommutative four-factor identity.
The two assumed covariances are explicit; this theorem does not
assume arbitrary Fock operators commute. -/
theorem originalFock_fourFactor_commutator_from_two_covariances
    (T X Y U V : Op) (a b c d : ℂ)
    (hX : T * X - X * T = a • U - b • V)
    (hY : T * Y - Y * T = c • U - d • V) :
    T * (X * Y) - (X * Y) * T =
      a • (U * Y) - b • (V * Y) +
        c • (X * U) - d • (X * V) := by
  calc
    T * (X * Y) - (X * Y) * T =
        (a • U - b • V) * Y + X * (c • U - d • V) :=
      FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz.
        originalFock_product_covariance_from_two_hypotheses
          T X Y (a • U - b • V) (c • U - d • V) hX hY
    _ = a • (U * Y) - b • (V * Y) +
          c • (X * U) - d • (X * V) := by
      simp only [sub_mul, mul_sub, smul_mul_assoc, mul_smul_comm]
      abel

/-- Native source48 four-Majorana commutator on the exact original
Fermion 2 Fock carrier. The explicit Kronecker coefficients follow
the normalized square-one CAR, with no distinctness assumption.
This uses only two accepted LB0 triples and the opaque lemma above. -/
theorem originalSource48_fourMajorana_commutator
    (i j k l : Source48Label) :
    (sourceNormalizedGamma i * sourceNormalizedGamma j) *
        (sourceNormalizedGamma k * sourceNormalizedGamma l) -
      (sourceNormalizedGamma k * sourceNormalizedGamma l) *
        (sourceNormalizedGamma i * sourceNormalizedGamma j) =
      (if j = k then (2 : ℂ) else 0) •
          (sourceNormalizedGamma i * sourceNormalizedGamma l) -
        (if i = k then (2 : ℂ) else 0) •
          (sourceNormalizedGamma j * sourceNormalizedGamma l) +
        (if j = l then (2 : ℂ) else 0) •
          (sourceNormalizedGamma k * sourceNormalizedGamma i) -
        (if i = l then (2 : ℂ) else 0) •
          (sourceNormalizedGamma k * sourceNormalizedGamma j) := by
  exact originalFock_fourFactor_commutator_from_two_covariances
    (sourceNormalizedGamma i * sourceNormalizedGamma j)
    (sourceNormalizedGamma k) (sourceNormalizedGamma l)
    (sourceNormalizedGamma i) (sourceNormalizedGamma j)
    (if j = k then (2 : ℂ) else 0)
    (if i = k then (2 : ℂ) else 0)
    (if j = l then (2 : ℂ) else 0)
    (if i = l then (2 : ℂ) else 0)
    (FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR.
      originalMajorana_bivector_commutator i j k)
    (FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR.
      originalMajorana_bivector_commutator i j l)

#print axioms originalFock_fourFactor_commutator_from_two_covariances
#print axioms originalSource48_fourMajorana_commutator

end
end FCP.BFSSP3M4LB1P1OriginalFourMajoranaCommutator
