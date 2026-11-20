import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C6OriginalGammaQuadraticUnitRadiusFixed

/-!
# RHOPF-P9C3D2G1C7 — exact source Gamma9 continuous Q-unit retraction

The accepted original Gamma9 quadratic Q in the abstract real-four
model is strictly positive away from zero. G1C3 proves continuity
and nonzero positivity of r = sqrt(Q), G1C5 shows radial normalization
lands in Q=1, and G1C6 proves it fixes the Q-unit level set.

Package the continuous radial retraction from nonzero real-four
coordinates to Q-unit coordinates. A retraction is not injective
on the punctured space, so it is NOT a homeomorphism from
R4\{0} to a sphere. This is not an S³ model, equivariant Hopf
quotient or physical Fock representation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C7
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C2
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C5
open FCP.RHOPFP9C3D2G1C6

/-- Original real-four coordinates away from the source zero spinor. -/
abbrev RelationalNonzeroCoordinates : Type :=
  {x : Fin 4 → ℝ // x ≠ 0}

/-- Exact source-original Gamma9 transported quadratic unit level set. -/
abbrev RelationalQUnitCoordinates : Type :=
  {x : Fin 4 → ℝ // relationalRangeCoordinateDotSelf x = 1}

/-- The source-original radial normalization is well defined on
nonzero coordinates and lands exactly in Q=1. -/
noncomputable def relationalRadialNormalize :
    RelationalNonzeroCoordinates → RelationalQUnitCoordinates :=
  fun v =>
    ⟨(relationalRangeCoordinateRadius v.1)⁻¹ • v.1,
      relationalRangeCoordinateDotSelf_inv_radius_smul v.1 v.2⟩

/-- Inclusion of the original Q-unit level set into the nonzero
real-four coordinates, justified by original Q(0)=0. -/
noncomputable def relationalQUnitIntoNonzero :
    RelationalQUnitCoordinates → RelationalNonzeroCoordinates :=
  fun v =>
    ⟨v.1, relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2⟩

/-- Source-exact normalization into the Q-unit level set is continuous
for the inherited real-four subtype topologies. -/
theorem relationalRadialNormalize_continuous :
    Continuous relationalRadialNormalize := by
  have hr : Continuous (fun v : RelationalNonzeroCoordinates =>
      relationalRangeCoordinateRadius v.1) :=
    relationalRangeCoordinateRadius_continuous.comp continuous_subtype_val
  have hi : Continuous (fun v : RelationalNonzeroCoordinates =>
      (relationalRangeCoordinateRadius v.1)⁻¹) :=
    hr.inv₀ (fun v =>
      ne_of_gt (relationalRangeCoordinateRadius_pos_of_ne_zero v.1 v.2))
  have hv : Continuous (fun v : RelationalNonzeroCoordinates =>
      (v.1 : Fin 4 → ℝ)) :=
    continuous_subtype_val
  have hbase : Continuous (fun v : RelationalNonzeroCoordinates =>
      (relationalRangeCoordinateRadius v.1)⁻¹ • v.1) :=
    hi.smul hv
  exact hbase.subtype_mk
    (fun v => relationalRangeCoordinateDotSelf_inv_radius_smul v.1 v.2)

/-- Exact source Q-unit inclusion is continuous. -/
theorem relationalQUnitIntoNonzero_continuous :
    Continuous relationalQUnitIntoNonzero := by
  have hv : Continuous (fun v : RelationalQUnitCoordinates =>
      (v.1 : Fin 4 → ℝ)) :=
    continuous_subtype_val
  exact hv.subtype_mk
    (fun v => relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2)

/-- Radial normalization is a left inverse of the Q-unit inclusion,
hence a continuous retraction, not an equivalence of the punctured space. -/
theorem relationalRadialNormalize_retract
    (v : RelationalQUnitCoordinates) :
    relationalRadialNormalize (relationalQUnitIntoNonzero v) = v := by
  apply Subtype.ext
  exact relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one v.1 v.2

#print axioms relationalRadialNormalize_continuous
#print axioms relationalQUnitIntoNonzero_continuous
#print axioms relationalRadialNormalize_retract

end
end FCP.RHOPFP9C3D2G1C7
