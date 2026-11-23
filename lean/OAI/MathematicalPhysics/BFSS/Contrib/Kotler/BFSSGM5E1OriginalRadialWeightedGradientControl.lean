import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5DOriginalFixedRadiusGradientLimit
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E0OriginalWeightedCoreEnergy
import OAI.MathematicalPhysics.BFSS.FormCompactness

/-! Original source first-radial-moment L² realization and smooth-core
weighted gradient inequality, without a completed-domain claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E1
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5C FCP.BFSSGM5D FCP.BFSSGM5E0
open MeasureTheory

/-- Original real first-radial-weight Fock smooth core, not a proxy. -/
abbrev radialWeightedCore {N : ℕ} (f : SmoothCore N) : FullL2 N :=
  BFSSSliceSobolev.weightedToL2 (volume : Measure (Boson N))
    (fun x : Boson N => Real.sqrt ‖x‖)
    (Real.continuous_sqrt.comp continuous_norm) f

/-- Weighted L² norm squared equals the exact original first radial moment. -/
theorem radialWeightedCore_norm_sq {N : ℕ} (f : SmoothCore N) :
    ‖radialWeightedCore f‖ ^ 2 = coreRadialMoment f := by
  unfold radialWeightedCore coreRadialMoment
  rw [BFSSSliceSobolev.weightedToL2_norm_sq]
  apply integral_congr_ae
  filter_upwards [] with x
  rw [Real.sq_sqrt (norm_nonneg x)]

/-- Native physical sixteen-charge plus weighted Hilbert control of
the original invariant smooth-core gradient. -/
theorem weightedCoreGradient_sq_le (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) :
    ‖sourceCoreGradient f.val‖ ^ 2 ≤
      (1 / 8 : ℝ) * ‖nativeCoreChargeValue M G f‖ ^ 2 +
        (2 * M.fermionGrowthConstant) * ‖radialWeightedCore f.val‖ ^ 2 := by
  have h := originalNativeCore_kineticPotential_le M G f
  have hpot : 0 ≤ (∫ x : Boson 2,
      M.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) :=
    integral_nonneg (fun x =>
      mul_nonneg (M.deformedBosonicPotential_nonneg 1 0 x) (sq_nonneg _))
  rw [kineticPotentialCoreEnergy, ← sourceCoreGradient_norm_sq,
    ← radialWeightedCore_norm_sq] at h
  linarith only [h, hpot]

#print axioms radialWeightedCore_norm_sq
#print axioms weightedCoreGradient_sq_le

end
end FCP.BFSSGM5E1
