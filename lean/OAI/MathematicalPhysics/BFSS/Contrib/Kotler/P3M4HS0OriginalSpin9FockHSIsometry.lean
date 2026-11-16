import Mathlib.Analysis.InnerProductSpace.LinearMap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2AOriginalFockHSFiber
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1AOriginalFockTracePairing

/-!
# P3-M4-HS0 — original source Spin(9) isometry on exact Fock HS columns

Use the already accepted original B3 physical-star automorphism, T1 exact
operator trace, OP1A trace-pairing invariance and M2A original Hilbert
column equivalence. No reconstructed Fock model or operator-norm-to-HS
norm substitution is permitted. The source operator retains its genuine
operator norm; only the separate PiLp 2 Hilbert column fiber has HS norm.

This is an isometry on the original FINITE Fock-operator Hilbert–Schmidt
fiber; no continuous group representation, Fock-vector implementer,
physical gauge fixedness, invariant unbounded charge domain or spectrum
is deduced. The precise original Spin(9) source group is unchanged.

STAGED: must pass a new pinned cold CI with separate native consumer,
source and consumer axioms before any acceptance.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometry
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3M2AOriginalFockHSFiber

variable {ι : Type*} [Fintype ι]

/-- Exact original Fock-operator Spin(9) action, transported to the
correctly normed separate Hilbert–Schmidt original Fock column fiber. -/
noncomputable def originalSpin9FockHSFiberLinearEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic) :
    OriginalFockHSFiber ι ≃ₗ[ℂ] OriginalFockHSFiber ι :=
  ((originalFockOperatorToHSFiber b).symm.trans
    ((source9Spin_originalFockOperatorStarAlgEquiv g).toAlgEquiv.toLinearEquiv)).trans
      (originalFockOperatorToHSFiber b)

/-- The fiber action is literally the original B3 Fock-operator action
under the accepted M2A equivalence, not a substitute representation. -/
theorem originalSpin9FockHSFiberLinearEquiv_toOperator
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalFockHSFiberToOperator b
        (originalSpin9FockHSFiberLinearEquiv b g u) =
      source9Spin_originalFockOperatorStarAlgEquiv g
        (originalFockHSFiberToOperator b u) := by
  change
    (originalFockOperatorToHSFiber b).symm
      ((originalFockOperatorToHSFiber b)
        (source9Spin_originalFockOperatorStarAlgEquiv g
          ((originalFockOperatorToHSFiber b).symm u))) =
    source9Spin_originalFockOperatorStarAlgEquiv g
      ((originalFockOperatorToHSFiber b).symm u)
  exact (originalFockOperatorToHSFiber b).symm_apply_apply _

/-- The original Spin(9) star automorphism preserves the actual source
Hilbert–Schmidt fiber INNER PRODUCT, via already qualified OP1A trace
invariance. No theorem about the physical FullL2 charge is asserted. -/
theorem originalSpin9FockHSFiber_inner_invariant
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u v : OriginalFockHSFiber ι) :
    ⟪originalSpin9FockHSFiberLinearEquiv b g u,
      originalSpin9FockHSFiberLinearEquiv b g v⟫_ℂ = ⟪u, v⟫_ℂ := by
  calc
    ⟪originalSpin9FockHSFiberLinearEquiv b g u,
      originalSpin9FockHSFiberLinearEquiv b g v⟫_ℂ =
        originalFockTracePairing
          (originalFockHSFiberToOperator b
            (originalSpin9FockHSFiberLinearEquiv b g u))
          (originalFockHSFiberToOperator b
            (originalSpin9FockHSFiberLinearEquiv b g v)) :=
      (originalFockHSFiber_tracePairing b _ _).symm
    _ = originalFockTracePairing
          (source9Spin_originalFockOperatorStarAlgEquiv g
            (originalFockHSFiberToOperator b u))
          (source9Spin_originalFockOperatorStarAlgEquiv g
            (originalFockHSFiberToOperator b v)) := by
      rw [originalSpin9FockHSFiberLinearEquiv_toOperator b g u,
        originalSpin9FockHSFiberLinearEquiv_toOperator b g v]
    _ = originalFockTracePairing
          (originalFockHSFiberToOperator b u)
          (originalFockHSFiberToOperator b v) :=
      source9Spin_originalFockTracePairing_invariant g _ _
    _ = ⟪u, v⟫_ℂ :=
      originalFockHSFiber_tracePairing b u v

/-- A genuine complex-linear ISOMETRY on the accepted original Fock
HS columns, not an isometry for the original operator norm. -/
noncomputable def originalSpin9FockHSFiberIsometry
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic) :
    OriginalFockHSFiber ι →ₗᵢ[ℂ] OriginalFockHSFiber ι :=
  LinearMap.isometryOfInner
    (originalSpin9FockHSFiberLinearEquiv b g).toLinearMap
    (originalSpin9FockHSFiber_inner_invariant b g)

/-- The isometric map really evaluates to the literal transported
original source Fock-operator action. -/
theorem originalSpin9FockHSFiberIsometry_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalSpin9FockHSFiberIsometry b g u =
      originalSpin9FockHSFiberLinearEquiv b g u := by
  rfl

#print axioms originalSpin9FockHSFiberLinearEquiv
#print axioms originalSpin9FockHSFiberLinearEquiv_toOperator
#print axioms originalSpin9FockHSFiber_inner_invariant
#print axioms originalSpin9FockHSFiberIsometry
#print axioms originalSpin9FockHSFiberIsometry_apply

end
end FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometry
