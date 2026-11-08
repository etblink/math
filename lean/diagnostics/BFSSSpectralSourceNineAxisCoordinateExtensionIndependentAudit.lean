import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCoordinateExtension

/-! Independent raw-membership, inverse, original-vector and point/sign guards. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateExtensionIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisCoordinateRestriction FCP.BFSSSourceNineAxisCoordinateExtension
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

example (B : M8) (i j : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B i.castSucc j.castSucc = B i j :=
  source9Axis8CoordinateExtensionMatrix_castSucc_castSucc B i j

example (B : M8) (i : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B i.castSucc (Fin.last 8) = 0 :=
  source9Axis8CoordinateExtensionMatrix_castSucc_last B i

example (B : M8) (j : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B (Fin.last 8) j.castSucc = 0 :=
  source9Axis8CoordinateExtensionMatrix_last_castSucc B j

example (B : M8) : source9Axis8CoordinateExtensionMatrix B (Fin.last 8) (Fin.last 8) = 1 :=
  source9Axis8CoordinateExtensionMatrix_last_last B

example (B : M8) : (source9Axis8CoordinateExtensionMatrix B).det = B.det :=
  source9Axis8CoordinateExtensionMatrix_det B

example (B : M8) (hB : Bᵀ * B = 1) :
    (source9Axis8CoordinateExtensionMatrix B)ᵀ * source9Axis8CoordinateExtensionMatrix B = 1 :=
  source9Axis8CoordinateExtensionMatrix_orthogonal B hB

example (B : M8) : (source9Axis8CoordinateExtensionMatrix B).mulVec
    (source9CoordinateVector 8) = source9CoordinateVector 8 :=
  source9Axis8CoordinateExtensionMatrix_fixes B

example (B : SO8) : source9Axis8CoordinateExtensionMatrix (B : M8) ∈
    Matrix.specialOrthogonalGroup SpaceIndex ℝ :=
  source9Axis8CoordinateExtensionMatrix_mem_SO9 B

example (B : SO8) : (((source9Axis8CoordinateExtension B : H) : SO9) : M9) =
    source9Axis8CoordinateExtensionMatrix (B : M8) :=
  source9Axis8CoordinateExtension_coe B

example (B : SO8) : source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension B) = B :=
  source9Axis8CoordinateRestriction_extension B

example (A : H) : source9Axis8CoordinateExtension (source9Axis8CoordinateRestrictionHom A) = A :=
  source9Axis8CoordinateExtension_restriction A

example : Function.Surjective source9Axis8CoordinateRestrictionHom :=
  source9Axis8CoordinateRestrictionHom_surjective

example (B C : SO8) (h : source9Axis8CoordinateExtension B = source9Axis8CoordinateExtension C) :
    B = C := by
  calc
    B = source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension B) :=
      (source9Axis8CoordinateRestriction_extension B).symm
    _ = source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension C) :=
      congrArg source9Axis8CoordinateRestrictionHom h
    _ = C := source9Axis8CoordinateRestriction_extension C

example : source9Axis8CoordinateExtension (1 : SO8) = (1 : H) := by
  apply source9Axis8CoordinateRestrictionHom_injective
  exact (source9Axis8CoordinateRestriction_extension (1 : SO8)).trans
    (map_one source9Axis8CoordinateRestrictionHom).symm

example (B C : SO8) : source9Axis8CoordinateExtension (B * C) =
    source9Axis8CoordinateExtension B * source9Axis8CoordinateExtension C := by
  apply source9Axis8CoordinateRestrictionHom_injective
  calc
    source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension (B * C)) = B * C :=
      source9Axis8CoordinateRestriction_extension (B * C)
    _ = source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension B) *
        source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension C) :=
      congrArg₂ (fun X Y : SO8 => X * Y)
        (source9Axis8CoordinateRestriction_extension B).symm
        (source9Axis8CoordinateRestriction_extension C).symm
    _ = source9Axis8CoordinateRestrictionHom
        (source9Axis8CoordinateExtension B * source9Axis8CoordinateExtension C) :=
      (map_mul source9Axis8CoordinateRestrictionHom _ _).symm

