import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5BOriginalNativeClosedChargeCoreEnergy
import OAI.MathematicalPhysics.BFSS.Cutoffs

/-! Bound the massless fermionic form by a first radial moment on the
original core, with a graph-norm estimate for fixed-radius support. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5C
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM4A
open FCP.BFSSGM5A
open FCP.BFSSGM5B
open MeasureTheory
open scoped InnerProductSpace

/-- First radial moment of the squared original core wavefunction. -/
def coreRadialMoment {N : ℕ} (f : SmoothCore N) : ℝ :=
  ∫ x : Boson N, ‖x‖ * ‖f x‖ ^ 2

/-- The kinetic and bosonic-potential contributions at massless parameters. -/
def kineticPotentialCoreEnergy {N : ℕ} (M : AlgebraData N) (f : SmoothCore N) : ℝ :=
  (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex N,
    ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
  (∫ x : Boson N, M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2)

private theorem masslessFermionDensity_abs_le {N : ℕ} (M : AlgebraData N)
    (x : Boson N) (z : Fermion N) :
    |inner ℝ z (M.deformedFermionField 1 0 x z)| ≤
      M.fermionGrowthConstant * (‖x‖ * ‖z‖ ^ 2) := by
  have hfield : ‖M.deformedFermionField 1 0 x‖ ≤ M.fermionGrowthConstant * ‖x‖ := by
    simpa only [abs_one, one_mul, abs_zero, add_zero] using
      M.deformedFermionField_growth 1 0 x
  have happ := (M.deformedFermionField 1 0 x).le_opNorm z
  calc
    _ ≤ ‖z‖ * ‖M.deformedFermionField 1 0 x z‖ := abs_real_inner_le_norm _ _
    _ ≤ ‖z‖ * ((M.fermionGrowthConstant * ‖x‖) * ‖z‖) :=
      mul_le_mul_of_nonneg_left
        (happ.trans (mul_le_mul_of_nonneg_right hfield (norm_nonneg z))) (norm_nonneg z)
    _ = _ := by ring

/-- Absolute control of the fermionic integral by the first radial moment. -/
theorem masslessCoreFermionIntegral_abs_le {N : ℕ} (M : AlgebraData N)
    (f : SmoothCore N) :
    |∫ x : Boson N, inner ℝ (f x) (M.deformedFermionField 1 0 x (f x)) ∂volume| ≤
      M.fermionGrowthConstant * coreRadialMoment f := by
  have habs : Integrable (fun x : Boson N =>
      |inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))|) volume := by
    simpa only [Real.norm_eq_abs] using (M.fermion_core_integrable 1 0 f).norm
  have hmoment := weighted_core_square_integrable
    (fun x : Boson N => ‖x‖) continuous_norm f
  calc
    _ ≤ ∫ x : Boson N, |inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))| :=
      abs_integral_le_integral_abs
    _ ≤ ∫ x : Boson N, M.fermionGrowthConstant * (‖x‖ * ‖f x‖ ^ 2) :=
      integral_mono habs (hmoment.const_mul _) (fun x => masslessFermionDensity_abs_le M x (f x))
    _ = _ := integral_const_mul _ _

/-- The discrepancy between the normalized native charge square and the
kinetic-plus-bosonic energy is bounded by the exact first radial moment. -/
theorem nativeCoreEnergy_difference_le (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) :
    |(1 / 16 : ℝ) *
      ‖originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)‖ ^ 2 -
        kineticPotentialCoreEnergy M f.val| ≤
      M.fermionGrowthConstant * coreRadialMoment f.val := by
  have he : (1 / 16 : ℝ) *
      ‖originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)‖ ^ 2 =
        kineticPotentialCoreEnergy M f.val +
        (inner ℂ (physicalMasslessCoreInput M G f).val
          (originalPhysicalMasslessMultiplier M G (physicalMasslessCoreInput M G f))).re :=
    physicalMasslessClosedChargeCoreEnergy M G f
  rw [he, add_sub_cancel_left, physicalMasslessCorePairing M G f]
  exact masslessCoreFermionIntegral_abs_le M f.val

private theorem coreRadialMoment_le_of_support {N : ℕ} (f : SmoothCore N) (R : ℝ)
    (hzero : ∀ x : Boson N, R < ‖x‖ → f x = 0) :
    coreRadialMoment f ≤ R * ‖coreToL2 f‖ ^ 2 := by
  have hmoment := weighted_core_square_integrable
    (fun x : Boson N => ‖x‖) continuous_norm f
  unfold coreRadialMoment
  rw [coreToL2_norm_sq, ← integral_const_mul]
  apply integral_mono hmoment ((coreNormSq_integrable f).const_mul R)
  intro x
  by_cases h : ‖x‖ ≤ R
  · exact mul_le_mul_of_nonneg_right h (sq_nonneg _)
  · simp only [hzero x (lt_of_not_ge h), norm_zero,
      zero_pow (by decide : (2 : ℕ) ≠ 0), mul_zero, le_refl]

/-- With a common support radius, only the unweighted L² norm is needed
to control the error between the two energies. -/
theorem nativeCoreEnergy_difference_le_of_support (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) (R : ℝ) (hzero : ∀ x : Boson 2, R < ‖x‖ → f.val x = 0) :
    |(1 / 16 : ℝ) *
      ‖originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)‖ ^ 2 -
        kineticPotentialCoreEnergy M f.val| ≤
      M.fermionGrowthConstant * (R * ‖coreToL2 f.val‖ ^ 2) :=
  (nativeCoreEnergy_difference_le M G f).trans
    (mul_le_mul_of_nonneg_left (coreRadialMoment_le_of_support f.val R hzero)
      M.fermionGrowthConstant_nonneg)

#print axioms coreRadialMoment
#print axioms kineticPotentialCoreEnergy
#print axioms masslessCoreFermionIntegral_abs_le
#print axioms nativeCoreEnergy_difference_le
#print axioms nativeCoreEnergy_difference_le_of_support

end
end FCP.BFSSGM5C
