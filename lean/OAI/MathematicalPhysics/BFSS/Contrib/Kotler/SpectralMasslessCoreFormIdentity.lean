import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4K9DSourcePotentialMultiplierProbe

/-! Bind the original normalized coreForm to the original massless energy fields.
No potential-agreement premise, concrete representation existence, sharp field bound,
physical-sector reduction or closed-domain identification is asserted here. -/

set_option autoImplicit false

namespace OAI.BFSSQuantum.AlgebraData
noncomputable section
open MeasureTheory

variable {N : ℕ} (M : AlgebraData N)

theorem massless_coreForm_energy (f : SmoothCore N) :
    M.coreForm f =
      (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex N,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      ∫ x : Boson N, (M.deformedBosonicPotential 1 0 x * ‖f x‖^2 +
        inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) := by
  rw [← FCP.BFSSSU2GaugeG4K9D.sourceUnconditionalCoreForm_equal M f]
  exact M.averaged_core_energy 1 0 f

end
end OAI.BFSSQuantum.AlgebraData

#print axioms OAI.BFSSQuantum.AlgebraData.massless_coreForm_energy
#eval IO.println "SPECTRAL_MASSLESS_CORE_FORM_SOURCE_OK"
