import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCoordinateEquivalence

/-! Independent topology, exact functions, original-vector and source-sign guards. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateEquivalenceIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisCoordinateRestriction FCP.BFSSSourceNineAxisCoordinateExtension
open FCP.BFSSSourceNineAxisCoordinateEquivalence
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev SO8 := Matrix.specialOrthogonalGroup (Fin 8) ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer

private abbrev perpendicularPair : G := source9UnitVectorPairSpin
  (source9CoordinateVector 0) (source9CoordinateVector 1)
  (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 1)
private abbrev mixedPair : G := source9UnitVectorPairSpin
  (source9CoordinateVector 0) (source9CoordinateVector 8)
  (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8)

private theorem perpendicular_fixes :
    source9SpinVectorRepresentation perpendicularPair (source9CoordinateVector 8) =
      source9CoordinateVector 8 := by
  have h1 : QuadraticMap.polar source9Quadratic
      (source9CoordinateVector 1) (source9CoordinateVector 8) = 0 := by
    norm_num [source9Quadratic_polar_dot, source9CoordinateVector, single_dotProduct]
  have h0 : QuadraticMap.polar source9Quadratic
      (source9CoordinateVector 0) (-source9CoordinateVector 8) = 0 := by
    norm_num [source9Quadratic_polar_dot, source9CoordinateVector, single_dotProduct]
  simp only [perpendicularPair, source9UnitVectorPairSpin_polar_action, h1,
    zero_smul, zero_sub, h0, neg_neg]

private theorem mixed_moves_axis :
    source9SpinVectorRepresentation mixedPair (source9CoordinateVector 8) =
      -source9CoordinateVector 8 := by
  have h8 : QuadraticMap.polar source9Quadratic
      (source9CoordinateVector 8) (source9CoordinateVector 8) = 2 := by
    rw [QuadraticMap.polar_self]
    norm_num [source9CoordinateVector_unit, two_smul]
  have hline : (2 : ℝ) • source9CoordinateVector 8 - source9CoordinateVector 8 =
      source9CoordinateVector 8 := by simp [two_smul]
  have h0 : QuadraticMap.polar source9Quadratic
      (source9CoordinateVector 0) (source9CoordinateVector 8) = 0 := by
    norm_num [source9Quadratic_polar_dot, source9CoordinateVector, single_dotProduct]
  simp only [mixedPair, source9UnitVectorPairSpin_polar_action, h8, hline, h0,
    zero_smul, zero_sub]


example : source9Axis8MatrixStabilizer ≃ₜ* Matrix.specialOrthogonalGroup (Fin 8) ℝ :=
  source9Axis8CoordinateContinuousMulEquiv

example (A : H) : source9Axis8CoordinateContinuousMulEquiv A = source9Axis8CoordinateRestrictionHom A :=
  source9Axis8CoordinateContinuousMulEquiv_apply A

example (B : SO8) : source9Axis8CoordinateContinuousMulEquiv.symm B = source9Axis8CoordinateExtension B :=
  source9Axis8CoordinateContinuousMulEquiv_symm_apply B

example (A : H) : source9Axis8CoordinateContinuousMulEquiv.toMulEquiv A =
    source9Axis8CoordinateRestrictionHom A := rfl

example (A : H) : source9Axis8CoordinateContinuousMulEquiv.toHomeomorph A =
    source9Axis8CoordinateRestrictionHom A := rfl

example (B : SO8) : source9Axis8CoordinateContinuousMulEquiv.symm.toHomeomorph B =
    source9Axis8CoordinateExtension B := rfl

example : Continuous (source9Axis8CoordinateExtensionMatrix : M8 → M9) :=
  source9Axis8CoordinateExtensionMatrix_continuous

example : Continuous (source9Axis8CoordinateExtension : SO8 → H) :=
  source9Axis8CoordinateExtension_continuous

example : Continuous (source9Axis8CoordinateContinuousMulEquiv : H → SO8) :=
  source9Axis8CoordinateContinuousMulEquiv.continuous_toFun

