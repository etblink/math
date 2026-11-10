import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bAOriginalFockGammaPhysicalStar

/-!
# P2b-B0 — original Fock physical-adjoint additivity microgate

Source-exact finite original Fermion 2 continuous complex-linear
operator carrier, original physical Hilbert adjoint, and already
accepted algebraic source Spin(9) action.

This isolates the only failing P2b-B1 tensor-addition proof step.
The physical adjoint is implemented by the same explicitly typed
ContinuousLinearMap.adjoint semilinear isometry used in the earlier
original normalized-Majorana self-adjointness proof.

No Clifford gamma generation, arbitrary operator star-equivariance,
Fock-vector unitary lift, gauge or spectral theorem is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Source-typed physical Hilbert adjoint is additive on the actual
original Fermion 2 continuous complex-linear operator algebra.

Do not ask typeclass synthesis to infer the nested `star_add` instance
inside the full 48-source Clifford-to-Fock transport. -/
theorem originalFock_physicalStar_add (X Y : OriginalFockOp) :
    star (X + Y) = star X + star Y := by
  change ContinuousLinearMap.adjoint (X + Y) =
    ContinuousLinearMap.adjoint X + ContinuousLinearMap.adjoint Y
  exact map_add
    (ContinuousLinearMap.adjoint :
      OriginalFockOp ≃ₗᵢ⋆[ℂ] OriginalFockOp) X Y

/-- If the exact original Spin(9) algebra automorphism preserves
the physical Fock adjoint separately on X and Y, then it does so
on X+Y. No premise asserts the global star theorem. -/
theorem originalFock_spinStarCompat_add
    (g : spinGroup source9Quadratic) (X Y : OriginalFockOp)
    (hX : source9Spin_originalFockOperatorAutomorphismHom g (star X) =
      star (source9Spin_originalFockOperatorAutomorphismHom g X))
    (hY : source9Spin_originalFockOperatorAutomorphismHom g (star Y) =
      star (source9Spin_originalFockOperatorAutomorphismHom g Y)) :
    source9Spin_originalFockOperatorAutomorphismHom g (star (X + Y)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g (X + Y)) := by
  have hAlphaAdd (S T : OriginalFockOp) :
      source9Spin_originalFockOperatorAutomorphismHom g (S + T) =
        source9Spin_originalFockOperatorAutomorphismHom g S +
          source9Spin_originalFockOperatorAutomorphismHom g T :=
    (source9Spin_originalFockOperatorAutomorphismHom g).toLinearEquiv.map_add S T
  calc
    source9Spin_originalFockOperatorAutomorphismHom g (star (X + Y)) =
      source9Spin_originalFockOperatorAutomorphismHom g (star X + star Y) :=
        congrArg
          (fun Z : OriginalFockOp =>
            source9Spin_originalFockOperatorAutomorphismHom g Z)
          (originalFock_physicalStar_add X Y)
    _ = source9Spin_originalFockOperatorAutomorphismHom g (star X) +
        source9Spin_originalFockOperatorAutomorphismHom g (star Y) :=
      hAlphaAdd (star X) (star Y)
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g X) +
        star (source9Spin_originalFockOperatorAutomorphismHom g Y) :=
      congrArg₂ (· + ·) hX hY
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g X +
        source9Spin_originalFockOperatorAutomorphismHom g Y) :=
      (originalFock_physicalStar_add
        (source9Spin_originalFockOperatorAutomorphismHom g X)
        (source9Spin_originalFockOperatorAutomorphismHom g Y)).symm
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g (X + Y)) :=
      congrArg star (hAlphaAdd X Y).symm

#print axioms originalFock_physicalStar_add
#print axioms originalFock_spinStarCompat_add

end
end FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge
