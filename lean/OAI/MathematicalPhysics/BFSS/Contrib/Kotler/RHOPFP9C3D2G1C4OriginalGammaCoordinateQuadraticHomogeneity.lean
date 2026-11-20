import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C3OriginalGammaCoordinateRadiusContinuityPositivity

/-!
# RHOPF-P9C3D2G1C4 — source-exact transported quadratic homogeneity

The accepted original Gamma9 coordinate dot self Q(x) uses the inverse
of a continuous real-linear equivalence from the actual original
projector image to real four-space. Transport the genuine source
spinor dot-product homogeneity to the chosen coordinates.

Only Q(t • x) = t * (t * Q(x)) is proved. This gate does not
construct a normalized coordinate, isometry, S³ homeomorphism,
Circle-equivariant Hopf quotient or physical Fock operator.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C4
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1

/-- The quadratic scalar induced by the original Gamma9 spinor
Euclidean dot-self is homogeneous of degree two under the
accepted continuous linear real-four model. -/
theorem relationalRangeCoordinateDotSelf_smul (t : ℝ) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (t • x) =
      t * (t * relationalRangeCoordinateDotSelf x) := by
  let E := relationalRangeContinuousLinearEquivFinFour
  have hlinear : E.symm (t • x) = t • E.symm x := by
    exact map_smul E.symm t x
  have hval : (E.symm (t • x)).1 = t • (E.symm x).1 := by
    exact congrArg Subtype.val hlinear
  calc
    relationalRangeCoordinateDotSelf (t • x) =
        (t • (E.symm x).1) ⬝ᵥ (t • (E.symm x).1) := by
      change (E.symm (t • x)).1 ⬝ᵥ (E.symm (t • x)).1 = _
      rw [hval]
    _ = t * (t * ((E.symm x).1 ⬝ᵥ (E.symm x).1)) := by
      simp only [smul_dotProduct, dotProduct_smul, smul_eq_mul]
    _ = t * (t * relationalRangeCoordinateDotSelf x) := by
      rfl

#print axioms relationalRangeCoordinateDotSelf_smul

end
end FCP.RHOPFP9C3D2G1C4
