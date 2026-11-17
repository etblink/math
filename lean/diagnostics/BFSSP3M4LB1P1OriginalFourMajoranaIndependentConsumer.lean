import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P1OriginalFourMajoranaCommutator

/-!
# P1 independent consumer: original Fock four-factor and native Source48.

No alternate fermion model, no new axioms, no K(A) sum expansion.
Four exact original-label controls: all distinct, shared, identical
bivector labels, and a repeated-label diagonal.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P1OriginalFourMajoranaIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1P1OriginalFourMajoranaCommutator

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_fourFactor_conditional_consumer
    (T X Y U V : Op) (a b c d : ℂ)
    (hX : T * X - X * T = a • U - b • V)
    (hY : T * Y - Y * T = c • U - d • V) :
    T * (X * Y) - (X * Y) * T =
      a • (U * Y) - b • (V * Y) +
        c • (X * U) - d • (X * V) :=
  originalFock_fourFactor_commutator_from_two_covariances
    T X Y U V a b c d hX hY

private def sourceFourLeft (i j k l : Source48Label) : Op :=
  (sourceNormalizedGamma i * sourceNormalizedGamma j) *
      (sourceNormalizedGamma k * sourceNormalizedGamma l) -
    (sourceNormalizedGamma k * sourceNormalizedGamma l) *
      (sourceNormalizedGamma i * sourceNormalizedGamma j)

private def sourceFourRight (i j k l : Source48Label) : Op :=
  (if j = k then (2 : ℂ) else 0) •
      (sourceNormalizedGamma i * sourceNormalizedGamma l) -
    (if i = k then (2 : ℂ) else 0) •
      (sourceNormalizedGamma j * sourceNormalizedGamma l) +
    (if j = l then (2 : ℂ) else 0) •
      (sourceNormalizedGamma k * sourceNormalizedGamma i) -
    (if i = l then (2 : ℂ) else 0) •
      (sourceNormalizedGamma k * sourceNormalizedGamma j)

theorem originalSource48_fourMajorana_consumer
    (i j k l : Source48Label) :
    sourceFourLeft i j k l = sourceFourRight i j k l :=
  originalSource48_fourMajorana_commutator i j k l

private abbrev a0 : Source48Label := ((0 : Fin 24), (0 : Fin 2))
private abbrev a1 : Source48Label := ((1 : Fin 24), (0 : Fin 2))
private abbrev a2 : Source48Label := ((2 : Fin 24), (0 : Fin 2))
private abbrev a3 : Source48Label := ((3 : Fin 24), (0 : Fin 2))

-- Control 1: four pairwise-distinct original labels.
example : sourceFourLeft a0 a1 a2 a3 = sourceFourRight a0 a1 a2 a3 :=
  originalSource48_fourMajorana_commutator a0 a1 a2 a3

-- Control 2: a shared source label, j=k.
example : sourceFourLeft a0 a1 a1 a2 = sourceFourRight a0 a1 a1 a2 :=
  originalSource48_fourMajorana_commutator a0 a1 a1 a2

-- Control 3: two identical ordered bivector factors.
example : sourceFourLeft a0 a1 a0 a1 = sourceFourRight a0 a1 a0 a1 :=
  originalSource48_fourMajorana_commutator a0 a1 a0 a1

-- Control 4: a diagonal first factor, i=j.
example : sourceFourLeft a0 a0 a2 a3 = sourceFourRight a0 a0 a2 a3 :=
  originalSource48_fourMajorana_commutator a0 a0 a2 a3

#print axioms originalFock_fourFactor_conditional_consumer
#print axioms originalSource48_fourMajorana_consumer

end
end FCP.BFSSP3M4LB1P1OriginalFourMajoranaIndependentConsumer
