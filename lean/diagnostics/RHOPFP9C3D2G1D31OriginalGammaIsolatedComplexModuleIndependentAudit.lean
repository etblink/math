import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D31OriginalGammaIsolatedComplexModule

/-! Independent import of the full Module ℂ on an isolated
source Gamma9 complex-four-real carrier, without any new ambient
normed-space instance on Fin 4 → ℝ. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D31Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31

example : Module ℂ RelationalSourceComplexFour := inferInstance

example (z : ℂ) (x : RelationalSourceComplexFour) :
    (z • x).coordinates =
      relationalSourceComplexScalarAction z x.coordinates :=
  relationalSourceComplexFour_smul_coordinates z x

example (x : RelationalSourceComplexFour) :
    (Complex.I • x).coordinates =
      relationalPhaseJFourLinear x.coordinates :=
  relationalSourceComplexFour_I_coordinates x

example (z w : ℂ) (x : RelationalSourceComplexFour) :
    (z * w) • x = z • (w • x) := by
  exact mul_smul z w x

#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFourEquiv
#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFourAddCommGroup
#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFourSMul
#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFourModule
#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFour_smul_coordinates
#print axioms FCP.RHOPFP9C3D2G1D31.relationalSourceComplexFour_I_coordinates

end
end FCP.RHOPFP9C3D2G1D31Independent
