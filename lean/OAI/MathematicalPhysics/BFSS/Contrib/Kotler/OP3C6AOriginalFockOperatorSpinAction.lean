import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C5BOriginalComplexCliffordSpinAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe

/-!
# OP3-C6A — actual original Fock-operator Spin(9) algebraic action

Transport the strictly qualified original complex Clifford Spin(9)
automorphism-valued MonoidHom from OP3-C5B across the already qualified
M3I algebra equivalence onto the literal original Fermion 2 continuous
complex-linear operator algebra, with no new Fock model or implementer.

Prove the exact conjugation formula on an arbitrary original Fock
operator. This is an algebraic operator automorphism, NOT automatically
a physical-adjoint star equivalence, continuity, Fock-vector unitary,
source center-parity implementation, gauge/closed-Hamiltonian-domain
compatibility or spectral result.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Exact algebraic Spin(9) action on all continuous linear operators
of the original 24-mode Fermion 2 Fock Hilbert space, transported
through the qualified M3I complex Clifford--Fock AlgEquiv. -/
noncomputable def source9Spin_originalFockOperatorAutomorphismHom :
    spinGroup source9Quadratic →*
      (OriginalFockOp ≃ₐ[ℂ] OriginalFockOp) :=
  (AlgEquiv.autCongr
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).toMonoidHom.comp
      source9Spin_originalComplexCliffordAutomorphismHom

/-- Pointwise identification of the bundled group action with the
specific M3I-transferred OP3-C5B complex Clifford action. -/
theorem source9Spin_originalFockOperatorAutomorphismHom_apply
    (g : spinGroup source9Quadratic) :
    source9Spin_originalFockOperatorAutomorphismHom g =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv.symm.trans
        ((source9Spin_originalComplexCliffordAutomorphismHom g).trans
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv) := by
  rfl

/-- Exact conjugated evaluation at each genuine original Fock operator.
This does not assert equality with a unitary conjugation on Fock vectors. -/
theorem source9Spin_originalFockOperatorAutomorphismHom_apply_operator
    (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    (source9Spin_originalFockOperatorAutomorphismHom g) T =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((source9Spin_originalComplexCliffordAutomorphismHom g)
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv.symm T)) := by
  rw [source9Spin_originalFockOperatorAutomorphismHom_apply]
  rfl

#print axioms source9Spin_originalFockOperatorAutomorphismHom
#print axioms source9Spin_originalFockOperatorAutomorphismHom_apply
#print axioms source9Spin_originalFockOperatorAutomorphismHom_apply_operator

end
end FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
