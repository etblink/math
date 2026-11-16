import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4HS1OriginalSpin9FockHSUnitaryGroupAction

/-!
# BFSS M4-HS1 independent original Hilbert–Schmidt group consumers

All statements use literal original Fermion 2 columns and exact source
Spin9. They distinguish unitary operator-HS group action from a
nonexistent-at-this-stage source Fock-vector Spin9 unitary.
-/
set_option autoImplicit false
namespace FCP.BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupAction

variable {ι : Type*} [Fintype ι]

theorem originalHS_group_law_consumer
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g h : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalSpin9FockHSFiberUnitaryHom b (g * h) u =
      originalSpin9FockHSFiberUnitaryHom b g
        (originalSpin9FockHSFiberUnitaryHom b h u) := by
  rw [map_mul]
  rfl

theorem originalHS_group_identity_consumer
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) :
    originalSpin9FockHSFiberUnitaryHom b
      (1 : spinGroup source9Quadratic) u = u := by
  rw [map_one]
  rfl

theorem originalHS_fockOperator_consumer
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    originalFockHSFiberToOperator b
      (originalSpin9FockHSFiberUnitaryHom b g u) =
    FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAlgEquiv
      g (originalFockHSFiberToOperator b u) :=
  originalSpin9FockHSFiberUnitaryHom_toOperator b g u

theorem originalHS_unitary_norm_consumer
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic)
    (u : OriginalFockHSFiber ι) :
    ‖originalSpin9FockHSFiberUnitaryHom b g u‖ = ‖u‖ :=
  (originalSpin9FockHSFiberUnitaryHom b g).norm_map u

theorem originalHS_operatorOne_singlet_consumer
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : spinGroup source9Quadratic) :
    originalSpin9FockHSFiberUnitaryHom b g
        (originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2)) =
      originalFockOperatorToHSFiber b (1 : Fermion 2 →L[ℂ] Fermion 2) :=
  originalSpin9FockHSFiberUnitaryHom_fixes_operator_one b g

#print axioms originalHS_group_law_consumer
#print axioms originalHS_group_identity_consumer
#print axioms originalHS_fockOperator_consumer
#print axioms originalHS_unitary_norm_consumer
#print axioms originalHS_operatorOne_singlet_consumer

end
end FCP.BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupIndependentConsumer
