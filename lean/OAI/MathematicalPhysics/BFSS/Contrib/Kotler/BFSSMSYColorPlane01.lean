import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYMajoranaTransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CZImage
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8RSourceNormalizedZColorFlowDiagonalProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G7KOriginalSourceFlowExactGaugeImplementationProbe

/-! The zero-based (0,1) plane of MSY Eq. (4) and Eq. (7), at the
actual native positive-i Pauli-Z gauge curve. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYColorPlane01

open OAI.BFSSQuantum Matrix
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG3A FCP.BFSSSU2GaugeG4B
open FCP.BFSSIBIG0CNativeZGenerator FCP.BFSSIBIG0CZImage
open FCP.BFSSSU2PhysicalDomainL6H5E8R
open FCP.BFSSSU2PhysicalDomainL6G6X FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSSU2PhysicalDomainL6G6Z FCP.BFSSSU2PhysicalDomainL6G7K
open FCP.BFSSMSYMajorana

private theorem native_z_eq_half_angle (t : ℝ) :
    sourcePlusIGaugeCurve 2 t = sourceZGauge (-(Real.sqrt 2 * t)) := by
  apply Subtype.ext
  change (sourcePlusIGaugeCurve 2 t : ColorMatrix 2) = sourceZMatrix (-(Real.sqrt 2 * t))
  rw [source_z_gaugeCurve_diagonal_exp]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sourceZDiagonal, sourceZMatrix, FCP.BFSSSU2.pauliScale] <;> ring_nf

/-- The adjoint of the actual native curve is the MSY (0,1) color
rotation at angle `√2 * t`, in row-output/column-input order. -/
theorem native_adjoint_plane01 (t : ℝ) :
    adjointColorMatrix (sourcePlusIGaugeCurve 2 t) =
      !![Real.cos (Real.sqrt 2 * t), Real.sin (Real.sqrt 2 * t), 0;
          -Real.sin (Real.sqrt 2 * t), Real.cos (Real.sqrt 2 * t), 0;
          0, 0, 1] := by
  rw [native_z_eq_half_angle, originalAdjointColorMatrix_sourceZ_eq_rotZ]
  simp only [sourceRotZ, Real.cos_neg, Real.sin_neg, neg_neg]

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- The ordered Majorana contraction in MSY Eq. (4), for colors zero and one. -/
noncomputable def planeBilinear
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) : E →L[ℂ] E :=
  ∑ α, theta α 0 * theta α 1

private theorem native_structure_constant (a b : ColorIndex 2) :
    pairedAlgebraData.structureConstant a b 2 = Real.sqrt 2 * FCP.BFSSSU2.epsilon3 a b 2 :=
  FCP.BFSSSU2.algebraData_structureConstant_of_pauli_color pairedAlgebraData
    (fun c => (pairedAlgebraData_color c).trans (FCP.BFSSSU2Full.concreteAlgebraData_color c))
    a b 2

private theorem native_spin_summand (α : SpinIndex) :
    (∑ a : ColorIndex 2, ∑ b : ColorIndex 2,
      sourceFiberFermionColorTerm pairedAlgebraData 2 α a b) =
      (2 * (Real.sqrt 2 : ℂ)) • (pairedTheta α 0 * pairedTheta α 1) := by
  have hanti : pairedTheta α 1 * pairedTheta α 0 = -(pairedTheta α 0 * pairedTheta α 1) := by
    rw [eq_neg_iff_add_eq_zero]
    have hn : ¬ (α = α ∧ (1 : ColorIndex 2) = 0) := fun h => (by decide : (1 : Fin 3) ≠ 0) h.2
    have hc := pairedTheta_CAR α α 1 0
    rw [ite_eq_right hn] at hc
    have hz : (0 : ℂ) • (1 : Fermion 2 →L[ℂ] Fermion 2) = 0 := by
      apply ContinuousLinearMap.ext
      intro v
      change (0 : ℂ) • v = 0
      exact zero_smul ℂ v
    exact hc.trans hz
  have hcoeff (a b : ColorIndex 2) :
      (pairedAlgebraData.structureConstant a b 2 : ℂ) =
        (Real.sqrt 2 : ℂ) * (FCP.BFSSSU2.epsilon3 a b 2 : ℂ) := by
    rw [native_structure_constant, Complex.ofReal_mul]
  apply ContinuousLinearMap.ext
  intro v
  simp only [Fin.sum_univ_three, _root_.add_apply, _root_.smul_apply, sourceFiberFermionColorTerm, hcoeff,
    FCP.BFSSSU2.epsilon3,
    pairedAlgebraData_theta, Complex.ofReal_zero, Complex.ofReal_one, Complex.ofReal_neg,
    mul_zero, mul_one, mul_neg, zero_smul, zero_add, add_zero, hanti, neg_smul, smul_neg, neg_neg,
    two_mul, add_smul]

/-- Exact coefficient and orientation of the native fermionic generator. -/
theorem native_fermion_generator_plane01 :
    sourceFiberFermionColorGenerator pairedAlgebraData 2 =
      (Real.sqrt 2 : ℂ) • planeBilinear pairedTheta := by
  unfold sourceFiberFermionColorGenerator sourceFiberFermionColorCurrent planeBilinear
  simp_rw [native_spin_summand]
  rw [← Finset.smul_sum, smul_smul, smul_smul]
  have hI : Complex.I * (-Complex.I / 2) * (2 * (Real.sqrt 2 : ℂ)) =
      (Real.sqrt 2 : ℂ) := by
    calc
      _ = -(Complex.I ^ 2) * (Real.sqrt 2 : ℂ) := by ring
      _ = _ := by rw [Complex.I_sq]; simp
  rw [hI]

private theorem planeBilinear_conj
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) (J : E ≃ₗᵢ[ℂ] Fermion 2)
    (hJ : ∀ α a v,
      J (pullMajorana (fun β b => (theta β b).toLinearMap) α a v) =
        pairedTheta α a (J v)) :
    J.toContinuousLinearEquiv.conjContinuousAlgEquiv (planeBilinear theta) =
      planeBilinear pairedTheta := by
  let T : SpinIndex → ColorIndex 2 → Module.End ℂ E := fun α a => (theta α a).toLinearMap
  have hB (v : E) : planeBilinear theta v =
      ∑ α, pullMajorana T α 0 (pullMajorana T α 1 v) := by
    have h := congrArg (fun A : Module.End ℂ E => A v) (color_bilinear_eq T 0 1).symm
    simp only [LinearMap.sum_apply, Module.End.mul_apply] at h
    simpa only [planeBilinear, _root_.sum_apply, mul_apply_eq_comp, T,
      ContinuousLinearMap.coe_coe]
      using h
  apply ContinuousLinearMap.ext
  intro v
  simp only [ContinuousLinearEquiv.conjContinuousAlgEquiv_apply_apply]
  change J (planeBilinear theta (J.symm v)) = _
  rw [hB, map_sum]
  simp only [planeBilinear, _root_.sum_apply, mul_apply_eq_comp]
  apply Finset.sum_congr rfl
  intro α _
  change J (pullMajorana T α 0 (pullMajorana T α 1 (J.symm v))) = _
  rw [hJ α 0, hJ α 1, J.apply_symm_apply]

noncomputable local instance planeRationalNormedAlgebra
    {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] :
    NormedAlgebra ℚ (V →L[ℂ] V) :=
  .restrictScalars ℚ ℂ _

/-- The MSY (0,1) plane exponential at angle `√2 * t` intertwines
the actual original fermionic gauge action, under the qualified Majorana
intertwining hypothesis. -/
theorem finite_plane01_intertwines [CompleteSpace E]
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) (J : E ≃ₗᵢ[ℂ] Fermion 2)
    (hJ : ∀ α a v,
      J (pullMajorana (fun β b => (theta β b).toLinearMap) α a v) =
        pairedTheta α a (J v))
    (t : ℝ) (v : E) :
    J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) v) =
      fermionGaugeLinearEquiv (sourcePlusIGaugeCurve 2 t) (J v) := by
  let e := J.toContinuousLinearEquiv
  let C := e.conjContinuousAlgEquiv
  have hC : Continuous C := (e.arrowCongr e).continuous
  have htime (D : Fermion 2 →L[ℂ] Fermion 2) : t • D = (t : ℂ) • D := by
    apply ContinuousLinearMap.ext
    intro w
    change t • D w = (t : ℂ) • D w
    exact RCLike.real_smul_eq_coe_smul (K := ℂ) t (D w)
  have hm : C (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) =
      t • sourceFiberFermionColorGenerator pairedAlgebraData 2 := by
    rw [native_fermion_generator_plane01, htime, smul_smul, map_smul]
    change ((Real.sqrt 2 * t : ℝ) : ℂ) •
      J.toContinuousLinearEquiv.conjContinuousAlgEquiv (planeBilinear theta) =
        ((t : ℂ) * (Real.sqrt 2 : ℂ)) • planeBilinear pairedTheta
    rw [planeBilinear_conj theta J hJ, Complex.ofReal_mul, mul_comm (Real.sqrt 2 : ℂ)]
  have he := NormedSpace.map_exp C hC (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta)
  rw [hm] at he
  have hp := congrArg (fun A : Fermion 2 →L[ℂ] Fermion 2 => A (J v)) he
  change J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) (J.symm (J v))) =
      sourceFermionColorFlow 2 t (J v) at hp
  rw [J.symm_apply_apply, sourceFermionColorFlow_eq_actualGauge_apply] at hp
  exact hp

#print axioms native_adjoint_plane01
#print axioms native_fermion_generator_plane01
#print axioms finite_plane01_intertwines

end FCP.BFSSMSYColorPlane01
