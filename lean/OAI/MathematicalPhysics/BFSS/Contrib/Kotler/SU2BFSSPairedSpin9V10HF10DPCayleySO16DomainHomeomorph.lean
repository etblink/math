import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DOCayleySO16BackwardCoordinates
import Mathlib.Topology.Homeomorph.Defs
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Tactic.NoncommRing

/-! F10DP: exact domain matching and two-sided Cayley inverse laws on the original open subtypes.
Bundle the accepted continuous forward/backward maps into a homeomorphism U ≃ₜ V.
This does not install an ambient partial homeomorphism, translated subgroup atlas, smoothness,
derivative normalization, intrinsic tangent identification or source Lie-group structure.
Candidate until strict compilation and complete independent audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance f10dpNativeSkewIsTopologicalAddGroup :
    IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))
local instance f10dpNativeSkewContinuousSMul :
    ContinuousSMul ℝ (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (ContinuousSMul ℝ
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))

private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev M := GammaMatrix
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev S16 := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev U := gamma16CayleySource
private abbrev V := gamma16CayleyTarget
private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev C : Q → M := gamma16CayleyMatrix
private abbrev B : SO → M := gamma16CayleyBackwardMatrix
private abbrev forwardDen (c : Q) : M := 1 - A c
private abbrev backwardDen (r : SO) : M := (r : M) + 1

theorem gamma16CayleyModel_injective : Function.Injective A := by
  intro c d h
  have e : Q ≃L[ℝ] S16 := gamma16StrictPlaneModelContinuousEquiv
  apply e.injective
  apply Subtype.ext
  exact h

theorem gamma16CayleyTwo_det_ne_zero : (1 + 1 : M).det ≠ 0 := gamma16CayleyTarget_one

theorem gamma16CayleyForward_add_one (c : U) :
    C c.val + 1 = (1 + 1 : M) * (forwardDen c.val)⁻¹ := by
  have hd : IsUnit (forwardDen c.val).det := isUnit_iff_ne_zero.mpr c.property
  have hn : (1 + A c.val) + forwardDen c.val = (1 + 1 : M) := by
    dsimp [forwardDen]
    noncomm_ring
  calc
    C c.val + 1 = (1 + A c.val) * (forwardDen c.val)⁻¹ +
        forwardDen c.val * (forwardDen c.val)⁻¹ :=
      congrArg (fun X : M => C c.val + X) (Matrix.mul_nonsing_inv _ hd).symm
    _ = ((1 + A c.val) + forwardDen c.val) * (forwardDen c.val)⁻¹ :=
      (add_mul _ _ _).symm
    _ = (1 + 1 : M) * (forwardDen c.val)⁻¹ :=
      congrArg (fun X : M => X * (forwardDen c.val)⁻¹) hn

theorem gamma16CayleyForward_sub_one (c : U) :
    C c.val - 1 = ((1 + 1 : M) * A c.val) * (forwardDen c.val)⁻¹ := by
  have hd : IsUnit (forwardDen c.val).det := isUnit_iff_ne_zero.mpr c.property
  have hn : (1 + A c.val) - forwardDen c.val = (1 + 1 : M) * A c.val := by
    dsimp [forwardDen]
    noncomm_ring
  calc
    C c.val - 1 = (1 + A c.val) * (forwardDen c.val)⁻¹ -
        forwardDen c.val * (forwardDen c.val)⁻¹ :=
      congrArg (fun X : M => C c.val - X) (Matrix.mul_nonsing_inv _ hd).symm
    _ = ((1 + A c.val) - forwardDen c.val) * (forwardDen c.val)⁻¹ :=
      (sub_mul _ _ _).symm
    _ = ((1 + 1 : M) * A c.val) * (forwardDen c.val)⁻¹ :=
      congrArg (fun X : M => X * (forwardDen c.val)⁻¹) hn

