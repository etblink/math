import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BGPBWSourceSpinTopologicalGroup
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



-- Fix the exact independently reconstructed PBW topology before checking exports.
example : source9PBWCoordinates = auditPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic)
      (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom
      auditPBWCoordinates.injective := rfl

example :
    Continuous (CliffordAlgebra.reverse :
      CliffordAlgebra source9Quadratic → CliffordAlgebra source9Quadratic) :=
  source9Clifford_reverse_continuous_pbw

example (g : spinGroup source9Quadratic) :
    ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic) :=
  source9Spin_inv_coe_eq_reverse g

example : Continuous (fun g : spinGroup source9Quadratic => g⁻¹) :=
  source9Spin_inv_continuous_pbw

example :
    Continuous (fun gh : spinGroup source9Quadratic × spinGroup source9Quadratic =>
      gh.1 * gh.2) :=
  source9Spin_mul_continuous_pbw

-- No continuity or topological-group hypotheses are installed in this audit.
example : IsTopologicalGroup (spinGroup source9Quadratic) :=
  source9Spin_isTopologicalGroup_pbw

#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_reverse_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_inv_coe_eq_reverse
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_inv_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_mul_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_isTopologicalGroup_pbw

end
