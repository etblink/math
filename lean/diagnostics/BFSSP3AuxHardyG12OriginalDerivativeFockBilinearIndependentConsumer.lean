import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG12OriginalDerivativeFockBilinear
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Twelve literal paired-source ordered derivative Fock controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinearIndependentConsumer
noncomputable section
open MeasureTheory
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear

example (α : SpinIndex) (k : SpaceIndex) (B : ColorIndex 2) :
    originalKineticFermion pairedAlgebraData α k B =
      ∑ β : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) • pairedAlgebraData.theta β B :=
  originalKineticFermion_eq_sum pairedAlgebraData α k B

example (i j : SpaceIndex) (X : Boson 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  originalKineticTauDerivativeFermion pairedAlgebraData i j X

example (i j : SpaceIndex) (X : Boson 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X =
      ∑ k : SpaceIndex, ∑ α : SpinIndex, ∑ B : ColorIndex 2,
        ∑ β : SpinIndex, ∑ A : ColorIndex 2, ∑ δ : SpinIndex,
          ((pairedAlgebraData.gamma k α β : ℂ) *
            originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ X) •
              (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ A) :=
  originalKineticTauDerivativeFermion_expand pairedAlgebraData i j X

example (i j : SpaceIndex) (X : Boson 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ A : ColorIndex 2, ∑ δ : SpinIndex,
        (∑ k : SpaceIndex, ∑ α : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) *
          originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α δ X) •
            (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ A) :=
  originalKineticTauDerivativeFermion_eq_contracted pairedAlgebraData i j X

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ B) :=
  originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij X

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) (v : Fermion 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X v =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B v) :=
  originalKineticTauDerivativeFermion_apply pairedAlgebraData i j hij X v

example (i j : SpaceIndex) (hij : i ≠ j) (X Z : Boson 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X =
      originalKineticTauDerivativeFermion pairedAlgebraData i j Z :=
  (originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij X).trans
    (originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij Z).symm

example (i j : SpaceIndex) (hij : i ≠ j) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j 0 =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ B) :=
  originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij 0

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData j i X =
      -originalKineticTauDerivativeFermion pairedAlgebraData i j X := by
  rw [originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData j i (Ne.symm hij) X,
    originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij X,
    OAI.BFSSGamma.gamma_anti pairedAlgebraData.gamma pairedAlgebraData.gamma_clifford (Ne.symm hij)]
  simp only [Matrix.neg_apply, Complex.ofReal_neg, mul_neg]
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro B _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro β _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro δ _
  exact _root_.neg_smul
    ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ))
    (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ B)

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) :
    (4 : ℂ) • originalKineticTauDerivativeFermion pairedAlgebraData i j X =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ) •
          (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ B) := by
  rw [originalKineticTauDerivativeFermion_eq_bilinear pairedAlgebraData i j hij X]
  simp only [Finset.smul_sum, smul_smul]
  apply Finset.sum_congr rfl
  intro B _
  apply Finset.sum_congr rfl
  intro β _
  apply Finset.sum_congr rfl
  intro δ _
  congr 1
  ring

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) (f : SmoothCore 2) :
    originalKineticTauDerivativeFermion pairedAlgebraData i j X (f X) =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X)) :=
  originalKineticTauDerivativeFermion_apply pairedAlgebraData i j hij X (f X)

example : FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticFermion_eq_sum
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_expand
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_eq_contracted
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_eq_bilinear
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_apply
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticFermion_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauDerivative_eq_basis
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyY_basis_spin_contraction
#print axioms FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction.originalHardyTauCoefficientDerivative_spin_contraction
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator

end
end FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinearIndependentConsumer
