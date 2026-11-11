import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D2OriginalPointwiseL2Membership

/-!
# NORM-0D D1-B microgate — exact original FullL2 carrier bridge

An independently testable original-source interface, not the held
D1-B multiplication theorem. Lift any MemLp-certified function of
Boson 2 into the *original* Fermion 2-valued FullL2 2, and establish
its almost-everywhere representative and quotient compatibility.

This microgate deliberately leaves application to the particular
normalized Fock field to a separate importing consumer. It adds no
finite-volume assumption, new physical model, or Hamiltonian claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3AOriginalLpCarrierBridge
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory

/-- Lift a certified function on the literal original bosonic
configuration and Fock-vector fibers into the actual FullL2 2. -/
noncomputable def originalCarrierLpOfMemLp
    (q : Boson 2 → Fermion 2)
    (hq : MemLp q 2 (volume : Measure (Boson 2))) : FullL2 2 :=
  hq.toLp q

/-- Equality with the original representative is almost everywhere,
not an everywhere equality between chosen Lp representatives. -/
theorem originalCarrierLpOfMemLp_ae
    (q : Boson 2 → Fermion 2)
    (hq : MemLp q 2 (volume : Measure (Boson 2))) :
    (originalCarrierLpOfMemLp q hq : Boson 2 → Fermion 2) =ᵐ[volume] q := by
  exact MemLp.coeFn_toLp hq

/-- Original L2 quotient invariance, with explicit original fiber and
volume types instead of reducing the Fock-field expression. -/
theorem originalCarrierLpOfMemLp_congr
    (q r : Boson 2 → Fermion 2)
    (hq : MemLp q 2 (volume : Measure (Boson 2)))
    (hr : MemLp r 2 (volume : Measure (Boson 2)))
    (hqr : q =ᵐ[volume] r) :
    originalCarrierLpOfMemLp q hq = originalCarrierLpOfMemLp r hr := by
  apply Lp.ext
  exact (originalCarrierLpOfMemLp_ae q hq).trans
    (hqr.trans (originalCarrierLpOfMemLp_ae r hr).symm)

#print axioms originalCarrierLpOfMemLp
#print axioms originalCarrierLpOfMemLp_ae
#print axioms originalCarrierLpOfMemLp_congr

end
end FCP.BFSSNORM0D3AOriginalLpCarrierBridge
