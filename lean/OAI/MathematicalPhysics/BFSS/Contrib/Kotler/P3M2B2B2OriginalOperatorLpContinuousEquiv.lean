import Mathlib.Topology.Algebra.Module.Equiv
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B1OriginalOperatorLpTransport

/-!
# P3-M2B2B2 — named continuous original bounded-operator L² equivalence

This is ONLY a source-specific interface adapter for six already-qualified
B1 theorems. The original Fermion 2 bounded-operator-valued L² retains its
original operator norm; separate HS-column L² has a DIFFERENT norm.
This continuous linear equivalence is NOT a linear isometry.
No physical gauge, Spin(9), original Hamiltonian domain, or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- The original source operator-norm L² field and distinct HS-field L²
are continuously complex-linearly equivalent. This directly packages the
accepted B1 maps and their two full L² class inverse identities. -/
noncomputable def originalFockOperatorLpHSContinuousEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockOperatorLp ≃L[ℂ] OriginalFockHSFieldLp ι :=
  ContinuousLinearEquiv.equivOfInverse
    (originalFockOperatorLpToHSField b)
    (originalFockHSFieldLpToOperator b)
    (originalFockOperatorLp_recovered b)
    (originalFockHSFieldLp_recovered b)

/-- Forward original-Fock source bounded operators are evaluated almost
everywhere, NOT by identifying the original operator norm with HS norm. -/
theorem originalFockOperatorLpHSContinuousEquiv_apply_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    ((originalFockOperatorLpHSContinuousEquiv b f :
      OriginalFockHSFieldLp ι) : Boson 2 → OriginalFockHSFiber ι) =ᵐ[volume]
        (fun x : Boson 2 => originalFockOperatorHSContinuousEquiv b (f x)) := by
  change ((originalFockOperatorLpToHSField b f : OriginalFockHSFieldLp ι) :
    Boson 2 → OriginalFockHSFiber ι) =ᵐ[volume]
      (fun x : Boson 2 => originalFockOperatorHSContinuousEquiv b (f x))
  exact originalFockOperatorLpToHSField_ae b f

/-- Its inverse returns actual original bounded Fock operators almost
everywhere on the original Boson 2 volume measure. -/
theorem originalFockOperatorLpHSContinuousEquiv_symm_apply_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFieldLp ι) :
    (((originalFockOperatorLpHSContinuousEquiv b).symm u :
      OriginalFockOperatorLp) :
      Boson 2 → (Fermion 2 →L[ℂ] Fermion 2)) =ᵐ[volume]
        (fun x : Boson 2 =>
          (originalFockOperatorHSContinuousEquiv b).symm (u x)) := by
  change ((originalFockHSFieldLpToOperator b u : OriginalFockOperatorLp) :
    Boson 2 → (Fermion 2 →L[ℂ] Fermion 2)) =ᵐ[volume]
      (fun x : Boson 2 =>
        (originalFockOperatorHSContinuousEquiv b).symm (u x))
  exact originalFockHSFieldLpToOperator_ae b u

#print axioms originalFockOperatorLpHSContinuousEquiv
#print axioms originalFockOperatorLpHSContinuousEquiv_apply_ae
#print axioms originalFockOperatorLpHSContinuousEquiv_symm_apply_ae

end
end FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
