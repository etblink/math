import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BTPBWBilinearMultiplicationSmoothness
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm from the actual source basis and finite-coordinate adapter.
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

example (a : CliffordAlgebra source9Quadratic) :
    CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9CliffordLeftMulCLM a
example (a b : CliffordAlgebra source9Quadratic) :
    source9CliffordLeftMulCLM a b = a * b := rfl

example :
    CliffordAlgebra source9Quadratic →L[ℝ]
      CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9CliffordMulCLM
example (a b : CliffordAlgebra source9Quadratic) :
    source9CliffordMulCLM a b = a * b :=
  source9CliffordMulCLM_apply a b

-- Check that an actual bounded-bilinear certificate is supplied, without assuming NormedRing.
example : IsBoundedBilinearMap ℝ
    (fun xy : CliffordAlgebra source9Quadratic × CliffordAlgebra source9Quadratic =>
      xy.1 * xy.2) := by
  change IsBoundedBilinearMap ℝ
    (fun xy : CliffordAlgebra source9Quadratic × CliffordAlgebra source9Quadratic =>
      source9CliffordMulCLM xy.1 xy.2)
  exact source9CliffordMulCLM.isBoundedBilinearMap

example (n : ℕ∞ω) :
    ContDiff ℝ n
      (fun xy : CliffordAlgebra source9Quadratic × CliffordAlgebra source9Quadratic =>
        xy.1 * xy.2) :=
  source9Clifford_mul_contDiff_pbw n

#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordLeftMulCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordMulCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordMulCLM_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_mul_contDiff_pbw

end