example : Continuous (source9Axis8CoordinateContinuousMulEquiv.symm : SO8 → H) :=
  source9Axis8CoordinateContinuousMulEquiv.continuous_invFun

example (A : H) : source9Axis8CoordinateContinuousMulEquiv.symm
    (source9Axis8CoordinateContinuousMulEquiv A) = A :=
  source9Axis8CoordinateContinuousMulEquiv.symm_apply_apply A

example (B : SO8) : source9Axis8CoordinateContinuousMulEquiv
    (source9Axis8CoordinateContinuousMulEquiv.symm B) = B :=
  source9Axis8CoordinateContinuousMulEquiv.apply_symm_apply B

example : source9Axis8CoordinateContinuousMulEquiv (1 : H) = 1 :=
  map_one source9Axis8CoordinateContinuousMulEquiv

example (A B : H) : source9Axis8CoordinateContinuousMulEquiv (A * B) =
    source9Axis8CoordinateContinuousMulEquiv A * source9Axis8CoordinateContinuousMulEquiv B :=
  map_mul source9Axis8CoordinateContinuousMulEquiv A B

example (A : H) : source9Axis8CoordinateContinuousMulEquiv A⁻¹ =
    (source9Axis8CoordinateContinuousMulEquiv A)⁻¹ :=
  map_inv source9Axis8CoordinateContinuousMulEquiv A

example (A : H) (i j : Fin 8) :
    (source9Axis8CoordinateContinuousMulEquiv A : M8) i j =
      ((A : SO9) : M9) i.castSucc j.castSucc :=
  source9Axis8CoordinateContinuousMulEquiv_entry A i j

