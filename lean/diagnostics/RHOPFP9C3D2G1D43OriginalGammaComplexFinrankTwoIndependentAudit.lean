import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D43OriginalGammaComplexFinrankTwo

/-! Independent D43 imported consumer: source real-linear unwrap
and genuine Gamma9 induced complex rank exactly two. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D43Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D43

example :
    RelationalSourceComplexFour ≃ₗ[ℝ] (Fin 4 → ℝ) :=
  relationalSourceComplexFourRealLinearEquiv

example :
    Module.finrank ℝ RelationalSourceComplexFour = 4 :=
  relationalSourceComplexFour_finrank_real

example :
    Module.finrank ℂ RelationalSourceComplexFour = 2 :=
  relationalSourceComplexFour_finrank_complex

#print axioms FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFourRealLinearEquiv
#print axioms FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFour_finrank_real
#print axioms FCP.RHOPFP9C3D2G1D43.relationalSourceComplexFour_finrank_complex

end
end FCP.RHOPFP9C3D2G1D43Independent
