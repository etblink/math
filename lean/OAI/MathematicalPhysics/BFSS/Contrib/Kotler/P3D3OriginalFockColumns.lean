import Mathlib.Analysis.InnerProductSpace.PiL2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.T1OriginalFockTraceInvariance

/-!
# P3-D3 — original Fock operator finite-column equivalence

This identifies actual bounded complex-linear operators on Fermion 2 with
their values on a genuine arbitrary finite orthonormal basis.
No substitute representation, Hilbert--Schmidt norm instance, gauge law,
topological Spin action, closed Hamiltonian or spectral existence result.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D3OriginalFockColumns
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance

variable {ι : Type*} [Fintype ι]

/-- Exact source-Fock continuous endomorphisms as arbitrary finite columns. -/
noncomputable def originalFockColumns
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    (Fermion 2 →L[ℂ] Fermion 2) ≃ₗ[ℂ] (ι → Fermion 2) :=
  originalFockEndAlgEquiv.symm.toLinearEquiv.trans
    ((b.toBasis.constr ℂ).symm)

/-- Values of the column equivalence are actual original operator values. -/
@[simp] theorem originalFockColumns_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : Fermion 2 →L[ℂ] Fermion 2) (i : ι) :
    originalFockColumns b T i = T (b i) := by
  rfl

#print axioms originalFockColumns
#print axioms originalFockColumns_apply

end
end FCP.BFSSP3D3OriginalFockColumns
