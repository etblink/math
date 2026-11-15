import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG15OriginalTauCoefficientNormReduction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! G15: twelve literal original paired norm/carrier controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReductionIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction

example (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    originalHardyTau pairedAlgebraData i j α X * originalHardyTau pairedAlgebraData i j α X =
      ((1 / 2 : ℝ) * (∑ p : FermionIndex 2, (originalHardyY pairedAlgebraData i j X p.2 α p.1) ^ 2) : ℂ) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) :=
  originalHardyTau_sq pairedAlgebraData i j α X

example (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    IsSelfAdjoint (originalHardyTau pairedAlgebraData i j α X) :=
  originalHardyTau_selfAdjoint pairedAlgebraData i j α X

example (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    ‖originalHardyTau pairedAlgebraData i j α X v‖ ^ 2 =
      (1 / 2 : ℝ) * (∑ p : FermionIndex 2, (originalHardyY pairedAlgebraData i j X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 :=
  originalHardyTau_norm_sq pairedAlgebraData i j α X v

example (i j : SpaceIndex)
    (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex, ‖originalHardyTau pairedAlgebraData i j α X v‖ ^ 2) =
      (1 / 2 : ℝ) * (∑ α : SpinIndex, ∑ p : FermionIndex 2,
        (originalHardyY pairedAlgebraData i j X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 :=
  originalHardyTau_sum_norm_sq pairedAlgebraData i j X v

example     (i j : Fin 4 → SpaceIndex) (α : SpinIndex) (X : Boson 2) :
    (∑ t : Fin 4, originalHardyTau pairedAlgebraData (i t) (j t) α X) =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 =>
        ∑ t : Fin 4, originalHardyY pairedAlgebraData (i t) (j t) X p.2 α p.1) :=
  originalHardyTau_fourPlane_sum_eq_cliffordLinear pairedAlgebraData i j α X

example     (i j : Fin 4 → SpaceIndex) (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      ‖(∑ t : Fin 4, originalHardyTau pairedAlgebraData (i t) (j t) α X) v‖ ^ 2) =
      (1 / 2 : ℝ) * (∑ α : SpinIndex, ∑ p : FermionIndex 2,
        (∑ t : Fin 4, originalHardyY pairedAlgebraData (i t) (j t) X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 :=
  originalHardyTau_fourPlane_sum_norm_sq pairedAlgebraData i j X v

example (i j : SpaceIndex)
    (α : SpinIndex) (v : Fermion 2) :
    ‖originalHardyTau pairedAlgebraData i j α (0 : Boson 2) v‖ ^ 2 =
      (1 / 2 : ℝ) * (∑ p : FermionIndex 2, (originalHardyY pairedAlgebraData i j (0 : Boson 2) p.2 α p.1) ^ 2) * ‖v‖ ^ 2 := by
  generalize (0 : Boson 2) = X
  exact originalHardyTau_norm_sq pairedAlgebraData i j α X v

example (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      ‖originalHardyTau pairedAlgebraData i j α X (0 : Fermion 2)‖ ^ 2) = 0 := by
  simp only [map_zero, norm_zero, zero_pow, Finset.sum_const_zero]

example     (i j : SpaceIndex) (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      ‖(∑ t : Fin 4, originalHardyTau pairedAlgebraData i j α X) v‖ ^ 2) =
      (1 / 2 : ℝ) * (∑ α : SpinIndex, ∑ p : FermionIndex 2,
        (∑ t : Fin 4, originalHardyY pairedAlgebraData i j X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 :=
  originalHardyTau_fourPlane_sum_norm_sq pairedAlgebraData (fun _ => i) (fun _ => j) X v

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) : FullL2 2 :=
  coreToL2 (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f))

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore pairedAlgebraData i j α f X =
      originalHardyTau pairedAlgebraData i j α X (f X) :=
  originalHardyTauCore_apply pairedAlgebraData i j α f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) X)) =
      (-Complex.I) • ((∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X)))) :=
  originalChargeTauCore_sum_apply pairedAlgebraData i j hij f X

#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_sq
#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_selfAdjoint
#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_norm_sq
#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_sum_norm_sq
#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_fourPlane_sum_eq_cliffordLinear
#print axioms FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction.originalHardyTau_fourPlane_sum_norm_sq
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_sq
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_selfAdjoint
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_norm_sq
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_mixed
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalChargeTauCore_sum_apply

end
end FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReductionIndependentConsumer
