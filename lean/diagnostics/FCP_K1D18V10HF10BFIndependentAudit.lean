import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BFPBWCliffordTopologicalRing
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the diagnostic topology without installing the exported structures.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _

private def auditPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))

local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic)
    (Finset SpaceIndex → ℝ)
    auditPBWCoordinates.toAddMonoidHom
    auditPBWCoordinates.injective

local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic)
    (Finset SpaceIndex → ℝ)
    auditPBWCoordinates


-- Recheck the accepted norm agrees with the independently reconstructed norm.
example : source9PBWCoordinates = auditPBWCoordinates := rfl

example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic)
      (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom
      auditPBWCoordinates.injective := rfl

-- No module-topology or multiplication-continuity hypothesis is installed.
example : IsModuleTopology ℝ (CliffordAlgebra source9Quadratic) :=
  source9Clifford_isModuleTopology_pbw

example :
    Continuous (fun xy : CliffordAlgebra source9Quadratic × CliffordAlgebra source9Quadratic =>
      xy.1 * xy.2) :=
  source9Clifford_mul_continuous_pbw

example : IsTopologicalRing (CliffordAlgebra source9Quadratic) :=
  source9Clifford_isTopologicalRing_pbw

#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_isModuleTopology_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_mul_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_isTopologicalRing_pbw

end
