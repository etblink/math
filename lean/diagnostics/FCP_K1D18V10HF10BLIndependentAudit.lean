import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BLSourceCoordinateCommutatorAction
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

example (r : SpaceIndex) (z : SpaceIndex → ℝ) :
    QuadraticMap.polar source9Quadratic (source9CoordinateVector r) z = 2 * z r :=
  source9Quadratic_polar_coordinate r z

example (u v w : SpaceIndex → ℝ) :
    (CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v) *
        CliffordAlgebra.ι source9Quadratic w -
      CliffordAlgebra.ι source9Quadratic w *
        (CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v) =
      (QuadraticMap.polar source9Quadratic v w) • CliffordAlgebra.ι source9Quadratic u -
        (QuadraticMap.polar source9Quadratic w u) • CliffordAlgebra.ι source9Quadratic v :=
  source9Clifford_pair_commutator_vector u v w

example (r s : SpaceIndex) (z : SpaceIndex → ℝ) :
    (coordinatePlane9 r s).mulVec z =
      (z s) • source9CoordinateVector r - (z r) • source9CoordinateVector s :=
  source9CoordinatePlane_mulVec r s z

-- Recheck the raw matrix is the same full native plane used by F10BK.
example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

example (r s : SpaceIndex) (z : SpaceIndex → ℝ) :
    ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) *
        CliffordAlgebra.ι source9Quadratic z -
      CliffordAlgebra.ι source9Quadratic z *
        ((1 / 2 : ℝ) •
          (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
            CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) =
      CliffordAlgebra.ι source9Quadratic ((coordinatePlane9 r s).mulVec z) :=
  source9CoordinateBivector_commutator_vector r s z

#print axioms FCP.BFSSPairedSpin9Clifford.source9Quadratic_polar_coordinate
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_pair_commutator_vector
#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinatePlane_mulVec
#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinateBivector_commutator_vector

end
