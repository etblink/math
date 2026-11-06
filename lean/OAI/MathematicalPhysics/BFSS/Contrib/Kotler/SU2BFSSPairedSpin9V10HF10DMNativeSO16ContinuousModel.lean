import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DLIdentityGammaDifferentialInjectivityRank
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Restrict

/-! F10DM: explicit continuous linear coordinates for native so(16) on the original matrix carrier.
Reconstruct from original upper entries, then express the accepted actual identity differential
in these 120 coordinates with an exact ambient reconstruction. This is a vector-space model;
no special-orthogonal subgroup atlas, intrinsic target tangent or native source bracket is installed.
Candidate until strict compilation and complete independent audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology BigOperators Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance f10dmLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10dmLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10dmLocalChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace
local instance f10dmNativeSkewIsTopologicalAddGroup :
    IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))
local instance f10dmNativeSkewContinuousSMul :
    ContinuousSMul ℝ (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (ContinuousSMul ℝ
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev M := GammaMatrix
private abbrev I := modelWithCornersSelf ℝ P
private abbrev T := TangentSpace I (1 : G)
private abbrev S16 := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev D : T →L[ℝ] M := source9SpinIdentityGammaDifferential
private abbrev nativeD : T →L[ℝ] S16 :=
  D.codRestrict (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule
    source9SpinIdentityGammaDifferential_mem_so

/-- Each original target plane occurs once, with its increasing orientation. -/
abbrev gamma16StrictPlaneIndex :=
  {p : SpinIndex × SpinIndex // p.1 < p.2}

/-- There are exactly 120 increasing pairs of the original sixteen labels. -/
theorem gamma16StrictPlaneIndex_card : Fintype.card gamma16StrictPlaneIndex = 120 := by
  decide

/-- Reconstruct the full original target matrix from upper entries, with negative lower entries. -/
noncomputable def gamma16StrictPlaneMatrix (c : gamma16StrictPlaneIndex → ℝ) :
    Matrix SpinIndex SpinIndex ℝ :=
  fun i j =>
    if h : i < j then c ⟨(i, j), h⟩
    else if h : j < i then -c ⟨(j, i), h⟩
    else 0

/-- The reconstruction is skew in the original matrix carrier. -/
theorem gamma16StrictPlaneMatrix_transpose (c : gamma16StrictPlaneIndex → ℝ) :
    (gamma16StrictPlaneMatrix c).transpose = -gamma16StrictPlaneMatrix c := by
  apply Matrix.ext
  intro i j
  change gamma16StrictPlaneMatrix c j i = -gamma16StrictPlaneMatrix c i j
  by_cases hij : i < j
  · have hji : ¬j < i := not_lt_of_gt hij
    simp [gamma16StrictPlaneMatrix, hij, hji]
  · by_cases hji : j < i
    · simp [gamma16StrictPlaneMatrix, hij, hji]
    · simp [gamma16StrictPlaneMatrix, hij, hji]

/-- Exact linear model of canonical Mathlib so(16,R), inverse given by upper entries. -/
noncomputable def gamma16StrictPlaneModelEquiv :
    (gamma16StrictPlaneIndex → ℝ) ≃ₗ[ℝ] LieAlgebra.Orthogonal.so SpinIndex ℝ where
  toFun c := ⟨gamma16StrictPlaneMatrix c, by
    rw [LieAlgebra.Orthogonal.mem_so]
    exact gamma16StrictPlaneMatrix_transpose c⟩
  invFun A p := A.val p.val.1 p.val.2
  left_inv c := by
    funext p
    change gamma16StrictPlaneMatrix c p.val.1 p.val.2 = c p
    simp only [gamma16StrictPlaneMatrix, dite_eq_left p.property]
  right_inv A := by
    apply Subtype.ext
    apply Matrix.ext
    intro i j
    change gamma16StrictPlaneMatrix
      (fun p : gamma16StrictPlaneIndex => A.val p.val.1 p.val.2) i j = A.val i j
    have hA : A.val.transpose = -A.val := by
      have hA_mem := A.property
      rw [LieAlgebra.Orthogonal.mem_so] at hA_mem
      exact hA_mem
    by_cases hij : i < j
    · simp [gamma16StrictPlaneMatrix, hij]
    · by_cases hji : j < i
      · have hentry : A.val j i = -(A.val i j) :=
          congrArg (fun M : Matrix SpinIndex SpinIndex ℝ => M i j) hA
        simp [gamma16StrictPlaneMatrix, hij, hji, hentry]
      · have heq : i = j :=
          le_antisymm (le_of_not_gt hji) (le_of_not_gt hij)
        subst j
        have hdiag : A.val i i = -(A.val i i) :=
          congrArg (fun M : Matrix SpinIndex SpinIndex ℝ => M i i) hA
        have hz : A.val i i = 0 := by linarith
        simp [gamma16StrictPlaneMatrix, hz]
  map_add' c d := by
    apply Subtype.ext
    apply Matrix.ext
    intro i j
    change gamma16StrictPlaneMatrix (c + d) i j =
      gamma16StrictPlaneMatrix c i j + gamma16StrictPlaneMatrix d i j
    by_cases hij : i < j
    · simp [gamma16StrictPlaneMatrix, hij]
    · by_cases hji : j < i
      · simp only [gamma16StrictPlaneMatrix, dite_eq_right hij, dite_eq_left hji,
          Pi.add_apply]
        abel
      · simp [gamma16StrictPlaneMatrix, hij, hji]
  map_smul' a c := by
    apply Subtype.ext
    apply Matrix.ext
    intro i j
    change gamma16StrictPlaneMatrix (a • c) i j = a • gamma16StrictPlaneMatrix c i j
    by_cases hij : i < j <;> by_cases hji : j < i <;>
      simp [gamma16StrictPlaneMatrix, hij, hji]

/-- The inverse is literally extraction of original upper-triangular entries. -/
theorem gamma16StrictPlaneModelEquiv_symm_apply
    (A : LieAlgebra.Orthogonal.so SpinIndex ℝ) (p : gamma16StrictPlaneIndex) :
    gamma16StrictPlaneModelEquiv.symm A p = A.val p.val.1 p.val.2 := rfl

/-- The forward map is literally the upper-entry reconstruction in the original GammaMatrix. -/
theorem gamma16StrictPlaneModelEquiv_apply (c : gamma16StrictPlaneIndex → ℝ) :
    (gamma16StrictPlaneModelEquiv c : GammaMatrix) = gamma16StrictPlaneMatrix c := rfl

/-- Promote the exact linear equivalence using the existing subtype and parameter topologies. -/
noncomputable def gamma16StrictPlaneModelContinuousEquiv :
    (gamma16StrictPlaneIndex → ℝ) ≃L[ℝ] S16 :=
  gamma16StrictPlaneModelEquiv.toContinuousLinearEquiv

theorem gamma16NativeSkew_finrank : Module.finrank ℝ S16 = 120 := by
  calc
    Module.finrank ℝ S16 = Module.finrank ℝ (gamma16StrictPlaneIndex → ℝ) :=
      gamma16StrictPlaneModelEquiv.symm.finrank_eq
    _ = Fintype.card gamma16StrictPlaneIndex := Module.finrank_fintype_fun_eq_card ℝ
    _ = 120 := gamma16StrictPlaneIndex_card

/-- The continuous model followed by the literal native skew-subtype inclusion. -/
noncomputable def gamma16StrictPlaneAmbientCLM :
    (gamma16StrictPlaneIndex → ℝ) →L[ℝ] M :=
  (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtypeL.comp
    gamma16StrictPlaneModelContinuousEquiv.toContinuousLinearMap

theorem gamma16StrictPlaneAmbientCLM_apply (c : gamma16StrictPlaneIndex → ℝ) :
    gamma16StrictPlaneAmbientCLM c = gamma16StrictPlaneMatrix c := rfl

/-- Coordinates of the accepted actual native identity differential, not a replacement derivative. -/
noncomputable def source9SpinIdentityGammaTargetCoordinateCLM :
    T →L[ℝ] (gamma16StrictPlaneIndex → ℝ) :=
  gamma16StrictPlaneModelContinuousEquiv.symm.toContinuousLinearMap.comp nativeD

/-- Every coordinate is an original upper entry of the actual differential. -/
theorem source9SpinIdentityGammaTargetCoordinateCLM_apply
    (v : T) (p : gamma16StrictPlaneIndex) :
    source9SpinIdentityGammaTargetCoordinateCLM v p = D v p.val.1 p.val.2 := rfl

/-- Complete continuous-linear factorization through the original 120-coordinate matrix model. -/
theorem source9SpinIdentityGammaTargetCoordinateCLM_factor :
    D = gamma16StrictPlaneAmbientCLM.comp source9SpinIdentityGammaTargetCoordinateCLM := by
  apply ContinuousLinearMap.ext
  intro v
  have h : gamma16StrictPlaneModelContinuousEquiv
      (gamma16StrictPlaneModelContinuousEquiv.symm (nativeD v)) = nativeD v :=
    gamma16StrictPlaneModelContinuousEquiv.apply_symm_apply (nativeD v)
  exact (congrArg (fun A : S16 => (A : M)) h).symm

theorem source9SpinIdentityGammaTargetCoordinateCLM_injective :
    Function.Injective source9SpinIdentityGammaTargetCoordinateCLM := by
  intro v w h
  apply source9SpinIdentityGammaDifferential_injective
  have hv := congrArg (fun L : T →L[ℝ] M => L v)
    source9SpinIdentityGammaTargetCoordinateCLM_factor
  have hw := congrArg (fun L : T →L[ℝ] M => L w)
    source9SpinIdentityGammaTargetCoordinateCLM_factor
  exact hv.trans ((congrArg gamma16StrictPlaneAmbientCLM h).trans hw.symm)

theorem source9SpinIdentityGammaTargetCoordinateCLM_range_finrank :
    Module.finrank ℝ source9SpinIdentityGammaTargetCoordinateCLM.toLinearMap.range = 36 :=
  (LinearMap.finrank_range_of_inj
    (f := source9SpinIdentityGammaTargetCoordinateCLM.toLinearMap)
    source9SpinIdentityGammaTargetCoordinateCLM_injective).trans source9SpinIdentityTangent_finrank

#print axioms gamma16StrictPlaneIndex_card
#print axioms gamma16StrictPlaneMatrix
#print axioms gamma16StrictPlaneMatrix_transpose
#print axioms gamma16StrictPlaneModelEquiv
#print axioms gamma16StrictPlaneModelEquiv_symm_apply
#print axioms gamma16StrictPlaneModelEquiv_apply
#print axioms gamma16StrictPlaneModelContinuousEquiv
#print axioms gamma16NativeSkew_finrank
#print axioms gamma16StrictPlaneAmbientCLM
#print axioms gamma16StrictPlaneAmbientCLM_apply
#print axioms source9SpinIdentityGammaTargetCoordinateCLM
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_apply
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_factor
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_injective
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_range_finrank
end
end FCP.BFSSPairedSpin9Clifford
