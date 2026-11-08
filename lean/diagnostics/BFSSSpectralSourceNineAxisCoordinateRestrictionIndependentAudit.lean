import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCoordinateRestriction

/-! Independent exact-coordinate, original-action, central-sign and fixed-axis checks. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateRestrictionIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisCoordinateRestriction
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev SO8 := Matrix.specialOrthogonalGroup (Fin 8) ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer
private abbrev M (A : H) : M9 := ((A : SO9) : M9)

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


example : (source9Axis8MatrixStabilizer : Set SO9) =
    {A : SO9 | (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8} := rfl

example (A : H) (i : SpaceIndex) : M A i (Fin.last 8) = source9CoordinateVector 8 i :=
  source9Axis8Target_lastColumn A i

example (A : H) (j : SpaceIndex) : M A (Fin.last 8) j = source9CoordinateVector 8 j :=
  source9Axis8Target_lastRow A j

example (A : H) (i : Fin 8) : M A i.castSucc (Fin.last 8) = 0 :=
  source9Axis8Target_lastColumn_castSucc A i

example (A : H) (j : Fin 8) : M A (Fin.last 8) j.castSucc = 0 :=
  source9Axis8Target_lastRow_castSucc A j

example (A : H) : M A (Fin.last 8) (Fin.last 8) = 1 := by
  calc
    M A (Fin.last 8) (Fin.last 8) = source9CoordinateVector 8 (Fin.last 8) :=
      source9Axis8Target_lastColumn A (Fin.last 8)
    _ = 1 := by norm_num [source9CoordinateVector]

example (A : H) (i j : Fin 8) :
    source9Axis8CoordinateBlock A i j = M A i.castSucc j.castSucc := rfl

example (A : H) : (source9Axis8CoordinateBlock A)ᵀ * source9Axis8CoordinateBlock A = 1 :=
  source9Axis8CoordinateBlock_orthogonal A

example (A : H) : (M A).det = (source9Axis8CoordinateBlock A).det :=
  source9Axis8Target_det_eq_coordinateBlock A

example (A : H) : (source9Axis8CoordinateBlock A).det = 1 :=
  source9Axis8CoordinateBlock_det_one A

example (A B : H) : source9Axis8CoordinateBlock (A * B) =
    source9Axis8CoordinateBlock A * source9Axis8CoordinateBlock B :=
  source9Axis8CoordinateBlock_mul A B

example (A : H) (i j : Fin 8) :
    (source9Axis8CoordinateRestrictionHom A : M8) i j = M A i.castSucc j.castSucc :=
  source9Axis8CoordinateRestrictionHom_entry A i j

example : Function.Injective source9Axis8CoordinateRestrictionHom :=
  source9Axis8CoordinateRestrictionHom_injective

example : Continuous (source9Axis8CoordinateRestrictionHom : H → SO8) :=
  source9Axis8CoordinateRestrictionHom_continuous

example : source9Axis8CoordinateRestrictionHom (1 : H) = 1 :=
  map_one source9Axis8CoordinateRestrictionHom

example (A B : H) : source9Axis8CoordinateRestrictionHom (A * B) =
    source9Axis8CoordinateRestrictionHom A * source9Axis8CoordinateRestrictionHom B :=
  map_mul source9Axis8CoordinateRestrictionHom A B

example (A : H) : source9Axis8CoordinateRestrictionHom A⁻¹ =
    (source9Axis8CoordinateRestrictionHom A)⁻¹ :=
  map_inv source9Axis8CoordinateRestrictionHom A

example (A B : H) (h : source9Axis8CoordinateRestrictionHom A =
    source9Axis8CoordinateRestrictionHom B) : M A = M B :=
  congrArg (fun T : H => M T) (source9Axis8CoordinateRestrictionHom_injective h)

example (A : H) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateRestrictionHom A : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i = ((M A).mulVec z) i.castSucc :=
  source9Axis8CoordinateRestrictionHom_mulVec A z i

-- Every source stabilizer element acts on the SAME original first eight vector coordinates.
example (g : K) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateRestrictionHom (source9Axis8ProjectionHom g) : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i =
      (source9SpinVectorRepresentation (g : G) z) i.castSucc := by
  exact (source9Axis8CoordinateRestrictionHom_mulVec (source9Axis8ProjectionHom g) z i).trans
    (congrFun (source9Axis8ProjectionHom_mulVec g z) i.castSucc)

example : source9Axis8CoordinateRestrictionHom
    (source9Axis8ProjectionHom source9Axis8NegativeCentral) = 1 := by
  rw [source9Axis8NegativeCentral_image, map_one]

example : (source9Axis8NegativeCentral : G) = source9NegativeCentral ∧
    ((source9Axis8NegativeCentral : G) : CliffordAlgebra source9Quadratic) = -1 ∧
    source9Axis8NegativeCentral ≠ (1 : K) :=
  ⟨source9Axis8NegativeCentral_coe, source9NegativeCentral_coe,
    source9Axis8NegativeCentral_ne_one⟩

-- Faithfulness on H does not collapse the original two-sign source kernel.
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

example : ∃ B : SO8, ∀ i j : Fin 8, (B : M8) i j =
    (source9SpinVectorSpecialOrthogonalHom perpendicularPair : M9) i.castSucc j.castSucc := by
  refine ⟨source9Axis8CoordinateRestrictionHom
    (source9Axis8ProjectionHom (⟨perpendicularPair, perpendicular_fixes⟩ : K)), ?_⟩
  intro i j
  rfl

example : mixedPair ∉ source9Axis8SpinStabilizer := by
  intro h
  have hfix : source9SpinVectorRepresentation mixedPair (source9CoordinateVector 8) =
      source9CoordinateVector 8 := h
  rw [mixed_moves_axis] at hfix
  have he := congrFun hfix (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at he

example (A : SO9)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8)
    (i j : Fin 8) :
    (source9Axis8CoordinateRestrictionHom (⟨A, hfix⟩ : H) : M8) i j =
      (A : M9) i.castSucc j.castSucc := rfl

#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastColumn
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastRow
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastColumn_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastRow_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_orthogonal
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_det_eq_coordinateBlock
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_det_one
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_mul
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_entry
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_injective
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_RESTRICTION_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateRestrictionIndependentAudit
