import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG8OriginalTauDerivative
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG9ComplexMatrixEntryDerivative

/-! HARDY-G9: original complex Y-entry derivative and G3 basis binding.
Prospective until whole strict source/native acceptance. No kinetic CAR contraction. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative

noncomputable def originalHardyYEntryCLM (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (α β : SpinIndex) : Boson 2 →L[ℝ] ℂ :=
  complexMatrixEntryCLM (originalHardyYCLM M i j A) α β

theorem originalHardyYEntryCLM_apply (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyYEntryCLM M i j A α β X = (originalHardyY M i j X A α β : ℂ) := by
  change (originalHardyYCLM M i j A X α β : ℂ) = _
  rw [originalHardyYCLM_apply]

theorem originalHardyY_entry_fderiv (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => (originalHardyY M i j Z A α β : ℂ)) X =
      originalHardyYEntryCLM M i j A α β := by
  have hfun : (fun Z : Boson 2 => (originalHardyY M i j Z A α β : ℂ)) =
      ⇑(originalHardyYEntryCLM M i j A α β) := by
    funext Z
    exact (originalHardyYEntryCLM_apply M i j A α β Z).symm
  rw [hfun]
  exact (originalHardyYEntryCLM M i j A α β).fderiv

theorem originalHardyTauCoefficientDerivative_eq_basis (M : AlgebraData 2)
    (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyTauCoefficientDerivative M i j k B A α β X =
      (originalHardyY M i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) := by
  unfold originalHardyTauCoefficientDerivative
  rw [originalHardyY_entry_fderiv]
  exact originalHardyYEntryCLM_apply M i j A α β (EuclideanSpace.single (k, B) 1)

theorem originalHardyTauCoefficientDerivative_independent_point (M : AlgebraData 2)
    (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X Z : Boson 2) :
    originalHardyTauCoefficientDerivative M i j k B A α β X =
      originalHardyTauCoefficientDerivative M i j k B A α β Z :=
  (originalHardyTauCoefficientDerivative_eq_basis M i j k B A α β X).trans
    (originalHardyTauCoefficientDerivative_eq_basis M i j k B A α β Z).symm

theorem originalHardyTauDerivative_eq_basis (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex) (X : Boson 2) :
    originalHardyTauDerivative M i j k B α X =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyY M i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) •
          M.theta β A := by
  unfold originalHardyTauDerivative
  simp_rw [originalHardyTauCoefficientDerivative_eq_basis]

#print axioms originalHardyYEntryCLM
#print axioms originalHardyYEntryCLM_apply
#print axioms originalHardyY_entry_fderiv
#print axioms originalHardyTauCoefficientDerivative_eq_basis
#print axioms originalHardyTauCoefficientDerivative_independent_point
#print axioms originalHardyTauDerivative_eq_basis

end
end FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding
