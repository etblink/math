import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C4AOriginalCoreIntegralTransfer
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralLinearMomentCompactness

/-!
# P2-C4B — discharge literal original smooth-core energy-density integrability

Extract the original local hip and hif arguments from
AlgebraData.averaged_core_energy; reuse the already proven compact-support
first radial moment. The final theorem discharges precisely the TWO named
integrability premises of qualified P2-C4A on the genuine SmoothCore 2.

No replacement Hamiltonian, physical Spin(9) sector, coercivity in valleys,
closed-domain statement, or positive eigenvalue is asserted.
Candidate until independent strict source/consumer qualification.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C4BOriginalSourceIntegrability
noncomputable section

open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C4AOriginalCoreIntegralTransfer
open MeasureTheory

private abbrev M : AlgebraData 2 :=
  FCP.BFSSSU2Full.concreteAlgebraData

/-- Original potential-density integrability witness from
DeformedCharge.averaged_core_energy, specialized without altering the source. -/
theorem originalPotentialDensity_integrable (f : SmoothCore 2) :
    Integrable (fun x : Boson 2 =>
      M.deformedBosonicPotential 1 0 x * ‖f x‖^2)
      (volume : Measure (Boson 2)) := by
  have hh : (fun x : Boson 2 => M.deformedBosonicPotential 1 0 x * ‖f x‖^2) =
      fun x => (1/16 : ℝ) * ∑ α : SpinIndex,
        ‖MixedEnergy.field (M.deformedRealField 1 0 α)
          (M.deformedRealField_contDiff 1 0 α) f x‖^2 := by
    funext x
    exact (M.deformed_potential_average 1 0 x (f x)).symm
  rw [hh]
  exact (integrable_finsetSum _ (fun α _ => coreNormSq_integrable _)).const_mul _

/-- Source-exact ordered fermionic-density integrability copied from the
original anticommutator/remainder proof, on the original 48-Majorana field. -/
theorem originalFermionDensity_integrable (f : SmoothCore 2) :
    Integrable (fun x : Boson 2 =>
      inner ℝ (f x) (M.deformedFermionField 1 0 x (f x)))
      (volume : Measure (Boson 2)) := by
  have hh : (fun x : Boson 2 =>
      inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) =
      fun x => (1/16 : ℝ) * inner ℝ (f x)
        (MixedEnergy.remainderCore (M.kineticSkewSymbol) (M.deformedRealField 1 0)
          (M.deformedRealField_contDiff 1 0) f x) := by
    funext x
    rw [MixedEnergy.remainderCore_apply _ _ _ (M.deformedRealField_anticommutator 1 0)]
    simp only [deformedFermionField, IsSMulApply.smul_apply, real_inner_smul_right]
  rw [hh]
  exact (MixedEnergy.inner_integrable _ _).const_mul _

/-- The existing finite-volume compact-support radial moment argument,
specialized to original SmoothCore 2. -/
theorem originalLinearMoment_integrable (f : SmoothCore 2) :
    Integrable (fun x : Boson 2 => ‖x‖ * ‖f x‖^2)
      (volume : Measure (Boson 2)) := by
  exact (continuous_norm.mul (f.continuous.norm.pow 2)).integrable_of_hasCompactSupport
    (BFSSNormalMeasure.square_compact f f.hasCompactSupport).mul_left

/-- The upper/original density is integrable, with no hypothesis on f
beyond genuine original SmoothCore membership. -/
theorem originalActualDensity_integrable (f : SmoothCore 2) :
    Integrable (originalActualDensity f) (volume : Measure (Boson 2)) := by
  have hDensity :
      originalActualDensity f =
        (fun x : Boson 2 => M.deformedBosonicPotential 1 0 x * ‖f x‖^2) +
          (fun x : Boson 2 =>
            inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) := by
    funext x
    rfl
  rw [hDensity]
  exact (originalPotentialDensity_integrable f).add (originalFermionDensity_integrable f)

/-- The lower density is integrable; the finite source constant is the
same original growth constant as in qualified P2-C2 and P2-C4A. -/
theorem originalLowerDensity_integrable (f : SmoothCore 2) :
    Integrable (originalLowerDensity f) (volume : Measure (Boson 2)) := by
  have hi := (originalPotentialDensity_integrable f).sub
    ((originalLinearMoment_integrable f).const_mul M.fermionGrowthConstant)
  have hDensity :
      originalLowerDensity f =
        (fun x : Boson 2 => M.deformedBosonicPotential 1 0 x * ‖f x‖^2) -
          (fun x : Boson 2 => M.fermionGrowthConstant * (‖x‖ * ‖f x‖^2)) := by
    funext x
    change
      (M.deformedBosonicPotential 1 0 x - M.fermionGrowthConstant * ‖x‖) *
        ‖f x‖^2 =
      M.deformedBosonicPotential 1 0 x * ‖f x‖^2 -
        M.fermionGrowthConstant * (‖x‖ * ‖f x‖^2)
    ring
  rw [hDensity]
  exact hi

/-- The original smooth-core form inequality without artificial integrability
premises, obtained by discharging both P2-C4A hypotheses from source results. -/
theorem originalMasslessCoreForm_lower (f : SmoothCore 2) :
    (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
      ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      (∫ x : Boson 2, originalLowerDensity f x) ≤
        M.coreForm f := by
  exact originalMasslessCoreForm_lower_of_integrable f
    (originalLowerDensity_integrable f) (originalActualDensity_integrable f)

#print axioms originalPotentialDensity_integrable
#print axioms originalFermionDensity_integrable
#print axioms originalLinearMoment_integrable
#print axioms originalActualDensity_integrable
#print axioms originalLowerDensity_integrable
#print axioms originalMasslessCoreForm_lower

end
end FCP.BFSSP2C4BOriginalSourceIntegrability
