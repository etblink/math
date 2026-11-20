import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D1AOriginalGammaPositiveRadiusHomogeneity

/-!
# RHOPF-P9C3D2G1D1B — source-exact inter-sphere inverse identities

G1D0 strictly qualified two continuous radial maps between the actual
original Gamma9 transported Q-unit sphere and the standard Euclidean
dot-one sphere. G1D1A strictly qualified positive-scalar homogeneity
of both coordinate radii. Prove the two typed compositions equal the
identity, with strictly positive denominators, exact scalar
cancellation, and subtype extensionality.

This gate establishes inverse identities but does not yet bundle
a Homeomorph or certify Circle-equivariant Hopf quotient,
original physical Fock action or a topological excitation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D1B
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C6
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D1A

/-- The standard Euclidean dot-one unit sphere has radius one,
independent of the Pi product norm on coordinate functions. -/
theorem standardCoordinateRadius_eq_one_of_dotSelf_eq_one
    (v : StandardUnitCoordinates) :
    standardCoordinateRadius v.1 = 1 := by
  change Real.sqrt (v.1 ⬝ᵥ v.1) = 1
  rw [v.2]
  exact Real.sqrt_one

/-- G ∘ F is the identity on the actual original Gamma9
transported Q-unit sphere; no isometry assumption is used. -/
theorem standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit
    (v : RelationalQUnitCoordinates) :
    standardUnitToRelationalQUnit
      (relationalQUnitToStandardUnit v) = v := by
  let a : ℝ := standardCoordinateRadius v.1
  have ha : 0 < a :=
    standardCoordinateRadius_pos_of_ne_zero v.1
      (relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2)
  have hainv : 0 ≤ a⁻¹ :=
    le_of_lt (inv_pos.mpr ha)
  have hr : relationalRangeCoordinateRadius (a⁻¹ • v.1) = a⁻¹ := by
    calc
      relationalRangeCoordinateRadius (a⁻¹ • v.1) =
          a⁻¹ * relationalRangeCoordinateRadius v.1 :=
        relationalRangeCoordinateRadius_smul_nonneg a⁻¹ hainv v.1
      _ = a⁻¹ := by
        rw [relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one v.1 v.2]
        exact mul_one _
  apply Subtype.ext
  change (relationalRangeCoordinateRadius (a⁻¹ • v.1))⁻¹ •
    (a⁻¹ • v.1) = v.1
  rw [hr, smul_smul, inv_inv, mul_inv_cancel₀ (ne_of_gt ha), one_smul]

/-- F ∘ G is the identity on the standard Euclidean dot-one
sphere; both radial denominators are source-native and nonzero. -/
theorem relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit
    (v : StandardUnitCoordinates) :
    relationalQUnitToStandardUnit
      (standardUnitToRelationalQUnit v) = v := by
  let b : ℝ := relationalRangeCoordinateRadius v.1
  have hb : 0 < b :=
    relationalRangeCoordinateRadius_pos_of_ne_zero v.1
      (standardUnitCoordinates_ne_zero v)
  have hbinv : 0 ≤ b⁻¹ :=
    le_of_lt (inv_pos.mpr hb)
  have hs : standardCoordinateRadius (b⁻¹ • v.1) = b⁻¹ := by
    calc
      standardCoordinateRadius (b⁻¹ • v.1) =
          b⁻¹ * standardCoordinateRadius v.1 :=
        standardCoordinateRadius_smul_nonneg b⁻¹ hbinv v.1
      _ = b⁻¹ := by
        rw [standardCoordinateRadius_eq_one_of_dotSelf_eq_one v]
        exact mul_one _
  apply Subtype.ext
  change (standardCoordinateRadius (b⁻¹ • v.1))⁻¹ •
    (b⁻¹ • v.1) = v.1
  rw [hs, smul_smul, inv_inv, mul_inv_cancel₀ (ne_of_gt hb), one_smul]

#print axioms standardCoordinateRadius_eq_one_of_dotSelf_eq_one
#print axioms standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit
#print axioms relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit

end
end FCP.RHOPFP9C3D2G1D1B
