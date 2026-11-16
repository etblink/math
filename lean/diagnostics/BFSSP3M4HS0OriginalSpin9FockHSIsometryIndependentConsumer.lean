import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4HS0OriginalSpin9FockHSIsometry

/-!
# Independent P3-M4-HS0 original Spin(9) HS-fiber consumer

Use the literal original Fermion 2 orthonormal basis and original
finite Hilbert column fiber. This test proves three separate consequences
from the proposed genuine source Fock operator star/trace action.
It does not assert a Fock-vector implementer, FullL2 Spin(9) action,
gauge-singlet or unbounded-domain result.
-/

set_option autoImplicit false
namespace FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometryIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometry

variable {ι : Type*} [Fintype ι]

/-- Native original Fock Hilbert columns preserve the complex pairing
under the genuine source Spin(9) operator star action. -/
theorem sourceSpin9HS_preserves_pairing
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u v : OriginalFockHSFiber ι) :
    ⟪originalSpin9FockHSFiberIsometry b g u,
      originalSpin9FockHSFiberIsometry b g v⟫_ℂ = ⟪u, v⟫_ℂ := by
  simpa only [originalSpin9FockHSFiberIsometry_apply] using
    (originalSpin9FockHSFiber_inner_invariant b g u v)

/-- HS norm is preserved on the explicitly separate original Fock
column Hilbert carrier. This is NOT an operator-norm identity. -/
theorem sourceSpin9HS_preserves_norm
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    ‖originalSpin9FockHSFiberIsometry b g u‖ = ‖u‖ :=
  (originalSpin9FockHSFiberIsometry b g).norm_map u

/-- Isometric action recovers the exact original Fock source operator,
rather than a new surrogate operator representation. -/
theorem sourceSpin9HS_recovers_source_operator
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalFockHSFiberToOperator b
      (originalSpin9FockHSFiberIsometry b g u) =
    FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAlgEquiv
      g (originalFockHSFiberToOperator b u) := by
  rw [originalSpin9FockHSFiberIsometry_apply]
  exact originalSpin9FockHSFiberLinearEquiv_toOperator b g u

#print axioms sourceSpin9HS_preserves_pairing
#print axioms sourceSpin9HS_preserves_norm
#print axioms sourceSpin9HS_recovers_source_operator

end
end FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometryIndependentConsumer
