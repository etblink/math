import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0e1bOriginalGraphAeLimitIdentification

/-!
MASSLESS-D0e1c — topological closedness of the exact original
maximal massless Fock-multiplication graph for arbitrary AlgebraData N.
Combines qualified common FullL2 subsequence extraction (D0e1a) and
source-exact a.e. graph-limit identification (D0e1b), in a generic
source-only theorem. The paired SU(2) consumer is a separate gate.
No self-adjointness, boundedness, gauge or spectral conclusion.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0e1c
noncomputable section
open OAI
open OAI.BFSSQuantum
open MeasureTheory

/-- The original maximal massless multiplier graph is closed in the
product of the original L² Hilbert spaces. No globally bounded
multiplication field or finite bosonic volume is required. -/
theorem originalMasslessGraph_isClosed {N : ℕ} (M : AlgebraData N) :
    IsClosed (FCP.BFSSMasslessD0c0.originalMasslessGraph M :
      Set (FullL2 N × FullL2 N)) := by
  apply IsSeqClosed.isClosed
  intro u p hgraph hp
  have hψ : Filter.Tendsto (fun n => (u n).1) Filter.atTop
      (nhds p.1) :=
    (continuous_fst.tendsto p).comp hp
  have hη : Filter.Tendsto (fun n => (u n).2) Filter.atTop
      (nhds p.2) :=
    (continuous_snd.tendsto p).comp hp
  obtain ⟨ns, hns, hψae, hηae⟩ :=
    FCP.BFSSMasslessD0e1a.originalFullL2_joint_ae_subsequence
      (fun n => (u n).1) (fun n => (u n).2) p.1 p.2 hψ hη
  have hgraph_ns (n : ℕ) :
      ((u (ns n)).1, (u (ns n)).2) ∈
        FCP.BFSSMasslessD0c0.originalMasslessGraph M := by
    simpa only [Prod.mk.eta] using hgraph (ns n)
  have hlim :=
    FCP.BFSSMasslessD0e1b.originalMasslessGraph_mem_of_joint_ae_limits
      M (fun n => (u (ns n)).1) (fun n => (u (ns n)).2)
      p.1 p.2 hgraph_ns hψae hηae
  simpa only [Prod.mk.eta] using hlim

#print axioms originalMasslessGraph_isClosed

end
end FCP.BFSSMasslessD0e1c
