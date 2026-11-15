import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG11OriginalDerivativeColorContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Twelve literal paired-source derivative color/spin controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContractionIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction

example (i j k : SpaceIndex) (B A : ColorIndex 2) (hBA : B ≠ A) :
    originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A = 0 :=
  originalHardyY_basis_off_color pairedAlgebraData i j k B A hBA

example (i j k : SpaceIndex) (B A : ColorIndex 2) :
    originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A =
      if B = A then originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, A) 1) A else 0 :=
  originalHardyY_basis_color pairedAlgebraData i j k B A

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A) =
      if B = A then (1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) else 0 :=
  originalHardyY_basis_color_contraction pairedAlgebraData i j hij B A

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, pairedAlgebraData.gamma k α β *
      originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α δ) =
      if B = A then (1 / 4 : ℝ) * (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ else 0 :=
  originalHardyY_basis_spin_contraction pairedAlgebraData i j hij B A β δ

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      (originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α δ : ℂ)) =
      if B = A then (1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ) else 0 :=
  originalHardyY_basis_complex_spin_contraction pairedAlgebraData i j hij B A β δ

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex)
    (X : Boson 2) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ X) =
      if B = A then (1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ) else 0 :=
  originalHardyTauCoefficientDerivative_spin_contraction pairedAlgebraData i j hij B A β δ X

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) (β δ : SpinIndex) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, pairedAlgebraData.gamma k α β *
      originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, A) 1) A α δ) =
      (1 / 4 : ℝ) * (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ := by
  simpa only [ite_eq_left rfl] using
    (originalHardyY_basis_spin_contraction pairedAlgebraData i j hij A A β δ)

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (hBA : B ≠ A) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A) = 0 := by
  rw [originalHardyY_basis_color_contraction pairedAlgebraData i j hij B A, ite_eq_right hBA]

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (hBA : B ≠ A)
    (β δ : SpinIndex) (X : Boson 2) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ X) = 0 := by
  rw [originalHardyTauCoefficientDerivative_spin_contraction pairedAlgebraData i j hij B A β δ X,
    ite_eq_right hBA]

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      originalHardyY pairedAlgebraData j i (EuclideanSpace.single (k, A) 1) A) =
      -(1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) := by
  rw [originalHardyY_basis_color_contraction pairedAlgebraData j i (Ne.symm hij) A A, ite_eq_left rfl,
    OAI.BFSSGamma.gamma_anti pairedAlgebraData.gamma pairedAlgebraData.gamma_clifford (Ne.symm hij)]
  module

example (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex)
    (X Z : Boson 2) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ X) =
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ Z) :=
  (originalHardyTauCoefficientDerivative_spin_contraction pairedAlgebraData i j hij B A β δ X).trans
    (originalHardyTauCoefficientDerivative_spin_contraction pairedAlgebraData i j hij B A β δ Z).symm

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) (β δ : SpinIndex)
    (X : Boson 2) :
    (4 : ℂ) * (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k A A α δ X) =
      ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ) := by
  rw [originalHardyTauCoefficientDerivative_spin_contraction pairedAlgebraData i j hij A A β δ X,
    ite_eq_left rfl]
  ring

#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_off_color
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_color
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_color_contraction
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_spin_contraction
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_complex_spin_contraction
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyTauCoefficientDerivative_spin_contraction
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_basis_contraction
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_derivative_contraction
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauCoefficientDerivative_eq_basis
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauDerivative_eq_basis
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticFermion_apply
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator

end
end FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContractionIndependentConsumer
