import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BNSourceConjugationDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

-- Reconstruct the PBW coordinate norm from the accepted basis.
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

-- Recheck all four coefficients and the two cross-term derivatives.
example {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] (a b c d : V) :
    HasDerivAt (fun t : ℝ =>
      ((Real.cos (t / 2) * Real.cos (t / 2)) • a +
        (Real.cos (t / 2) * Real.sin (t / 2)) • b) +
      ((Real.sin (t / 2) * Real.cos (t / 2)) • c +
        (Real.sin (t / 2) * Real.sin (t / 2)) • d))
      ((1 / 2 : ℝ) • b + (1 / 2 : ℝ) • c) 0 :=
  realHalfAngleQuadraticVectorCurve_hasDerivAt_zero a b c d

-- The exact group inverse occurs on the right, at the same parameter.
example (r s : SpaceIndex) (hrs : r ≠ s)
    (W : CliffordAlgebra source9Quadratic) (t : ℝ) :
    ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic) * W *
      (((source9PlaneSpinCurve r s hrs t)⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) =
      ((Real.cos (t / 2) * Real.cos (t / 2)) • W +
        (Real.cos (t / 2) * Real.sin (t / 2)) • (W * (-(CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))))) +
      ((Real.sin (t / 2) * Real.cos (t / 2)) • ((CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)) * W) +
        (Real.sin (t / 2) * Real.sin (t / 2)) •
          (((CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)) * W) * (-(CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))))) :=
  source9PlaneSpinCurve_conjugation_coe r s hrs W t

example (r s : SpaceIndex) (hrs : r ≠ s) (W : CliffordAlgebra source9Quadratic) :
    HasDerivAt (fun t : ℝ =>
      ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic) * W *
        (((source9PlaneSpinCurve r s hrs t)⁻¹ : spinGroup source9Quadratic) :
          CliffordAlgebra source9Quadratic))
      ((((1 / 2 : ℝ) • (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) * W) -
        W * ((1 / 2 : ℝ) • (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)))) 0 :=
  source9PlaneSpinCurve_conjugation_hasDerivAt_zero r s hrs W

-- The derivative is the literal full native plane acting on every original nine-vector.
example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

example (r s : SpaceIndex) (hrs : r ≠ s) (z : SpaceIndex → ℝ) :
    HasDerivAt (fun t : ℝ =>
      ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic) *
        CliffordAlgebra.ι source9Quadratic z *
        (((source9PlaneSpinCurve r s hrs t)⁻¹ : spinGroup source9Quadratic) :
          CliffordAlgebra source9Quadratic))
      (CliffordAlgebra.ι source9Quadratic ((coordinatePlane9 r s).mulVec z)) 0 :=
  source9PlaneSpinCurve_conjugation_vector_hasDerivAt_zero r s hrs z

#print axioms FCP.BFSSPairedSpin9Clifford.realHalfAngleQuadraticVectorCurve_hasDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_conjugation_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_conjugation_hasDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_conjugation_vector_hasDerivAt_zero

end
