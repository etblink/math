import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BKCoordinatePlaneVelocityComparison
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

private abbrev auditGammaProductTopology : TopologicalSpace GammaMatrix := inferInstance
open scoped Matrix.Norms.Elementwise
example : (inferInstance : TopologicalSpace GammaMatrix) = auditGammaProductTopology := rfl

example (r s : SpaceIndex) : LieAlgebra.Orthogonal.so SpaceIndex ℝ :=
  source9CoordinatePlaneInSo r s

-- Check the input is literally the full native E_rs - E_sr, with no extra half factor.
example (r s : SpaceIndex) :
    ((source9CoordinatePlaneInSo r s) : Matrix SpaceIndex SpaceIndex ℝ) =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) := by
  change coordinatePlane9 r s = _
  exact coordinatePlane9_eq_single_sub_single r s

example (r s : SpaceIndex) (hrs : r ≠ s) :
    ((coordinateToOriginalGammaSkewLieHom (source9CoordinatePlaneInSo r s)) : GammaMatrix) =
      (1 / 2 : ℝ) • (gamma r * gamma s) :=
  coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply r s hrs

example (r s : SpaceIndex) (hrs : r ≠ s) :
    source9GammaCliffordAlgHom
      ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) =
      ((coordinateToOriginalGammaSkewLieHom (source9CoordinatePlaneInSo r s)) : GammaMatrix) :=
  source9PlaneCliffordVelocity_gamma_eq_coordinatePlaneLieHom r s hrs

example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9PlaneSpinCurve r s hrs t)) : GammaMatrix))
      ((coordinateToOriginalGammaSkewLieHom (source9CoordinatePlaneInSo r s)) : GammaMatrix) 0 :=
  source9PlaneSpinCurve_gamma_hasDerivAt_coordinatePlaneLieHom r s hrs

#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinatePlaneInSo
#print axioms FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneCliffordVelocity_gamma_eq_coordinatePlaneLieHom
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_gamma_hasDerivAt_coordinatePlaneLieHom

end
