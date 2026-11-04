import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CNLocalOrthogonalRecovery
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditRecoveryMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditRecoveryMatrixTopology := rfl
example : source9OrthogonalRecoveryNeighborhood =
    (fun A : Matrix SpaceIndex SpaceIndex ℝ => A - 1) ⁻¹'
      source9OrthogonalCompletionLocalHomeomorph.source := rfl
example (A : Matrix SpaceIndex SpaceIndex ℝ) : A ∈ source9OrthogonalRecoveryNeighborhood ↔
    A - 1 ∈ source9OrthogonalCompletionLocalHomeomorph.source := Iff.rfl
example : IsOpen source9OrthogonalRecoveryNeighborhood := source9OrthogonalRecoveryNeighborhood_isOpen
example : (1 : Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood :=
  source9OrthogonalRecoveryNeighborhood_one_mem
example : source9OrthogonalRecoveryNeighborhood ∈ 𝓝 (1 : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalRecoveryNeighborhood_isOpen.mem_nhds source9OrthogonalRecoveryNeighborhood_one_mem
example : Set.InjOn source9OrderedUpperProjection
    ((Matrix.orthogonalGroup SpaceIndex ℝ : Set (Matrix SpaceIndex SpaceIndex ℝ)) ∩
      source9OrthogonalRecoveryNeighborhood) := source9OrderedUpperProjection_injOn_orthogonal_near_one
example (A B : Matrix SpaceIndex SpaceIndex ℝ)
    (hA : A ∈ Matrix.orthogonalGroup SpaceIndex ℝ)
    (hB : B ∈ Matrix.orthogonalGroup SpaceIndex ℝ)
    (hAn : A ∈ source9OrthogonalRecoveryNeighborhood)
    (hBn : B ∈ source9OrthogonalRecoveryNeighborhood)
    (h : source9OrderedUpperProjection A = source9OrderedUpperProjection B) : A = B :=
  source9Orthogonal_eq_of_upperProjection_eq_near_one A B hA hB hAn hBn h
example (A B : Matrix SpaceIndex SpaceIndex ℝ)
    (hA : A ∈ Matrix.orthogonalGroup SpaceIndex ℝ)
    (hB : B ∈ Matrix.orthogonalGroup SpaceIndex ℝ)
    (hAn : A ∈ source9OrthogonalRecoveryNeighborhood)
    (hBn : B ∈ source9OrthogonalRecoveryNeighborhood)
    (h : ∀ p : source9StrictPlaneIndex, A p.val.1 p.val.2 = B p.val.1 p.val.2) : A = B :=
  source9Orthogonal_eq_of_strict_entries_eq_near_one A B hA hB hAn hBn h
example (A B : Matrix.orthogonalGroup SpaceIndex ℝ)
    (hAn : (A : Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood)
    (hBn : (B : Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood)
    (h : ∀ i : Fin 36, (A : Matrix SpaceIndex SpaceIndex ℝ)
      (source9StrictPlaneRow i) (source9StrictPlaneColumn i) =
      (B : Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i) (source9StrictPlaneColumn i)) :
    A = B := by
  apply Subtype.ext
  apply source9Orthogonal_eq_of_upperProjection_eq_near_one _ _ A.property B.property hAn hBn
  funext i
  exact (source9OrderedUpperProjection_apply _ i).trans
    ((h i).trans (source9OrderedUpperProjection_apply _ i).symm)
example (g h : spinGroup source9Quadratic)
    (hgn : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
      source9OrthogonalRecoveryNeighborhood)
    (hhn : ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ∈
      source9OrthogonalRecoveryNeighborhood)
    (hc : source9SpinUpperCoordinates g = source9SpinUpperCoordinates h) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9NaturalMatrices_eq_of_upperCoordinates_eq_near_one g h hgn hhn hc
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain)
    (hReconstruction : ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood)
    (hOriginal : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
      source9OrthogonalRecoveryNeighborhood) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9NaturalMatrix_reconstruction_eq_near_one g hg hReconstruction hOriginal
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain)
    (hReconstruction : ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood)
    (hOriginal : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
      source9OrthogonalRecoveryNeighborhood) (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) i j =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M i j)
    (source9NaturalMatrix_reconstruction_eq_near_one g hg hReconstruction hOriginal)

private theorem auditRecoveryActualReconstruction_eq (g : spinGroup source9Quadratic) :
    source9SpinCoordinateReconstruction g = source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) := rfl
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain)
    (hReconstruction : ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalRecoveryNeighborhood)
    (hOriginal : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) ∈
      source9OrthogonalRecoveryNeighborhood) :
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)))) :
        Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) := by
  have heq := source9NaturalMatrix_reconstruction_eq_near_one g hg hReconstruction hOriginal
  rw [auditRecoveryActualReconstruction_eq g] at heq
  exact heq

-- A global-injectivity negative control: I and -I have identical strict upper entries.
private theorem auditRecovery_negativeIdentity_zero :
    source9OrthogonalCompletionMap ((-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1) = 0 := by
  have horth : (-1 : Matrix SpaceIndex SpaceIndex ℝ) ∈ Matrix.orthogonalGroup SpaceIndex ℝ := by
    rw [Matrix.mem_orthogonalGroup_iff']
    simp
  have hcoeff : (fun p : source9StrictPlaneIndex =>
      (-1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2) = 0 := by
    funext p
    change -((1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2) = 0
    rw [Matrix.one_apply, ite_eq_right p.property.ne, neg_zero]
  have hzero : source9StrictPlaneMatrix (0 : source9StrictPlaneIndex → ℝ) = 0 := by
    funext i j
    simp [source9StrictPlaneMatrix]
  calc
    source9OrthogonalCompletionMap ((-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1) =
        source9StrictPlaneMatrix (fun p : source9StrictPlaneIndex =>
          (-1 : Matrix SpaceIndex SpaceIndex ℝ) p.val.1 p.val.2) :=
      source9OrthogonalCompletionMap_on_orthogonal _ horth
    _ = source9StrictPlaneMatrix (0 : source9StrictPlaneIndex → ℝ) :=
      congrArg source9StrictPlaneMatrix hcoeff
    _ = 0 := hzero
example : ¬ Function.Injective source9OrthogonalCompletionMap := by
  intro hinj
  have heq : (-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1 = 0 :=
    hinj (auditRecovery_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry


-- The known global collision cannot belong to this injective source neighborhood.
private theorem auditRecovery_negativePerturbation_not_source :
    ((-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1) ∉
    source9OrthogonalCompletionLocalHomeomorph.source := by
  intro hnegative
  have heq : (-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1 = 0 :=
    source9OrthogonalCompletionMap_injOn_source hnegative
      source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
      (auditRecovery_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry

example : (-1 : Matrix SpaceIndex SpaceIndex ℝ) ∉ source9OrthogonalRecoveryNeighborhood :=
  auditRecovery_negativePerturbation_not_source

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

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalRecoveryNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalRecoveryNeighborhood_isOpen
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalRecoveryNeighborhood_one_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9Orthogonal_eq_of_upperProjection_eq_near_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperProjection_injOn_orthogonal_near_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9Orthogonal_eq_of_strict_entries_eq_near_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrices_eq_of_upperCoordinates_eq_near_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_reconstruction_eq_near_one
end
