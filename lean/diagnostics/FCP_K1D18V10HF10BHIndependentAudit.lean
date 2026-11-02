import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BHUnitVectorPairMembership
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

example (v : SpaceIndex → ℝ) (hv : source9Quadratic v = 1) :
    (CliffordAlgebra source9Quadratic)ˣ :=
  source9UnitVectorCliffordUnit v hv

example (v : SpaceIndex → ℝ) (hv : source9Quadratic v = 1) :
    ((source9UnitVectorCliffordUnit v hv) : CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.ι source9Quadratic v := rfl

example (v : SpaceIndex → ℝ) (hv : source9Quadratic v = 1) :
    source9UnitVectorCliffordUnit v hv ∈ lipschitzGroup source9Quadratic :=
  source9UnitVectorCliffordUnit_mem_lipschitzGroup v hv

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v ∈
      spinGroup source9Quadratic :=
  source9UnitVectorPair_mem_spinGroup u v hu hv

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    spinGroup source9Quadratic :=
  source9UnitVectorPairSpin u v hu hv

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    ((source9UnitVectorPairSpin u v hu hv) : CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v := rfl

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    ((source9SpinGammaSpecialOrthogonalHom (source9UnitVectorPairSpin u v hu hv)) :
      GammaMatrix) = gammaNineRealLinear u * gammaNineRealLinear v :=
  source9UnitVectorPairSpin_gamma u v hu hv

#print axioms FCP.BFSSPairedSpin9Clifford.source9UnitVectorCliffordUnit
#print axioms FCP.BFSSPairedSpin9Clifford.source9UnitVectorCliffordUnit_mem_lipschitzGroup
#print axioms FCP.BFSSPairedSpin9Clifford.source9UnitVectorPair_mem_spinGroup
#print axioms FCP.BFSSPairedSpin9Clifford.source9UnitVectorPairSpin
#print axioms FCP.BFSSPairedSpin9Clifford.source9UnitVectorPairSpin_gamma

end
