import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0e1aOriginalJointLpAeSubsequence

/-!
MASSLESS-D0e1b — source-specific a.e.-limit identification for the
original maximal massless multiplication graph, at a smaller boundary
than global graph closedness. Assumes a common a.e. convergent pair
sequence and proves the resulting limit lies in the exact algebraic graph.
Does not assert full topological graph closure, symmetry, self-adjointness, or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0e1b
noncomputable section
open OAI
open OAI.BFSSQuantum
open MeasureTheory

/-- A graph sequence whose original FullL2 inputs and outputs both
converge pointwise a.e. has its pair of limits in the same maximal
original massless graph. No finite-volume or uniform multiplier bound
is assumed. -/
theorem originalMasslessGraph_mem_of_joint_ae_limits {N : ℕ}
    (M : AlgebraData N) (ψ η : ℕ → FullL2 N) (φ ζ : FullL2 N)
    (hgraph : ∀ n, (ψ n, η n) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph M)
    (hψ : ∀ᵐ x ∂(volume : Measure (Boson N)),
      Filter.Tendsto
        (fun n => (ψ n : Boson N → Fermion N) x)
        Filter.atTop (nhds ((φ : Boson N → Fermion N) x)))
    (hη : ∀ᵐ x ∂(volume : Measure (Boson N)),
      Filter.Tendsto
        (fun n => (η n : Boson N → Fermion N) x)
        Filter.atTop (nhds ((ζ : Boson N → Fermion N) x))) :
    (φ, ζ) ∈ FCP.BFSSMasslessD0c0.originalMasslessGraph M := by
  have hgraph_ae :
      ∀ n, FCP.BFSSMasslessD0b0.originalMasslessAction M (ψ n)
        =ᵐ[volume] (η n : Boson N → Fermion N) := by
    intro n
    obtain ⟨u, hu⟩ := hgraph n
    change ((u : FullL2 N),
        FCP.BFSSMasslessD0c0.originalMasslessMultiplier M u) =
      (ψ n, η n) at hu
    have huψ : (u : FullL2 N) = ψ n :=
      congrArg Prod.fst hu
    have huη : FCP.BFSSMasslessD0c0.originalMasslessMultiplier M u = η n :=
      congrArg Prod.snd hu
    rw [← huψ, ← huη]
    exact (FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae M u).symm
  have hgraph_all :
      ∀ᵐ x ∂(volume : Measure (Boson N)),
        ∀ n, FCP.BFSSMasslessD0b0.originalMasslessAction M (ψ n) x
          = (η n : Boson N → Fermion N) x :=
    ae_all_iff.2 hgraph_ae
  have haction :=
    FCP.BFSSMasslessD0e0.originalMasslessAction_preserves_ae_tendsto
      M ψ φ hψ
  have hlimit :
      FCP.BFSSMasslessD0b0.originalMasslessAction M φ
        =ᵐ[volume] (ζ : Boson N → Fermion N) := by
    filter_upwards [hgraph_all, haction, hη] with x hmatch hVa hηa
    have hseq :
        (fun n => FCP.BFSSMasslessD0b0.originalMasslessAction M (ψ n) x) =
          (fun n => (η n : Boson N → Fermion N) x) :=
      funext hmatch
    have hηVa : Filter.Tendsto
        (fun n => FCP.BFSSMasslessD0b0.originalMasslessAction M (ψ n) x)
        Filter.atTop (nhds ((ζ : Boson N → Fermion N) x)) := by
      rw [hseq]
      exact hηa
    exact tendsto_nhds_unique hVa hηVa
  have hmem : MemLp (FCP.BFSSMasslessD0b0.originalMasslessAction M φ) 2
      (volume : Measure (Boson N)) :=
    (memLp_congr_ae hlimit).2 (Lp.memLp ζ)
  let u : FCP.BFSSMasslessD0b0.originalMasslessDomain M := ⟨φ, hmem⟩
  have hmul : FCP.BFSSMasslessD0c0.originalMasslessMultiplier M u = ζ := by
    apply Lp.ext
    exact (FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae M u).trans hlimit
  change (φ, ζ) ∈
    LinearMap.range
      ((FCP.BFSSMasslessD0b0.originalMasslessDomain M).subtype.prod
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M))
  refine ⟨u, ?_⟩
  change ((u : FullL2 N),
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier M u) = (φ, ζ)
  exact Prod.ext rfl hmul

#print axioms originalMasslessGraph_mem_of_joint_ae_limits

end
end FCP.BFSSMasslessD0e1b
