import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CVExactSourceRecoveryNeighborhood
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditExactPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditExactPBWCoordinates.toAddMonoidHom auditExactPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditExactPBWCoordinates

@[instance_reducible] private def auditExactSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditExactMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditExactPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditExactPBWCoordinates.toAddMonoidHom auditExactPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditExactPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditExactSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditExactMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw

-- The source remains a separated subtype of the independently reconstructed Clifford PBW space.
example : T2Space (spinGroup source9Quadratic) := inferInstance
example : IsOpen ({source9NegativeCentral}ᶜ : Set (spinGroup source9Quadratic)) :=
  isOpen_compl_singleton
example (g : spinGroup source9Quadratic) :
    source9SpinReconstructionRelative g = source9SpinCoordinateReconstruction g * g⁻¹ := rfl
example (g : spinGroup source9Quadratic) :
    (source9SpinReconstructionRelative g : CliffordAlgebra source9Quadratic) =
      (source9SpinCoordinateReconstruction g : CliffordAlgebra source9Quadratic) *
        CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic) := by
  change (source9SpinCoordinateReconstruction g : CliffordAlgebra source9Quadratic) *
    ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) = _
  rw [source9Spin_inv_coe_eq_reverse g]
example : ContinuousOn source9SpinReconstructionRelative source9SpinCoordinateReconstructionDomain :=
  source9SpinReconstructionRelative_continuousOn_pbw
example : source9SpinReconstructionRelative (1 : spinGroup source9Quadratic) = 1 :=
  source9SpinReconstructionRelative_one
example : source9SpinExactRecoveryNeighborhood =
    source9SpinNaturalMatrixRecoveryNeighborhood ∩
      source9SpinReconstructionRelative ⁻¹'
        ({source9NegativeCentral}ᶜ : Set (spinGroup source9Quadratic)) := rfl
example (g : spinGroup source9Quadratic) :
    g ∈ source9SpinExactRecoveryNeighborhood ↔
      g ∈ source9SpinNaturalMatrixRecoveryNeighborhood ∧
        source9SpinCoordinateReconstruction g * g⁻¹ ≠ source9NegativeCentral := Iff.rfl
example : IsOpen source9SpinExactRecoveryNeighborhood :=
  source9SpinExactRecoveryNeighborhood_isOpen_pbw
example : (1 : spinGroup source9Quadratic) ∈ source9SpinExactRecoveryNeighborhood :=
  source9SpinExactRecoveryNeighborhood_one_mem
example : source9SpinExactRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinExactRecoveryNeighborhood_mem_nhds_one_pbw
example : Set.Nonempty source9SpinExactRecoveryNeighborhood :=
  ⟨1, source9SpinExactRecoveryNeighborhood_one_mem⟩
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    g ∈ source9SpinNaturalMatrixRecoveryNeighborhood ∧
      source9SpinReconstructionRelative g ≠ source9NegativeCentral :=
  source9SpinExactRecoveryNeighborhood_conditions g hg
example : source9SpinExactRecoveryNeighborhood ⊆ source9SpinNaturalMatrixRecoveryNeighborhood :=
  fun g hg => (source9SpinExactRecoveryNeighborhood_conditions g hg).1
example : source9SpinExactRecoveryNeighborhood ⊆ source9SpinCoordinateReconstructionDomain :=
  fun g hg => (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g
    (source9SpinExactRecoveryNeighborhood_conditions g hg).1).1
example : ContinuousOn source9SpinReconstructionRelative source9SpinExactRecoveryNeighborhood :=
  source9SpinReconstructionRelative_continuousOn_pbw.mono
    (fun g hg => (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g
      (source9SpinExactRecoveryNeighborhood_conditions g hg).1).1)
example : ContinuousOn source9SpinCoordinateReconstruction source9SpinExactRecoveryNeighborhood :=
  source9SpinCoordinateReconstruction_continuousOn_pbw.mono
    (fun g hg => (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g
      (source9SpinExactRecoveryNeighborhood_conditions g hg).1).1)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    source9SpinReconstructionRelative g = 1 :=
  source9SpinReconstructionRelative_eq_one_on_exactNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    source9SpinCoordinateReconstruction g = g :=
  source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    (source9SpinCoordinateReconstruction g : CliffordAlgebra source9Quadratic) =
      (g : CliffordAlgebra source9Quadratic) :=
  congrArg (fun k : spinGroup source9Quadratic => (k : CliffordAlgebra source9Quadratic))
    (source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood g hg)
example : Set.EqOn source9SpinCoordinateReconstruction (fun g : spinGroup source9Quadratic => g)
    source9SpinExactRecoveryNeighborhood :=
  fun g hg => source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood g hg
