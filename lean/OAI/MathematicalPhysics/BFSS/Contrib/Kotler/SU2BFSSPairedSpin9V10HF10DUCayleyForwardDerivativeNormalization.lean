import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DTNativeSO16AtlasRegularity
import Mathlib.Analysis.Calculus.FDeriv.Bilinear
import Mathlib.Analysis.Calculus.FDeriv.Add
import Mathlib.Analysis.Calculus.FDeriv.Congr

/-! F10DU: the literal forward Cayley derivative is twice the original skew reconstruction.
Reuse BT's finite-dimensional continuous bilinear multiplication construction with the
unchanged GammaMatrix norm. Differentiate the actual Cayley denominator identity locally
at zero, use DS regularity and derivative uniqueness, and solve the resulting operator law.
No matrix NormedRing, inverse-derivative assumption, intrinsic tangent identification,
representation manifold differential or smooth group structure is introduced.
Candidate until complete strict source compilation and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

private abbrev M := GammaMatrix
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev U : Set Q := gamma16CayleySource

/-- Actual left matrix multiplication, continuously bundled by finite dimensionality. -/
noncomputable def gamma16MatrixLeftMulCLM (a : M) : M →L[ℝ] M :=
  { toLinearMap := Algebra.lmul ℝ M a
    cont := (Algebra.lmul ℝ M a).continuous_of_finiteDimensional }

/-- The original matrix product as a continuous bilinear map, without changing its norm. -/
noncomputable def gamma16MatrixMulCLM : M →L[ℝ] M →L[ℝ] M := by
  let L : M →ₗ[ℝ] (M →L[ℝ] M) :=
    { toFun := gamma16MatrixLeftMulCLM
      map_add' := by
        intro a b
        apply ContinuousLinearMap.ext
        intro x
        change (a + b) * x = a * x + b * x
        exact add_mul a b x
      map_smul' := by
        intro c a
        apply ContinuousLinearMap.ext
        intro x
        change (c • a) * x = (RingHom.id ℝ) c • (a * x)
        rw [RingHom.id_apply, smul_mul_assoc] }
  exact { toLinearMap := L, cont := L.continuous_of_finiteDimensional }

theorem gamma16MatrixMulCLM_apply (a b : M) : gamma16MatrixMulCLM a b = a * b := rfl

/-- At two identity-valued maps, the actual matrix-product derivative is the sum of derivatives. -/
theorem gamma16MatrixProduct_hasFDerivAt_one
    (f g : Q → M) (F G : Q →L[ℝ] M)
    (hf : HasFDerivAt f F 0) (hg : HasFDerivAt g G 0)
    (hf0 : f 0 = 1) (hg0 : g 0 = 1) :
    HasFDerivAt (fun c : Q => f c * g c) (F + G) 0 := by
  have hbil : HasFDerivAt (fun p : M × M => gamma16MatrixMulCLM p.1 p.2)
      (gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0)) (f 0, g 0) :=
    gamma16MatrixMulCLM.isBoundedBilinearMap.hasFDerivAt (f 0, g 0)
  have hfun : (fun p : M × M => gamma16MatrixMulCLM p.1 p.2) =
      (fun p : M × M => p.1 * p.2) := by
    funext p
    exact gamma16MatrixMulCLM_apply p.1 p.2
  have hmul : HasFDerivAt (fun p : M × M => p.1 * p.2)
      (gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0)) (f 0, g 0) :=
    Eq.mp (congrArg (fun b : M × M → M => HasFDerivAt b
      (gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0)) (f 0, g 0)) hfun) hbil
  have hpair : HasFDerivAt (fun c : Q => (f c, g c)) (F.prod G) 0 := hf.prodMk hg
  have hprod : HasFDerivAt (fun c : Q => f c * g c)
      ((gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0)).comp (F.prod G)) 0 :=
    hmul.comp 0 hpair
  have hoperator :
      (gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0)).comp (F.prod G) = F + G := by
    apply ContinuousLinearMap.ext
    intro v
    change gamma16MatrixMulCLM.isBoundedBilinearMap.deriv (f 0, g 0) (F v, G v) = F v + G v
    rw [IsBoundedBilinearMap.deriv_apply]
    simp only [gamma16MatrixMulCLM_apply]
    rw [hf0, hg0, Matrix.one_mul, Matrix.mul_one, add_comm]
  exact Eq.mp (congrArg (fun L : Q →L[ℝ] M =>
    HasFDerivAt (fun c : Q => f c * g c) L 0) hoperator) hprod

/-- Exact original Cayley denominator identity on the original accepted source U. -/
theorem gamma16CayleyMatrix_mul_denominator (c : Q) (hc : c ∈ U) :
    gamma16CayleyMatrix c * (1 - A c) = 1 + A c := by
  have hd : IsUnit (1 - A c).det := isUnit_iff_ne_zero.mpr hc
  change ((1 + A c) * (1 - A c)⁻¹) * (1 - A c) = 1 + A c
  rw [Matrix.mul_assoc, Matrix.nonsing_inv_mul _ hd, Matrix.mul_one]

/-- The full original-matrix forward derivative, with its exact factor of two. -/
theorem gamma16CayleyMatrix_fderiv_zero :
    fderiv ℝ gamma16CayleyMatrix 0 = (2 : ℝ) • A := by
  have hC : HasFDerivAt gamma16CayleyMatrix (fderiv ℝ gamma16CayleyMatrix 0) 0 :=
    ((gamma16CayleyMatrix_contDiffAt (1 : ℕ∞ω) 0 gamma16CayleySource_zero).differentiableAt
      one_ne_zero).hasFDerivAt
  have hd : HasFDerivAt (fun c : Q => 1 - A c) (-A) 0 := A.hasFDerivAt.const_sub 1
  have hd0 : (fun c : Q => 1 - A c) 0 = 1 := by simp only [map_zero, sub_zero]
  have hp : HasFDerivAt (fun c : Q => gamma16CayleyMatrix c * (1 - A c))
      (fderiv ℝ gamma16CayleyMatrix 0 + -A) 0 :=
    gamma16MatrixProduct_hasFDerivAt_one gamma16CayleyMatrix (fun c : Q => 1 - A c)
      (fderiv ℝ gamma16CayleyMatrix 0) (-A) hC hd gamma16CayleyMatrix_zero hd0
  have hevent : (fun c : Q => 1 + A c) =ᶠ[𝓝 (0 : Q)]
      (fun c : Q => gamma16CayleyMatrix c * (1 - A c)) :=
    (gamma16CayleySource_isOpen.mem_nhds gamma16CayleySource_zero).mono
      (fun c hc => (gamma16CayleyMatrix_mul_denominator c hc).symm)
  have hpos : HasFDerivAt (fun c : Q => 1 + A c) A 0 := A.hasFDerivAt.const_add 1
  have heq : fderiv ℝ gamma16CayleyMatrix 0 - A = A := by
    simpa only [sub_eq_add_neg] using (hp.congr_of_eventuallyEq hevent).unique hpos
  calc
    fderiv ℝ gamma16CayleyMatrix 0 = A + A := (sub_eq_iff_eq_add).mp heq
    _ = (2 : ℝ) • A := (two_smul ℝ A).symm

theorem gamma16CayleyMatrix_hasFDerivAt_zero :
    HasFDerivAt gamma16CayleyMatrix ((2 : ℝ) • A) 0 := by
  have hC : HasFDerivAt gamma16CayleyMatrix (fderiv ℝ gamma16CayleyMatrix 0) 0 :=
    ((gamma16CayleyMatrix_contDiffAt (1 : ℕ∞ω) 0 gamma16CayleySource_zero).differentiableAt
      one_ne_zero).hasFDerivAt
  exact Eq.mp (congrArg (fun L : Q →L[ℝ] M => HasFDerivAt gamma16CayleyMatrix L 0)
    gamma16CayleyMatrix_fderiv_zero) hC

theorem gamma16CayleyMatrix_hasStrictFDerivAt_zero :
    HasStrictFDerivAt gamma16CayleyMatrix ((2 : ℝ) • A) 0 :=
  (gamma16CayleyMatrix_contDiffAt (1 : ℕ∞ω) 0 gamma16CayleySource_zero).hasStrictFDerivAt'
    gamma16CayleyMatrix_hasFDerivAt_zero one_ne_zero

theorem gamma16CayleyMatrix_fderiv_zero_apply (v : Q) :
    (fderiv ℝ gamma16CayleyMatrix 0) v = (2 : ℝ) • gamma16StrictPlaneAmbientCLM v :=
  congrArg (fun L : Q →L[ℝ] M => L v) gamma16CayleyMatrix_fderiv_zero

/-- Every original increasing upper entry has derivative twice its own input coordinate. -/
theorem gamma16CayleyMatrix_fderiv_zero_upper (v : Q) (p : gamma16StrictPlaneIndex) :
    (fderiv ℝ gamma16CayleyMatrix 0) v p.val.1 p.val.2 = (2 : ℝ) * v p := by
  have he : gamma16StrictPlaneAmbientCLM v p.val.1 p.val.2 = v p := by
    rw [gamma16StrictPlaneAmbientCLM_apply]
    simp only [gamma16StrictPlaneMatrix, dite_eq_left p.property]
  rw [gamma16CayleyMatrix_fderiv_zero_apply]
  change (2 : ℝ) * gamma16StrictPlaneAmbientCLM v p.val.1 p.val.2 = (2 : ℝ) * v p
  exact congrArg (fun a : ℝ => 2 * a) he

/-- The actual ambient forward derivative is injective on all original 120 coordinates. -/
theorem gamma16CayleyMatrix_fderiv_zero_injective :
    Function.Injective (fderiv ℝ gamma16CayleyMatrix (0 : Q)) := by
  intro v w hvw
  apply gamma16CayleyModel_injective
  have hscaled : (2 : ℝ) • A v = (2 : ℝ) • A w :=
    (gamma16CayleyMatrix_fderiv_zero_apply v).symm.trans
      (hvw.trans (gamma16CayleyMatrix_fderiv_zero_apply w))
  have h := congrArg (fun X : M => (1 / 2 : ℝ) • X) hscaled
  have hcancel : (1 / 2 : ℝ) * 2 = 1 := by norm_num
  simpa only [smul_smul, hcancel, one_smul] using h

#print axioms gamma16MatrixLeftMulCLM
#print axioms gamma16MatrixMulCLM
#print axioms gamma16MatrixMulCLM_apply
#print axioms gamma16MatrixProduct_hasFDerivAt_one
#print axioms gamma16CayleyMatrix_mul_denominator
#print axioms gamma16CayleyMatrix_fderiv_zero
#print axioms gamma16CayleyMatrix_hasFDerivAt_zero
#print axioms gamma16CayleyMatrix_hasStrictFDerivAt_zero
#print axioms gamma16CayleyMatrix_fderiv_zero_apply
#print axioms gamma16CayleyMatrix_fderiv_zero_upper
#print axioms gamma16CayleyMatrix_fderiv_zero_injective
end
end FCP.BFSSPairedSpin9Clifford
