import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity
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

-- Check the coordinate map and the complete induced normed structure exactly.
example : source9PBWCoordinates = auditPBWCoordinates := rfl

example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic)
      (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom
      auditPBWCoordinates.injective := rfl

example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  source9PBWNormedSpace

-- These types use the independently reconstructed topology, not an assumed
-- norm or topology parameter. They must match the exported declarations.
example : T2Space (CliffordAlgebra source9Quadratic) :=
  source9Clifford_t2Space_pbw

example : T2Space (spinGroup source9Quadratic) :=
  source9Spin_t2Space_pbw

example : Continuous source9GammaCliffordAlgHom :=
  source9GammaCliffordAlgHom_continuous_pbw

example : Continuous source9SpinGammaSpecialOrthogonalHom :=
  source9SpinGammaSpecialOrthogonalHom_continuous_pbw

#print axioms FCP.BFSSPairedSpin9Clifford.source9PBWCoordinates
#print axioms FCP.BFSSPairedSpin9Clifford.source9PBWNormedAddCommGroup
#print axioms FCP.BFSSPairedSpin9Clifford.source9PBWNormedSpace
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_t2Space_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_t2Space_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9GammaCliffordAlgHom_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinGammaSpecialOrthogonalHom_continuous_pbw

end
