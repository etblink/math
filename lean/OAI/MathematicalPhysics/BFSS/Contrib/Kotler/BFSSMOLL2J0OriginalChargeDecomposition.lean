import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2I0OriginalPotentialConvergence

/-! MOL-L2J0: exact decomposition of the original bundled charge into
its original kinetic smooth-core term and the qualified potential field,
including the original FullL2 embedding. No weak graph conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2J0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2G0 FCP.BFSSMOLL2H0 FCP.BFSSMOLL2I0
open MeasureTheory

def kineticCore {N : ℕ} (M : AlgebraData N) (a : SpinIndex) :
    SmoothCore N →ₗ[ℂ] SmoothCore N :=
  ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
    (-Complex.I * (M.gamma i a b : ℂ)) •
      ((M.fermionAction b A).comp (coordinateDerivative i A))

def potentialCore {N : ℕ} (M : AlgebraData N) (a : SpinIndex) :
    SmoothCore N →ₗ[ℂ] SmoothCore N :=
  ∑ i : SpaceIndex, ∑ j : SpaceIndex, ∑ A : ColorIndex N,
    ∑ B : ColorIndex N, ∑ C : ColorIndex N, ∑ b : SpinIndex,
    (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
      ((M.fermionAction b A).comp ((position i B).comp (position j C)))

theorem charge_split {N : ℕ} (M : AlgebraData N) (a : SpinIndex) :
    M.charge a = kineticCore M a + potentialCore M a := rfl

/-- Evaluate at a point using the actual test carrier's linear operations. -/
def coreEval {N : ℕ} (x : Boson N) : SmoothCore N →ₗ[ℂ] Fermion N where
  toFun f := f x
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

theorem kineticCore_apply {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (x : Boson N) :
    kineticCore M a f x =
      ∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) •
          M.theta b A (coordinateDerivative i A f x) := by
  change coreEval x (kineticCore M a f) = _
  simp only [kineticCore, LinearMap.sum_apply, LinearMap.smul_apply,
    LinearMap.comp_apply, map_sum, map_smul]; rfl

theorem potentialCore_apply {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (x : Boson N) :
    potentialCore M a f x = potentialField M a f x := by
  rw [potentialField, potentialOperator_apply]
  change coreEval x (potentialCore M a f) = _
  simp only [potentialCore, LinearMap.sum_apply, map_sum]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  apply Finset.sum_congr rfl
  intro A hA
  apply Finset.sum_congr rfl
  intro B hB
  apply Finset.sum_congr rfl
  intro C hC
  apply Finset.sum_congr rfl
  intro b hb
  simp only [LinearMap.smul_apply, LinearMap.comp_apply, map_smul]
  change (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
      M.theta b A ((coordinate i B x : ℂ) • ((coordinate j C x : ℂ) • f x)) =
    (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
      ((coordinate i B x : ℂ) • ((coordinate j C x : ℂ) • M.theta b A (f x)))
  simp only [map_smul]

theorem charge_apply_split {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (x : Boson N) :
    M.charge a f x =
      kineticCore M a f x + potentialField M a f x := by
  rw [charge_split, LinearMap.add_apply]
  change kineticCore M a f x + potentialCore M a f x = _
  rw [potentialCore_apply]

theorem corePotentialL2_eq {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (R : ℝ)
    (hs : tsupport (f : Boson N → Fermion N) ⊆ Metric.closedBall 0 R) :
    coreToL2 (potentialCore M a f) = corePotentialL2 M a f R hs := by
  apply Lp.ext
  have hp : (corePotentialL2 M a f R hs : Boson N → Fermion N) =ᵐ[volume]
      potentialField M a f :=
    potentialL2_ae M a f f.continuous.stronglyMeasurable
      (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport) R hs
  filter_upwards [coreToL2_ae (potentialCore M a f), hp] with x hx hy
  rw [hx, hy]
  exact potentialCore_apply M a f x

theorem chargeL2_split {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (R : ℝ)
    (hs : tsupport (f : Boson N → Fermion N) ⊆ Metric.closedBall 0 R) :
    coreToL2 (M.charge a f) =
      coreToL2 (kineticCore M a f) + corePotentialL2 M a f R hs := by
  rw [charge_split, LinearMap.add_apply, map_add, corePotentialL2_eq M a f R hs]

#print axioms kineticCore
#print axioms potentialCore
#print axioms charge_split
#print axioms coreEval
#print axioms kineticCore_apply
#print axioms potentialCore_apply
#print axioms charge_apply_split
#print axioms corePotentialL2_eq
#print axioms chargeL2_split

end
end FCP.BFSSMOLL2J0
