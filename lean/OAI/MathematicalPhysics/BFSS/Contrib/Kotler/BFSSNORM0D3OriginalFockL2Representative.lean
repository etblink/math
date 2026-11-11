import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D2OriginalPointwiseL2Membership

/-!
# NORM-0D D1-B — genuine original FullL2 class and representative independence

Use the accepted D1-A pointwise MemLp theorem to construct a true
FullL2 2 class from the genuine original normalized Fock operator
field. An independent representative changing on a null set gives
the same L2 class, via pinned MemLp.toLp_congr.

This does NOT yet bundle a continuous complex-linear multiplier or
establish original Hamiltonian/gauge-domain/spectral statements.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3OriginalFockL2Representative
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership

/-- A genuine original FullL2 2 output class, not a pointwise
function claimed to be in L2 without the D1-A MemLp certificate. -/
noncomputable def originalFockL2Action
    (B : GammaMatrix) (f : FullL2 2) : FullL2 2 :=
  (originalPointwiseFock_memLp B f).toLp
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))

/-- The L2 class has the source-original operator action almost
everywhere, not at every representative point. -/
theorem originalFockL2Action_ae (B : GammaMatrix) (f : FullL2 2) :
    (originalFockL2Action B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) :=
  MemLp.coeFn_toLp (originalPointwiseFock_memLp B f)

/-- If g is any a.e.-equal representative of f, the pointwise
original Fock image of g also belongs to L2. -/
private theorem originalPointwiseFock_memLp_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    MemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
      2 (volume : Measure (Boson 2)) := by
  apply MemLp.ae_eq ?_ (originalPointwiseFock_memLp B f)
  filter_upwards [hfg] with x hx
  exact congrArg (originalNormalizedFockGramObservable x B) hx

/-- The resulting actual FullL2 class is invariant under changing
the input representative on any null set. -/
theorem originalFockL2Action_toLp_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    originalFockL2Action B f =
      (originalPointwiseFock_memLp_of_rep B f g hfg).toLp
        (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) := by
  exact MemLp.toLp_congr
    (originalPointwiseFock_memLp B f)
    (originalPointwiseFock_memLp_of_rep B f g hfg)
    (by
      filter_upwards [hfg] with x hx
      exact congrArg (originalNormalizedFockGramObservable x B) hx)

/-- Representative independence, stated at the level of a.e. output
function equality as well as equality of L2 classes. -/
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
