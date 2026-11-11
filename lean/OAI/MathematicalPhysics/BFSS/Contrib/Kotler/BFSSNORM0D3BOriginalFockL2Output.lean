import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3AOriginalLpCarrierBridge

/-!
# NORM-0D D1-B production microgate — original Fock FullL2 output

Use the strictly qualified original-carrier Lp bridge to construct an
actual source-original FullL2 2 class for the normalized Fock field.
The only quotient result used is the already-qualified bridge theorem.

The previously held monolithic D1-B source stays frozen. Equality of
output classes across arbitrary representatives, a continuous complex
linear multiplier and any original Hamiltonian spectral claim remain
outside this small gate.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3BOriginalFockL2Output
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership
open FCP.BFSSNORM0D3AOriginalLpCarrierBridge

/-- Genuine original FullL2 output for the fixed original normalized
Fock field and any original square-integrable fermionic wavefunction. -/
noncomputable def originalFockL2Output
    (B : GammaMatrix) (f : FullL2 2) : FullL2 2 :=
  originalCarrierLpOfMemLp
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (originalPointwiseFock_memLp B f)

/-- The actual original FullL2 output agrees almost everywhere with
the source-original pointwise field action. -/
theorem originalFockL2Output_ae (B : GammaMatrix) (f : FullL2 2) :
    (originalFockL2Output B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  simpa only [originalFockL2Output] using
    (originalCarrierLpOfMemLp_ae
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      (originalPointwiseFock_memLp B f))

/-- Changing the input representative changes the pointwise expression
only on a null set. This is an a.e. output law, not yet a second
toLp-class equality theorem. -/
theorem originalFockL2Output_ae_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    (originalFockL2Output B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) := by
  filter_upwards [originalFockL2Output_ae B f, hfg] with x hL2 hx
  exact hL2.trans (congrArg (originalNormalizedFockGramObservable x B) hx)

#print axioms originalFockL2Output
#print axioms originalFockL2Output_ae
#print axioms originalFockL2Output_ae_of_rep

end
end FCP.BFSSNORM0D3BOriginalFockL2Output
