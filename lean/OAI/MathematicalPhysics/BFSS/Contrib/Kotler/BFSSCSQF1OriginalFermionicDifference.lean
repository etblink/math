import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF0OriginalFierzDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G6KOriginalBoundedFermionColorCurrentProbe

/-! CSQ-F1: ordered response difference into the original bounded color current.
Finite scalar/module transport precedes the original source adapter.
Candidate until strict source and independent paired consumer qualification. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF1
noncomputable section
open scoped Matrix BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5W
open FCP.BFSSSU2PhysicalDomainL6G6H
open FCP.BFSSSU2PhysicalDomainL6G6I
open FCP.BFSSSU2PhysicalDomainL6G6K

/-- Abstract scalar-module transport. No concrete Fock reduction or CAR
identity; the ordered vector t is never reordered. -/
theorem finiteResponseDifference {P C V : Type*} [Fintype P] [Fintype C]
    [AddCommGroup V] [Module ℂ V]
    (D : P → P → Prop) [∀ p q, Decidable (D p q)]
    (a b : P → P → ℂ) (d : C → ℂ) (F : C → P → P → ℂ)
    (t : P → P → V)
    (h : ∀ p q, a p q - b p q =
      -(if D p q then ∑ c : C, F c p q * d c else 0)) :
    (1 / 2 : ℂ) • (∑ p : P, ∑ q : P, (Complex.I * a p q) • t p q) -
      (1 / 2 : ℂ) • (∑ p : P, ∑ q : P, (Complex.I * b p q) • t p q) =
      ∑ c : C, d c • ((-Complex.I / 2 : ℂ) •
        (∑ p : P, ∑ q : P, if D p q then F c p q • t p q else 0)) := by
  calc
    _ = (1 / 2 : ℂ) • (∑ p : P, ∑ q : P,
        (Complex.I * (a p q - b p q)) • t p q) := by
          simp only [mul_sub, sub_smul, Finset.sum_sub_distrib, smul_sub]
    _ = (1 / 2 : ℂ) • (∑ p : P, ∑ q : P, ∑ c : C,
        d c • ((-Complex.I) • (if D p q then F c p q • t p q else 0))) := by
          apply congrArg (fun v : V => (1 / 2 : ℂ) • v)
          apply Finset.sum_congr rfl
          intro p _
          apply Finset.sum_congr rfl
          intro q _
          rw [h p q]
          by_cases hp : D p q
          · simp only [hp, ite_true]
            rw [mul_neg, ← neg_mul, Finset.mul_sum, Finset.sum_smul]
            simp only [smul_smul]
            apply Finset.sum_congr rfl
            intro c _
            apply congrArg (fun z : ℂ => z • t p q)
            ring
          · simp [hp]
    _ = (1 / 2 : ℂ) • (∑ c : C, ∑ p : P, ∑ q : P,
        d c • ((-Complex.I) • (if D p q then F c p q • t p q else 0))) := by
          apply congrArg (fun v : V => (1 / 2 : ℂ) • v)
          calc
            _ = ∑ p : P, ∑ c : C, ∑ q : P,
                d c • ((-Complex.I) • (if D p q then F c p q • t p q else 0)) := by
                  apply Finset.sum_congr rfl
                  intro p _
                  exact Finset.sum_comm
            _ = _ := Finset.sum_comm
    _ = _ := by
          simp only [Finset.smul_sum, smul_smul]
          apply Finset.sum_congr rfl
          intro c _
          apply Finset.sum_congr rfl
          intro p _
          apply Finset.sum_congr rfl
          intro q _
          apply congrArg (fun z : ℂ =>
            z • (if D p q then F c p q • t p q else 0))
          ring

private def evalEnd (f : SmoothCore 2) (x : Boson 2) :
    SourceEnd 2 →ₗ[ℂ] Fermion 2 where
  toFun T := (T f) x
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- Pointwise diagonal expression from the public G6I and G6K
identities. No new spin-diagonal CAR calculation. -/
theorem current_diagonal_apply (M : AlgebraData 2) (c : ColorIndex 2)
    (f : SmoothCore 2) (x : Boson 2) :
    sourceFiberFermionColorCurrent M c (f x) =
      (-Complex.I / 2 : ℂ) •
        (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
          if p.1 = q.1 then
            (M.structureConstant p.2 q.2 c : ℂ) •
              M.theta p.1 p.2 (M.theta q.1 q.2 (f x))
          else 0) := by
  rw [← sourceFermionColorCurrent_apply_fiber M c f x]
  change evalEnd f x (sourceOriginalFermionColorCurrent M c) = _
  rw [sourceOriginalFermionColorCurrent_eq_spinDiagonal]
  simp only [map_smul, map_sum]
  apply congrArg (fun v : Fermion 2 => (-Complex.I / 2 : ℂ) • v)
  apply Finset.sum_congr rfl
  intro p _
  apply Finset.sum_congr rfl
  intro q _
  by_cases he : p.1 = q.1
  · simp only [he, ite_true, sourceOriginalFermionColorTerm_eq_source, map_smul]
    rfl
  · simp only [he, ite_false, map_zero]

/-- The literal G6H ordered response difference equals the weighted
original bounded current, with exactly the original -i/2 normalization. -/
theorem originalFermionicDifference (M : AlgebraData 2)
    (hcolor : ∀ a : ColorIndex 2, M.color a = FCP.BFSSSU2.normalizedPauli a)
    (hgamma : M.gamma = originalGamma)
    (w z : SpinIndex → ℝ) (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceOriginalOrderedFermionicResponse M w) f) x -
      ((sourceOriginalOrderedFermionicResponse M z) f) x =
      ∑ c : ColorIndex 2,
        ((sourceSpinorWeightedColor M w x c - sourceSpinorWeightedColor M z x c : ℝ) : ℂ) •
          sourceFiberFermionColorCurrent M c (f x) := by
  let d : ColorIndex 2 → ℂ := fun c =>
    ((sourceSpinorWeightedColor M w x c - sourceSpinorWeightedColor M z x c : ℝ) : ℂ)
  have hd (p q : FermionLabel 2) :
      (sourceFierzChannelsReal M w p q x : ℂ) -
        (sourceFierzChannelsReal M z p q x : ℂ) =
        -(if p.1 = q.1 then
          ∑ c : ColorIndex 2, (M.structureConstant p.2 q.2 c : ℂ) * d c else 0) := by
    have h := congrArg (fun r : ℝ => (r : ℂ))
      (FCP.BFSSCSQF0.originalFierzDifference M w z hn p q x)
    by_cases he : p.1 = q.1
    · simpa only [d, he, ite_true, Complex.ofReal_sub, Complex.ofReal_neg,
        Complex.ofReal_sum, Complex.ofReal_mul] using h
    · simpa only [he, ite_false, Complex.ofReal_sub, Complex.ofReal_neg,
        Complex.ofReal_zero] using h
  rw [sourceOriginalOrderedFermionicResponse_apply M hcolor hgamma w f x,
    sourceOriginalOrderedFermionicResponse_apply M hcolor hgamma z f x]
  calc
    _ = ∑ c : ColorIndex 2, d c • ((-Complex.I / 2 : ℂ) •
        (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
          if p.1 = q.1 then (M.structureConstant p.2 q.2 c : ℂ) •
            M.theta p.1 p.2 (M.theta q.1 q.2 (f x)) else 0)) :=
          finiteResponseDifference (fun p q : FermionLabel 2 => p.1 = q.1)
            (fun p q => (sourceFierzChannelsReal M w p q x : ℂ))
            (fun p q => (sourceFierzChannelsReal M z p q x : ℂ))
            d (fun c p q => (M.structureConstant p.2 q.2 c : ℂ))
            (fun p q => M.theta p.1 p.2 (M.theta q.1 q.2 (f x))) hd
    _ = _ := by
      apply Finset.sum_congr rfl
      intro c _
      rw [current_diagonal_apply M c f x]

#print axioms finiteResponseDifference
#print axioms current_diagonal_apply
#print axioms originalFermionicDifference
end
end FCP.BFSSCSQF1
