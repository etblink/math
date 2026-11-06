import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DRTranslatedSO16Charts
import Mathlib.Analysis.Calculus.ContDiff.Operations

/-! F10DS: ambient regularity of the literal forward and backward Cayley formulas.
Use entrywise finite sums/products, determinant/adjugate and scalar inversion to retain
GammaMatrix's existing elementwise norm and topology. Smoothness is restricted to the
actual nonzero-determinant domains. Bind the backward extension to the accepted native
matrix and coordinate maps. No atlas-transition compatibility, IsManifold, derivative
normalization, intrinsic target tangent or representation differential is asserted.
Candidate until complete strict source compilation and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology BigOperators ContDiff Matrix.Norms.Elementwise

private abbrev M := GammaMatrix
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev U : Set Q := gamma16CayleySource
private abbrev W : Set M := {B | (B + 1).det ≠ 0}

/-- Original matrix entry evaluation with the existing finite-product norm. -/
noncomputable def gamma16MatrixEntryCLM (i j : SpinIndex) : M →L[ℝ] ℝ :=
  (ContinuousLinearMap.proj j : (SpinIndex → ℝ) →L[ℝ] ℝ).comp
    (ContinuousLinearMap.proj i : (SpinIndex → SpinIndex → ℝ) →L[ℝ] (SpinIndex → ℝ))

theorem gamma16MatrixEntryCLM_apply (i j : SpinIndex) (B : M) :
    gamma16MatrixEntryCLM i j B = B i j := rfl

/-- The determinant is a finite scalar polynomial in the original entries. -/
theorem gamma16Matrix_det_contDiff (n : ℕ∞ω) : ContDiff ℝ n (Matrix.det : M → ℝ) := by
  have hfun : (Matrix.det : M → ℝ) =
      (fun B : M => ∑ σ : Equiv.Perm SpinIndex,
        ((Equiv.Perm.sign σ : ℤ) : ℝ) * ∏ i : SpinIndex, B (σ i) i) := by
    funext B
    exact Matrix.det_apply' B
  rw [hfun]
  apply ContDiff.sum
  intro σ _
  apply ContDiff.mul contDiff_const
  apply contDiff_prod
  intro i _
  exact (gamma16MatrixEntryCLM (σ i) i).contDiff

/-- Replacing a fixed row by fixed scalar entries is smooth in the original topology. -/
theorem gamma16Matrix_updateRow_contDiff (n : ℕ∞ω) (j : SpinIndex) (row : SpinIndex → ℝ) :
    ContDiff ℝ n (fun B : M => B.updateRow j row) := by
  apply contDiff_pi.2
  intro a
  apply contDiff_pi.2
  intro b
  by_cases h : a = j
  · simpa only [Matrix.updateRow_apply, ite_eq_left h] using
      (contDiff_const : ContDiff ℝ n (fun _ : M => row b))
  · have he : ContDiff ℝ n (gamma16MatrixEntryCLM a b : M → ℝ) :=
      (gamma16MatrixEntryCLM a b).contDiff
    have hentry : (gamma16MatrixEntryCLM a b : M → ℝ) = (fun B : M => B a b) := by
      funext B
      exact gamma16MatrixEntryCLM_apply a b B
    have hraw : ContDiff ℝ n (fun B : M => B a b) :=
      Eq.mp (congrArg (fun f : M → ℝ => ContDiff ℝ n f) hentry) he
    simpa only [Matrix.updateRow_apply, ite_eq_right h] using hraw

/-- Adjugate entries are determinants of fixed-row replacements. -/
theorem gamma16Matrix_adjugate_contDiff (n : ℕ∞ω) :
    ContDiff ℝ n (Matrix.adjugate : M → M) := by
  apply contDiff_pi.2
  intro i
  apply contDiff_pi.2
  intro j
  have hfun : (fun B : M => B.adjugate i j) =
      (fun B : M => (B.updateRow j (Pi.single i 1)).det) := by
    funext B
    exact Matrix.adjugate_apply B i j
  have hdet : ContDiff ℝ n (Matrix.det : M → ℝ) := gamma16Matrix_det_contDiff n
  have hrow : ContDiff ℝ n (fun B : M => B.updateRow j (Pi.single i 1)) :=
    gamma16Matrix_updateRow_contDiff n j (Pi.single i 1)
  have hcomp : ContDiff ℝ n (fun B : M => (B.updateRow j (Pi.single i 1)).det) :=
    ContDiff.fun_comp (g := (Matrix.det : M → ℝ))
      (f := (fun B : M => B.updateRow j (Pi.single i 1))) hdet hrow
  exact Eq.mp (congrArg (fun f : M → ℝ => ContDiff ℝ n f) hfun.symm) hcomp

/-- Matrix multiplication is smooth by its finite scalar-entry sums, without a matrix NormedRing. -/
theorem gamma16Matrix_mul_contDiff (n : ℕ∞ω) :
    ContDiff ℝ n (fun B : M × M => B.1 * B.2) := by
  apply contDiff_pi.2
  intro i
  apply contDiff_pi.2
  intro j
  change ContDiff ℝ n (fun B : M × M => ∑ k : SpinIndex, B.1 i k * B.2 k j)
  apply ContDiff.sum
  intro k _
  exact ((gamma16MatrixEntryCLM i k).contDiff.comp contDiff_fst).mul
    ((gamma16MatrixEntryCLM k j).contDiff.comp contDiff_snd)

/-- The actual nonsingular matrix inverse is smooth wherever its scalar determinant is nonzero. -/
theorem gamma16Matrix_inv_contDiffAt (n : ℕ∞ω) (B : M) (hB : B.det ≠ 0) :
    ContDiffAt ℝ n (Inv.inv : M → M) B := by
  have hfun : (Inv.inv : M → M) = (fun X : M => X.det⁻¹ • X.adjugate) := by
    funext X
    rw [Matrix.inv_def, Ring.inverse_eq_inv']
  rw [hfun]
  exact ((gamma16Matrix_det_contDiff n).contDiffAt.inv hB).smul
    (gamma16Matrix_adjugate_contDiff n).contDiffAt

/-- Ambient smoothness of the exact accepted forward formula on its determinant domain. -/
theorem gamma16CayleyMatrix_contDiffAt (n : ℕ∞ω) (c : Q) (hc : c ∈ U) :
    ContDiffAt ℝ n gamma16CayleyMatrix c := by
  have ha : ContDiffAt ℝ n (fun x : Q => A x) c := A.contDiff.contDiffAt
  have hd : ContDiffAt ℝ n (fun x : Q => 1 - A x) c := contDiffAt_const.sub ha
  have hi : ContDiffAt ℝ n (fun x : Q => (1 - A x)⁻¹) c :=
    (gamma16Matrix_inv_contDiffAt n (1 - A c) hc).comp c hd
  have hn : ContDiffAt ℝ n (fun x : Q => 1 + A x) c := contDiffAt_const.add ha
  have h : ContDiffAt ℝ n
      (fun x : Q => (1 + A x) * (1 - A x)⁻¹) c :=
    (gamma16Matrix_mul_contDiff n).contDiffAt.comp c (hn.prodMk hi)
  change ContDiffAt ℝ n gamma16CayleyMatrix c at h
  exact h

theorem gamma16CayleyMatrix_contDiffOn (n : ℕ∞ω) :
    ContDiffOn ℝ n gamma16CayleyMatrix U := by
  intro c hc
  exact (gamma16CayleyMatrix_contDiffAt n c hc).contDiffWithinAt

/-- The literal backward formula extended to the original ambient matrix carrier. -/
noncomputable def gamma16CayleyBackwardAmbientMatrix (B : M) : M := (B - 1) * (B + 1)⁻¹

theorem gamma16CayleyBackwardAmbientMatrix_eq_native (r : SO) :
    gamma16CayleyBackwardAmbientMatrix (r : M) = gamma16CayleyBackwardMatrix r := rfl

/-- Ambient backward smoothness uses exactly det(B+1) nonzero. -/
theorem gamma16CayleyBackwardAmbientMatrix_contDiffAt
    (n : ℕ∞ω) (B : M) (hB : (B + 1).det ≠ 0) :
    ContDiffAt ℝ n gamma16CayleyBackwardAmbientMatrix B := by
  have hd : ContDiffAt ℝ n (fun X : M => X + 1) B := contDiffAt_id.add contDiffAt_const
  have hi : ContDiffAt ℝ n (fun X : M => (X + 1)⁻¹) B :=
    (gamma16Matrix_inv_contDiffAt n (B + 1) hB).comp B hd
  have hn : ContDiffAt ℝ n (fun X : M => X - 1) B := contDiffAt_id.sub contDiffAt_const
  have h : ContDiffAt ℝ n (fun X : M => (X - 1) * (X + 1)⁻¹) B :=
    (gamma16Matrix_mul_contDiff n).contDiffAt.comp B (hn.prodMk hi)
  change ContDiffAt ℝ n gamma16CayleyBackwardAmbientMatrix B at h
  exact h

/-- Extract the original increasing upper entries of the ambient backward formula. -/
noncomputable def gamma16CayleyBackwardAmbientCoordinates (B : M) : Q :=
  fun p => gamma16CayleyBackwardAmbientMatrix B p.val.1 p.val.2

/-- On the exact accepted native domain this extension is the original backward coordinates. -/
theorem gamma16CayleyBackwardAmbientCoordinates_eq_native (r : gamma16CayleyTarget) :
    gamma16CayleyBackwardAmbientCoordinates (r.val : M) = gamma16CayleyBackwardCoordinates r := by
  funext p
  change gamma16CayleyBackwardMatrix r.val p.val.1 p.val.2 =
    gamma16CayleyBackwardCoordinates r p
  exact (gamma16CayleyBackwardCoordinates_apply r p).symm

theorem gamma16CayleyBackwardAmbientCoordinates_contDiffAt
    (n : ℕ∞ω) (B : M) (hB : (B + 1).det ≠ 0) :
    ContDiffAt ℝ n gamma16CayleyBackwardAmbientCoordinates B := by
  apply contDiffAt_pi.2
  intro p
  have h : ContDiffAt ℝ n
      (fun X : M => gamma16CayleyBackwardAmbientMatrix X p.val.1 p.val.2) B :=
    (gamma16MatrixEntryCLM p.val.1 p.val.2).contDiff.contDiffAt.comp B
      (gamma16CayleyBackwardAmbientMatrix_contDiffAt n B hB)
  exact h

theorem gamma16CayleyBackwardAmbientCoordinates_contDiffOn (n : ℕ∞ω) :
    ContDiffOn ℝ n gamma16CayleyBackwardAmbientCoordinates W := by
  intro B hB
  exact (gamma16CayleyBackwardAmbientCoordinates_contDiffAt n B hB).contDiffWithinAt

#print axioms gamma16MatrixEntryCLM
#print axioms gamma16MatrixEntryCLM_apply
#print axioms gamma16Matrix_det_contDiff
#print axioms gamma16Matrix_updateRow_contDiff
#print axioms gamma16Matrix_adjugate_contDiff
#print axioms gamma16Matrix_mul_contDiff
#print axioms gamma16Matrix_inv_contDiffAt
#print axioms gamma16CayleyMatrix_contDiffAt
#print axioms gamma16CayleyMatrix_contDiffOn
#print axioms gamma16CayleyBackwardAmbientMatrix
#print axioms gamma16CayleyBackwardAmbientMatrix_eq_native
#print axioms gamma16CayleyBackwardAmbientMatrix_contDiffAt
#print axioms gamma16CayleyBackwardAmbientCoordinates
#print axioms gamma16CayleyBackwardAmbientCoordinates_eq_native
#print axioms gamma16CayleyBackwardAmbientCoordinates_contDiffAt
#print axioms gamma16CayleyBackwardAmbientCoordinates_contDiffOn
end
end FCP.BFSSPairedSpin9Clifford
