import Mathlib.Algebra.Algebra.Equiv
import Mathlib.Basic.Complex.Basic

/-!
# BFSS × QIT × SCC W0G0 — generic scalar commutation interface

This module is deliberately source-INDEPENDENT. It contains no
original BFSS Fock/Clifford operator, gamma, gauge or Hamiltonian
imports. The original W0B1 R1/R2 full Clifford induction is STOPPED.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0G0GenericScalarActionAdapter
noncomputable section

universe u v

/-- Scalar algebra-map images commute on the right with arbitrary
elements of an arbitrary complex algebra. No BFSS objects. -/
theorem generic_scalarImage_commutes
    {B : Type v} [Semiring B] [Algebra ℂ B] (T : B) (z : ℂ) :
    Commute T ((algebraMap ℂ B) z) :=
  Algebra.commute_algebraMap_right z T

/-- The image of a scalar algebra-map element under any complex
algebra equivalence commutes with all elements of its target.
Source-independent, not the stopped W0B1 Clifford theorem. -/
theorem generic_algEquiv_scalarImage_commutes
    {A : Type u} {B : Type v}
    [Semiring A] [Algebra ℂ A] [Semiring B] [Algebra ℂ B]
    (φ : A ≃ₐ[ℂ] B) (T : B) (z : ℂ) :
    Commute T (φ ((algebraMap ℂ A) z)) := by
  rw [AlgEquiv.commutes]
  exact generic_scalarImage_commutes T z

#print axioms generic_scalarImage_commutes
#print axioms generic_algEquiv_scalarImage_commutes

end
end FCP.BFSSP3M4W0G0GenericScalarActionAdapter
