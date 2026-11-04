import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CLCompletionSmoothStrictDerivative
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditStrictCompletionMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped BigOperators ContDiff Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditStrictCompletionMatrixTopology := rfl
example : CompleteSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
example (i j : SpaceIndex) : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] ℝ :=
  source9CompletionEntryCLM i j
example (i j : SpaceIndex) (B : Matrix SpaceIndex SpaceIndex ℝ) :
    source9CompletionEntryCLM i j B = B i j := source9CompletionEntryCLM_apply i j B
example (n : ℕ∞ω) (i j : SpaceIndex) :
    ContDiff ℝ n (fun B : Matrix SpaceIndex SpaceIndex ℝ => (B.transpose * B) i j) :=
  source9CompletionGramEntry_contDiff n i j
example (i j : SpaceIndex) :
    HasFDerivAt (fun B : Matrix SpaceIndex SpaceIndex ℝ => (B.transpose * B) i j)
      (0 : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] ℝ) 0 :=
  source9CompletionGramEntry_hasFDerivAt_zero i j
example (i j : SpaceIndex) (V : Matrix SpaceIndex SpaceIndex ℝ) :
    (fderiv ℝ (fun B : Matrix SpaceIndex SpaceIndex ℝ => (B.transpose * B) i j) 0) V = 0 :=
  congrArg (fun L : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] ℝ => L V)
    (source9CompletionGramEntry_hasFDerivAt_zero i j).fderiv
example (n : ℕ∞ω) : ContDiff ℝ n source9OrthogonalCompletionMap :=
  source9OrthogonalCompletionMap_contDiff n
example : HasFDerivAt source9OrthogonalCompletionMap
    (ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ)) 0 :=
  source9OrthogonalCompletionMap_hasFDerivAt_zero
example : fderiv ℝ source9OrthogonalCompletionMap 0 =
    ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrthogonalCompletionMap_fderiv_zero
example : HasStrictFDerivAt source9OrthogonalCompletionMap
    (ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ)) 0 :=
  source9OrthogonalCompletionMap_hasStrictFDerivAt_zero
example (V : Matrix SpaceIndex SpaceIndex ℝ) :
    (fderiv ℝ source9OrthogonalCompletionMap 0) V = V :=
  congrArg (fun L : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] Matrix SpaceIndex SpaceIndex ℝ => L V)
    source9OrthogonalCompletionMap_fderiv_zero
example (V : Matrix SpaceIndex SpaceIndex ℝ) (i j : SpaceIndex) :
    (fderiv ℝ source9OrthogonalCompletionMap 0) V i j = V i j :=
  congrArg (fun L : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] Matrix SpaceIndex SpaceIndex ℝ => L V i j)
    source9OrthogonalCompletionMap_fderiv_zero

private theorem auditStrictCompletionGramEntry_eq_sum (i j : SpaceIndex) :
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => (B.transpose * B) i j) =
      (fun B : Matrix SpaceIndex SpaceIndex ℝ => ∑ k : SpaceIndex, B k i * B k j) := rfl
example (n : ℕ∞ω) (i j : SpaceIndex) :
    ContDiff ℝ n (fun B : Matrix SpaceIndex SpaceIndex ℝ => ∑ k : SpaceIndex, B k i * B k j) := by
  rw [← auditStrictCompletionGramEntry_eq_sum i j]
  exact source9CompletionGramEntry_contDiff n i j
example (i j : SpaceIndex) :
    HasFDerivAt (fun B : Matrix SpaceIndex SpaceIndex ℝ => ∑ k : SpaceIndex, B k i * B k j)
      (0 : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] ℝ) 0 := by
  rw [← auditStrictCompletionGramEntry_eq_sum i j]
  exact source9CompletionGramEntry_hasFDerivAt_zero i j

private theorem auditStrictCompletionActualMap_eq : source9OrthogonalCompletionMap =
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2) := rfl
example (n : ℕ∞ω) : ContDiff ℝ n
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2) := by
  rw [← auditStrictCompletionActualMap_eq]
  exact source9OrthogonalCompletionMap_contDiff n
example : HasFDerivAt
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2)
    (ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ)) 0 := by
  rw [← auditStrictCompletionActualMap_eq]
  exact source9OrthogonalCompletionMap_hasFDerivAt_zero
example : HasStrictFDerivAt
    (fun B : Matrix SpaceIndex SpaceIndex ℝ => fun i j : SpaceIndex =>
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2)
    (ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ)) 0 := by
  rw [← auditStrictCompletionActualMap_eq]
  exact source9OrthogonalCompletionMap_hasStrictFDerivAt_zero

-- A global-injectivity negative control: I and -I have identical strict upper entries.
private theorem auditStrictCompletion_negativeIdentity_zero :
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
    hinj (auditStrictCompletion_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry


#print axioms FCP.BFSSPairedSpin9Clifford.source9CompletionEntryCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9CompletionEntryCLM_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9CompletionGramEntry_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9CompletionGramEntry_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_fderiv_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_hasStrictFDerivAt_zero
end