-- Every original vector, including a nonzero ninth component, is tested.
example (B : SO8) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateExtensionMatrix (B : M8)).mulVec z) i.castSucc =
      ((B : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i := by
  calc
    ((source9Axis8CoordinateExtensionMatrix (B : M8)).mulVec z) i.castSucc =
        (((source9Axis8CoordinateExtension B : H) : SO9) : M9).mulVec z i.castSucc :=
      (congrArg (fun T : M9 => T.mulVec z i.castSucc)
        (source9Axis8CoordinateExtension_coe B)).symm
    _ =
        ((source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension B) : M8).mulVec
          (fun j : Fin 8 => z j.castSucc)) i :=
      (source9Axis8CoordinateRestrictionHom_mulVec (source9Axis8CoordinateExtension B) z i).symm
    _ = ((B : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i :=
      congrArg (fun T : SO8 => ((T : M8).mulVec (fun j : Fin 8 => z j.castSucc)) i)
        (source9Axis8CoordinateRestriction_extension B)

example (B : M8) (z : V) :
    ((source9Axis8CoordinateExtensionMatrix B).mulVec z) (Fin.last 8) = z (8 : SpaceIndex) := by
  change (∑ j : SpaceIndex, source9Axis8CoordinateExtensionMatrix B (Fin.last 8) j * z j) = z 8
  rw [Fin.sum_univ_castSucc (fun j : SpaceIndex =>
    source9Axis8CoordinateExtensionMatrix B (Fin.last 8) j * z j)]
  simpa only [source9Axis8CoordinateExtensionMatrix_last_castSucc,
    source9Axis8CoordinateExtensionMatrix_last_last, zero_mul, Finset.sum_const_zero,
    one_mul, zero_add] using
    congrArg z (by decide : (Fin.last 8 : SpaceIndex) = (8 : SpaceIndex))

example : source9Axis8CoordinateExtension
    (source9Axis8CoordinateRestrictionHom (source9Axis8ProjectionHom source9Axis8NegativeCentral)) =
      (1 : H) := by
  apply source9Axis8CoordinateRestrictionHom_injective
  exact (source9Axis8CoordinateRestriction_extension _).trans
    (congrArg source9Axis8CoordinateRestrictionHom source9Axis8NegativeCentral_image)

example : (source9Axis8NegativeCentral : G) = source9NegativeCentral ∧
    ((source9Axis8NegativeCentral : G) : CliffordAlgebra source9Quadratic) = -1 ∧
    source9Axis8NegativeCentral ≠ (1 : K) :=
  ⟨source9Axis8NegativeCentral_coe, source9NegativeCentral_coe,
    source9Axis8NegativeCentral_ne_one⟩

example (g : K) : source9Axis8CoordinateRestrictionHom (source9Axis8ProjectionHom g) = 1 ↔
    g = 1 ∨ g = source9Axis8NegativeCentral := by
  constructor
  · intro h
    apply (source9Axis8ProjectionHom_mem_ker_iff g).mp
    change source9Axis8ProjectionHom g = 1
    apply source9Axis8CoordinateRestrictionHom_injective
    exact h.trans (map_one source9Axis8CoordinateRestrictionHom).symm
  · rintro (rfl | rfl)
    · rw [map_one, map_one]
    · rw [source9Axis8NegativeCentral_image, map_one]

example : source9Axis8CoordinateExtension
    (source9Axis8CoordinateRestrictionHom
      (source9Axis8ProjectionHom (⟨perpendicularPair, perpendicular_fixes⟩ : K))) =
    source9Axis8ProjectionHom (⟨perpendicularPair, perpendicular_fixes⟩ : K) :=
  source9Axis8CoordinateExtension_restriction _

example : mixedPair ∉ source9Axis8SpinStabilizer := by
  intro h
  have hfix : source9SpinVectorRepresentation mixedPair (source9CoordinateVector 8) =
      source9CoordinateVector 8 := h
  rw [mixed_moves_axis] at hfix
  have he := congrFun hfix (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at he

-- -I8 has positive ninth entry after raw extension; no gamma-volume claim follows.
example (i j : Fin 8) :
    source9Axis8CoordinateExtensionMatrix (-(1 : M8)) i.castSucc j.castSucc = (-(1 : M8)) i j ∧
    source9Axis8CoordinateExtensionMatrix (-(1 : M8)) (Fin.last 8) (Fin.last 8) = 1 :=
  ⟨source9Axis8CoordinateExtensionMatrix_castSucc_castSucc _ i j,
    source9Axis8CoordinateExtensionMatrix_last_last _⟩

-- Negating the positive extension moves the axis; it cannot substitute for the point stabilizer.
example (B : M8) : (-(source9Axis8CoordinateExtensionMatrix B)).mulVec
    (source9CoordinateVector 8) ≠ source9CoordinateVector 8 := by
  have hone : source9CoordinateVector 8 (8 : SpaceIndex) = (1 : ℝ) :=
    (Pi.single_apply (8 : SpaceIndex) (1 : ℝ) (8 : SpaceIndex)).trans
      (ite_eq_left (rfl : (8 : SpaceIndex) = (8 : SpaceIndex)))
  have hneg : (-(source9Axis8CoordinateExtensionMatrix B)).mulVec
      (source9CoordinateVector 8) = -source9CoordinateVector 8 :=
    (Matrix.neg_mulVec (source9CoordinateVector 8) (source9Axis8CoordinateExtensionMatrix B)).trans
      (congrArg (fun z : V => -z) (source9Axis8CoordinateExtensionMatrix_fixes B))
  intro h
  have he := congrFun (hneg.symm.trans h) (8 : SpaceIndex)
  change -(source9CoordinateVector 8 (8 : SpaceIndex)) = source9CoordinateVector 8 (8 : SpaceIndex) at he
  rw [hone] at he
  norm_num at he

#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_castSucc_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_castSucc_last
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_last_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_last_last
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_orthogonal
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_det
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_fixes
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_mem_SO9
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension_coe
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateRestriction_extension
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension_restriction
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateRestrictionHom_surjective
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EXTENSION_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateExtensionIndependentAudit
