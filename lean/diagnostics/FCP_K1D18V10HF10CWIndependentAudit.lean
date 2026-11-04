import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CWOriginalSourceIdentityLocalChart
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditChartPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditChartPBWCoordinates.toAddMonoidHom auditChartPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditChartPBWCoordinates

@[instance_reducible] private def auditChartSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditChartMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditChartParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditChartPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditChartPBWCoordinates.toAddMonoidHom auditChartPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditChartPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditChartSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditChartMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw


example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditChartParameterTopology := rfl
example : T2Space (spinGroup source9Quadratic) := inferInstance
example : source9SpinIdentityChartTarget =
    source9OrderedUpperCoordinateLocalHomeomorph.source ∩
      source9OrderedStrictPlaneWord ⁻¹' source9SpinExactRecoveryNeighborhood := rfl
example (t : Fin 36 → ℝ) : t ∈ source9SpinIdentityChartTarget ↔
    t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source ∧
      source9OrderedStrictPlaneWord t ∈ source9SpinExactRecoveryNeighborhood := Iff.rfl
example : source9SpinIdentityChartTarget ⊆ source9OrderedUpperCoordinateLocalHomeomorph.source :=
  fun _ ht => ht.1
example : IsOpen source9SpinIdentityChartTarget := source9SpinIdentityChartTarget_isOpen
example : (0 : Fin 36 → ℝ) ∈ source9SpinIdentityChartTarget := source9SpinIdentityChartTarget_zero_mem
example : source9SpinIdentityChartTarget ∈ 𝓝 (0 : Fin 36 → ℝ) :=
  source9SpinIdentityChartTarget_isOpen.mem_nhds source9SpinIdentityChartTarget_zero_mem
example : OpenPartialHomeomorph (spinGroup source9Quadratic) (Fin 36 → ℝ) :=
  source9SpinIdentityLocalChart
example : source9SpinIdentityLocalChart.source = source9SpinExactRecoveryNeighborhood :=
  source9SpinIdentityLocalChart_source
example : source9SpinIdentityLocalChart.target = source9SpinIdentityChartTarget :=
  source9SpinIdentityLocalChart_target
example : (source9SpinIdentityLocalChart : spinGroup source9Quadratic → (Fin 36 → ℝ)) =
    (fun g : spinGroup source9Quadratic =>
      source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) :=
  source9SpinIdentityLocalChart_coe
example : (source9SpinIdentityLocalChart.symm : (Fin 36 → ℝ) → spinGroup source9Quadratic) =
    source9OrderedStrictPlaneWord := source9SpinIdentityLocalChart_symm_coe
example (g : spinGroup source9Quadratic) : source9SpinIdentityLocalChart g =
    source9OrderedUpperCoordinateLocalHomeomorph.symm
      (source9OrderedUpperProjection ((source9SpinVectorOrthogonalHom g) :
        Matrix SpaceIndex SpaceIndex ℝ)) := rfl
example : IsOpen source9SpinIdentityLocalChart.source := source9SpinIdentityLocalChart.open_source
example : IsOpen source9SpinIdentityLocalChart.target := source9SpinIdentityLocalChart.open_target
example : source9SpinIdentityLocalChart (1 : spinGroup source9Quadratic) = 0 :=
  source9SpinIdentityLocalChart_one
example : (1 : spinGroup source9Quadratic) ∈ source9SpinIdentityLocalChart.source :=
  source9SpinIdentityLocalChart_one_mem_source
example : (0 : Fin 36 → ℝ) ∈ source9SpinIdentityLocalChart.target :=
  source9SpinIdentityLocalChart_zero_mem_target
example : source9SpinIdentityLocalChart.symm (0 : Fin 36 → ℝ) = 1 :=
  source9OrderedStrictPlaneWord_zero
example : source9SpinIdentityLocalChart.source ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinIdentityLocalChart.open_source.mem_nhds source9SpinIdentityLocalChart_one_mem_source
example : Set.BijOn source9SpinIdentityLocalChart source9SpinExactRecoveryNeighborhood
    source9SpinIdentityChartTarget := source9SpinIdentityLocalChart_bijOn
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    source9SpinIdentityLocalChart g ∈ source9SpinIdentityChartTarget :=
  source9SpinIdentityLocalChart.map_source hg
example (t : Fin 36 → ℝ) (ht : t ∈ source9SpinIdentityChartTarget) :
    source9OrderedStrictPlaneWord t ∈ source9SpinExactRecoveryNeighborhood :=
  source9SpinIdentityLocalChart.map_target ht
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    source9OrderedStrictPlaneWord (source9SpinIdentityLocalChart g) = g :=
  source9SpinIdentityLocalChart.left_inv hg
