import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLD0OriginalKernelIntegralTransport

/-! MOL-E0: assemble the exact original kinetic mollifier equation from the
qualified reflected weak pairing and kernel integral transport. The input
weak pairing is for the complete kinetic operator, not its coordinates. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLE0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLC0 FCP.BFSSMOLD0
open MeasureTheory

/-- The three original finite sums, in their original order. -/
theorem triple_integral {N : ℕ}
    (F : SpaceIndex → ColorIndex N → SpinIndex → Boson N → Fermion N)
    (hF : ∀ i A b, Integrable (F i A b) volume) :
    Integrable (fun y => ∑ i : SpaceIndex, ∑ A : ColorIndex N,
      ∑ b : SpinIndex, F i A b y) volume ∧
    (∫ y, ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex, F i A b y) =
      ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex, ∫ y, F i A b y := by
  have hb (i : SpaceIndex) (A : ColorIndex N) :
      Integrable (fun y => ∑ b : SpinIndex, F i A b y) volume :=
    integrable_finsetSum Finset.univ (fun b _ => hF i A b)
  have hA (i : SpaceIndex) :
      Integrable (fun y => ∑ A : ColorIndex N, ∑ b : SpinIndex, F i A b y) volume :=
    integrable_finsetSum Finset.univ (fun A _ => hb i A)
  refine ⟨integrable_finsetSum Finset.univ (fun i _ => hA i), ?_⟩
  calc
    _ = ∑ i : SpaceIndex, ∫ y, ∑ A : ColorIndex N, ∑ b : SpinIndex, F i A b y :=
      integral_finsetSum Finset.univ (fun i _ => hA i)
    _ = ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∫ y, ∑ b : SpinIndex, F i A b y := by
      apply Finset.sum_congr rfl
      intro i hi
      exact integral_finsetSum Finset.univ (fun A _ => hb i A)
    _ = _ := by
      apply Finset.sum_congr rfl
      intro i hi
      apply Finset.sum_congr rfl
      intro A hA'
      exact integral_finsetSum Finset.univ (fun b _ => hF i A b)

/-- Actual source kinetic equation at every x, under the whole weak pairing. -/
theorem mollified_kinetic_eq {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u w : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hw : LocallyIntegrable w volume) (hsu : HasCompactSupport u)
    (hsw : HasCompactSupport w)
    (h : ∀ f : SmoothCore N,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : ScalarCore N) (x : Boson N) :
    (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
      (-Complex.I * (M.gamma i a b : ℂ)) •
        M.theta b A (coordinateDerivative i A (mollifiedCore k u hu hsu) x)) =
      mollifiedCore k w hw hsw x := by
  let F (i : SpaceIndex) (A : ColorIndex N) (b : SpinIndex) (y : Boson N) :
      Fermion N :=
    (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
      ((fderiv ℝ (k : Boson N → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y)
  let G (y : Boson N) : Fermion N := k (x - y) • w y
  have hF (i : SpaceIndex) (A : ColorIndex N) (b : SpinIndex) :
      Integrable (F i A b) volume := kineticTerm_integrable M a b i A k u hu x
  have hG : Integrable G volume := kernel_integrable k w hw x
  obtain ⟨hi, he⟩ := triple_integral F hF
  have hsum :
      (∫ y, ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex, F i A b y) =
        ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A (mollifiedCore k u hu hsu) x) := by
    calc
      _ = ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          ∫ y, F i A b y := he
      _ = _ := by
        apply Finset.sum_congr rfl
        intro i hi'
        apply Finset.sum_congr rfl
        intro A hA
        apply Finset.sum_congr rfl
        intro b hb
        exact kineticTerm_integral M a b i A k u hu hsu x
  apply ext_inner_left ℂ
  intro z
  calc
    _ = inner ℂ z (∫ y, ∑ i : SpaceIndex, ∑ A : ColorIndex N,
          ∑ b : SpinIndex, F i A b y) := by rw [hsum]
    _ = ∫ y, inner ℂ z (∑ i : SpaceIndex, ∑ A : ColorIndex N,
          ∑ b : SpinIndex, F i A b y) := (fixedInner_integral z _ hi).symm
    _ = ∫ y, inner ℂ z (G y) := transported_kinetic_weak_pairing M a u w h k x z
    _ = inner ℂ z (∫ y, G y) := fixedInner_integral z G hG
    _ = _ := congrArg (fun v : Fermion N => inner ℂ z v)
      (mollifiedCore_apply k w hw hsw x).symm

#print axioms triple_integral
#print axioms mollified_kinetic_eq

end
end FCP.BFSSMOLE0