theorem gamma16CayleyForward_add_one_det_ne_zero (c : U) : (C c.val + 1).det ≠ 0 := by
  have hd : IsUnit (forwardDen c.val).det := isUnit_iff_ne_zero.mpr c.property
  have hm : (C c.val + 1) * forwardDen c.val = (1 + 1 : M) := by
    calc
      (C c.val + 1) * forwardDen c.val =
          ((1 + 1 : M) * (forwardDen c.val)⁻¹) * forwardDen c.val :=
        congrArg (fun X : M => X * forwardDen c.val) (gamma16CayleyForward_add_one c)
      _ = (1 + 1 : M) * ((forwardDen c.val)⁻¹ * forwardDen c.val) := by rw [Matrix.mul_assoc]
      _ = (1 + 1 : M) := by rw [Matrix.nonsing_inv_mul _ hd, Matrix.mul_one]
  have hdet : (C c.val + 1).det * (forwardDen c.val).det = (1 + 1 : M).det :=
    (Matrix.det_mul _ _).symm.trans (congrArg (fun X : M => X.det) hm)
  intro hz
  apply gamma16CayleyTwo_det_ne_zero
  exact hdet.symm.trans (by rw [hz, zero_mul])

theorem gamma16CayleyForward_mem_target (c : U) : gamma16CayleySO c ∈ V := by
  change ((gamma16CayleySO c : M) + 1).det ≠ 0
  rw [gamma16CayleySO_apply]
  exact gamma16CayleyForward_add_one_det_ne_zero c

noncomputable def gamma16CayleyForwardTarget (c : U) : V :=
  ⟨gamma16CayleySO c, gamma16CayleyForward_mem_target c⟩

theorem gamma16CayleyBackwardMatrix_forward (c : U) : B (gamma16CayleySO c) = A c.val := by
  have ht : IsUnit (C c.val + 1).det :=
    isUnit_iff_ne_zero.mpr (gamma16CayleyForward_add_one_det_ne_zero c)
  have hcross : A c.val * (C c.val + 1) = C c.val - 1 := by
    rw [gamma16CayleyForward_add_one c, gamma16CayleyForward_sub_one c]
    noncomm_ring
  calc
    B (gamma16CayleySO c) = (C c.val - 1) * (C c.val + 1)⁻¹ :=
      congrArg (fun R : M => (R - 1) * (R + 1)⁻¹) (gamma16CayleySO_apply c)
    _ = (A c.val * (C c.val + 1)) * (C c.val + 1)⁻¹ :=
      congrArg (fun X : M => X * (C c.val + 1)⁻¹) hcross.symm
    _ = A c.val := by rw [Matrix.mul_assoc, Matrix.mul_nonsing_inv _ ht, Matrix.mul_one]

theorem gamma16CayleyBackwardCoordinates_forward (c : U) :
    gamma16CayleyBackwardCoordinates (gamma16CayleyForwardTarget c) = c.val := by
  apply gamma16CayleyModel_injective
  exact (gamma16CayleyBackwardCoordinates_reconstruct (gamma16CayleyForwardTarget c)).trans
    (gamma16CayleyBackwardMatrix_forward c)

theorem gamma16CayleyBackward_one_sub (r : V) :
    1 - B r.val = (1 + 1 : M) * (backwardDen r.val)⁻¹ := by
  have hd : IsUnit (backwardDen r.val).det := isUnit_iff_ne_zero.mpr r.property
  have hn : backwardDen r.val - ((r.val : M) - 1) = (1 + 1 : M) := by
    dsimp [backwardDen]
    noncomm_ring
  calc
    1 - B r.val = backwardDen r.val * (backwardDen r.val)⁻¹ -
        ((r.val : M) - 1) * (backwardDen r.val)⁻¹ :=
      congrArg (fun X : M => X - B r.val) (Matrix.mul_nonsing_inv _ hd).symm
    _ = (backwardDen r.val - ((r.val : M) - 1)) * (backwardDen r.val)⁻¹ :=
      (sub_mul _ _ _).symm
    _ = (1 + 1 : M) * (backwardDen r.val)⁻¹ :=
      congrArg (fun X : M => X * (backwardDen r.val)⁻¹) hn

