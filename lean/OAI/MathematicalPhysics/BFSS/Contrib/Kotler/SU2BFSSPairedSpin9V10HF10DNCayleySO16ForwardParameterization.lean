import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DMNativeSO16ContinuousModel
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Topology.Instances.Matrix
import Mathlib.Tactic.NoncommRing

/-! F10DN: a continuous actual SO(16)-valued Cayley parameterization on an explicit open domain.
Use (1+A)*(1-A)⁻¹ in the original GammaMatrix, where A is the accepted native skew model.
The determinant domain is proved open and contains zero. No subgroup atlas, inverse chart,
smoothness, intrinsic tangent identification or Cayley derivative normalization is asserted.
Candidate until complete strict source compilation and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology Matrix.Norms.Elementwise

private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev M := GammaMatrix
private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev numerator (c : Q) : M := 1 + A c
private abbrev denominator (c : Q) : M := 1 - A c

/-- Exact determinant domain of the actual original-matrix Cayley formula. -/
noncomputable def gamma16CayleySource : Set Q := {c | (denominator c).det ≠ 0}

/-- Actual matrix formula, with geometric claims restricted to the explicit source. -/
noncomputable def gamma16CayleyMatrix (c : Q) : M := numerator c * (denominator c)⁻¹

theorem gamma16CayleyModel_transpose (c : Q) : (A c).transpose = -A c := by
  change (gamma16StrictPlaneAmbientCLM c).transpose = -gamma16StrictPlaneAmbientCLM c
  rw [gamma16StrictPlaneAmbientCLM_apply]
  exact gamma16StrictPlaneMatrix_transpose c

theorem gamma16CayleyDenominator_transpose (c : Q) :
    (denominator c).transpose = numerator c := by
  change (1 - A c).transpose = 1 + A c
  rw [Matrix.transpose_sub, Matrix.transpose_one, gamma16CayleyModel_transpose, sub_neg_eq_add]

theorem gamma16CayleyNumerator_transpose (c : Q) :
    (numerator c).transpose = denominator c := by
  change (1 + A c).transpose = 1 - A c
  rw [Matrix.transpose_add, Matrix.transpose_one, gamma16CayleyModel_transpose, sub_eq_add_neg]

theorem gamma16CayleyNumerator_det (c : Q) : (numerator c).det = (denominator c).det := by
  have h := congrArg (fun B : M => B.det) (gamma16CayleyDenominator_transpose c)
  exact h.symm.trans (Matrix.det_transpose (denominator c))

theorem gamma16CayleySource_isOpen : IsOpen gamma16CayleySource := by
  have h : Continuous (fun c : Q => (denominator c).det) :=
    (continuous_const.sub A.continuous).matrix_det
  change IsOpen ((fun c : Q => (denominator c).det) ⁻¹' (({0} : Set ℝ)ᶜ))
  exact isClosed_singleton.isOpen_compl.preimage h

theorem gamma16CayleySource_zero : (0 : Q) ∈ gamma16CayleySource := by
  simp [gamma16CayleySource, denominator]

theorem gamma16CayleyMatrix_zero : gamma16CayleyMatrix (0 : Q) = 1 := by
  simp [gamma16CayleyMatrix, numerator, denominator]

/-- Orthogonality is proved on the actual determinant domain, with both inverse conditions discharged. -/
theorem gamma16CayleyMatrix_orthogonal (c : Q) (hc : c ∈ gamma16CayleySource) :
    (gamma16CayleyMatrix c).transpose * gamma16CayleyMatrix c = 1 := by
  have hd : IsUnit (denominator c).det := isUnit_iff_ne_zero.mpr hc
  have hn : IsUnit (numerator c).det := (gamma16CayleyNumerator_det c).symm ▸ hd
  have hcomm : denominator c * numerator c = numerator c * denominator c := by
    dsimp [denominator, numerator]
    noncomm_ring
  change (numerator c * (denominator c)⁻¹).transpose *
    (numerator c * (denominator c)⁻¹) = 1
  rw [Matrix.transpose_mul, Matrix.transpose_nonsing_inv,
    gamma16CayleyDenominator_transpose, gamma16CayleyNumerator_transpose]
  calc
    ((numerator c)⁻¹ * denominator c) * (numerator c * (denominator c)⁻¹) =
        (numerator c)⁻¹ * (denominator c * numerator c) * (denominator c)⁻¹ := by
      simp only [Matrix.mul_assoc]
    _ = (numerator c)⁻¹ * (numerator c * denominator c) * (denominator c)⁻¹ := by rw [hcomm]
    _ = ((numerator c)⁻¹ * numerator c) * (denominator c * (denominator c)⁻¹) := by
      simp only [Matrix.mul_assoc]
    _ = 1 := by rw [Matrix.nonsing_inv_mul _ hn, Matrix.mul_nonsing_inv _ hd, Matrix.one_mul]

theorem gamma16CayleyMatrix_det (c : Q) (hc : c ∈ gamma16CayleySource) :
    (gamma16CayleyMatrix c).det = 1 := by
  have hd : IsUnit (denominator c).det := isUnit_iff_ne_zero.mpr hc
  calc
    (gamma16CayleyMatrix c).det = (numerator c).det * ((denominator c)⁻¹).det :=
      Matrix.det_mul _ _
    _ = (denominator c).det * ((denominator c)⁻¹).det :=
      congrArg (fun r : ℝ => r * ((denominator c)⁻¹).det) (gamma16CayleyNumerator_det c)
    _ = (denominator c * (denominator c)⁻¹).det := (Matrix.det_mul _ _).symm
    _ = 1 := by rw [Matrix.mul_nonsing_inv _ hd, Matrix.det_one]

theorem gamma16CayleyMatrix_mem_so (c : Q) (hc : c ∈ gamma16CayleySource) :
    gamma16CayleyMatrix c ∈ Matrix.specialOrthogonalGroup SpinIndex ℝ := by
  rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff']
  exact ⟨gamma16CayleyMatrix_orthogonal c hc, gamma16CayleyMatrix_det c hc⟩

/-- Actual group-valued map from the proved open source, without a homomorphism claim. -/
noncomputable def gamma16CayleySO : gamma16CayleySource → Matrix.specialOrthogonalGroup SpinIndex ℝ :=
  fun c => ⟨gamma16CayleyMatrix c.val, gamma16CayleyMatrix_mem_so c.val c.property⟩

theorem gamma16CayleySO_apply (c : gamma16CayleySource) :
    (gamma16CayleySO c : M) = gamma16CayleyMatrix c.val := rfl

theorem gamma16CayleySO_continuous : Continuous gamma16CayleySO := by
  have h : Continuous (fun c : gamma16CayleySource => gamma16CayleyMatrix c.val) := by
    apply continuous_iff_continuousAt.mpr
    intro c
    have ha : ContinuousAt (fun u : gamma16CayleySource => A u.val) c :=
      (A.continuous.comp continuous_subtype_val).continuousAt
    have hd : ContinuousAt (fun u : gamma16CayleySource => denominator u.val) c :=
      continuous_const.continuousAt.sub ha
    have hs : ContinuousAt (Ring.inverse : ℝ → ℝ) (denominator c.val).det := by
      rw [Ring.inverse_eq_inv']
      exact continuousAt_inv₀ c.property
    have hi : ContinuousAt (fun u : gamma16CayleySource => (denominator u.val)⁻¹) c :=
      (continuousAt_matrix_inv (denominator c.val) hs).comp
        (f := fun u : gamma16CayleySource => denominator u.val) (x := c) hd
    exact (continuous_const.continuousAt.add ha).mul hi
  exact h.subtype_mk (fun c : gamma16CayleySource => gamma16CayleyMatrix_mem_so c.val c.property)

#print axioms gamma16CayleySource
#print axioms gamma16CayleyMatrix
#print axioms gamma16CayleyModel_transpose
#print axioms gamma16CayleyDenominator_transpose
#print axioms gamma16CayleyNumerator_transpose
#print axioms gamma16CayleyNumerator_det
#print axioms gamma16CayleySource_isOpen
#print axioms gamma16CayleySource_zero
#print axioms gamma16CayleyMatrix_zero
#print axioms gamma16CayleyMatrix_orthogonal
#print axioms gamma16CayleyMatrix_det
#print axioms gamma16CayleyMatrix_mem_so
#print axioms gamma16CayleySO
#print axioms gamma16CayleySO_apply
#print axioms gamma16CayleySO_continuous
end
end FCP.BFSSPairedSpin9Clifford
