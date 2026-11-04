import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CORecoverySourceNeighborhood
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditSourceRecoveryPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditSourceRecoveryPBWCoordinates.toAddMonoidHom auditSourceRecoveryPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditSourceRecoveryPBWCoordinates

@[instance_reducible] private def auditSourceRecoverySpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditSourceRecoveryMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditSourceRecoveryPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditSourceRecoveryPBWCoordinates.toAddMonoidHom auditSourceRecoveryPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditSourceRecoveryPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditSourceRecoverySpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditSourceRecoveryMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : Continuous (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_continuous_pbw

private theorem auditSourceRecoveryActualMatrix_eq :
    (fun g : spinGroup source9Quadratic =>
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) =
    (fun g : spinGroup source9Quadratic => fun i j : SpaceIndex =>
      source9CliffordVectorProjection
        ((g : CliffordAlgebra source9Quadratic) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) *
          CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic)) i) := by
  funext g i j
  exact (source9NaturalMatrix_entry_eq_vectorConjugation g i j).trans
    (congrFun (source9AmbientVectorConjugation_eq_spin g (source9CoordinateVector j)).symm i)
example : Continuous (fun g : spinGroup source9Quadratic => fun i j : SpaceIndex =>
    source9CliffordVectorProjection
      ((g : CliffordAlgebra source9Quadratic) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) *
        CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic)) i) := by
  rw [← auditSourceRecoveryActualMatrix_eq]
  exact source9NaturalMatrix_continuous_pbw
example : source9SpinCoordinateReconstruction (1 : spinGroup source9Quadratic) = 1 :=
  source9SpinCoordinateReconstruction_one
example : source9SpinNaturalMatrixRecoveryNeighborhood =
    (source9SpinCoordinateReconstructionDomain ∩
      (fun g : spinGroup source9Quadratic =>
        ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
          Matrix SpaceIndex SpaceIndex ℝ)) ⁻¹' source9OrthogonalRecoveryNeighborhood) ∩
      (fun g : spinGroup source9Quadratic =>
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) ⁻¹'
          source9OrthogonalRecoveryNeighborhood := rfl
example (g : spinGroup source9Quadratic) :
    g ∈ source9SpinNaturalMatrixRecoveryNeighborhood ↔
      (g ∈ source9SpinCoordinateReconstructionDomain ∧
        ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
          Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood) ∧
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
          source9OrthogonalRecoveryNeighborhood := Iff.rfl
example : IsOpen source9SpinNaturalMatrixRecoveryNeighborhood :=
  source9SpinNaturalMatrixRecoveryNeighborhood_isOpen_pbw
example : (1 : spinGroup source9Quadratic) ∈ source9SpinNaturalMatrixRecoveryNeighborhood :=
  source9SpinNaturalMatrixRecoveryNeighborhood_one_mem
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example : Set.Nonempty source9SpinNaturalMatrixRecoveryNeighborhood :=
  ⟨1, source9SpinNaturalMatrixRecoveryNeighborhood_one_mem⟩
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    g ∈ source9SpinCoordinateReconstructionDomain ∧
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
        source9OrthogonalRecoveryNeighborhood ∧
      ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
        Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood :=
  source9SpinNaturalMatrixRecoveryNeighborhood_conditions g hg
example : source9SpinNaturalMatrixRecoveryNeighborhood ⊆ source9SpinCoordinateReconstructionDomain :=
  fun g hg => (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g hg).1
example : ContinuousOn source9SpinCoordinateReconstruction source9SpinNaturalMatrixRecoveryNeighborhood :=
  source9SpinCoordinateReconstruction_continuousOn_pbw.mono
    (fun g hg => (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g hg).1)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg
example : Set.EqOn (fun g : spinGroup source9Quadratic =>
      ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
        Matrix SpaceIndex SpaceIndex ℝ))
    (fun g : spinGroup source9Quadratic =>
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ))
    source9SpinNaturalMatrixRecoveryNeighborhood :=
  fun g hg => source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg
example : ∀ᶠ g : spinGroup source9Quadratic in 𝓝 (1 : spinGroup source9Quadratic),
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) :=
  Filter.mem_of_superset source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
    (fun g hg => source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) i j =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M i j)
    (source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g) =
      source9SpinVectorOrthogonalHom g := by
  apply Subtype.ext
  exact source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg

private theorem auditSourceRecoveryActualReconstruction_eq (g : spinGroup source9Quadratic) :
    source9SpinCoordinateReconstruction g = source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) := rfl
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)))) :
        Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) := by
  have heq := source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood g hg
  rw [auditSourceRecoveryActualReconstruction_eq g] at heq
  exact heq

-- Full natural-matrix equality still leaves source equality and image coverage as an extra obligation.
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    source9SpinCoordinateReconstruction g = g ↔ g ∈ source9OrderedStrictPlaneWordLocalImage :=
  source9SpinCoordinateReconstruction_eq_self_iff g
    (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g hg).1
example (V : Set (spinGroup source9Quadratic)) (hV : V ⊆ source9SpinNaturalMatrixRecoveryNeighborhood) :
    V ⊆ source9OrderedStrictPlaneWordLocalImage ↔
      ∀ g ∈ V, source9SpinCoordinateReconstruction g = g := by
  constructor
  · intro himage g hg
    exact (source9SpinCoordinateReconstruction_eq_self_iff g
      (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g (hV hg)).1).2 (himage hg)
  · intro hfix g hg
    exact (source9SpinCoordinateReconstruction_eq_self_iff g
      (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g (hV hg)).1).1 (hfix g hg)

-- Upper coordinates alone do not determine a general orthogonal matrix globally.
example : ¬ Set.InjOn source9OrderedUpperProjection
    (Matrix.orthogonalGroup SpaceIndex ℝ : Set (Matrix SpaceIndex SpaceIndex ℝ)) := by
  intro hinj
  have hnegative : (-1 : Matrix SpaceIndex SpaceIndex ℝ) ∈ Matrix.orthogonalGroup SpaceIndex ℝ := by
    rw [Matrix.mem_orthogonalGroup_iff']
    simp
  have hupper : source9OrderedUpperProjection (1 : Matrix SpaceIndex SpaceIndex ℝ) =
      source9OrderedUpperProjection (-1 : Matrix SpaceIndex SpaceIndex ℝ) := by
    apply (source9OrderedUpperProjection_eq_iff_strict_entries _ _).2
    intro p
    change (1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2 =
      -((1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2)
    have hz : (1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2 = 0 := by
      rw [Matrix.one_apply, ite_eq_right p.property.ne]
    simp only [hz, neg_zero]
  have heq : (1 : Matrix SpaceIndex SpaceIndex ℝ) = -1 :=
    hinj (Matrix.orthogonalGroup SpaceIndex ℝ).one_mem hnegative hupper
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (1 : ℝ) = -1 at hentry
  norm_num at hentry

#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinNaturalMatrixRecoveryNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinNaturalMatrixRecoveryNeighborhood_isOpen_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinNaturalMatrixRecoveryNeighborhood_one_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinNaturalMatrixRecoveryNeighborhood_conditions
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_reconstruction_eq_on_sourceNeighborhood
end
