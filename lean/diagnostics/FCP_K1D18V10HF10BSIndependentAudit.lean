import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BSSourceMatrixCurveVelocity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BKCoordinatePlaneVelocityComparison
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

private abbrev auditSourceMatrixProductTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
private abbrev auditGammaProductTopology : TopologicalSpace GammaMatrix := inferInstance

open scoped Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditSourceMatrixProductTopology := rfl
example : (inferInstance : TopologicalSpace GammaMatrix) = auditGammaProductTopology := rfl
example : NormedAddCommGroup (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
example : NormedSpace ℝ (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance

example (r s : SpaceIndex) (hrs : r ≠ s) (i j : SpaceIndex) :
    HasDerivAt (fun t : ℝ => source9SpinVectorMatrixHom
      (source9PlaneSpinCurve r s hrs t) i j) (coordinatePlane9 r s i j) 0 :=
  source9PlaneSpinCurve_vectorMatrix_entry_hasDerivAt_zero r s hrs i j

example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      ((source9SpinVectorOrthogonalHom (source9PlaneSpinCurve r s hrs t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) (coordinatePlane9 r s) 0 :=
  source9PlaneSpinCurve_vectorOrthogonalMatrix_hasDerivAt_zero r s hrs

-- Check the canonical native plane is the full literal E_rs - E_sr.
example (r s : SpaceIndex) : LieAlgebra.Orthogonal.so SpaceIndex ℝ :=
  source9CoordinatePlaneInSo r s
example (r s : SpaceIndex) :
    ((source9CoordinatePlaneInSo r s) : Matrix SpaceIndex SpaceIndex ℝ) =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) := by
  change coordinatePlane9 r s = _
  exact coordinatePlane9_eq_single_sub_single r s

-- The same exact source curve has native-plane velocity on nine-vectors and
-- the accepted canonical LieHom image velocity in the original gamma target.
example (r s : SpaceIndex) (hrs : r ≠ s) :
    HasDerivAt (fun t : ℝ =>
      ((source9SpinVectorOrthogonalHom (source9PlaneSpinCurve r s hrs t)) :
        Matrix SpaceIndex SpaceIndex ℝ))
      ((source9CoordinatePlaneInSo r s) : Matrix SpaceIndex SpaceIndex ℝ) 0 ∧
    HasDerivAt (fun t : ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9PlaneSpinCurve r s hrs t)) : GammaMatrix))
      ((coordinateToOriginalGammaSkewLieHom (source9CoordinatePlaneInSo r s)) : GammaMatrix) 0 := by
  constructor
  · exact source9PlaneSpinCurve_vectorOrthogonalMatrix_hasDerivAt_zero r s hrs
  · exact source9PlaneSpinCurve_gamma_hasDerivAt_coordinatePlaneLieHom r s hrs

#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_vectorMatrix_entry_hasDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_vectorOrthogonalMatrix_hasDerivAt_zero

end
