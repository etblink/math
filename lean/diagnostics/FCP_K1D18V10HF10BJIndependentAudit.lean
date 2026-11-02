import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BJSourceCurveDerivatives
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSGamma9
noncomputable section

-- Reconstruct the accepted PBW norm independently before checking the source derivative.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPBWCoordinates

example : source9PBWCoordinates = auditPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective := rfl

example {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] (a b : V) :
    HasDerivAt (fun t : ℝ => (Real.cos (t / 2)) • a + (Real.sin (t / 2)) • b)
      ((1 / 2 : ℝ) • b) 0 :=
  realHalfAngleVectorCurve_hasDerivAt_zero a b

example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic))
      ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) 0 :=
  source9PlaneSpinCurve_coe_hasDerivAt_zero r s hrs

example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9PlaneSpinCurve r s hrs t)) : GammaMatrix))
      ((1 / 2 : ℝ) • (gamma r * gamma s)) 0 :=
  source9PlaneSpinCurve_gamma_hasDerivAt_zero r s hrs

#print axioms FCP.BFSSPairedSpin9Clifford.realHalfAngleVectorCurve_hasDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_coe_hasDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_gamma_hasDerivAt_zero

end
