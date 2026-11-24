import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQO0LiteralOrbitalDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF1OriginalFermionicDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G7TOriginalFullColorLieGaussIdentityProbe

/-! CSQ-G0: exact equal-norm charge-square equality on the actual
paired invariant smooth core. Candidate pending strict qualification.
No closed-operator or spectral assertion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQG0
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2Full
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G4B
open FCP.BFSSSU2PhysicalDomainL6G5W
open FCP.BFSSSU2PhysicalDomainL6G6H
open FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSSU2PhysicalDomainL6G7T

/-- Exact scalar sign transport, independent of the Fock implementation. -/
theorem gaussSignCancel {C V : Type*} [Fintype C]
    [AddCommGroup V] [Module ℂ V]
    (D : V) (d : C → ℂ) (j : C → V)
    (h : -D - (∑ c : C, d c • (Complex.I • j c)) = 0) :
    (-Complex.I) • D + (∑ c : C, d c • j c) = 0 := by
  have ht (c : C) :
      Complex.I • (d c • (Complex.I • j c)) = -(d c • j c) := by
    calc
      _ = d c • (Complex.I • (Complex.I • j c)) :=
        smul_comm Complex.I (d c) (Complex.I • j c)
      _ = _ := by
        rw [← mul_smul Complex.I Complex.I (j c), Complex.I_mul_I,
          neg_one_smul, smul_neg]
  calc
    _ = Complex.I • (-D - (∑ c : C, d c • (Complex.I • j c))) := by
      rw [smul_sub, smul_neg, ← neg_smul, Finset.smul_sum]
      simp only [ht, Finset.sum_neg_distrib, sub_neg_eq_add]
    _ = 0 := by rw [h, smul_zero]

/-- Original generator normalization at one fiber vector, with no
expansion of the bounded current. -/
theorem generator_apply (M : AlgebraData 2) (c : ColorIndex 2)
    (v : Fermion 2) :
    sourceFiberFermionColorGenerator M c v =
      Complex.I • sourceFiberFermionColorCurrent M c v := by
  rfl

/-- Actual physical Gauss cancellation for every source color direction.
The direction is fixed at the point, not differentiated. -/
theorem physicalGaussCancel (u : ColorVector 2)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    (-Complex.I) • fderiv ℝ (f.val : Boson 2 → Fermion 2) x
        (pairedAlgebraData.gaugeTangent x u) +
      (∑ c : ColorIndex 2, (u c : ℂ) •
        sourceFiberFermionColorCurrent pairedAlgebraData c (f.val x)) = 0 := by
  have h := actualInvariantCore_fullColorLieGauss_zero u f x
  have hsum :
      (∑ c : ColorIndex 2, (u c) •
        sourceFiberFermionColorGenerator pairedAlgebraData c (f.val x)) =
      ∑ c : ColorIndex 2, (u c : ℂ) •
        (Complex.I • sourceFiberFermionColorCurrent pairedAlgebraData c (f.val x)) := by
    apply Finset.sum_congr rfl
    intro c _
    rw [generator_apply]
    exact (IsScalarTower.algebraMap_smul ℂ (u c)
      (Complex.I • sourceFiberFermionColorCurrent pairedAlgebraData c (f.val x))).symm
  rw [hsum] at h
  exact gaussSignCancel
    (fderiv ℝ (f.val : Boson 2 → Fermion 2) x (pairedAlgebraData.gaugeTangent x u))
    (fun c => (u c : ℂ))
    (fun c => sourceFiberFermionColorCurrent pairedAlgebraData c (f.val x)) h

/-- Keep evaluation of a sum abstract over its endomorphism arguments. -/
theorem evaluateAdd (A B : SourceEnd 2) (f : SmoothCore 2) (x : Boson 2) :
    ((A + B) f) x = (A f) x + (B f) x := rfl

/-- Pointwise normal order from literal G4B, with the original G6H
ordered response. The scalar half-square is never wrapped. -/
theorem normalOrder_apply (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceAllSpinorCharge M w * sourceAllSpinorCharge M w) f) x =
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x +
      ((sourceOriginalOrderedFermionicResponse M w) f) x := by
  unfold sourceOriginalOrderedFermionicResponse
  calc
    _ = (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p) +
        (1 / 2 : ℂ) • (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
          (M.fermionAction p.1 p.2 * M.fermionAction q.1 q.2) *
            sourceAllSpinorCoefficientResponse M w p q)) f) x :=
      congrArg (fun A : SourceEnd 2 => (A f) x)
        (sourceAllSpinorCharge_normalOrder_response M w)
    _ = _ := evaluateAdd _ _ f x

/-- Pure evaluated additive assembly; no operator conversion. -/
theorem joinDifferences {V : Type*} [AddCommGroup V]
    (sW sZ fW fZ O F : V)
    (hs : sW - sZ = O) (hf : fW - fZ = F) (hzero : O + F = 0) :
    (sW + fW) - (sZ + fZ) = 0 := by
  calc
    _ = (sW - sZ) + (fW - fZ) := by abel
    _ = 0 := by rw [hs, hf, hzero]

/-- Original charge squares agree pointwise for equal-norm real spinors
on the actual paired gauge invariant smooth core. -/
theorem physicalSquareDifference (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x -
      ((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x = 0 := by
  have hc (a : ColorIndex 2) :
      pairedAlgebraData.color a = FCP.BFSSSU2.normalizedPauli a :=
    (pairedAlgebraData_color a).trans (concreteAlgebraData_color a)
  have hg : pairedAlgebraData.gamma = originalGamma := by
    funext i
    exact (pairedAlgebraData_gamma i).trans (concreteAlgebraData_gamma i)
  let u : ColorVector 2 :=
    sourceSpinorWeightedColor pairedAlgebraData w x -
      sourceSpinorWeightedColor pairedAlgebraData z x
  have hs := FCP.BFSSCSQO0Literal.scalarHalfSquare_difference
    pairedAlgebraData hc hg w z hn f.val x
  have hf := FCP.BFSSCSQF1.originalFermionicDifference
    pairedAlgebraData hc hg w z hn f.val x
  have hzero := physicalGaussCancel u f x
  have hweights (c : ColorIndex 2) :
      u c = sourceSpinorWeightedColor pairedAlgebraData w x c -
        sourceSpinorWeightedColor pairedAlgebraData z x c := rfl
  simp only [hweights] at hzero
  rw [normalOrder_apply pairedAlgebraData w f.val x,
    normalOrder_apply pairedAlgebraData z f.val x]
  exact joinDifferences _ _ _ _ _ _ hs hf hzero

#print axioms gaussSignCancel
#print axioms generator_apply
#print axioms physicalGaussCancel
#print axioms evaluateAdd
#print axioms normalOrder_apply
#print axioms joinDifferences
#print axioms physicalSquareDifference
end
end FCP.BFSSCSQG0
