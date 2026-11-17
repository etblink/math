import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0G0GenericScalarActionAdapter
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe

/-!
# W0H0 — exact original BFSS Clifford/Fock scalar-image commutation

This is the first bounded source-EXACT specialization of the separately
qualified generic W0G0 scalar-image theorem. It proves only commutation
with scalar algebra-map images under the genuine original M3I equivalence.
It does not import, modify, retry or prove stopped W0B1 full induction.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H0OriginalScalarImageAdapter
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Every original complex-linear Fock operator commutes with the image
of a scalar element of the ORIGINAL complexified Clifford algebra under
the genuine M3I source equivalence. No Clifford generation or Schur. -/
theorem originalComplexEquiv_scalarImage_commutes
    (T : Op) (z : ℂ) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((algebraMap ℂ A) z)) := by
  exact FCP.BFSSP3M4W0G0GenericScalarActionAdapter.generic_algEquiv_scalarImage_commutes
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv T z

#print axioms originalComplexEquiv_scalarImage_commutes

end
end FCP.BFSSP3M4W0H0OriginalScalarImageAdapter
