import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisTargetPreimage

/-! Independent arbitrary-target, exact matrix, central-sign and escaping-axis consumers. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisTargetPreimageIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineCartan
open FCP.BFSSSourceNineEvenListLift FCP.BFSSSourceNineTargetEuclideanBridge
open FCP.BFSSSourceNineAxisTargetPreimage Submodule

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : V ≃ₗ[ℝ] Euc9 := source9ToEuclidean
private abbrev G := spinGroup source9Quadratic
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev perpendicularPair : G := source9UnitVectorPairSpin
  (source9CoordinateVector 0) (source9CoordinateVector 1)
  (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 1)
private abbrev mixedPair : G := source9UnitVectorPairSpin
  (source9CoordinateVector 0) (source9CoordinateVector 8)
  (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8)

private theorem negative_center_action (z : V) :
    source9SpinVectorRepresentation source9NegativeCentral z = z := by
  have hinv : ((source9NegativeCentral⁻¹ : G) : C) = -1 := by
    change star (-1 : C) = (-1 : C)
    simp only [star_neg, star_one]
  change source9CliffordVectorProjection
    ((source9NegativeCentral : C) * CliffordAlgebra.ι source9Quadratic z *
      ((source9NegativeCentral⁻¹ : G) : C)) = z
  rw [source9NegativeCentral_coe, hinv]
  simp only [neg_one_mul, mul_neg_one, neg_neg]
  exact source9CliffordVectorProjection_ι z

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
    norm_num [source9Quadratic_polar_dot, source9CoordinateVector, single_dotProduct]
  have hline : (2 : ℝ) • source9CoordinateVector 8 - source9CoordinateVector 8 =
      source9CoordinateVector 8 := by simp [two_smul]
  have h0 : QuadraticMap.polar source9Quadratic
      (source9CoordinateVector 0) (source9CoordinateVector 8) = 0 := by
    norm_num [source9Quadratic_polar_dot, source9CoordinateVector, single_dotProduct]
  simp only [mixedPair, source9UnitVectorPairSpin_polar_action, h8, hline, h0,
    zero_smul, zero_sub]

