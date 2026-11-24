import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G6HOriginalOrderedMajoranaFierzAssemblyProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5WOriginalOrbitalGaugeTangentProbe

/-! CSQ-F0: exact real coefficient subtraction before any Fock evaluation.
Prospective until strict native source and independent paired-source audit.
No new Fierz identity, charge-square theorem or operator-domain conclusion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF0
noncomputable section
open scoped Matrix BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5W
open FCP.BFSSSU2PhysicalDomainL6G6H

/-- Pure finite scalar factorization; no BFSS instances enter. -/
theorem finiteWeightedContraction {C K : Type*} [Fintype C] [Fintype K]
    (a : C → ℝ) (X : K → C → ℝ) (h : K → ℝ) :
    (∑ c : C, ∑ k : K, (a c * X k c) * h k) =
      ∑ c : C, a c * (∑ k : K, h k * X k c) := by
  apply Finset.sum_congr rfl
  intro c _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _
  ring

/-- Component of the literal weighted color vector via its native projection. -/
theorem weightedColor_component (M : AlgebraData 2)
    (w : SpinIndex → ℝ) (x : Boson 2) (c : ColorIndex 2) :
    sourceSpinorWeightedColor M w x c =
      ∑ k : SpaceIndex, dotProduct w (M.gamma k *ᵥ w) * x (k,c) := by
  unfold sourceSpinorWeightedColor
  change (EuclideanSpace.proj (𝕜 := ℝ) c)
    (∑ k : SpaceIndex, (dotProduct w (M.gamma k *ᵥ w)) • spatialColor x k) = _
  rw [map_sum]
  simp only [map_smul, smul_eq_mul] <;> rfl

/-- Equal norm cancels the gamma channel and leaves the exact diagonal
color coefficient with its negative sign, before any Majorana action. -/
theorem originalFierzDifference (M : AlgebraData 2)
    (w z : SpinIndex → ℝ) (hn : spinorSquareNorm w = spinorSquareNorm z)
    (p q : FermionLabel 2) (x : Boson 2) :
    sourceFierzChannelsReal M w p q x - sourceFierzChannelsReal M z p q x =
      -(if p.1 = q.1 then
        ∑ c : ColorIndex 2, M.structureConstant p.2 q.2 c *
          (sourceSpinorWeightedColor M w x c - sourceSpinorWeightedColor M z x c)
        else 0) := by
  have hc (v : SpinIndex → ℝ) :
      (∑ c : ColorIndex 2, ∑ k : SpaceIndex,
        (M.structureConstant p.2 q.2 c * x (k,c)) * dotProduct v (M.gamma k *ᵥ v)) =
        ∑ c : ColorIndex 2, M.structureConstant p.2 q.2 c *
          sourceSpinorWeightedColor M v x c := by
    simp only [weightedColor_component]
    exact finiteWeightedContraction
      (fun c => M.structureConstant p.2 q.2 c) (fun k c => x (k,c))
      (fun k => dotProduct v (M.gamma k *ᵥ v))
  by_cases he : p.1 = q.1
  · simp only [sourceFierzChannelsReal, he, if_true, hn, hc]
    calc
      _ = -((∑ c : ColorIndex 2, M.structureConstant p.2 q.2 c *
          sourceSpinorWeightedColor M w x c) -
          (∑ c : ColorIndex 2, M.structureConstant p.2 q.2 c *
          sourceSpinorWeightedColor M z x c)) := by ring
      _ = _ := by
        rw [← Finset.sum_sub_distrib]
        congr 1
        apply Finset.sum_congr rfl
        intro c _
        ring
  · simp only [sourceFierzChannelsReal, he, if_false, hn, sub_zero, sub_self, neg_zero]

#print axioms finiteWeightedContraction
#print axioms weightedColor_component
#print axioms originalFierzDifference

end
end FCP.BFSSCSQF0
