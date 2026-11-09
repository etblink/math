import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientMatrixUnitDiagnostic

/-!
F1F symbolic skew-plane transport.

Generic real-module statement: given an independently verified
matrix-plane identification, transport it through the already-qualified
abstract half-coefficient LinearMap by congrArg, then apply its accepted
skew-plane formula. Do not specialize to the concrete original-Fock
operator type within this theorem.

The separate original source F1E plane identity and any Fock
specialization remain independent proof obligations.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractPlaneTransport
noncomputable section

open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FAbstractMatrixUnits

variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module ℝ M]

/-- Symbolic congruence transport for a named skew plane; no Fock
instances, CAR expansion, or replacement operator representation. -/
theorem halfCoefficientLinearMap_skewPlane_of_eq
    (T : ι → ι → M)
    (P : ι → ι → Matrix ι ι ℝ)
    (hP : ∀ p q, P p q =
      Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ))
    (p q : ι) :
    halfCoefficientLinearMap T (P p q) =
      (1 / 2 : ℝ) • (T p q - T q p) :=
  (congrArg
    (fun A : Matrix ι ι ℝ => halfCoefficientLinearMap T A)
    (hP p q)).trans
    (halfCoefficientLinearMap_skewPlane T p q)

#print axioms halfCoefficientLinearMap_skewPlane_of_eq

end
end FCP.BFSSF1FAbstractPlaneTransport
