import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CMCompletionLocalInverse
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditCompletionInverseMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology BigOperators Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditCompletionInverseMatrixTopology := rfl
example : CompleteSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
example : ((ContinuousLinearEquiv.refl ℝ (Matrix SpaceIndex SpaceIndex ℝ)) :
    Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] Matrix SpaceIndex SpaceIndex ℝ) =
      ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ) := rfl
example : HasStrictFDerivAt source9OrthogonalCompletionMap
    ((ContinuousLinearEquiv.refl ℝ (Matrix SpaceIndex SpaceIndex ℝ)) :
      Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] Matrix SpaceIndex SpaceIndex ℝ) 0 :=
  source9OrthogonalCompletionMap_hasStrictFDerivAt_refl
example : OpenPartialHomeomorph (Matrix SpaceIndex SpaceIndex ℝ) (Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalCompletionLocalHomeomorph
example : (source9OrthogonalCompletionLocalHomeomorph :
    Matrix SpaceIndex SpaceIndex ℝ → Matrix SpaceIndex SpaceIndex ℝ) =
      source9OrthogonalCompletionMap := source9OrthogonalCompletionLocalHomeomorph_coe
example : (0 : Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalCompletionLocalHomeomorph.source :=
  source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
example : (0 : Matrix SpaceIndex SpaceIndex ℝ) ∈ source9OrthogonalCompletionLocalHomeomorph.target :=
  source9OrthogonalCompletionLocalHomeomorph_zero_mem_target
example : source9OrthogonalCompletionLocalHomeomorph.source ∈ 𝓝 (0 : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalCompletionLocalHomeomorph.open_source.mem_nhds
    source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
example : source9OrthogonalCompletionLocalHomeomorph.target ∈ 𝓝 (0 : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalCompletionLocalHomeomorph.open_target.mem_nhds
    source9OrthogonalCompletionLocalHomeomorph_zero_mem_target
example : ContinuousAt source9OrthogonalCompletionLocalHomeomorph.symm
    (0 : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalCompletionLocalHomeomorph.continuousAt_symm
    source9OrthogonalCompletionLocalHomeomorph_zero_mem_target
example (B : Matrix SpaceIndex SpaceIndex ℝ)
    (hB : B ∈ source9OrthogonalCompletionLocalHomeomorph.source) :
    source9OrthogonalCompletionLocalHomeomorph.symm (source9OrthogonalCompletionMap B) = B :=
  source9OrthogonalCompletionLocalHomeomorph_left_inv B hB
example (Y : Matrix SpaceIndex SpaceIndex ℝ)
    (hY : Y ∈ source9OrthogonalCompletionLocalHomeomorph.target) :
    source9OrthogonalCompletionMap (source9OrthogonalCompletionLocalHomeomorph.symm Y) = Y :=
  source9OrthogonalCompletionLocalHomeomorph_right_inv Y hY
example : source9OrthogonalCompletionLocalHomeomorph.symm (0 : Matrix SpaceIndex SpaceIndex ℝ) = 0 := by
  have h := source9OrthogonalCompletionLocalHomeomorph_left_inv 0
    source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
  rw [source9OrthogonalCompletionMap_zero] at h
  exact h
example : Set.InjOn source9OrthogonalCompletionMap source9OrthogonalCompletionLocalHomeomorph.source :=
  source9OrthogonalCompletionMap_injOn_source

private theorem auditCompletionInverseActualMap_eq : source9OrthogonalCompletionMap =
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2) := rfl
example (B : Matrix SpaceIndex SpaceIndex ℝ) (i j : SpaceIndex) :
    source9OrthogonalCompletionLocalHomeomorph B i j =
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2 := by
  have hforward := congrFun source9OrthogonalCompletionLocalHomeomorph_coe B
  have hactual := congrFun auditCompletionInverseActualMap_eq B
  exact congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M i j) (hforward.trans hactual)
example (B : Matrix SpaceIndex SpaceIndex ℝ)
    (hB : B ∈ source9OrthogonalCompletionLocalHomeomorph.source) :
    source9OrthogonalCompletionLocalHomeomorph.symm
      (fun i j : SpaceIndex =>
        if i < j then B i j
        else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
        else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2) = B := by
  have heq := congrFun auditCompletionInverseActualMap_eq B
  exact (congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ =>
    source9OrthogonalCompletionLocalHomeomorph.symm M) heq).symm.trans
      (source9OrthogonalCompletionLocalHomeomorph_left_inv B hB)
example (Y : Matrix SpaceIndex SpaceIndex ℝ)
    (hY : Y ∈ source9OrthogonalCompletionLocalHomeomorph.target) (i j : SpaceIndex) :
    (if i < j then source9OrthogonalCompletionLocalHomeomorph.symm Y i j
      else if j < i then source9OrthogonalCompletionLocalHomeomorph.symm Y i j +
        ∑ k : SpaceIndex, source9OrthogonalCompletionLocalHomeomorph.symm Y k i *
          source9OrthogonalCompletionLocalHomeomorph.symm Y k j
      else source9OrthogonalCompletionLocalHomeomorph.symm Y i j +
        (∑ k : SpaceIndex, source9OrthogonalCompletionLocalHomeomorph.symm Y k i *
          source9OrthogonalCompletionLocalHomeomorph.symm Y k j) / 2) = Y i j := by
  have heq := congrFun auditCompletionInverseActualMap_eq
    (source9OrthogonalCompletionLocalHomeomorph.symm Y)
  have hleft := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M i j) heq
  have hright := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M i j)
    (source9OrthogonalCompletionLocalHomeomorph_right_inv Y hY)
  exact hleft.symm.trans hright
example : Set.InjOn
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2)
    source9OrthogonalCompletionLocalHomeomorph.source := by
  rw [← auditCompletionInverseActualMap_eq]
  exact source9OrthogonalCompletionMap_injOn_source
example (A B : Matrix SpaceIndex SpaceIndex ℝ)
    (hA : A ∈ source9OrthogonalCompletionLocalHomeomorph.source)
    (hB : B ∈ source9OrthogonalCompletionLocalHomeomorph.source)
    (h : ∀ i j : SpaceIndex, source9OrthogonalCompletionMap A i j =
      source9OrthogonalCompletionMap B i j) : A = B := by
  apply source9OrthogonalCompletionMap_injOn_source hA hB
  funext i j
  exact h i j

-- A global-injectivity negative control: I and -I have identical strict upper entries.
private theorem auditCompletionInverse_negativeIdentity_zero :
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
    hinj (auditCompletionInverse_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry


-- The known global collision cannot belong to this injective source neighborhood.
example : ((-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1) ∉
    source9OrthogonalCompletionLocalHomeomorph.source := by
  intro hnegative
  have heq : (-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1 = 0 :=
    source9OrthogonalCompletionMap_injOn_source hnegative
      source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
      (auditCompletionInverse_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_hasStrictFDerivAt_refl
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph_zero_mem_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph_zero_mem_target
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph_left_inv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionLocalHomeomorph_right_inv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_injOn_source
end
