import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB0OriginalSource48MajoranaBivectorCAR

/-!
# P3-M4-LB0 independent exact original Fock CAR bivector consumer

Three genuinely source-typed implications on the real original
Source48Label = Fin 24 × Fin 2 and the physical Fock operator space.
No alternative Clifford model, missing hypothesis, or physical charge
domain is introduced.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCARIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR

/-- Independent literal 48-label Fock-operator triple CAR consumer. -/
theorem originalFockCAR_bivector_raw_consumer
    (p q k : Source48Label) :
    (sourceNormalizedGamma p * sourceNormalizedGamma q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      sourceNormalizedGamma p *
        ((if q = k then (2 : ℂ) else 0) •
          (1 : Fermion 2 →L[ℂ] Fermion 2)) -
      ((if p = k then (2 : ℂ) else 0) •
          (1 : Fermion 2 →L[ℂ] Fermion 2)) *
        sourceNormalizedGamma q :=
  originalMajorana_bivector_commutator_CAR p q k

/-- Independent normalized coefficient version; no hidden division
by the original Majorana sqrt(2). -/
theorem originalFockCAR_bivector_coeff_consumer
    (p q k : Source48Label) :
    (sourceNormalizedGamma p * sourceNormalizedGamma q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      (if q = k then (2 : ℂ) else 0) • sourceNormalizedGamma p -
        (if p = k then (2 : ℂ) else 0) • sourceNormalizedGamma q :=
  originalMajorana_bivector_commutator p q k

/-- Independent physical Fock-adjoint sign for all distinct actual
Majorana coordinate indices. -/
theorem originalFockCAR_bivector_skew_consumer
    (p q : Source48Label) (hpq : p ≠ q) :
    star (sourceNormalizedGamma p * sourceNormalizedGamma q) =
      -(sourceNormalizedGamma p * sourceNormalizedGamma q) :=
  originalMajorana_bivector_skewAdjoint p q hpq

#print axioms originalFockCAR_bivector_raw_consumer
#print axioms originalFockCAR_bivector_coeff_consumer
#print axioms originalFockCAR_bivector_skew_consumer

end
end FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCARIndependentConsumer
