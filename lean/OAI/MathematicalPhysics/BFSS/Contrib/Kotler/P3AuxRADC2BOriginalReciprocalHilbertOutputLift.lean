import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC2AOriginalReciprocalFullL2Injectivity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.PiProd

/-! P3-AUX-RAD-C2B R1. Actual sixteen-column PiLp bounded original reciprocal.
No replacement output carrier, charge graph or spectral conclusion. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity
open FCP.BFSSSU2PhysicalDomainL6H5E8AY

noncomputable def originalReciprocalHilbertOutputCLM {ε : ℝ} (hε : 0 < ε) :
    PiLp 2 (fun _ : SpinIndex => FullL2 2) →L[ℂ]
      PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
  (originalMinimalHilbertOutputEquiv (N := 2)).symm.toContinuousLinearMap.comp
    ((ContinuousLinearMap.piMap
        (fun _ : SpinIndex => originalReciprocalFullL2CLM hε)).comp
      (originalMinimalHilbertOutputEquiv (N := 2)).toContinuousLinearMap)

theorem originalReciprocalHilbertOutputCLM_coordinate {ε : ℝ} (hε : 0 < ε)
    (y : PiLp 2 (fun _ : SpinIndex => FullL2 2)) (α : SpinIndex) :
    (originalMinimalHilbertOutputEquiv (N := 2)
      (originalReciprocalHilbertOutputCLM hε y)) α =
      originalReciprocalFullL2CLM hε
        ((originalMinimalHilbertOutputEquiv (N := 2) y) α) := by
  change
    ((originalMinimalHilbertOutputEquiv (N := 2))
      ((originalMinimalHilbertOutputEquiv (N := 2)).symm
        ((ContinuousLinearMap.piMap
          (fun _ : SpinIndex => originalReciprocalFullL2CLM hε))
            ((originalMinimalHilbertOutputEquiv (N := 2)) y)))) α =
      originalReciprocalFullL2CLM hε
        ((originalMinimalHilbertOutputEquiv (N := 2) y) α)
  rfl

theorem originalReciprocalHilbertOutputCLM_injective {ε : ℝ} (hε : 0 < ε) :
    Function.Injective (originalReciprocalHilbertOutputCLM hε) := by
  intro y z hyz
  apply (originalMinimalHilbertOutputEquiv (N := 2)).injective
  funext α
  have hα := congrArg
      (fun t : PiLp 2 (fun _ : SpinIndex => FullL2 2) =>
        (originalMinimalHilbertOutputEquiv (N := 2) t) α) hyz
  rw [originalReciprocalHilbertOutputCLM_coordinate hε y α,
      originalReciprocalHilbertOutputCLM_coordinate hε z α] at hα
  exact originalReciprocalFullL2CLM_injective hε hα

#print axioms originalReciprocalHilbertOutputCLM
#print axioms originalReciprocalHilbertOutputCLM_coordinate
#print axioms originalReciprocalHilbertOutputCLM_injective

end
end FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
