import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB2OriginalFockGlobalPhysicalStar

/-!
Independent external consumer of BOTH exact source P2b-B2 declarations.
The only carrier is the true original 24-complex-mode Fermion 2
continuous complex-linear endomorphism algebra. No surrogate
matrix/Clifford star and no physical spectral consequence is assumed.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB2OriginalFockGlobalPhysicalStarIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (g : spinGroup source9Quadratic)
    (x : CliffordAlgebra (source48Quadratic.baseChange ℂ)) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv x)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv x)) :=
  source9Spin_originalFockOperator_clifford_map_star g x

example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    source9Spin_originalFockOperatorAutomorphismHom g (star T) =
      star (source9Spin_originalFockOperatorAutomorphismHom g T) :=
  source9Spin_originalFockOperator_global_map_star g T

/-- Independent typed consumer: source action transports a genuine
original Fock self-adjoint operator to a genuine self-adjoint operator. -/
theorem originalFock_selfAdjoint_preserved
    (g : spinGroup source9Quadratic) (T : OriginalFockOp)
    (h : IsSelfAdjoint T) :
    IsSelfAdjoint (source9Spin_originalFockOperatorAutomorphismHom g T) := by
  change star (source9Spin_originalFockOperatorAutomorphismHom g T) =
    source9Spin_originalFockOperatorAutomorphismHom g T
  rw [← source9Spin_originalFockOperator_global_map_star g T, h.star_eq]

#print axioms FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar.source9Spin_originalFockOperator_clifford_map_star
#print axioms FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar.source9Spin_originalFockOperator_global_map_star
#print axioms originalFock_selfAdjoint_preserved

end
end FCP.BFSSP2bB2OriginalFockGlobalPhysicalStarIndependentAudit