theorem gamma16CayleyBackward_one_add (r : V) :
    1 + B r.val = ((1 + 1 : M) * (r.val : M)) * (backwardDen r.val)⁻¹ := by
  have hd : IsUnit (backwardDen r.val).det := isUnit_iff_ne_zero.mpr r.property
  have hn : backwardDen r.val + ((r.val : M) - 1) = (1 + 1 : M) * (r.val : M) := by
    dsimp [backwardDen]
    noncomm_ring
  calc
    1 + B r.val = backwardDen r.val * (backwardDen r.val)⁻¹ +
        ((r.val : M) - 1) * (backwardDen r.val)⁻¹ :=
      congrArg (fun X : M => X + B r.val) (Matrix.mul_nonsing_inv _ hd).symm
    _ = (backwardDen r.val + ((r.val : M) - 1)) * (backwardDen r.val)⁻¹ :=
      (add_mul _ _ _).symm
    _ = ((1 + 1 : M) * (r.val : M)) * (backwardDen r.val)⁻¹ :=
      congrArg (fun X : M => X * (backwardDen r.val)⁻¹) hn

theorem gamma16CayleyBackward_one_sub_det_ne_zero (r : V) : (1 - B r.val).det ≠ 0 := by
  have hd : IsUnit (backwardDen r.val).det := isUnit_iff_ne_zero.mpr r.property
  have hm : (1 - B r.val) * backwardDen r.val = (1 + 1 : M) := by
    calc
      (1 - B r.val) * backwardDen r.val =
          ((1 + 1 : M) * (backwardDen r.val)⁻¹) * backwardDen r.val :=
        congrArg (fun X : M => X * backwardDen r.val) (gamma16CayleyBackward_one_sub r)
      _ = (1 + 1 : M) * ((backwardDen r.val)⁻¹ * backwardDen r.val) := by rw [Matrix.mul_assoc]
      _ = (1 + 1 : M) := by rw [Matrix.nonsing_inv_mul _ hd, Matrix.mul_one]
  have hdet : (1 - B r.val).det * (backwardDen r.val).det = (1 + 1 : M).det :=
    (Matrix.det_mul _ _).symm.trans (congrArg (fun X : M => X.det) hm)
  intro hz
  apply gamma16CayleyTwo_det_ne_zero
  exact hdet.symm.trans (by rw [hz, zero_mul])

theorem gamma16CayleyBackward_mem_source (r : V) : gamma16CayleyBackwardCoordinates r ∈ U := by
  change (1 - A (gamma16CayleyBackwardCoordinates r)).det ≠ 0
  have h : (1 - A (gamma16CayleyBackwardCoordinates r)).det = (1 - B r.val).det :=
    congrArg (fun X : M => (1 - X).det) (gamma16CayleyBackwardCoordinates_reconstruct r)
  exact h.symm ▸ gamma16CayleyBackward_one_sub_det_ne_zero r

noncomputable def gamma16CayleyBackwardSource (r : V) : U :=
  ⟨gamma16CayleyBackwardCoordinates r, gamma16CayleyBackward_mem_source r⟩

theorem gamma16CayleyForwardMatrix_backward (r : V) :
    C (gamma16CayleyBackwardCoordinates r) = (r.val : M) := by
  have hd : IsUnit (1 - B r.val).det :=
    isUnit_iff_ne_zero.mpr (gamma16CayleyBackward_one_sub_det_ne_zero r)
  have hcross : (r.val : M) * (1 - B r.val) = 1 + B r.val := by
    rw [gamma16CayleyBackward_one_sub r, gamma16CayleyBackward_one_add r]
    noncomm_ring
  calc
    C (gamma16CayleyBackwardCoordinates r) = (1 + B r.val) * (1 - B r.val)⁻¹ :=
      congrArg (fun X : M => (1 + X) * (1 - X)⁻¹) (gamma16CayleyBackwardCoordinates_reconstruct r)
    _ = ((r.val : M) * (1 - B r.val)) * (1 - B r.val)⁻¹ :=
      congrArg (fun X : M => X * (1 - B r.val)⁻¹) hcross.symm
    _ = (r.val : M) := by rw [Matrix.mul_assoc, Matrix.mul_nonsing_inv _ hd, Matrix.mul_one]

theorem gamma16CayleyForwardSO_backward (r : V) : gamma16CayleySO (gamma16CayleyBackwardSource r) = r.val := by
  apply Subtype.ext
  exact (gamma16CayleySO_apply (gamma16CayleyBackwardSource r)).trans
    (gamma16CayleyForwardMatrix_backward r)

theorem gamma16CayleyBackward_forward (c : U) :
    gamma16CayleyBackwardSource (gamma16CayleyForwardTarget c) = c := by
  apply Subtype.ext
  exact gamma16CayleyBackwardCoordinates_forward c

theorem gamma16CayleyForward_backward (r : V) :
    gamma16CayleyForwardTarget (gamma16CayleyBackwardSource r) = r := by
  apply Subtype.ext
  exact gamma16CayleyForwardSO_backward r

theorem gamma16CayleyForwardTarget_continuous : Continuous gamma16CayleyForwardTarget :=
  gamma16CayleySO_continuous.subtype_mk gamma16CayleyForward_mem_target

theorem gamma16CayleyBackwardSource_continuous : Continuous gamma16CayleyBackwardSource :=
  gamma16CayleyBackwardCoordinates_continuous.subtype_mk gamma16CayleyBackward_mem_source

noncomputable def gamma16CayleyDomainHomeomorph : U ≃ₜ V where
  toFun := gamma16CayleyForwardTarget
  invFun := gamma16CayleyBackwardSource
  left_inv := gamma16CayleyBackward_forward
  right_inv := gamma16CayleyForward_backward
  continuous_toFun := gamma16CayleyForwardTarget_continuous
  continuous_invFun := gamma16CayleyBackwardSource_continuous

theorem gamma16CayleyDomainHomeomorph_apply (c : U) :
    gamma16CayleyDomainHomeomorph c = gamma16CayleyForwardTarget c := rfl

theorem gamma16CayleyDomainHomeomorph_symm_apply (r : V) :
    gamma16CayleyDomainHomeomorph.symm r = gamma16CayleyBackwardSource r := rfl

theorem gamma16CayleyDomainHomeomorph_zero :
    gamma16CayleyDomainHomeomorph ⟨0, gamma16CayleySource_zero⟩ = ⟨1, gamma16CayleyTarget_one⟩ := by
  apply Subtype.ext
  apply Subtype.ext
  calc
    ((gamma16CayleyDomainHomeomorph ⟨0, gamma16CayleySource_zero⟩).val : M) = C (0 : Q) := rfl
    _ = 1 := gamma16CayleyMatrix_zero

#print axioms gamma16CayleyModel_injective
#print axioms gamma16CayleyTwo_det_ne_zero
#print axioms gamma16CayleyForward_add_one
#print axioms gamma16CayleyForward_sub_one
#print axioms gamma16CayleyForward_add_one_det_ne_zero
#print axioms gamma16CayleyForward_mem_target
#print axioms gamma16CayleyForwardTarget
#print axioms gamma16CayleyBackwardMatrix_forward
#print axioms gamma16CayleyBackwardCoordinates_forward
#print axioms gamma16CayleyBackward_one_sub
#print axioms gamma16CayleyBackward_one_add
#print axioms gamma16CayleyBackward_one_sub_det_ne_zero
#print axioms gamma16CayleyBackward_mem_source
#print axioms gamma16CayleyBackwardSource
#print axioms gamma16CayleyForwardMatrix_backward
#print axioms gamma16CayleyForwardSO_backward
#print axioms gamma16CayleyBackward_forward
#print axioms gamma16CayleyForward_backward
#print axioms gamma16CayleyForwardTarget_continuous
#print axioms gamma16CayleyBackwardSource_continuous
#print axioms gamma16CayleyDomainHomeomorph
#print axioms gamma16CayleyDomainHomeomorph_apply
#print axioms gamma16CayleyDomainHomeomorph_symm_apply
#print axioms gamma16CayleyDomainHomeomorph_zero
end
end FCP.BFSSPairedSpin9Clifford