example (t : Fin 36 → ℝ) (ht : t ∈ source9SpinIdentityChartTarget) :
    source9SpinIdentityLocalChart (source9OrderedStrictPlaneWord t) = t :=
  source9SpinIdentityLocalChart.right_inv ht
example : ContinuousOn (fun g : spinGroup source9Quadratic =>
      source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g))
    source9SpinExactRecoveryNeighborhood := source9SpinIdentityLocalChart.continuousOn
example : ContinuousOn source9OrderedStrictPlaneWord source9SpinIdentityChartTarget :=
  source9SpinIdentityLocalChart.continuousOn_symm
example : source9SpinExactRecoveryNeighborhood ≃ₜ source9SpinIdentityChartTarget :=
  source9SpinIdentityLocalChart.toHomeomorphSourceTarget
example : source9OrderedStrictPlaneWord '' source9SpinIdentityChartTarget =
    source9SpinExactRecoveryNeighborhood := by
  ext g
  constructor
  · rintro ⟨t, ht, rfl⟩
    exact source9SpinIdentityLocalChart.map_target ht
  · intro hg
    exact ⟨source9SpinIdentityLocalChart g, source9SpinIdentityLocalChart.map_source hg,
      source9SpinIdentityLocalChart.left_inv hg⟩

-- The new maps agree literally with CI's old homeomorphism on the restricted subtypes.
example (t : Fin 36 → ℝ) (ht : t ∈ source9SpinIdentityChartTarget) :
    (source9OrderedStrictPlaneWordImageHomeomorph ⟨t, ht.1⟩ : spinGroup source9Quadratic) =
      source9SpinIdentityLocalChart.symm t := rfl
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    (source9OrderedStrictPlaneWordImageHomeomorph.symm
      ⟨g, source9SpinExactRecoveryNeighborhood_subset_wordImage hg⟩ : Fin 36 → ℝ) =
      source9SpinIdentityLocalChart g := rfl

-- The actual natural matrix map is injective on this chart source, with both memberships explicit.
example : Set.InjOn (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ))
    source9SpinExactRecoveryNeighborhood := by
  intro g hg h hh hmat
  have hchart : source9SpinIdentityLocalChart g = source9SpinIdentityLocalChart h :=
    congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ =>
      source9OrderedUpperCoordinateLocalHomeomorph.symm (source9OrderedUpperProjection A)) hmat
  exact source9SpinIdentityLocalChart.injOn hg hh hchart

-- The total chart function still identifies the actual negative source sign with identity.
private theorem auditChart_negative_coordinates :
    source9SpinIdentityLocalChart source9NegativeCentral =
      source9SpinIdentityLocalChart (1 : spinGroup source9Quadratic) := by
  have hone : ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) :
      Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
    change source9SpinVectorMatrixHom (1 : spinGroup source9Quadratic) = 1
    exact map_one source9SpinVectorMatrixHom
  have hmat : ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) : Matrix SpaceIndex SpaceIndex ℝ) :=
    source9NegativeCentral_naturalMatrix_one.trans hone.symm
  exact congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ =>
    source9OrderedUpperCoordinateLocalHomeomorph.symm (source9OrderedUpperProjection A)) hmat
example : source9NegativeCentral ∉ source9SpinIdentityLocalChart.source := by
  intro hg
  exact source9NegativeCentral_ne_one (source9SpinIdentityLocalChart.injOn hg
    source9SpinIdentityLocalChart_one_mem_source auditChart_negative_coordinates)
example : ¬ Function.Injective (source9SpinIdentityLocalChart :
    spinGroup source9Quadratic → (Fin 36 → ℝ)) := by
  intro hinj
  exact source9NegativeCentral_ne_one (hinj auditChart_negative_coordinates)
example : source9SpinIdentityLocalChart.source ≠ Set.univ := by
  intro h
  have hg : source9NegativeCentral ∈ source9SpinIdentityLocalChart.source := by
    rw [h]
    exact Set.mem_univ _
  exact source9NegativeCentral_ne_one (source9SpinIdentityLocalChart.injOn hg
    source9SpinIdentityLocalChart_one_mem_source auditChart_negative_coordinates)
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityChartTarget
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityChartTarget_isOpen
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityChartTarget_zero_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_target
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_symm_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_one_mem_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_zero_mem_target
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinIdentityLocalChart_bijOn
end
