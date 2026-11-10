import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB3OriginalFockStarAutomorphismAction

/-!
Independent external consumer of original source Spin(9) physical-star
automorphisms on literal Fermion 2. Separately test the underlying C6A
action, physical adjoint, and actual group composition order. No
implementing vector unitary, continuity, gauge or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB3OriginalFockStarAutomorphismIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    (source9Spin_originalFockOperatorStarAlgEquiv g).toAlgEquiv T =
      source9Spin_originalFockOperatorAutomorphismHom g T :=
  source9Spin_originalFockOperatorStarAlgEquiv_apply g T

example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    source9Spin_originalFockOperatorStarAlgEquiv g (star T) =
      star (source9Spin_originalFockOperatorStarAlgEquiv g T) :=
  by
    change
      source9Spin_originalFockOperatorAutomorphismHom g (star T) =
        star (source9Spin_originalFockOperatorAutomorphismHom g T)
    exact
      FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar.source9Spin_originalFockOperator_global_map_star
        g T

/-- Verify the source Spin(9) multiplication in the *star* target, not
just the earlier algebra-equivalence target. -/
theorem originalFock_starAction_mul_on_operator
    (g h : spinGroup source9Quadratic) (T : OriginalFockOp) :
    source9Spin_originalFockOperatorStarAutomorphismHom (g * h) T =
      source9Spin_originalFockOperatorStarAutomorphismHom g
        (source9Spin_originalFockOperatorStarAutomorphismHom h T) := by
  have hh := congrArg
    (fun e : OriginalFockOp ≃⋆ₐ[ℂ] OriginalFockOp => e T)
    (map_mul source9Spin_originalFockOperatorStarAutomorphismHom g h)
  simpa only [StarAlgEquiv.mul_apply] using hh

/-- Self-adjointness is preserved on the true original operator carrier. -/
theorem originalFock_starAction_selfAdjoint
    (g : spinGroup source9Quadratic) (T : OriginalFockOp)
    (h : IsSelfAdjoint T) :
    IsSelfAdjoint (source9Spin_originalFockOperatorStarAlgEquiv g T) := by
  change star (source9Spin_originalFockOperatorAutomorphismHom g T) =
    source9Spin_originalFockOperatorAutomorphismHom g T
  rw [
    ← FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar.source9Spin_originalFockOperator_global_map_star
      g T,
    h.star_eq]

#print axioms FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAlgEquiv
#print axioms FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAlgEquiv_apply
#print axioms FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAutomorphismHom
#print axioms originalFock_starAction_mul_on_operator
#print axioms originalFock_starAction_selfAdjoint

end
end FCP.BFSSP2bB3OriginalFockStarAutomorphismIndependentAudit
