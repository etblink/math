import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CKOrthogonalCompletionCoordinates
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditCompletionMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped BigOperators Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditCompletionMatrixTopology := rfl
example : (Matrix SpaceIndex SpaceIndex ℝ) → Matrix SpaceIndex SpaceIndex ℝ :=
  source9OrthogonalCompletionMap
example (B : Matrix SpaceIndex SpaceIndex ℝ) (i j : SpaceIndex) :
    source9OrthogonalCompletionMap B i j =
      if i < j then B i j
      else if j < i then B i j + ∑ k : SpaceIndex, B k i * B k j
      else B i j + (∑ k : SpaceIndex, B k i * B k j) / 2 := rfl
example (B : Matrix SpaceIndex SpaceIndex ℝ) (i j : SpaceIndex) (hij : i < j) :
    source9OrthogonalCompletionMap B i j = B i j := by
  simp only [source9OrthogonalCompletionMap, ite_eq_left hij]
example : source9OrthogonalCompletionMap 0 = 0 := source9OrthogonalCompletionMap_zero
example (B : Matrix SpaceIndex SpaceIndex ℝ) :
    (1 + B).transpose * (1 + B) - 1 = B + B.transpose + B.transpose * B :=
  source9Matrix_perturbation_gram_identity B
example (A : Matrix SpaceIndex SpaceIndex ℝ) (hA : A ∈ Matrix.orthogonalGroup SpaceIndex ℝ) :
    (A - 1) + (A - 1).transpose + (A - 1).transpose * (A - 1) = 0 :=
  source9Orthogonal_perturbation_gram_zero A hA
example (A : Matrix.orthogonalGroup SpaceIndex ℝ) :
    source9OrthogonalCompletionMap ((A : Matrix SpaceIndex SpaceIndex ℝ) - 1) =
      source9StrictPlaneMatrix (fun p : source9StrictPlaneIndex => A.val p.val.1 p.val.2) :=
  source9OrthogonalCompletionMap_on_orthogonal A.val A.property
example (A B : Matrix SpaceIndex SpaceIndex ℝ) :
    source9OrderedUpperProjection A = source9OrderedUpperProjection B ↔
      ∀ p : source9StrictPlaneIndex, A p.val.1 p.val.2 = B p.val.1 p.val.2 :=
  source9OrderedUpperProjection_eq_iff_strict_entries A B
example (A B : Matrix.orthogonalGroup SpaceIndex ℝ)
    (h : ∀ p : source9StrictPlaneIndex, A.val p.val.1 p.val.2 = B.val p.val.1 p.val.2) :
    source9OrthogonalCompletionMap ((A : Matrix SpaceIndex SpaceIndex ℝ) - 1) =
      source9OrthogonalCompletionMap ((B : Matrix SpaceIndex SpaceIndex ℝ) - 1) :=
  source9OrthogonalCompletionMap_eq_of_upperProjection_eq A.val B.val A.property B.property
    ((source9OrderedUpperProjection_eq_iff_strict_entries A.val B.val).2 h)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9OrthogonalCompletionMap
        (((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
          Matrix SpaceIndex SpaceIndex ℝ) - 1) =
      source9OrthogonalCompletionMap
        (((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) - 1) :=
  source9OrthogonalCompletionMap_actual_reconstruction g hg

-- Preserve the completely expanded original source-word reconstruction interface.
private theorem auditCompletionActualReconstruction_eq (g : spinGroup source9Quadratic) :
    source9SpinCoordinateReconstruction g =
      source9OrderedStrictPlaneWord
        (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) := rfl
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9OrthogonalCompletionMap
        (((source9SpinVectorOrthogonalHom
          (source9OrderedStrictPlaneWord
            (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)))) :
              Matrix SpaceIndex SpaceIndex ℝ) - 1) =
      source9OrthogonalCompletionMap
        (((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) - 1) := by
  have h := source9OrthogonalCompletionMap_actual_reconstruction g hg
  rw [auditCompletionActualReconstruction_eq g] at h
  exact h

-- A global-injectivity negative control: I and -I have identical strict upper entries.
private theorem auditCompletion_negativeIdentity_zero :
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
    hinj (auditCompletion_negativeIdentity_zero.trans source9OrthogonalCompletionMap_zero.symm)
  have hentry := congrArg (fun M : Matrix SpaceIndex SpaceIndex ℝ => M (0 : SpaceIndex) 0) heq
  change (-1 : ℝ) - 1 = 0 at hentry
  norm_num at hentry

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Matrix_perturbation_gram_identity
#print axioms FCP.BFSSPairedSpin9Clifford.source9Orthogonal_perturbation_gram_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_on_orthogonal
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperProjection_eq_iff_strict_entries
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_eq_of_upperProjection_eq
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrthogonalCompletionMap_actual_reconstruction
end
