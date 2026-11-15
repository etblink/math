import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG10OriginalKineticTauCAR
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Twelve literal paired-source orbital CAR controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG10OriginalKineticTauCARIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR

example (α : SpinIndex) (k : SpaceIndex) (B : ColorIndex 2) :
    Fermion 2 →L[ℂ] Fermion 2 := originalKineticFermion pairedAlgebraData α k B

example (α : SpinIndex) (k : SpaceIndex) (B : ColorIndex 2) (v : Fermion 2) :
    originalKineticFermion pairedAlgebraData α k B v =
      ∑ β : SpinIndex, (pairedAlgebraData.gamma k α β : ℂ) • pairedAlgebraData.theta β B v :=
  originalKineticFermion_apply pairedAlgebraData α k B v

example (α : SpinIndex) (k : SpaceIndex) (B : ColorIndex 2) (p : FermionIndex 2) :
    pairedAlgebraData.principalCoefficients (Pi.single α 1)
      (EuclideanSpace.single (k, B) 1) p =
        if p.2 = B then pairedAlgebraData.gamma k α p.1 else 0 :=
  originalKineticCoefficient_basis pairedAlgebraData α k B p

private abbrev nativePairing (i j k : SpaceIndex) (B : ColorIndex 2) (X : Boson 2) : ℝ :=
  ∑ α : SpinIndex, ∑ p : FermionIndex 2,
    pairedAlgebraData.principalCoefficients (Pi.single α 1)
      (EuclideanSpace.single (k, B) 1) p * originalHardyY pairedAlgebraData i j X p.2 α p.1

example (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) :
    nativePairing i j k B X =
      (if k = j then X (i, B) else 0) - (if k = i then X (j, B) else 0) :=
  originalKineticTauCoefficient_trace pairedAlgebraData i j hij k B X

example (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) :
    (∑ α : SpinIndex,
      (originalKineticFermion pairedAlgebraData α k B * originalHardyTau pairedAlgebraData i j α X +
        originalHardyTau pairedAlgebraData i j α X * originalKineticFermion pairedAlgebraData α k B)) =
      (((if k = j then X (i, B) else 0) - (if k = i then X (j, B) else 0) : ℝ) : ℂ) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) :=
  originalKineticTau_anticommutator pairedAlgebraData i j hij k B X

example (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      (originalKineticFermion pairedAlgebraData α k B (originalHardyTau pairedAlgebraData i j α X v) +
        originalHardyTau pairedAlgebraData i j α X (originalKineticFermion pairedAlgebraData α k B v))) =
      (((if k = j then X (i, B) else 0) - (if k = i then X (j, B) else 0) : ℝ) : ℂ) • v :=
  originalKineticTau_anticommutator_apply pairedAlgebraData i j hij k B X v

example (i j : SpaceIndex) (hij : i ≠ j) (B : ColorIndex 2) :
    nativePairing i j j B (EuclideanSpace.single (i, B) 1) = 1 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData i j hij]
  simp_all [PiLp.single_apply]
  exact Ne.symm hij

example (i j : SpaceIndex) (hij : i ≠ j) (B : ColorIndex 2) :
    nativePairing i j i B (EuclideanSpace.single (j, B) 1) = -1 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData i j hij]
  simp_all

example (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex)
    (hki : k ≠ i) (hkj : k ≠ j) (B : ColorIndex 2) (X : Boson 2) :
    nativePairing i j k B X = 0 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData i j hij]
  simp_all

example (i j : SpaceIndex) (hij : i ≠ j) (B : ColorIndex 2) :
    nativePairing j i j B (EuclideanSpace.single (i, B) 1) = -1 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData j i (Ne.symm hij)]
  simp_all [PiLp.single_apply]
  exact Ne.symm hij

example (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2) :
    nativePairing i j k B 0 = 0 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData i j hij]
  simp

example (i j : SpaceIndex) (hij : i ≠ j) (A B : ColorIndex 2) (hAB : A ≠ B) :
    nativePairing i j j B (EuclideanSpace.single (i, A) 1) = 0 := by
  dsimp only [nativePairing]
  rw [originalKineticTauCoefficient_trace pairedAlgebraData i j hij]
  simp_all

#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticFermion
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticFermion_apply
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticCoefficient_basis
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTauCoefficient_trace
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator_apply
#print axioms OAI.BFSSQuantum.AlgebraData.kineticSymbol_apply
#print axioms OAI.BFSSQuantum.AlgebraData.principalCoefficients_basis
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_mixed
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY_trace
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalHardyTau_apply
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauCoefficientDerivative_eq_basis

end
end FCP.BFSSP3AuxHardyG10OriginalKineticTauCARIndependentConsumer
