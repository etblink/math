import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC0OriginalWeakCutoffPairing

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2L0 FCP.BFSSLOC0
open MeasureTheory

theorem originalSU2WeakCutoffAudit (M : AlgebraData 2) (a : SpinIndex)
    (χ : Boson 2 → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (u v : Boson 2 → Fermion 2)
    (hcu : MemLp (cutoffField χ u) 2 volume)
    (hcv : MemLp (cutoffField χ v) 2 volume)
    (he : MemLp (cutoffError M a χ u) 2 volume)
    (h : ChargeWeakPair M a u v) :
    ChargeWeakPair M a (cutoffField χ u)
      (cutoffField χ v + cutoffError M a χ u) :=
  chargeWeakPair_cutoff M a χ hχ u v hcu hcv he h

theorem originalSU2CutoffNormAudit (M : AlgebraData 2) (a : SpinIndex)
    (χ : Boson 2 → ℝ) (u : Boson 2 → Fermion 2) (x : Boson 2) :
    ‖cutoffError M a χ u x‖ ^ 2 =
      (1 / 2 : ℝ) * ‖cutoffGradient χ x‖ ^ 2 * ‖u x‖ ^ 2 :=
  cutoffError_norm_sq M a χ u x

#print axioms originalSU2WeakCutoffAudit
#print axioms originalSU2CutoffNormAudit
end
end FCP.BFSSLOC0Independent
