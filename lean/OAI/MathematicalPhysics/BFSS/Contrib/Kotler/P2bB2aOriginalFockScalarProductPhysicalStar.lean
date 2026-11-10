import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB0OriginalFockAdjointAdditiveBridge

/-!
# BFSS P2b-B2a — exact original Fock operator scalar/product physical-star microgate

Prepare the scalar and multiplication constructors for CliffordAlgebra.induction
without making any assertion of physical-star compatibility on all operators.

The carrier is the actual original Fermion 2 →L[ℂ] Fermion 2; the star is
the physical Hilbert adjoint. The original Spin(9) algebra automorphism is
the qualified C6A action. The scalar law uses source complex algebraMap,
not a surrogate matrix representation, and the product law reverses
physical-adjoint multiplication order.

No default odd Clifford star, altered operator action, Fock-vector lift,
gauge-projection, Hilbert–Schmidt unitary, unbounded-domain or spectral
conclusion is introduced.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- The physical Hilbert adjoint reverses multiplication of genuine
original continuous Fock operators. This uses the exactly typed
adjoint-of-composition interface, not a generic `star_mul _ _` search. -/
theorem originalFock_physicalStar_mul (S T : OriginalFockOp) :
    star (S * T) = star T * star S := by
  change ContinuousLinearMap.adjoint (S ∘L T) =
    ContinuousLinearMap.adjoint T ∘L ContinuousLinearMap.adjoint S
  exact ContinuousLinearMap.adjoint_comp S T

/-- Source Spin(9) fixes the complex scalar algebraMap of the actual
original Fock-operator algebra, and therefore preserves physical Hilbert
adjoints on this scalar subalgebra. The scalar star is conjugate-linear,
not an assertion that arbitrary complex scalars are self-adjoint. -/
theorem source9Spin_originalFockOperator_algebraMap_map_star
    (g : spinGroup source9Quadratic) (z : ℂ) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star ((algebraMap ℂ OriginalFockOp) z)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        ((algebraMap ℂ OriginalFockOp) z)) := by
  calc
    source9Spin_originalFockOperatorAutomorphismHom g
        (star ((algebraMap ℂ OriginalFockOp) z)) =
      source9Spin_originalFockOperatorAutomorphismHom g
        ((algebraMap ℂ OriginalFockOp) (star z)) := by
          exact congrArg
            (fun X : OriginalFockOp =>
              source9Spin_originalFockOperatorAutomorphismHom g X)
            (algebraMap_star_comm z (A := OriginalFockOp)).symm
    _ = (algebraMap ℂ OriginalFockOp) (star z) := by
          exact
            (source9Spin_originalFockOperatorAutomorphismHom g).commutes (star z)
    _ = star ((algebraMap ℂ OriginalFockOp) z) :=
          algebraMap_star_comm z (A := OriginalFockOp)
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g
        ((algebraMap ℂ OriginalFockOp) z)) := by
          exact congrArg star
            ((source9Spin_originalFockOperatorAutomorphismHom g).commutes z).symm

/-- The exact original Spin(9) action preserves physical-star
compatibility under multiplication, provided the two original Fock
operators already individually satisfy compatibility.

This is a conditional closure result, not a global assertion for all S,T. -/
theorem source9Spin_originalFockOperator_mul_map_star
    (g : spinGroup source9Quadratic) (S T : OriginalFockOp)
    (hS : source9Spin_originalFockOperatorAutomorphismHom g (star S) =
      star (source9Spin_originalFockOperatorAutomorphismHom g S))
    (hT : source9Spin_originalFockOperatorAutomorphismHom g (star T) =
      star (source9Spin_originalFockOperatorAutomorphismHom g T)) :
    source9Spin_originalFockOperatorAutomorphismHom g (star (S * T)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g (S * T)) := by
  have hAlphaMul (X Y : OriginalFockOp) :
      source9Spin_originalFockOperatorAutomorphismHom g (X * Y) =
        source9Spin_originalFockOperatorAutomorphismHom g X *
          source9Spin_originalFockOperatorAutomorphismHom g Y :=
    (source9Spin_originalFockOperatorAutomorphismHom g).map_mul X Y
  calc
    source9Spin_originalFockOperatorAutomorphismHom g (star (S * T)) =
      source9Spin_originalFockOperatorAutomorphismHom g (star T * star S) :=
        congrArg
          (fun X : OriginalFockOp =>
            source9Spin_originalFockOperatorAutomorphismHom g X)
          (originalFock_physicalStar_mul S T)
    _ = source9Spin_originalFockOperatorAutomorphismHom g (star T) *
        source9Spin_originalFockOperatorAutomorphismHom g (star S) :=
      hAlphaMul (star T) (star S)
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g T) *
        star (source9Spin_originalFockOperatorAutomorphismHom g S) :=
      congrArg₂ (· * ·) hT hS
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g S *
        source9Spin_originalFockOperatorAutomorphismHom g T) :=
      (originalFock_physicalStar_mul
        (source9Spin_originalFockOperatorAutomorphismHom g S)
        (source9Spin_originalFockOperatorAutomorphismHom g T)).symm
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g (S * T)) :=
      congrArg star (hAlphaMul S T).symm

#print axioms originalFock_physicalStar_mul
#print axioms source9Spin_originalFockOperator_algebraMap_map_star
#print axioms source9Spin_originalFockOperator_mul_map_star

end
end FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar
