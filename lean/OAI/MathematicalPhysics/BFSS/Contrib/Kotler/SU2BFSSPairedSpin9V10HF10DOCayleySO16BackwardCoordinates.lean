import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DNCayleySO16ForwardParameterization
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Topology.Instances.Matrix
import Mathlib.Tactic.NoncommRing

/-! F10DO: continuous backward Cayley coordinates on an explicit open subset of actual SO(16).
Prove (R-1)*(R+1)⁻¹ is native skew when det(R+1) is nonzero, then use the accepted
120-coordinate continuous model inverse. No two-sided Cayley inverse law, source/image
identification, LocalHomeomorph, subgroup atlas, smoothness or derivative is asserted.
Candidate until complete strict source and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance f10doNativeSkewIsTopologicalAddGroup :
    IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))
local instance f10doNativeSkewContinuousSMul :
    ContinuousSMul ℝ (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (ContinuousSMul ℝ
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))

private abbrev M := GammaMatrix
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev S16 := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev rMatrix (r : SO) : M := r.val
private abbrev numerator (r : SO) : M := rMatrix r - 1
private abbrev denominator (r : SO) : M := rMatrix r + 1

noncomputable def gamma16CayleyTarget : Set SO := {r | (denominator r).det ≠ 0}

noncomputable def gamma16CayleyBackwardMatrix (r : SO) : M :=
  numerator r * (denominator r)⁻¹

