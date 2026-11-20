import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C5OriginalGammaCoordinateQuadraticNormalization

/-!
# RHOPF-P9C3D2G1C6 — source-exact Q-unit radius and fixedness

G1C5 strictly proves that radial normalization of any nonzero
Fin-four coordinate has the original Gamma9 transported Q-value one.
This gate proves the inverse-side algebra needed later for a radial
homeomorphism: Q(0)=0, Q(x)=1 implies nonzero x and radius one, and
normalization fixes every Q-unit vector.

No standard S³ homeomorphism, Circle-equivariant Hopf quotient,
isometric identification or physical Fock implementation is assumed.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C6
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C4
open FCP.RHOPFP9C3D2G1C5

/-- The original transported Euclidean quadratic vanishes at the
zero coordinate, by accepted degree-two homogeneity. -/
theorem relationalRangeCoordinateDotSelf_zero :
    relationalRangeCoordinateDotSelf (0 : Fin 4 → ℝ) = 0 := by
  have h := relationalRangeCoordinateDotSelf_smul
    (0 : ℝ) (0 : Fin 4 → ℝ)
  simpa using h

/-- A Q-unit coordinate is necessarily nonzero in the accepted
source-original Gamma9 coordinate model. -/
theorem relationalRangeCoordinateDotSelf_one_ne_zero
    (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) : x ≠ 0 := by
  intro hz
  subst x
  rw [relationalRangeCoordinateDotSelf_zero] at hx
  exact (zero_ne_one : (0 : ℝ) ≠ 1) hx

/-- The transported source-original radius is exactly one on
the quadratic unit level set, not merely positive. -/
theorem relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one
    (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) :
    relationalRangeCoordinateRadius x = 1 := by
  change Real.sqrt (relationalRangeCoordinateDotSelf x) = 1
  rw [hx]
  exact Real.sqrt_one

/-- Exact radial normalization fixes every source Q-unit coordinate.
The map is not yet bundled as a continuous homeomorphism. -/
theorem relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one
    (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) :
    (relationalRangeCoordinateRadius x)⁻¹ • x = x := by
  rw [relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one x hx]
  simp

#print axioms relationalRangeCoordinateDotSelf_zero
#print axioms relationalRangeCoordinateDotSelf_one_ne_zero
#print axioms relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one
#print axioms relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one

end
end FCP.RHOPFP9C3D2G1C6
