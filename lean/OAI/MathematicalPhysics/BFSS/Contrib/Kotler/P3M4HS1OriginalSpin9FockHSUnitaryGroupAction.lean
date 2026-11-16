import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4HS0OriginalSpin9FockHSIsometry

/-!
# BFSS P3-M4-HS1 — genuine original Spin(9) group action on Fock-HS columns

Upgrade the strictly qualified HS0 isometry for each genuine source
Spin(9) element to a genuine group homomorphism on the ORIGINAL
separately Hilbert–Schmidt normed Fock-operator column carrier.

Do not replace original Fermion 2 operators with artificial matrices.
The source operator carrier retains its operator norm. This is NOT
the unproved Fock-VECTOR group representation, not strong continuity,
and not source physical charge covariance or an invariant domain.

STAGED pending cold strict warning-as-error CI, exact source pins,
separate native consumer and restricted axioms.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupAction
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M4HS0OriginalSpin9FockHSIsometry

variable {ι : Type*} [Fintype ι]

/-- This is a surjective isometry because the HS0 source action is an
exact LINEAR EQUIVALENCE, and HS0 proves norm preservation. -/
noncomputable def originalSpin9FockHSFiberIsometryEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic) :
    OriginalFockHSFiber ι ≃ₗᵢ[ℂ] OriginalFockHSFiber ι where
  toLinearEquiv := originalSpin9FockHSFiberLinearEquiv b g
  norm_map' := by
    intro u
    exact (originalSpin9FockHSFiberIsometry b g).norm_map u

/-- Evaluation is exactly the qualified HS0 isometry. -/
theorem originalSpin9FockHSFiberIsometryEquiv_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalSpin9FockHSFiberIsometryEquiv b g u =
      originalSpin9FockHSFiberLinearEquiv b g u := by
  rfl

/-- The ACTUAL source Spin(9) group law acts on the separately normed
original Fock Hilbert–Schmidt operator columns. Group law comes from
the already qualified original B3 star-automorphism MonoidHom and
conjugation across the already qualified M2A equivalence. -/
noncomputable def originalSpin9FockHSFiberUnitaryHom
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    spinGroup source9Quadratic →*
      (OriginalFockHSFiber ι ≃ₗᵢ[ℂ] OriginalFockHSFiber ι) where
  toFun := originalSpin9FockHSFiberIsometryEquiv b
  map_one' := by
    apply LinearIsometryEquiv.ext
    intro u
    apply (originalFockHSFiberToOperator b).injective
    change originalFockHSFiberToOperator b
        (originalSpin9FockHSFiberLinearEquiv b 1 u) =
      originalFockHSFiberToOperator b u
    rw [originalSpin9FockHSFiberLinearEquiv_toOperator]
    change (source9Spin_originalFockOperatorStarAutomorphismHom 1)
      (originalFockHSFiberToOperator b u) =
      originalFockHSFiberToOperator b u
    rw [map_one]
    rfl
  map_mul' := by
    intro g h
    apply LinearIsometryEquiv.ext
    intro u
    apply (originalFockHSFiberToOperator b).injective
    change originalFockHSFiberToOperator b
        (originalSpin9FockHSFiberLinearEquiv b (g * h) u) =
      originalFockHSFiberToOperator b
        (originalSpin9FockHSFiberLinearEquiv b g
          (originalSpin9FockHSFiberLinearEquiv b h u))
    rw [originalSpin9FockHSFiberLinearEquiv_toOperator b (g * h) u,
      originalSpin9FockHSFiberLinearEquiv_toOperator b g
        (originalSpin9FockHSFiberLinearEquiv b h u),
      originalSpin9FockHSFiberLinearEquiv_toOperator b h u]
    change (source9Spin_originalFockOperatorStarAutomorphismHom (g * h))
        (originalFockHSFiberToOperator b u) =
      (source9Spin_originalFockOperatorStarAutomorphismHom g)
        ((source9Spin_originalFockOperatorStarAutomorphismHom h)
          (originalFockHSFiberToOperator b u))
    rw [map_mul]
    rfl

/-- Source exact group action reconstructs the original Fock operator
after transporting through the true M2A Hilbert columns. -/
theorem originalSpin9FockHSFiberUnitaryHom_toOperator
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalFockHSFiberToOperator b
      (originalSpin9FockHSFiberUnitaryHom b g u) =
    source9Spin_originalFockOperatorStarAlgEquiv g
      (originalFockHSFiberToOperator b u) := by
  change originalFockHSFiberToOperator b
      (originalSpin9FockHSFiberLinearEquiv b g u) = _
  exact originalSpin9FockHSFiberLinearEquiv_toOperator b g u

/-- Every actual source B3 automorphism fixes the operator identity,
so the original Fock HS column representation has an OPERATOR-space
fixed vector. This is not a spin-invariant Fock wavefunction. -/
theorem originalSpin9FockHSFiberUnitaryHom_fixes_operator_one
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic) :
    originalSpin9FockHSFiberUnitaryHom b g
        (originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2)) =
      originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  apply (originalFockHSFiberToOperator b).injective
  rw [originalSpin9FockHSFiberUnitaryHom_toOperator]
  have hround :
      originalFockHSFiberToOperator b
        (originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2)) =
      (1 : Fermion 2 →L[ℂ] Fermion 2) := by
    change (originalFockOperatorToHSFiber b).symm
        (originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2)) =
      (1 : Fermion 2 →L[ℂ] Fermion 2)
    exact (originalFockOperatorToHSFiber b).symm_apply_apply _
  rw [hround]
  exact (source9Spin_originalFockOperatorStarAlgEquiv g).map_one

#print axioms originalSpin9FockHSFiberIsometryEquiv
#print axioms originalSpin9FockHSFiberIsometryEquiv_apply
#print axioms originalSpin9FockHSFiberUnitaryHom
#print axioms originalSpin9FockHSFiberUnitaryHom_toOperator
#print axioms originalSpin9FockHSFiberUnitaryHom_fixes_operator_one

end
end FCP.BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupAction
