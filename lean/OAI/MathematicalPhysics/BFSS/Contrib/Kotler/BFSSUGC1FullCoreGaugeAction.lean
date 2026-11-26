import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC0FullCoreGaugeCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B7SourceFullL2GaugeIsometryAndFixednessProbe

/-! UGC1: package the actual transformed section on the original full
SmoothCore, commute each literal charge and identify its genuine SU2 L2
action. No closure, averaging in graph norm or spectral assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC1
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSUGC0 FCP.BFSSSU2PhysicalDomainD2B6 FCP.BFSSSU2PhysicalDomainD2B7

def core_action {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) : SmoothCore N →ₗ[ℂ] SmoothCore N where
  toFun f := {
    toFun := fun x => G.fermion g (f (G.boson g⁻¹ x))
    contDiff' := by
      let B := (G.boson g⁻¹).toContinuousLinearEquiv.toContinuousLinearMap
      let F := (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
      exact (F.restrictScalars ℝ).contDiff.comp (f.contDiff.comp B.contDiff)
    hasCompactSupport' := by
      have h := f.hasCompactSupport.comp_homeomorph
        (G.boson g⁻¹).toContinuousLinearEquiv.toHomeomorph
      exact h.comp_left (map_zero (G.fermion g))
    tsupport_subset' := by
      intro x hx
      trivial }
  map_add' f h := by
    apply TestFunction.ext
    intro x
    change G.fermion g (f (G.boson g⁻¹ x) + h (G.boson g⁻¹ x)) =
      G.fermion g (f (G.boson g⁻¹ x)) + G.fermion g (h (G.boson g⁻¹ x))
    exact map_add _ _ _
  map_smul' c f := by
    apply TestFunction.ext
    intro x
    change G.fermion g (c • f (G.boson g⁻¹ x)) =
      c • G.fermion g (f (G.boson g⁻¹ x))
    exact map_smul _ _ _

theorem core_action_apply {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (f : SmoothCore N) (x : Boson N) :
    core_action M G g f x = G.fermion g (f (G.boson g⁻¹ x)) := rfl

theorem core_action_related {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (f : SmoothCore N) (x : Boson N) :
    core_action M G g f (G.boson g x) = G.fermion g (f x) := by
  rw [core_action_apply]
  have hb : G.boson g⁻¹ (G.boson g x) = x := by
    calc
      _ = G.boson (g⁻¹ * g) x := by rw [map_mul]; rfl
      _ = x := by simp
  rw [hb]

theorem core_action_commutes {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (α : SpinIndex) (f : SmoothCore N) :
    M.charge α (core_action M G g f) =
      core_action M G g (M.charge α f) := by
  apply TestFunction.ext
  intro x
  obtain ⟨y, rfl⟩ := (G.boson g).surjective x
  rw [core_action_related M G g (M.charge α f) y]
  exact original_charge_related M G g α f (core_action M G g f)
    (core_action_related M G g f) y

theorem core_toL2_intertwines (M : AlgebraData 2) (G : M.GaugeData)
    (g : GaugeGroup 2) (f : SmoothCore 2) :
    coreToL2 (core_action M G g f) =
      sourceFullGaugePairCLM M G g (coreToL2 f) := by
  apply Lp.ext
  exact (coreToL2_ae (core_action M G g f)).trans
    (sourceFullGaugePairCLM_core_ae M G f g).symm

#print axioms core_action
#print axioms core_action_apply
#print axioms core_action_related
#print axioms core_action_commutes
#print axioms core_toL2_intertwines

end
end FCP.BFSSUGC1