example (B : SO8) : (((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9) =
    source9Axis8CoordinateExtensionMatrix (B : M8) :=
  source9Axis8CoordinateContinuousMulEquiv_symm_coe B

example (A : H) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateContinuousMulEquiv A : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i = ((((A : SO9) : M9)).mulVec z) i.castSucc :=
  source9Axis8CoordinateContinuousMulEquiv_mulVec A z i

-- Inverse action on the same first eight coordinates for every original vector.
example (B : SO8) (z : V) (i : Fin 8) :
    (((((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9)).mulVec z) i.castSucc =
      ((B : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i := by
  calc
    (((((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9)).mulVec z) i.castSucc =
        ((source9Axis8CoordinateContinuousMulEquiv
          (source9Axis8CoordinateContinuousMulEquiv.symm B) : M8).mulVec
            (fun j : Fin 8 => z j.castSucc)) i :=
      (source9Axis8CoordinateContinuousMulEquiv_mulVec
        (source9Axis8CoordinateContinuousMulEquiv.symm B) z i).symm
    _ = ((B : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i :=
      congrArg (fun T : SO8 => ((T : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i)
        (source9Axis8CoordinateContinuousMulEquiv.apply_symm_apply B)

-- The inverse fixes the ORIGINAL ninth component, with no zero-component premise.
example (B : SO8) (z : V) :
    (((((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9)).mulVec z)
      (Fin.last 8) = z (8 : SpaceIndex) := by
  have hlast : ((source9Axis8CoordinateExtensionMatrix (B : M8)).mulVec z) (Fin.last 8) =
      z (8 : SpaceIndex) := by
    change (∑ j : SpaceIndex, source9Axis8CoordinateExtensionMatrix (B : M8) (Fin.last 8) j * z j) = z 8
    rw [Fin.sum_univ_castSucc (fun j : SpaceIndex =>
      source9Axis8CoordinateExtensionMatrix (B : M8) (Fin.last 8) j * z j)]
    simpa only [source9Axis8CoordinateExtensionMatrix_last_castSucc,
      source9Axis8CoordinateExtensionMatrix_last_last, zero_mul, Finset.sum_const_zero,
      one_mul, zero_add] using
      congrArg z (by decide : (Fin.last 8 : SpaceIndex) = (8 : SpaceIndex))
  calc
    (((((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9)).mulVec z) (Fin.last 8) =
        ((source9Axis8CoordinateExtensionMatrix (B : M8)).mulVec z) (Fin.last 8) :=
      congrArg (fun T : M9 => T.mulVec z (Fin.last 8))
        (source9Axis8CoordinateContinuousMulEquiv_symm_coe B)
    _ = z (8 : SpaceIndex) := hlast

example : (source9Axis8NegativeCentral : G) = source9NegativeCentral ∧
    ((source9Axis8NegativeCentral : G) : CliffordAlgebra source9Quadratic) = -1 ∧
    source9Axis8NegativeCentral ≠ (1 : K) :=
  ⟨source9Axis8NegativeCentral_coe, source9NegativeCentral_coe,
    source9Axis8NegativeCentral_ne_one⟩

example : source9Axis8CoordinateContinuousMulEquiv
    (source9Axis8ProjectionHom source9Axis8NegativeCentral) = 1 := by
  calc
    source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom source9Axis8NegativeCentral) =
        source9Axis8CoordinateRestrictionHom (source9Axis8ProjectionHom source9Axis8NegativeCentral) :=
      source9Axis8CoordinateContinuousMulEquiv_apply _
    _ = source9Axis8CoordinateRestrictionHom (1 : H) :=
      congrArg source9Axis8CoordinateRestrictionHom source9Axis8NegativeCentral_image
    _ = 1 := map_one source9Axis8CoordinateRestrictionHom

-- A faithful target equivalence must preserve, rather than collapse, the two-sign source kernel.
example (g : K) : source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom g) = 1 ↔
    g = 1 ∨ g = source9Axis8NegativeCentral := by
  constructor
  · intro h
    apply (source9Axis8ProjectionHom_mem_ker_iff g).mp
    change source9Axis8ProjectionHom g = 1
    apply source9Axis8CoordinateRestrictionHom_injective
    calc
      source9Axis8CoordinateRestrictionHom (source9Axis8ProjectionHom g) =
          source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom g) :=
        (source9Axis8CoordinateContinuousMulEquiv_apply _).symm
      _ = 1 := h
      _ = source9Axis8CoordinateRestrictionHom (1 : H) :=
        (map_one source9Axis8CoordinateRestrictionHom).symm
  · rintro (rfl | rfl)
    · calc
        source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom 1) =
            source9Axis8CoordinateContinuousMulEquiv (1 : H) :=
          congrArg source9Axis8CoordinateContinuousMulEquiv (map_one source9Axis8ProjectionHom)
        _ = 1 := map_one source9Axis8CoordinateContinuousMulEquiv
    · calc
        source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom source9Axis8NegativeCentral) =
            source9Axis8CoordinateContinuousMulEquiv (1 : H) :=
          congrArg source9Axis8CoordinateContinuousMulEquiv source9Axis8NegativeCentral_image
        _ = 1 := map_one source9Axis8CoordinateContinuousMulEquiv

example (g : K) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateContinuousMulEquiv (source9Axis8ProjectionHom g) : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i =
      (source9SpinVectorRepresentation (g : G) z) i.castSucc :=
  (source9Axis8CoordinateContinuousMulEquiv_mulVec (source9Axis8ProjectionHom g) z i).trans
    (congrFun (source9Axis8ProjectionHom_mulVec g z) i.castSucc)

example : source9Axis8CoordinateContinuousMulEquiv.symm
    (source9Axis8CoordinateContinuousMulEquiv
      (source9Axis8ProjectionHom (⟨perpendicularPair, perpendicular_fixes⟩ : K))) =
      source9Axis8ProjectionHom (⟨perpendicularPair, perpendicular_fixes⟩ : K) :=
  source9Axis8CoordinateContinuousMulEquiv.symm_apply_apply _

example : mixedPair ∉ source9Axis8SpinStabilizer := by
  intro h
  have hfix : source9SpinVectorRepresentation mixedPair (source9CoordinateVector 8) =
      source9CoordinateVector 8 := h
  rw [mixed_moves_axis] at hfix
  have he := congrFun hfix (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at he

#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateExtensionMatrix_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateExtension_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_apply
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_symm_apply
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_entry
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_symm_coe
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EQUIVALENCE_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateEquivalenceIndependentAudit
