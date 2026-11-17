import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0G0GenericScalarActionAdapter

/-!
# W0G0 independent consumer — generic and concrete scalar transport

Imports only the W0G0 generic module and its dependencies.
Does not import any stopped W0B1 source or construct a BFSS Fock operator.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0G0GenericScalarActionIndependentConsumer
noncomputable section

open FCP.BFSSP3M4W0G0GenericScalarActionAdapter

universe u v

theorem generic_scalarImage_commutes_consumer
    {B : Type v} [Semiring B] [Algebra ℂ B] (T : B) (z : ℂ) :
    Commute T ((algebraMap ℂ B) z) :=
  generic_scalarImage_commutes T z

theorem generic_algEquiv_scalarImage_commutes_consumer
    {A : Type u} {B : Type v}
    [Semiring A] [Algebra ℂ A] [Semiring B] [Algebra ℂ B]
    (φ : A ≃ₐ[ℂ] B) (T : B) (z : ℂ) :
    Commute T (φ ((algebraMap ℂ A) z)) :=
  generic_algEquiv_scalarImage_commutes φ T z

example (T z : ℂ) : Commute T ((algebraMap ℂ ℂ) z) :=
  generic_scalarImage_commutes_consumer T z

example (T z : ℂ) :
    Commute T ((AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ) ((algebraMap ℂ ℂ) z)) :=
  generic_algEquiv_scalarImage_commutes_consumer (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ) T z

#print axioms generic_scalarImage_commutes_consumer
#print axioms generic_algEquiv_scalarImage_commutes_consumer

end
end FCP.BFSSP3M4W0G0GenericScalarActionIndependentConsumer
