import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H0OriginalScalarImageAdapter

/-!
# W0H0 independent consumer of the exact original scalar-action adapter

The original W0B1 induction is stopped and is never imported here.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H0OriginalScalarImageIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4W0H0OriginalScalarImageAdapter

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalComplexEquiv_scalarImage_commutes_consumer
    (T : Op) (z : ℂ) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((algebraMap ℂ A) z)) :=
  originalComplexEquiv_scalarImage_commutes T z

example (T : Op) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((algebraMap ℂ A) 0)) :=
  originalComplexEquiv_scalarImage_commutes_consumer T 0

example (T : Op) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((algebraMap ℂ A) 1)) :=
  originalComplexEquiv_scalarImage_commutes_consumer T 1

#print axioms originalComplexEquiv_scalarImage_commutes_consumer

end
end FCP.BFSSP3M4W0H0OriginalScalarImageIndependentConsumer
