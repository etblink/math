import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5BOriginalNativeClosedChargeCoreEnergy
import OAI.MathematicalPhysics.BFSS.Cutoffs

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E7
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSGM5B
open MeasureTheory

private theorem smoothEquivariant_mem_physical
    (M : AlgebraData 2) (G : M.GaugeData) (f : SmoothCore 2)
    (h : ∀ g x, f (G.boson g x) = G.fermion g (f x)) :
    coreToL2 f ∈ G.physicalSpace := by
  change coreToL2 f ∈
    (⨅ g : GaugeGroup 2, LinearMap.ker (G.bosonPullback g - G.fiberAction g))
  rw [Submodule.mem_iInf]
  intro g
  change (G.bosonPullback g - G.fiberAction g) (coreToL2 f) = 0
  apply sub_eq_zero.mpr
  apply Lp.ext_iff.mpr
  have hp := Lp.coeFn_compMeasurePreserving (coreToL2 f) (G.boson g).measurePreserving
  have hf := ContinuousLinearMap.coeFn_compLp
    (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap (coreToL2 f)
  have hg := (coreToL2_ae f).comp_tendsto
    (G.boson g).measurePreserving.quasiMeasurePreserving.tendsto_ae
  filter_upwards [hp, hf, hg, coreToL2_ae f] with x hp' hf' hg' hfx
  calc
    (G.bosonPullback g (coreToL2 f) : Boson 2 → Fermion 2) x =
        (coreToL2 f : Boson 2 → Fermion 2) (G.boson g x) := hp'
    _ = f (G.boson g x) := hg'
    _ = G.fermion g (f x) := h g x
    _ = G.fermion g ((coreToL2 f : Boson 2 → Fermion 2) x) :=
      congrArg (G.fermion g) hfx.symm
    _ = (G.fiberAction g (coreToL2 f) : Boson 2 → Fermion 2) x := hf'.symm

/-- Real smooth gauge-invariant multiplication preserves the original
physical smooth form core. -/
def gaugeInvariantRealCutoff (M : AlgebraData 2) (G : M.GaugeData)
    (χ : Boson 2 → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (hg : ∀ g x, χ (G.boson g x) = χ x) (f : G.invariantCore) : G.invariantCore := by
  refine ⟨realCutoff χ hχ f.val, ?_⟩
  change coreToL2 (realCutoff χ hχ f.val) ∈ G.physicalSpace
  apply smoothEquivariant_mem_physical M G
  intro g x
  change (χ (G.boson g x) : ℂ) • f.val (G.boson g x) =
    G.fermion g ((χ x : ℂ) • f.val x)
  rw [hg g x, G.invariantCore_equivariant f g x]
  exact ((G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap.map_smul
    (χ x : ℂ) (f.val x)).symm

/-- IMS localization for the literal native closed charge column evaluated
on the original invariant smooth core. -/
theorem nativeCoreCutoff_ims (M : AlgebraData 2) (G : M.GaugeData)
    {ι : Type*} [Fintype ι] (χ : ι → Boson 2 → ℝ)
    (hχ : ∀ j, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (χ j))
    (hg : ∀ j g x, χ j (G.boson g x) = χ j x)
    (hpart : ∀ x, ∑ j, χ j x ^ 2 = 1) (f : G.invariantCore) :
    (∑ j, (1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn M G
      (closedChargeCoreInput M G (gaugeInvariantRealCutoff M G (χ j) (hχ j) (hg j) f))‖ ^ 2) =
      (1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn M G
        (closedChargeCoreInput M G f)‖ ^ 2 + (1 / 2 : ℝ) *
          ∑ j, ∫ x, ‖cutoffGradient (χ j) x‖ ^ 2 * ‖f.val x‖ ^ 2 := by
  simp only [closedChargeCoreForm]
  exact M.coreForm_ims χ hχ hpart f.val

#print axioms gaugeInvariantRealCutoff
#print axioms nativeCoreCutoff_ims

end
end FCP.BFSSGM5E7
