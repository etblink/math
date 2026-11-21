import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D39OriginalGammaQNormedGroupCoherence

/-!
# RHOPF-P9C3D2G1D40 — standalone source-Q compatible complex NormedSpace

D37 accepted an original Gamma9 Q-Hermitian complex InnerProductSpace.Core.
D38 accepted a detached normed group from that same Core.
D39 accepted that the actual detached group norm is sqrt(original Q).
This gate packages the corresponding pinned Mathlib complex NormedSpace
as a DETACHED value under a local normed group instance, then checks
the complex scalar norm law and original Q scaling.

No global NormedAddCommGroup/NormedSpace/InnerProductSpace instance
is added, and the ambient Fin 4 → ℝ Euclidean norm stays untouched.
No C² frame/Hopf quotient or physical BFSS conclusion is inferred.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D40
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D37
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D39

/-- An isolated, source-Q-compatible NormedSpace ℂ structure from
the original Gamma9 Core. The local normed-group argument is explicit
even in the declaration TYPE, so no global instance is installed. -/
@[instance_reducible]
noncomputable def relationalSourceComplexFourNormedSpace :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    NormedSpace ℂ RelationalSourceComplexFour := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : InnerProductSpace.Core ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductCore
  exact InnerProductSpace.Core.toNormedSpace
    (𝕜 := ℂ) (F := RelationalSourceComplexFour)

/-- Complex scalar multiplication scales the NORM OF THE ACTUAL
original Gamma9 Q-derived detached group by the complex modulus. -/
theorem relationalSourceComplexFourGroupNorm_smul
    (z : ℂ) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm (z • x) =
      ‖z‖ * relationalSourceComplexFourGroupNorm x := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  change ‖z • x‖ = ‖z‖ * ‖x‖
  exact norm_smul z x

/-- The original gamma-derived quadratic Q scales with squared
complex modulus, as a consequence of the proven actual group norm. -/
theorem relationalSourceComplexFourSourceQ_complex_smul
    (z : ℂ) (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf (z • x).coordinates =
      ‖z‖ ^ 2 * relationalRangeCoordinateDotSelf x.coordinates := by
  rw [← relationalSourceComplexFourGroupNorm_sq,
    relationalSourceComplexFourGroupNorm_smul,
    mul_pow, relationalSourceComplexFourGroupNorm_sq]

#print axioms relationalSourceComplexFourNormedSpace
#print axioms relationalSourceComplexFourGroupNorm_smul
#print axioms relationalSourceComplexFourSourceQ_complex_smul

end
end FCP.RHOPFP9C3D2G1D40
