import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisProjection

/-! Independent literal carriers, projection, exact fibers, actual signs and fixed-axis guards. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisProjectionIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisProjection

private abbrev V := SpaceIndex → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer
private abbrev axis : V := source9CoordinateVector 8
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

example : (source9Axis8SpinStabilizer : Set G) =
    {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} := rfl

example : (source9Axis8MatrixStabilizer : Set SO9) =
    {A : SO9 | (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8} := rfl

example (g : K) : ((source9Axis8ProjectionHom g : H) : SO9) =
    source9SpinVectorSpecialOrthogonalHom g.val := source9Axis8ProjectionHom_coe g

example (g : K) (z : V) : (((source9Axis8ProjectionHom g : H) : SO9) : M9).mulVec z =
    source9SpinVectorRepresentation g.val z := source9Axis8ProjectionHom_mulVec g z

example : Function.Surjective source9Axis8ProjectionHom := source9Axis8ProjectionHom_surjective

example (A : SO9)
    (hA : (A : M9).mulVec axis = axis) :
    ∃ g : K, ((source9Axis8ProjectionHom g : H) : SO9) = A := by
  obtain ⟨g, hg⟩ := source9Axis8ProjectionHom_surjective (⟨A, hA⟩ : H)
  exact ⟨g, congrArg (fun B : H => (B : SO9)) hg⟩

example : source9Axis8ProjectionHom (1 : K) = 1 := map_one source9Axis8ProjectionHom

example (g h : K) : source9Axis8ProjectionHom (g * h) =
    source9Axis8ProjectionHom g * source9Axis8ProjectionHom h := map_mul source9Axis8ProjectionHom g h

example : (source9Axis8NegativeCentral : G) = source9NegativeCentral ∧
    ((source9Axis8NegativeCentral : G) : CliffordAlgebra source9Quadratic) = -1 :=
  ⟨source9Axis8NegativeCentral_coe, source9NegativeCentral_coe⟩

example : source9Axis8NegativeCentral ≠ (1 : K) := source9Axis8NegativeCentral_ne_one

example : source9Axis8ProjectionHom source9Axis8NegativeCentral = 1 := source9Axis8NegativeCentral_image

example (g h : source9Axis8SpinStabilizer) :
    source9Axis8ProjectionHom g = source9Axis8ProjectionHom h ↔
      g = h ∨ g = source9Axis8NegativeCentral * h :=
  source9Axis8ProjectionHom_eq_iff_two_sign_fiber g h

example (g : K) : g ∈ source9Axis8ProjectionHom.ker ↔
    g = 1 ∨ g = source9Axis8NegativeCentral := source9Axis8ProjectionHom_mem_ker_iff g

example : (source9Axis8ProjectionHom.ker : Set K) = {1, source9Axis8NegativeCentral} :=
  source9Axis8ProjectionHom_ker_eq

example (g : K) : g ≠ source9Axis8NegativeCentral * g :=
  source9Axis8ProjectionHom_fiber_signs_distinct g

example (A : source9Axis8MatrixStabilizer) :
    ∃ g : source9Axis8SpinStabilizer, source9Axis8ProjectionHom g = A ∧
      (∀ h : source9Axis8SpinStabilizer, source9Axis8ProjectionHom h = A ↔
        h = g ∨ h = source9Axis8NegativeCentral * g) ∧
      g ≠ source9Axis8NegativeCentral * g := source9Axis8ProjectionHom_fiber_exact_pair A

example (g : K) : source9SpinVectorRepresentation ((g⁻¹ : K) : G) axis = axis :=
  (g⁻¹ : K).property

example (A : H) : (((A⁻¹ : H) : SO9) : M9).mulVec axis = axis := (A⁻¹ : H).property

example : perpendicularPair ∈ source9Axis8SpinStabilizer := perpendicular_fixes

example : mixedPair ∉ source9Axis8SpinStabilizer := by
  intro h
  have hbad : -source9CoordinateVector 8 = source9CoordinateVector 8 := mixed_moves_axis.symm.trans h
  have hc := congrFun hbad (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at hc

example (g : K) : {k : G //
    source9SpinVectorRepresentation k (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  ⟨g.val, g.property⟩

example : ¬ Function.Injective source9Axis8ProjectionHom := by
  intro hi
  apply source9Axis8NegativeCentral_ne_one
  exact hi (source9Axis8NegativeCentral_image.trans (map_one source9Axis8ProjectionHom).symm)

#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer_mem_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer_mem_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_coe
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mulVec
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_surjective
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_coe
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_ne_one
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_image
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_eq_iff_two_sign_fiber
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mem_ker_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_ker_eq
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_signs_distinct
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_exact_pair
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisProjectionIndependentAudit
