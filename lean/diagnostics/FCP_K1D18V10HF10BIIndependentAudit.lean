import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BICoordinatePlaneSourceCurve
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSGamma9
noncomputable section

example (r : SpaceIndex) :
    source9CoordinateVector r = (Pi.single r (1 : ℝ) : SpaceIndex → ℝ) := rfl
example (r : SpaceIndex) : source9Quadratic (source9CoordinateVector r) = 1 :=
  source9CoordinateVector_unit r

example (r s : SpaceIndex) (t : ℝ) :
    source9PlaneUnitVector r s t =
      (Real.cos (t / 2)) • source9CoordinateVector r +
        (Real.sin (t / 2)) • source9CoordinateVector s := rfl
example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    source9Quadratic (source9PlaneUnitVector r s t) = 1 :=
  source9PlaneUnitVector_unit r s hrs t

example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    spinGroup source9Quadratic := source9PlaneSpinCurve r s hrs t

example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
        CliffordAlgebra.ι source9Quadratic (source9PlaneUnitVector r s t) := rfl

example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic) =
      (Real.cos (t / 2)) • (1 : CliffordAlgebra source9Quadratic) +
        (Real.sin (t / 2)) •
          (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
            CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s)) :=
  source9PlaneSpinCurve_coe r s hrs t

example (r s : SpaceIndex) (hrs : r ≠ s) :
    source9PlaneSpinCurve r s hrs 0 = 1 :=
  source9PlaneSpinCurve_zero r s hrs

example (r s : SpaceIndex) (hrs : r ≠ s) (t : ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom (source9PlaneSpinCurve r s hrs t)) :
      GammaMatrix) =
      (Real.cos (t / 2)) • (1 : GammaMatrix) +
        (Real.sin (t / 2)) • (gamma r * gamma s) :=
  source9PlaneSpinCurve_gamma r s hrs t

#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinateVector
#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinateVector_unit
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneUnitVector
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneUnitVector_unit
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_gamma

end
