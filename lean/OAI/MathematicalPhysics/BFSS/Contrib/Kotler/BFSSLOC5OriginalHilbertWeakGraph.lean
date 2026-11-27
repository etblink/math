import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC4OriginalGlobalWeakGraph

/-! LOC5: exact Hilbert weak-pair characterization of the original individual
ambient graph. No physical adjoint-domain or ESA assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC5
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2L0 FCP.BFSSLOC4
open MeasureTheory

theorem core_hilbert_pairing {N : ℕ} (f : SmoothCore N) (u : FullL2 N) :
    inner ℂ (coreToL2 f) u = ∫ x, inner ℂ (f x) (u x) := by
  rw [L2.inner_def]
  apply integral_congr_ae
  filter_upwards [coreToL2_ae f] with x hx
  rw [hx]

theorem hilbert_pairing_mem_closed_graph {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : FullL2 N)
    (h : ∀ f : SmoothCore N,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v) :
    (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f)))) := by
  have hw : ChargeWeakPair M a (u : Boson N → Fermion N) v := by
    intro f
    rw [← core_hilbert_pairing (M.charge a f) u, ← core_hilbert_pairing f v]
    exact h f
  have hp := fullWeak_mem_closed_graph M a (u : Boson N → Fermion N)
    (v : Boson N → Fermion N) u.stronglyMeasurable v.stronglyMeasurable
    u.memLp v.memLp hw
  rw [Lp.toLp_coeFn u u.memLp, Lp.toLp_coeFn v v.memLp] at hp
  exact hp

theorem closed_graph_iff_hilbert_pairing {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : FullL2 N) :
    (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f)))) ↔
    ∀ f : SmoothCore N,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v := by
  constructor
  · intro hp f
    let S : Set (FullL2 N × FullL2 N) :=
      {p | inner ℂ (coreToL2 (M.charge a f)) p.1 = inner ℂ (coreToL2 f) p.2}
    have hc : IsClosed S := isClosed_eq
      (continuous_const.inner continuous_fst) (continuous_const.inner continuous_snd)
    have hs : Set.range (fun g : SmoothCore N =>
        (coreToL2 g, coreToL2 (M.charge a g))) ⊆ S := by
      rintro p ⟨g, rfl⟩
      exact M.charge_symmetric a f g
    exact closure_minimal hs hc hp
  · exact hilbert_pairing_mem_closed_graph M a u v

#print axioms core_hilbert_pairing
#print axioms hilbert_pairing_mem_closed_graph
#print axioms closed_graph_iff_hilbert_pairing

end
end FCP.BFSSLOC5