example : ∀ᶠ g : spinGroup source9Quadratic in 𝓝 (1 : spinGroup source9Quadratic),
    source9SpinCoordinateReconstruction g = g :=
  Filter.mem_of_superset source9SpinExactRecoveryNeighborhood_mem_nhds_one_pbw
    (fun g hg => source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood g hg)
example : source9SpinExactRecoveryNeighborhood ⊆ source9OrderedStrictPlaneWordLocalImage :=
  source9SpinExactRecoveryNeighborhood_subset_wordImage
example : source9OrderedStrictPlaneWordLocalImage ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9OrderedStrictPlaneWordLocalImage_mem_nhds_one_pbw
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinExactRecoveryNeighborhood) :
    ∃ t : Fin 36 → ℝ, t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source ∧
      source9OrderedStrictPlaneWord t = g :=
  source9SpinExactRecoveryNeighborhood_subset_wordImage hg
example : ∀ᶠ g : spinGroup source9Quadratic in 𝓝 (1 : spinGroup source9Quadratic),
    ∃ t : Fin 36 → ℝ, t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source ∧
      source9OrderedStrictPlaneWord t = g :=
  Filter.mem_of_superset source9SpinExactRecoveryNeighborhood_mem_nhds_one_pbw
    (fun _ hg => source9SpinExactRecoveryNeighborhood_subset_wordImage hg)

-- Exact source equality yields actual local coordinate separation, with both membership premises.
example : Set.InjOn source9SpinUpperCoordinates source9SpinExactRecoveryNeighborhood := by
  intro g hg h hh hcoords
  have hrec : source9SpinCoordinateReconstruction g = source9SpinCoordinateReconstruction h :=
    congrArg (fun u : Fin 36 → ℝ =>
      source9OrderedStrictPlaneWord (source9OrderedUpperCoordinateLocalHomeomorph.symm u)) hcoords
  calc
    g = source9SpinCoordinateReconstruction g :=
      (source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood g hg).symm
    _ = source9SpinCoordinateReconstruction h := hrec
    _ = h := source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood h hh

-- The negative sign has the same natural coordinates as identity but reconstructs to identity.
private theorem auditExact_negative_reconstruction :
    source9SpinCoordinateReconstruction source9NegativeCentral = 1 := by
  have hone : ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) :
      Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
    change source9SpinVectorMatrixHom (1 : spinGroup source9Quadratic) = 1
    exact map_one source9SpinVectorMatrixHom
  have hmat : ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) : Matrix SpaceIndex SpaceIndex ℝ) :=
    source9NegativeCentral_naturalMatrix_one.trans hone.symm
  have hcoords : source9SpinUpperCoordinates source9NegativeCentral =
      source9SpinUpperCoordinates (1 : spinGroup source9Quadratic) :=
    congrArg source9OrderedUpperProjection hmat
  have hrec : source9SpinCoordinateReconstruction source9NegativeCentral =
      source9SpinCoordinateReconstruction (1 : spinGroup source9Quadratic) :=
    congrArg (fun u : Fin 36 → ℝ =>
      source9OrderedStrictPlaneWord (source9OrderedUpperCoordinateLocalHomeomorph.symm u)) hcoords
  exact hrec.trans source9SpinCoordinateReconstruction_one
private theorem auditExact_negative_not_in_wordImage :
    source9NegativeCentral ∉ source9OrderedStrictPlaneWordLocalImage := by
  intro hg
  have hfix := (source9SpinCoordinateReconstruction_eq_self_iff source9NegativeCentral
    (source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain hg)).2 hg
  exact source9NegativeCentral_ne_one (hfix.symm.trans auditExact_negative_reconstruction)
example : source9NegativeCentral ∉ source9SpinExactRecoveryNeighborhood :=
  fun hg => auditExact_negative_not_in_wordImage (source9SpinExactRecoveryNeighborhood_subset_wordImage hg)
example : source9OrderedStrictPlaneWordLocalImage ≠ Set.univ := by
  intro h
  apply auditExact_negative_not_in_wordImage
  rw [h]
  exact Set.mem_univ _
example : ¬ ∀ g : spinGroup source9Quadratic, source9SpinCoordinateReconstruction g = g := by
  intro h
  exact source9NegativeCentral_ne_one ((h source9NegativeCentral).symm.trans auditExact_negative_reconstruction)
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinReconstructionRelative
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinReconstructionRelative_continuousOn_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinReconstructionRelative_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood_isOpen_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood_one_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood_mem_nhds_one_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood_conditions
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinReconstructionRelative_eq_one_on_exactNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_eq_self_on_exactNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinExactRecoveryNeighborhood_subset_wordImage
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordLocalImage_mem_nhds_one_pbw
end
