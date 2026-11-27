import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2L0OriginalFullWeakPairReduction

/-! MOL-L2M0: compact full-charge weak pairs lie in the closure of
the literal original individual ambient smooth-core graph. The core here
is the full smooth core, not yet the gauge-invariant core. No ESA claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2M0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open FCP.BFSSMOLL2H0 FCP.BFSSMOLL2I0 FCP.BFSSMOLL2K0 FCP.BFSSMOLL2L0
open MeasureTheory Filter
open scoped Topology

theorem kinetic_potential_target_cancel {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (h2u : MemLp u 2 volume)
    (h2v : MemLp v 2 volume) (R : ℝ)
    (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (hw : MemLp (v - potentialField M a u) 2 volume) :
    hw.toLp (v - potentialField M a u) +
      potentialL2 M a u hsmu h2u R hR = h2v.toLp v := by
  have hV := potentialField_memLp M a u hsmu h2u R hR
  change (h2v.sub hV).toLp (v - potentialField M a u) +
    hV.toLp (potentialField M a u) = h2v.toLp v
  rw [MemLp.toLp_sub h2v hV, sub_add_cancel]

theorem concrete_fullWeak_charge_tendsto {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hu : LocallyIntegrable u volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    Tendsto (fun n => coreToL2 (M.charge a
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu)))
      atTop (𝓝 (h2v.toLp v)) := by
  obtain ⟨hsmw, h2w, hw, hsw, hkin⟩ :=
    compact_chargeWeakPair_reduction M a u v hsmu hsmv h2u h2v hsu hsv R hR h
  have ht := concrete_mollified_charge_tendsto M a u (v - potentialField M a u)
    hsmu h2u hsmw h2w hu hw hsu hsw R hR hkin
  rw [kinetic_potential_target_cancel M a u v hsmu h2u h2v (R + 1)
    (input_support_enlarged u R hR) h2w] at ht
  exact ht

theorem concrete_fullWeak_graph_tendsto {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hu : LocallyIntegrable u volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    Tendsto (fun n =>
      (coreToL2 (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu),
       coreToL2 (M.charge a
        (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu))))
      atTop (𝓝 (h2u.toLp u, h2v.toLp v)) :=
  (concrete_mollified_tendsto u hsmu h2u hu hsu).prodMk_nhds
    (concrete_fullWeak_charge_tendsto M a u v hsmu hsmv h2u h2v hu hsu hsv R hR h)

theorem compact_fullWeak_mem_closed_graph {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    (h2u.toLp u, h2v.toLp v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f)))) := by
  have hu : LocallyIntegrable u volume := h2u.locallyIntegrable (by norm_num)
  exact mem_closure_of_tendsto
    (concrete_fullWeak_graph_tendsto M a u v hsmu hsmv h2u h2v hu hsu hsv R hR h)
    (Eventually.of_forall (fun n => Set.mem_range_self
      (f := fun f : SmoothCore N => (coreToL2 f, coreToL2 (M.charge a f)))
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu)))

#print axioms kinetic_potential_target_cancel
#print axioms concrete_fullWeak_charge_tendsto
#print axioms concrete_fullWeak_graph_tendsto
#print axioms compact_fullWeak_mem_closed_graph

end
end FCP.BFSSMOLL2M0
