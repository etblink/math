import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BOSourceVectorConjugationDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

-- Reconstruct the accepted ambient PBW norm; leave the output at the standard nine-coordinate Pi norm.
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

-- Exact canonical linear recovery, with no choice of a vector preimage.
example : source9CliffordVectorProjection =
    (ExteriorAlgebra.ιInv :
      ExteriorAlgebra ℝ (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ)).comp
        (CliffordAlgebra.equivExterior source9Quadratic).toLinearMap := rfl

example (z : SpaceIndex → ℝ) :
    source9CliffordVectorProjection (CliffordAlgebra.ι source9Quadratic z) = z :=
  source9CliffordVectorProjection_ι z

example : Continuous source9CliffordVectorProjection :=
  source9CliffordVectorProjection_continuous_pbw

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
      ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) ∈
        LinearMap.range (CliffordAlgebra.ι source9Quadratic) :=
  source9Spin_conjugation_mem_range g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorConjugation g z =
      source9CliffordVectorProjection
        ((g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
          ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic (source9SpinVectorConjugation g z) =
      (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) :=
  source9SpinVectorConjugation_ι g z

-- Retain the full literal native plane and arbitrary original nine-vector.
example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

example (r s : SpaceIndex) (hrs : r ≠ s) (z : SpaceIndex → ℝ) :
    HasDerivAt (fun t : ℝ => source9SpinVectorConjugation
      (source9PlaneSpinCurve r s hrs t) z) ((coordinatePlane9 r s).mulVec z) 0 :=
  source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero r s hrs z

#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordVectorProjection
#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordVectorProjection_ι
#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordVectorProjection_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_conjugation_mem_range
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorConjugation
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorConjugation_ι
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero

end
