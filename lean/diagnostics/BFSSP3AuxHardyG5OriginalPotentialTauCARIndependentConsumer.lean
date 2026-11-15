import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG5OriginalPotentialTauCAR
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Actual original Fock potential/tau operators and source CAR normalization controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG5OriginalPotentialTauCARIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open MeasureTheory

-- Canonical zero witnesses: tested generic/native decomposition from G5 D0.
private theorem nativeFiniteComplexZeroSum {ι E : Type*} [Fintype ι]
    [NormedAddCommGroup E] [NormedSpace ℂ E] (T : ι → E →L[ℂ] E) :
    (∑ p : ι, (0 : ℂ) • T p) = (0 : E →L[ℂ] E) := by
  apply Finset.sum_eq_zero
  intro p _
  exact zero_smul ℂ (T p)

private theorem nativeThetaZeroSum :
    (∑ p : FermionIndex 2, (0 : ℂ) • pairedAlgebraData.theta p.1 p.2) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  nativeFiniteComplexZeroSum (fun p : FermionIndex 2 => pairedAlgebraData.theta p.1 p.2)

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (i j : SpaceIndex) (α : SpinIndex) (X : Boson 2) :
    originalHardyTau pairedAlgebraData i j α X =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 =>
        originalHardyY pairedAlgebraData i j X p.2 α p.1) := rfl

example (i j : SpaceIndex) (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalHardyTau pairedAlgebraData i j α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyY pairedAlgebraData i j X A α β : ℂ) • pairedAlgebraData.theta β A v :=
  originalHardyTau_apply pairedAlgebraData i j α X v

example (α : SpinIndex) (X : Boson 2) :
    originalPotentialFermion pairedAlgebraData α X =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 =>
        originalPotentialGamma pairedAlgebraData X p.2 α p.1) := rfl

example (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalPotentialFermion pairedAlgebraData α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalPotentialGamma pairedAlgebraData X A α β : ℂ) • pairedAlgebraData.theta β A v :=
  originalPotentialFermion_apply pairedAlgebraData α X v

example (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      (originalPotentialFermion pairedAlgebraData α X * originalHardyTau pairedAlgebraData i j α X +
        originalHardyTau pairedAlgebraData i j α X * originalPotentialFermion pairedAlgebraData α X)) = 0 :=
  originalPotentialTau_anticommutator_zero pairedAlgebraData i j X

example (i j : SpaceIndex) (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      (originalPotentialFermion pairedAlgebraData α X (originalHardyTau pairedAlgebraData i j α X v) +
        originalHardyTau pairedAlgebraData i j α X (originalPotentialFermion pairedAlgebraData α X v))) = 0 :=
  originalPotentialTau_anticommutator_apply pairedAlgebraData i j X v

example (i j : SpaceIndex) (α : SpinIndex) :
    originalHardyTau pairedAlgebraData i j α (0 : Boson 2) = 0 := by
  simp [originalHardyTau, AlgebraData.cliffordLinear, originalHardyY]
  exact nativeThetaZeroSum

example (α : SpinIndex) :
    originalPotentialFermion pairedAlgebraData α (0 : Boson 2) = 0 := by
  simp [originalPotentialFermion, AlgebraData.cliffordLinear, originalPotentialGamma]
  exact nativeThetaZeroSum

private theorem nativeUnitRowCAR (p : FermionIndex 2) :
    pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) +
      pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) =
      (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  simpa [Pi.single_apply] using pairedAlgebraData.cliffordLinear_mixed
    (Pi.single p (1 : ℝ)) (Pi.single p (1 : ℝ))

example (p : FermionIndex 2) :
    pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) +
      pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) =
      (1 : Fermion 2 →L[ℂ] Fermion 2) := nativeUnitRowCAR p

-- The source CAR has coefficient one, not the doubled convention.
example (p : FermionIndex 2) (v : Fermion 2) (hv : v ≠ 0) :
    (pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) +
      pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ)) *
        pairedAlgebraData.cliffordLinear (Pi.single p (1 : ℝ))) v ≠ (2 : ℂ) • v := by
  rw [nativeUnitRowCAR p]
  change v ≠ (2 : ℂ) • v
  intro h
  have hn := congrArg norm h
  norm_num [norm_smul] at hn
  have hp := norm_pos_iff.mpr hv
  linarith

example (i j : SpaceIndex) (α : SpinIndex) (X : Boson 2) :
    IsSelfAdjoint (originalHardyTau pairedAlgebraData i j α X) :=
  pairedAlgebraData.cliffordLinear_selfAdjoint _

#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalHardyTau
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalHardyTau_apply
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialFermion
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialFermion_apply
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_zero
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_apply
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_mixed
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_selfAdjoint
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_pairing_zero
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_apply
#print axioms OAI.BFSSQuantum.AlgebraData.theta_CAR

end
end BFSSP3AuxHardyG5OriginalPotentialTauCARIndependentConsumer
