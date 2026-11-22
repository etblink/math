import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessM1cOriginalCoefficientDifferenceConsumer
import OAI.MathematicalPhysics.BFSS.DeformedCharge

/-!
MASSLESS-D0a: original complex-linear massless Fock quantizer action
on original smooth compactly supported wavefunctions is genuinely in
the full bosonic Lp 2 carrier. Paired SU(2) source consumer.
This is NOT a global maximal multiplier graph, gauge-domain result,
self-adjoint physical Hamiltonian, or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0a
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- The exact source complex-linear massless quantizer applied to any
original smooth core section has an actual bosonic L² representative. -/
theorem originalMasslessQuantizer_core_memLp {N : ℕ}
    (M : AlgebraData N) (f : SmoothCore N) :
    MemLp
      (fun x : Boson N =>
        M.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x))
      2 (volume : Measure (Boson N)) := by
  let R : SmoothCore N :=
    (1 / 16 : ℝ) •
      MixedEnergy.remainderCore (M.kineticSkewSymbol)
        (M.deformedRealField 1 0) (M.deformedRealField_contDiff 1 0) f
  have hpoint (x : Boson N) :
      M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x) =
      R x := by
    have hfield := congrArg
      (fun T : Fermion N →L[ℝ] Fermion N => T (f x))
      (FCP.BFSSMasslessM1b.originalMasslessFermionField_eq_quantized M x)
    have hquant :
        M.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x) =
        M.deformedFermionField 1 0 x (f x) := by
      simpa only [ContinuousLinearMap.coe_restrictScalars'] using hfield.symm
    rw [hquant]
    change M.deformedFermionField 1 0 x (f x) =
      (1 / 16 : ℝ) •
        (MixedEnergy.remainderCore (M.kineticSkewSymbol)
          (M.deformedRealField 1 0) (M.deformedRealField_contDiff 1 0) f) x
    rw [MixedEnergy.remainderCore_apply _ _ _
      (M.deformedRealField_anticommutator 1 0)]
    rfl
  have hfun :
      (fun x : Boson N =>
        M.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x)) =
      (R : Boson N → Fermion N) := funext hpoint
  rw [hfun]
  exact R.continuous.memLp_of_hasCompactSupport R.hasCompactSupport

/-- The genuine original FullL2 output on smooth-core inputs, not a
bounded map on all FullL2 wavefunctions. -/
noncomputable def originalMasslessQuantizer_core_output {N : ℕ}
    (M : AlgebraData N) (f : SmoothCore N) : FullL2 N :=
  (originalMasslessQuantizer_core_memLp M f).toLp
    (fun x : Boson N =>
      M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x))

/-- A.e. original Fock-fiber action of the new FullL2 output. -/
theorem originalMasslessQuantizer_core_output_ae {N : ℕ}
    (M : AlgebraData N) (f : SmoothCore N) :
    (originalMasslessQuantizer_core_output M f : Boson N → Fermion N) =ᵐ[volume]
      (fun x : Boson N =>
        M.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x)) := by
  exact MemLp.coeFn_toLp (originalMasslessQuantizer_core_memLp M f)

/-- Literal original paired SU(2) 48-Majorana source consumer. -/
theorem pairedOriginalMasslessQuantizer_core_memLp (f : SmoothCore 2) :
    MemLp
      (fun x : Boson 2 =>
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency
            FCP.BFSSSU2GaugeG1A.pairedAlgebraData x) (f x))
      2 (volume : Measure (Boson 2)) :=
  originalMasslessQuantizer_core_memLp
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData f

#print axioms originalMasslessQuantizer_core_memLp
#print axioms originalMasslessQuantizer_core_output
#print axioms originalMasslessQuantizer_core_output_ae
#print axioms pairedOriginalMasslessQuantizer_core_memLp

end
end FCP.BFSSMasslessD0a
