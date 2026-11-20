import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C9OriginalGammaStandardFourNormalizationAlgebra

/-!
# RHOPF-P9C3D2G1D0 — source-exact continuous inter-sphere maps

The actual original Gamma9 projector range has a Q-unit sphere in
the accepted abstract real-four coordinate model (G1C7). The
standard Euclidean dot-one sphere is different from the Pi sup-norm
sphere. G1C9 proved radial normalization into the latter dot-one
sphere using the actual standard Euclidean dot self.

Construct explicitly the maps QUnit → StandardUnit by dividing by
s(x)=sqrt(x dot x), and StandardUnit → QUnit by dividing by the
original Gamma9 transported r(x)=sqrt(Q(x)). Prove both maps
continuous in inherited subtype topologies. Two-sided inverse
identities and a Homeomorph remain subsequent, separate gates.

Neither the punctured real-four space nor the original unscaled
continuous linear equivalence is asserted to be an isometry or
homeomorphic to either sphere. Circle-equivariant Hopf quotient and
physical Fock-space implementation remain open.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D0
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C5
open FCP.RHOPFP9C3D2G1C6
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1C9

/-- The standard real-four Euclidean dot-one sphere, explicitly
as the dot-self level set and not the default Pi norm sphere. -/
abbrev StandardUnitCoordinates : Type :=
  {x : Fin 4 → ℝ // x ⬝ᵥ x = 1}

/-- A standard Euclidean dot-one real-four vector is nonzero. -/
theorem standardUnitCoordinates_ne_zero
    (v : StandardUnitCoordinates) : (v.1 : Fin 4 → ℝ) ≠ 0 := by
  intro hz
  have h := v.2
  rw [hz, zero_dotProduct] at h
  exact (zero_ne_one : (0 : ℝ) ≠ 1) h

/-- Radial conversion from the exact Gamma9 Q-unit sphere to the
standard real-four Euclidean dot-one sphere. -/
noncomputable def relationalQUnitToStandardUnit :
    RelationalQUnitCoordinates → StandardUnitCoordinates :=
  fun v =>
    ⟨(standardCoordinateRadius v.1)⁻¹ • v.1,
      standardCoordinateDotSelf_inv_radius_smul v.1
        (relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2)⟩

/-- Radial conversion from the standard Euclidean dot-one sphere
back to the exact original Gamma9 transported Q-unit sphere. -/
noncomputable def standardUnitToRelationalQUnit :
    StandardUnitCoordinates → RelationalQUnitCoordinates :=
  fun v =>
    ⟨(relationalRangeCoordinateRadius v.1)⁻¹ • v.1,
      relationalRangeCoordinateDotSelf_inv_radius_smul v.1
        (standardUnitCoordinates_ne_zero v)⟩

/-- Q-unit to standard Euclidean sphere radial conversion is
continuous by positivity and continuity of the standard radius. -/
theorem relationalQUnitToStandardUnit_continuous :
    Continuous relationalQUnitToStandardUnit := by
  have hr : Continuous (fun v : RelationalQUnitCoordinates =>
      standardCoordinateRadius v.1) :=
    standardCoordinateRadius_continuous.comp continuous_subtype_val
  have hi : Continuous (fun v : RelationalQUnitCoordinates =>
      (standardCoordinateRadius v.1)⁻¹) :=
    hr.inv₀ (fun v =>
      ne_of_gt (standardCoordinateRadius_pos_of_ne_zero v.1
        (relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2)))
  have hbase : Continuous (fun v : RelationalQUnitCoordinates =>
      (standardCoordinateRadius v.1)⁻¹ • v.1) :=
    hi.smul continuous_subtype_val
  exact hbase.subtype_mk (fun v =>
    standardCoordinateDotSelf_inv_radius_smul v.1
      (relationalRangeCoordinateDotSelf_one_ne_zero v.1 v.2))

/-- Standard Euclidean sphere to original Gamma9 Q-unit sphere
radial conversion is continuous by positive source radius. -/
theorem standardUnitToRelationalQUnit_continuous :
    Continuous standardUnitToRelationalQUnit := by
  have hr : Continuous (fun v : StandardUnitCoordinates =>
      relationalRangeCoordinateRadius v.1) :=
    relationalRangeCoordinateRadius_continuous.comp continuous_subtype_val
  have hi : Continuous (fun v : StandardUnitCoordinates =>
      (relationalRangeCoordinateRadius v.1)⁻¹) :=
    hr.inv₀ (fun v =>
      ne_of_gt (relationalRangeCoordinateRadius_pos_of_ne_zero v.1
        (standardUnitCoordinates_ne_zero v)))
  have hbase : Continuous (fun v : StandardUnitCoordinates =>
      (relationalRangeCoordinateRadius v.1)⁻¹ • v.1) :=
    hi.smul continuous_subtype_val
  exact hbase.subtype_mk (fun v =>
    relationalRangeCoordinateDotSelf_inv_radius_smul v.1
      (standardUnitCoordinates_ne_zero v))

#print axioms standardUnitCoordinates_ne_zero
#print axioms relationalQUnitToStandardUnit_continuous
#print axioms standardUnitToRelationalQUnit_continuous

end
end FCP.RHOPFP9C3D2G1D0