theorem gamma16CayleyTarget_isOpen : IsOpen gamma16CayleyTarget := by
  have hr : Continuous (Subtype.val : SO → M) := continuous_subtype_val
  have h : Continuous (fun r : SO => (denominator r).det) :=
    (hr.add continuous_const).matrix_det
  change IsOpen ((fun r : SO => (denominator r).det) ⁻¹' (({0} : Set ℝ)ᶜ))
  exact isClosed_singleton.isOpen_compl.preimage h

theorem gamma16CayleyTarget_one : (1 : SO) ∈ gamma16CayleyTarget := by
  change (1 + 1 : M).det ≠ 0
  have h2 : (1 + 1 : M) = (2 : ℝ) • (1 : M) := by rw [two_smul]
  rw [h2, Matrix.det_smul, Matrix.det_one, mul_one]
  exact pow_ne_zero _ (by norm_num)

theorem gamma16CayleyBackwardMatrix_one : gamma16CayleyBackwardMatrix (1 : SO) = 0 := by
  simp [gamma16CayleyBackwardMatrix, numerator, rMatrix]

theorem gamma16CayleyTarget_orthogonal (r : SO) :
    (rMatrix r).transpose * rMatrix r = 1 := by
  have h : rMatrix r ∈ Matrix.orthogonalGroup SpinIndex ℝ :=
    (Matrix.mem_specialOrthogonalGroup_iff.mp r.property).1
  exact Matrix.mem_orthogonalGroup_iff'.mp h

/-- The literal backward matrix is skew; both cancellation conditions come from the target domain. -/
theorem gamma16CayleyBackwardMatrix_transpose
    (r : SO) (hr : r ∈ gamma16CayleyTarget) :
    (gamma16CayleyBackwardMatrix r).transpose = -gamma16CayleyBackwardMatrix r := by
  have hd : IsUnit (denominator r).det := isUnit_iff_ne_zero.mpr hr
  have hdt : IsUnit (denominator r).transpose.det := Matrix.isUnit_det_transpose _ hd
  have horth : (rMatrix r).transpose * rMatrix r = 1 := gamma16CayleyTarget_orthogonal r
  have hleft : (denominator r).transpose *
      ((gamma16CayleyBackwardMatrix r).transpose * denominator r) =
        (numerator r).transpose * denominator r := by
    change (denominator r).transpose *
      ((numerator r * (denominator r)⁻¹).transpose * denominator r) =
        (numerator r).transpose * denominator r
    rw [Matrix.transpose_mul, Matrix.transpose_nonsing_inv]
    calc
      (denominator r).transpose *
          ((((denominator r).transpose)⁻¹ * (numerator r).transpose) * denominator r) =
          ((denominator r).transpose * ((denominator r).transpose)⁻¹) *
            ((numerator r).transpose * denominator r) := by simp only [Matrix.mul_assoc]
      _ = (numerator r).transpose * denominator r := by
        rw [Matrix.mul_nonsing_inv _ hdt, Matrix.one_mul]
  have hright : (denominator r).transpose *
      ((-gamma16CayleyBackwardMatrix r) * denominator r) =
        -((denominator r).transpose * numerator r) := by
    change (denominator r).transpose *
      ((-(numerator r * (denominator r)⁻¹)) * denominator r) =
        -((denominator r).transpose * numerator r)
    calc
      (denominator r).transpose * ((-(numerator r * (denominator r)⁻¹)) * denominator r) =
          -((denominator r).transpose * ((numerator r * (denominator r)⁻¹) * denominator r)) := by
        rw [neg_mul, mul_neg]
      _ = -((denominator r).transpose * (numerator r * ((denominator r)⁻¹ * denominator r))) := by
        rw [Matrix.mul_assoc]
      _ = -((denominator r).transpose * numerator r) := by
        rw [Matrix.nonsing_inv_mul _ hd, Matrix.mul_one]
  have hpoly : (numerator r).transpose * denominator r =
      -((denominator r).transpose * numerator r) := by
    change (rMatrix r - 1).transpose * (rMatrix r + 1) =
      -((rMatrix r + 1).transpose * (rMatrix r - 1))
    simp only [Matrix.transpose_sub, Matrix.transpose_add, Matrix.transpose_one]
    calc
      ((rMatrix r).transpose - 1) * (rMatrix r + 1) =
          ((rMatrix r).transpose * rMatrix r - 1) +
            ((rMatrix r).transpose * rMatrix r - 1) -
              (((rMatrix r).transpose + 1) * (rMatrix r - 1)) := by noncomm_ring
      _ = -(((rMatrix r).transpose + 1) * (rMatrix r - 1)) := by
        simp only [horth, sub_self, zero_add, zero_sub]
  apply Matrix.mul_left_injective_of_inv (denominator r) (denominator r)⁻¹
    (Matrix.mul_nonsing_inv _ hd)
  apply Matrix.mul_right_injective_of_inv ((denominator r).transpose)⁻¹
    (denominator r).transpose (Matrix.nonsing_inv_mul _ hdt)
  exact hleft.trans (hpoly.trans hright.symm)

theorem gamma16CayleyBackwardMatrix_mem_so (r : SO) (hr : r ∈ gamma16CayleyTarget) :
    gamma16CayleyBackwardMatrix r ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ := by
  rw [LieAlgebra.Orthogonal.mem_so]
  exact gamma16CayleyBackwardMatrix_transpose r hr

noncomputable def gamma16CayleyBackwardSkew : gamma16CayleyTarget → S16 :=
  fun r => ⟨gamma16CayleyBackwardMatrix r.val, gamma16CayleyBackwardMatrix_mem_so r.val r.property⟩

theorem gamma16CayleyBackwardSkew_apply (r : gamma16CayleyTarget) :
    (gamma16CayleyBackwardSkew r : M) = gamma16CayleyBackwardMatrix r.val := rfl

theorem gamma16CayleyBackwardMatrix_continuous :
    Continuous (fun r : gamma16CayleyTarget => gamma16CayleyBackwardMatrix r.val) := by
  have hso : Continuous (Subtype.val : SO → M) := continuous_subtype_val
  have hv : Continuous (Subtype.val : gamma16CayleyTarget → SO) := continuous_subtype_val
  apply continuous_iff_continuousAt.mpr
  intro r
  have hm : ContinuousAt (fun u : gamma16CayleyTarget => rMatrix u.val) r :=
    (hso.comp hv).continuousAt
  have hd : ContinuousAt (fun u : gamma16CayleyTarget => denominator u.val) r :=
    hm.add continuous_const.continuousAt
  have hs : ContinuousAt (Ring.inverse : ℝ → ℝ) (denominator r.val).det := by
    rw [Ring.inverse_eq_inv']
    exact continuousAt_inv₀ r.property
  have hi : ContinuousAt (fun u : gamma16CayleyTarget => (denominator u.val)⁻¹) r :=
    (continuousAt_matrix_inv (denominator r.val) hs).comp
      (f := fun u : gamma16CayleyTarget => denominator u.val) (x := r) hd
  exact (hm.sub continuous_const.continuousAt).mul hi

theorem gamma16CayleyBackwardSkew_continuous : Continuous gamma16CayleyBackwardSkew :=
  gamma16CayleyBackwardMatrix_continuous.subtype_mk
    (fun r : gamma16CayleyTarget => gamma16CayleyBackwardMatrix_mem_so r.val r.property)

noncomputable def gamma16CayleyBackwardCoordinates (r : gamma16CayleyTarget) : Q :=
  gamma16StrictPlaneModelContinuousEquiv.symm (gamma16CayleyBackwardSkew r)

theorem gamma16CayleyBackwardCoordinates_apply
    (r : gamma16CayleyTarget) (p : gamma16StrictPlaneIndex) :
    gamma16CayleyBackwardCoordinates r p = gamma16CayleyBackwardMatrix r.val p.val.1 p.val.2 := rfl

theorem gamma16CayleyBackwardCoordinates_reconstruct (r : gamma16CayleyTarget) :
    gamma16StrictPlaneAmbientCLM (gamma16CayleyBackwardCoordinates r) =
      gamma16CayleyBackwardMatrix r.val := by
  have h : gamma16StrictPlaneModelContinuousEquiv
      (gamma16StrictPlaneModelContinuousEquiv.symm (gamma16CayleyBackwardSkew r)) =
        gamma16CayleyBackwardSkew r :=
    gamma16StrictPlaneModelContinuousEquiv.apply_symm_apply (gamma16CayleyBackwardSkew r)
  exact congrArg (fun B : S16 => (B : M)) h

theorem gamma16CayleyBackwardCoordinates_continuous : Continuous gamma16CayleyBackwardCoordinates := by
  have h : Continuous (gamma16StrictPlaneModelContinuousEquiv.symm : S16 → Q) :=
    gamma16StrictPlaneModelContinuousEquiv.symm.continuous
  exact h.comp gamma16CayleyBackwardSkew_continuous

theorem gamma16CayleyBackwardCoordinates_one :
    gamma16CayleyBackwardCoordinates ⟨1, gamma16CayleyTarget_one⟩ = 0 := by
  funext p
  calc
    gamma16CayleyBackwardCoordinates ⟨1, gamma16CayleyTarget_one⟩ p =
        gamma16CayleyBackwardMatrix (1 : SO) p.val.1 p.val.2 :=
      gamma16CayleyBackwardCoordinates_apply _ p
    _ = 0 := congrArg (fun B : M => B p.val.1 p.val.2) gamma16CayleyBackwardMatrix_one

#print axioms gamma16CayleyTarget
#print axioms gamma16CayleyBackwardMatrix
#print axioms gamma16CayleyTarget_isOpen
#print axioms gamma16CayleyTarget_one
#print axioms gamma16CayleyBackwardMatrix_one
#print axioms gamma16CayleyTarget_orthogonal
#print axioms gamma16CayleyBackwardMatrix_transpose
#print axioms gamma16CayleyBackwardMatrix_mem_so
#print axioms gamma16CayleyBackwardSkew
#print axioms gamma16CayleyBackwardSkew_apply
#print axioms gamma16CayleyBackwardMatrix_continuous
#print axioms gamma16CayleyBackwardSkew_continuous
#print axioms gamma16CayleyBackwardCoordinates
#print axioms gamma16CayleyBackwardCoordinates_apply
#print axioms gamma16CayleyBackwardCoordinates_reconstruct
#print axioms gamma16CayleyBackwardCoordinates_continuous
#print axioms gamma16CayleyBackwardCoordinates_one
end
end FCP.BFSSPairedSpin9Clifford
