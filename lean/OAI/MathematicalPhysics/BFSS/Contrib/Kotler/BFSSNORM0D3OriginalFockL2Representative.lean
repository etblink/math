import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D2OriginalPointwiseL2Membership

/-!
# NORM-0D D1-B — original FullL2 class and representative independence

The accepted D1-A MemLp result is lifted to the genuine original FullL2 2
carrier. Generic, type-parametric Lp certificates isolate the a.e.
quotient/proof of representative independence from the large original
2^24-dimensional Fock fiber; no surrogate Hamiltonian/model is used.

A continuous complex-linear multiplier is NOT yet constructed (D2).
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3OriginalFockL2Representative
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership

/-- Generic Lp quotient certificate: package the genuine Lp class
with its a.e. representative law before any BFSS specialization. -/
private noncomputable def certifiedLp
    {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E]
    {μ : Measure α} {p : ℝ≥0∞}
    (q : α → E) (hq : MemLp q p μ) :
    {u : Lp E p μ // (u : α → E) =ᵐ[μ] q} :=
  ⟨hq.toLp q, MemLp.coeFn_toLp hq⟩

/-- Generic quotient-invariance proof using only Lp.ext and a.e.
equality; elaborated without unfolding the BFSS Fermion fiber. -/
private theorem certifiedLp_eq_toLp_of_ae
    {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E]
    {μ : Measure α} {p : ℝ≥0∞}
    (q r : α → E) (hq : MemLp q p μ) (hr : MemLp r p μ)
    (hqr : q =ᵐ[μ] r) :
    (certifiedLp q hq).1 = hr.toLp r := by
  apply Lp.ext
  exact (certifiedLp q hq).2.trans
    (hqr.trans (MemLp.coeFn_toLp hr).symm)

/-- An actual original FullL2 2 output, constructed from the
accepted original D1-A MemLp proof via the generic certificate. -/
noncomputable def originalFockL2Action
    (B : GammaMatrix) (f : FullL2 2) : FullL2 2 :=
  (certifiedLp
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (originalPointwiseFock_memLp B f)).1

/-- The original output class agrees a.e. with genuine original
pointwise normalized Fock multiplication. -/
theorem originalFockL2Action_ae (B : GammaMatrix) (f : FullL2 2) :
    (originalFockL2Action B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  exact (certifiedLp
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (originalPointwiseFock_memLp B f)).2

/-- Every a.e.-equal representative of f retains the original
pointwise Fock image's L2 membership. -/
private theorem originalPointwiseFock_memLp_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    MemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
      2 (volume : Measure (Boson 2)) := by
  apply MemLp.ae_eq ?_ (originalPointwiseFock_memLp B f)
  filter_upwards [hfg] with x hx
  exact congrArg (originalNormalizedFockGramObservable x B) hx

/-- The actual original FullL2 output is unchanged when its input
representative is changed on a null set. -/
theorem originalFockL2Action_toLp_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    originalFockL2Action B f =
      (originalPointwiseFock_memLp_of_rep B f g hfg).toLp
        (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) := by
  exact certifiedLp_eq_toLp_of_ae
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
    (originalPointwiseFock_memLp B f)
    (originalPointwiseFock_memLp_of_rep B f g hfg)
    (by
      filter_upwards [hfg] with x hx
      exact congrArg (originalNormalizedFockGramObservable x B) hx)

/-- Representative independence at the a.e.-output level. -/
theorem originalFockL2Action_ae_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    (originalFockL2Action B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) := by
  filter_upwards [originalFockL2Action_ae B f, hfg] with x hx hfgx
  exact hx.trans (congrArg (originalNormalizedFockGramObservable x B) hfgx)

#print axioms originalFockL2Action
#print axioms originalFockL2Action_ae
#print axioms originalFockL2Action_toLp_rep
#print axioms originalFockL2Action_ae_of_rep

end
end FCP.BFSSNORM0D3OriginalFockL2Representative