example (A : SO9) : ∃ l : List Euc9, (∀ u ∈ l, ‖u‖ = 1) ∧ l.length ≤ 8 ∧
    Even l.length ∧ source9TargetEuclideanIsometry A =
      (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
  source9TargetEuclidean_unitCartan_le_eight A

example (A : SO9) : ∃ l : List V, (∀ u ∈ l, source9Quadratic u = 1) ∧
    l.length ≤ 8 ∧ Even l.length ∧
    source9TargetEuclideanIsometry A = source9NativeReflectionWord l :=
  source9Target_sourceUnitCartan_le_eight A

example (A : SO9)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List V, ∃ g : G,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (g : C) = source9CliffordWord l ∧
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ∧
      ∀ z : V, source9SpinVectorRepresentation g z = (A : M9).mulVec z :=
  source9Axis8Target_hasOriginalSourceWordPreimage A hfix

example (A : Matrix.specialOrthogonalGroup SpaceIndex ℝ)
    (hfix : (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec
      (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ g : spinGroup source9Quadratic,
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ∧
      ∀ z : SpaceIndex → ℝ, source9SpinVectorRepresentation g z =
        (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec z :=
  source9Axis8Target_hasOriginalSourcePreimage A hfix

example (A : SO9)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List V, ∃ g : G, l.length ≤ 8 ∧ (g : C) = source9CliffordWord l := by
  obtain ⟨l, g, _hu, hlen, _heven, hword, _hgfix, _haction⟩ :=
    source9Axis8Target_hasOriginalSourceWordPreimage A hfix
  exact ⟨l, g, hlen, hword⟩

example (A : SO9)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ g : G, source9SpinVectorSpecialOrthogonalHom g = A := by
  obtain ⟨g, _hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage A hfix
  refine ⟨g, ?_⟩
  apply Subtype.ext
  apply Matrix.ext
  intro i j
  change (source9SpinVectorRepresentation g (source9CoordinateVector j)) i = (A : M9) i j
  have h := congrFun (haction (source9CoordinateVector j)) i
  simpa only [source9CoordinateVector, Matrix.mulVec_single_one] using h

example (A : SO9)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ g : G, (∀ z : V, source9Quadratic (source9SpinVectorRepresentation g z) = source9Quadratic z) ∧
      ∀ z : V, source9SpinVectorRepresentation g z = (A : M9).mulVec z := by
  obtain ⟨g, _hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage A hfix
  exact ⟨g, source9SpinVectorRepresentation_preserves_quadratic g, haction⟩

example (A : SO9) (z : V)
    (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ g : G, source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ∧
      source9SpinVectorRepresentation g z = (A : M9).mulVec z := by
  obtain ⟨g, hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage A hfix
  exact ⟨g, hgfix, haction z⟩

example : ∃ g : G, source9SpinVectorRepresentation g (source9CoordinateVector 8) =
    source9CoordinateVector 8 ∧ ∀ z : V, source9SpinVectorRepresentation g z = z := by
  have hfix : ((1 : SO9) : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8 :=
    Matrix.one_mulVec _
  obtain ⟨g, hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage 1 hfix
  refine ⟨g, hgfix, ?_⟩
  intro z
  exact (haction z).trans (Matrix.one_mulVec z)

example : ∃ g : G, g = 1 ∧ (g : C) = source9CliffordWord [] := by
  obtain ⟨g, hword, _haction⟩ := source9EvenUnitList_lift [] (by simp) ⟨0, rfl⟩
  exact ⟨g, Subtype.ext hword, hword⟩

example : source9EuclideanUnitNormals ([0] : List Euc9) = [] := by
  simp [source9EuclideanUnitNormals]

example (l : List Euc9) (hall : ∀ u ∈ l, ‖u‖ = 1)
    (hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1) :
    Even l.length := source9EuclideanUnitReflectionList_even_of_det_one l hall hdet

example : source9NegativeCentral ≠ (1 : G) ∧
    ∀ z : V, source9SpinVectorRepresentation source9NegativeCentral z = z :=
  ⟨source9NegativeCentral_ne_one, negative_center_action⟩

example : ∃ g : G, source9SpinVectorRepresentation g (source9CoordinateVector 8) =
    source9CoordinateVector 8 ∧ ∀ z : V,
      source9SpinVectorRepresentation g z = source9SpinVectorRepresentation perpendicularPair z := by
  have hfix : ((source9SpinVectorSpecialOrthogonalHom perpendicularPair) : M9).mulVec
      (source9CoordinateVector 8) = source9CoordinateVector 8 :=
    (source9SpinVectorSpecialOrthogonalHom_mulVec _ _).trans perpendicular_fixes
  obtain ⟨g, hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage _ hfix
  exact ⟨g, hgfix, fun z => (haction z).trans (source9SpinVectorSpecialOrthogonalHom_mulVec _ _)⟩

example : ¬ ∃ g : G, source9SpinVectorRepresentation g (source9CoordinateVector 8) =
    source9CoordinateVector 8 ∧ ∀ z : V,
      source9SpinVectorRepresentation g z =
        ((source9SpinVectorSpecialOrthogonalHom mixedPair) : M9).mulVec z := by
  rintro ⟨g, hgfix, haction⟩
  have hbad : -source9CoordinateVector 8 = source9CoordinateVector 8 := by
    calc
      _ = source9SpinVectorRepresentation mixedPair (source9CoordinateVector 8) := mixed_moves_axis.symm
      _ = ((source9SpinVectorSpecialOrthogonalHom mixedPair) : M9).mulVec
          (source9CoordinateVector 8) := (source9SpinVectorSpecialOrthogonalHom_mulVec _ _).symm
      _ = source9SpinVectorRepresentation g (source9CoordinateVector 8) := (haction _).symm
      _ = source9CoordinateVector 8 := hgfix
  have hc := congrFun hbad (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at hc

example (u v z : V) (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9ToEuclidean (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) =
      (ℝ ∙ E u)ᗮ.reflection ((ℝ ∙ E v)ᗮ.reflection (E z)) :=
  source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv

#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9TargetEuclidean_unitCartan_le_eight
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Target_sourceUnitCartan_le_eight
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourceWordPreimage
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourcePreimage
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_TARGET_PREIMAGE_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisTargetPreimageIndependentAudit
