import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC3OriginalStrongLocalization

/-! LOC4: assemble compact weak graph membership and strong expanding
localization into global ambient weak graph membership. No gauge-core or
essential self-adjointness assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC4
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2C0 FCP.BFSSMOLL2L0 FCP.BFSSMOLL2M0
open FCP.BFSSLOC0 FCP.BFSSLOC1 FCP.BFSSLOC2 FCP.BFSSLOC3
open MeasureTheory Filter
open scoped Topology

theorem localizedTarget_support {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (u v : Boson N → Fermion N) :
    tsupport (cutoffField χ v + cutoffError M a χ u) ⊆ tsupport χ := by
  apply closure_minimal
  · intro x hx
    by_contra hout
    have hv : cutoffField χ v x = 0 := by
      by_contra hn
      exact hout (cutoffField_support χ v (subset_closure
        (show x ∈ Function.support (cutoffField χ v) from hn)))
    have he : cutoffError M a χ u x = 0 := by
      by_contra hn
      exact hout (cutoffError_support M a χ u (subset_closure
        (show x ∈ Function.support (cutoffError M a χ u) from hn)))
    exact (show (cutoffField χ v + cutoffError M a χ u) x ≠ 0 from hx)
      (by simp [Pi.add_apply, hv, he])
  · exact isClosed_closure

theorem fullWeak_mem_closed_graph {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u v : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (h : ChargeWeakPair M a u v) :
    (h2u.toLp u, h2v.toLp v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f)))) := by
  let S := closure (Set.range (fun f : SmoothCore N =>
    (coreToL2 f, coreToL2 (M.charge a f))))
  have hm (n : ℕ) :
      (expandingFieldL2 n u hsmu h2u,
       expandingFieldL2 n v hsmv h2v + expandingErrorL2 M a n u hsmu h2u) ∈ S := by
    let χ := expandingCutoff N n
    let R : ℝ := 2 / cutoffScale n
    have hχ := expandingCutoff_smooth N n
    have hcu := expandingField_memLp n u hsmu h2u
    have hcv := expandingField_memLp n v hsmv h2v
    have he := expandingError_memLp M a n u hsmu h2u
    have hs1 : tsupport (cutoffField χ u) ⊆ Metric.closedBall 0 R :=
      (cutoffField_support χ u).trans (expandingCutoff_support N n)
    have hs2 : tsupport (cutoffField χ v + cutoffError M a χ u) ⊆
        Metric.closedBall 0 R :=
      (localizedTarget_support M a χ u v).trans (expandingCutoff_support N n)
    have hc1 : HasCompactSupport (cutoffField χ u) :=
      (isCompact_closedBall (0 : Boson N) R).of_isClosed_subset isClosed_closure hs1
    have hc2 : HasCompactSupport (cutoffField χ v + cutoffError M a χ u) :=
      (isCompact_closedBall (0 : Boson N) R).of_isClosed_subset isClosed_closure hs2
    have hp := compact_fullWeak_mem_closed_graph M a (cutoffField χ u)
      (cutoffField χ v + cutoffError M a χ u)
      (cutoffField_stronglyMeasurable χ hχ.continuous u hsmu)
      ((cutoffField_stronglyMeasurable χ hχ.continuous v hsmv).add
        (cutoffError_stronglyMeasurable M a χ hχ u hsmu))
      hcu (hcv.add he) hc1 hc2 R hs1
      (chargeWeakPair_cutoff M a χ hχ u v hcu hcv he h)
    change (hcu.toLp (cutoffField χ u),
      hcv.toLp (cutoffField χ v) + he.toLp (cutoffError M a χ u)) ∈ S
    rw [← MemLp.toLp_add hcv he]
    exact hp
  have ht := (expandingFieldL2_tendsto u hsmu h2u).prodMk_nhds
    ((expandingFieldL2_tendsto v hsmv h2v).add
      (expandingErrorL2_tendsto M a u hsmu h2u))
  have ht' : Tendsto (fun n =>
      (expandingFieldL2 n u hsmu h2u,
       expandingFieldL2 n v hsmv h2v + expandingErrorL2 M a n u hsmu h2u))
      atTop (𝓝 (h2u.toLp u, h2v.toLp v)) := by
    simpa only [add_zero] using ht
  exact isClosed_closure.mem_of_tendsto ht' (Eventually.of_forall hm)

#print axioms localizedTarget_support
#print axioms fullWeak_mem_closed_graph

end
end FCP.BFSSLOC4
