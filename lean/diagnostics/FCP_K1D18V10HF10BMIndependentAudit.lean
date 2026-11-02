import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BMInverseSourceCurveDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently for the inverse derivative.
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

example (r s : SpaceIndex) (hrs : r ≠ s) :
    CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) =
      -(CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)) :=
  source9CoordinateClifford_anticommute r s hrs

example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    (((source9PlaneSpinCurve r s hrs t)⁻¹ : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) =
      (Real.cos (t / 2)) • (1 : CliffordAlgebra source9Quadratic) +
        (Real.sin (t / 2)) •
          (-(CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
            CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) :=
  source9PlaneSpinCurve_inv_coe r s hrs t

example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      (((source9PlaneSpinCurve r s hrs t)⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic))
      (-((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)))) 0 :=
  source9PlaneSpinCurve_inv_coe_hasDerivAt_zero r s hrs

#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinateClifford_anticommute
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_inv_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_inv_coe_hasDerivAt_zero

end
