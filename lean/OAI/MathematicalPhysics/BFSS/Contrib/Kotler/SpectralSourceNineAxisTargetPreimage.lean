import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineTargetEuclideanBridge
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEvenListLift

/-!
Candidate actual source Spin preimages of arbitrary fixed-axis original SO(9)
targets. Apply GENERIC Cartan to the independently constructed target isometry;
reuse original normalization and ordered even-list lifting. Establish equality
of the full original vector action before deducing stabilizer membership.
No source-attainment premise, covering, SO(8) classification or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisTargetPreimage
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineCartan
open FCP.BFSSSourceNineEvenListLift FCP.BFSSSourceNineTargetEuclideanBridge Submodule

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : V ≃ₗ[ℝ] Euc9 := source9ToEuclidean
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ

/-- Generic target Cartan factorization: unit normals, even length at most eight, original order. -/
theorem source9TargetEuclidean_unitCartan_le_eight (A : SO9) :
    ∃ l : List Euc9, (∀ u ∈ l, ‖u‖ = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9TargetEuclideanIsometry A = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  rcases LinearIsometryEquiv.reflections_generate_dim (source9TargetEuclideanIsometry A) with
    ⟨normals, hlen, hfactor⟩
  let l := source9EuclideanUnitNormals normals
  have hall : ∀ u ∈ l, ‖u‖ = 1 := source9EuclideanUnitNormals_all_unit normals
  have hlen9 : l.length ≤ 9 := by
    have hraw : normals.length ≤ 9 := by
      simpa [Euc9, SpaceIndex] using hlen
    exact (source9EuclideanUnitNormals_length_le normals).trans hraw
  have hfact : source9TargetEuclideanIsometry A =
      (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
    hfactor.trans (source9EuclideanUnitNormals_reflectionProduct_eq normals)
  have hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1 :=
    (congrArg (fun f : Euc9 ≃ₗᵢ[ℝ] Euc9 => LinearMap.det f.toLinearMap) hfact.symm).trans
      (source9TargetEuclideanIsometry_det_one A)
  have heven : Even l.length := source9EuclideanUnitReflectionList_even_of_det_one l hall hdet
  have hlen8 : l.length ≤ 8 := by
    rcases heven with ⟨k, hk⟩
    omega
  exact ⟨l, hall, hlen8, heven, hfact⟩

/-- Transport target normals back to the actual original Q-unit vectors, retaining their order. -/
theorem source9Target_sourceUnitCartan_le_eight (A : SO9) :
    ∃ l : List V, (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9TargetEuclideanIsometry A = source9NativeReflectionWord l := by
  rcases source9TargetEuclidean_unitCartan_le_eight A with
    ⟨normals, hall, hlen, heven, hfactor⟩
  refine ⟨normals.map E.symm, ?_, ?_, ?_, ?_⟩
  · intro a ha
    rcases List.mem_map.mp ha with ⟨u, hu, rfl⟩
    rw [source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply, hall u hu]
    norm_num
  · simpa only [List.length_map] using hlen
  · simpa only [List.length_map] using heven
  · simpa only [source9NativeReflectionWord, List.map_map, Function.comp_def,
      E.apply_symm_apply] using hfactor

/-- Original source word and complete target action; only the final step uses axis fixing. -/
theorem source9Axis8Target_hasOriginalSourceWordPreimage
    (A : SO9) (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List V, ∃ g : spinGroup source9Quadratic,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ∧
      ∀ z : V, source9SpinVectorRepresentation g z = (A : M9).mulVec z := by
  obtain ⟨l, hall, hlen, heven, hfactor⟩ := source9Target_sourceUnitCartan_le_eight A
  obtain ⟨g, hword, haction⟩ := source9EvenUnitList_lift l hall heven
  have heq : ∀ z : V, source9SpinVectorRepresentation g z = (A : M9).mulVec z := by
    intro z
    apply E.injective
    calc
      _ = source9NativeReflectionWord l (E z) := haction z
      _ = source9TargetEuclideanIsometry A (E z) :=
        (congrArg (fun f : Euc9 ≃ₗᵢ[ℝ] Euc9 => f (E z)) hfactor).symm
      _ = E ((A : M9).mulVec z) := source9TargetEuclideanIsometry_apply_source A z
  exact ⟨l, g, hall, hlen, heven, hword, (heq _).trans hfix, heq⟩

/-- Main source-exact existence theorem for every arbitrary original fixed-axis matrix target. -/
theorem source9Axis8Target_hasOriginalSourcePreimage
    (A : SO9) (hfix : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ g : spinGroup source9Quadratic,
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ∧
      ∀ z : V, source9SpinVectorRepresentation g z = (A : M9).mulVec z := by
  obtain ⟨_l, g, _hall, _hlen, _heven, _hword, hgfix, haction⟩ :=
    source9Axis8Target_hasOriginalSourceWordPreimage A hfix
  exact ⟨g, hgfix, haction⟩

#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9TargetEuclidean_unitCartan_le_eight
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Target_sourceUnitCartan_le_eight
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourceWordPreimage
#print axioms FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourcePreimage
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_TARGET_PREIMAGE_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisTargetPreimage
