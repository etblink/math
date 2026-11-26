import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD3AKineticGaugeContractionProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4K9DSourcePotentialMultiplierProbe
import OAI.MathematicalPhysics.BFSS.CovariantFields

/-! UGC0: arbitrary gauge-related full smooth-core sections, not invariant sections.
The relation h(R_g x) = F_g f(x) specifies the transformed section, not a
physical invariance assumption. Construction of the combined core action and
its L² graph extension are subsequent gates. Candidate until strict CI. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainD3A FCP.BFSSSU2GaugeG4K9D
open Finset

theorem related_fderiv {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (f h : SmoothCore N)
    (hr : ∀ y : Boson N, h (G.boson g y) = G.fermion g (f y))
    (x v : Boson N) :
    fderiv ℝ (h : Boson N → Fermion N) (G.boson g x) (G.boson g v) =
      G.fermion g (fderiv ℝ (f : Boson N → Fermion N) x v) := by
  let B : Fermion N →L[ℝ] Fermion N :=
    (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap.restrictScalars ℝ
  have hf : Differentiable ℝ (f : Boson N → Fermion N) :=
    f.contDiff.differentiable (by norm_num)
  have hh : Differentiable ℝ (h : Boson N → Fermion N) :=
    h.contDiff.differentiable (by norm_num)
  have hl := (hh (G.boson g x)).hasFDerivAt.comp x (G.boson g).hasFDerivAt
  have hd := B.hasFDerivAt.comp x (hf x).hasFDerivAt
  have he : ((h : Boson N → Fermion N) ∘ G.boson g) = B ∘ f := by
    funext y
    exact hr y
  rw [he] at hl
  exact congrArg (fun L : Boson N →L[ℝ] Fermion N => L v) (hl.unique hd)

theorem related_kinetic {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (α : SpinIndex) (f h : SmoothCore N)
    (hr : ∀ y : Boson N, h (G.boson g y) = G.fermion g (f y))
    (x : Boson N) :
    (∑ p : SpaceIndex × ColorIndex N,
      M.kineticSkewLinear α (EuclideanSpace.single p 1)
        (fderiv ℝ (h : Boson N → Fermion N) (G.boson g x)
          (EuclideanSpace.single p 1))) =
      G.fermion g (∑ p : SpaceIndex × ColorIndex N,
        M.kineticSkewLinear α (EuclideanSpace.single p 1)
          (fderiv ℝ (f : Boson N → Fermion N) x
            (EuclideanSpace.single p 1))) := by
  let e (p : SpaceIndex × ColorIndex N) : Boson N := EuclideanSpace.single p 1
  calc
    (∑ p : SpaceIndex × ColorIndex N, M.kineticSkewLinear α (e p)
        (fderiv ℝ (h : Boson N → Fermion N) (G.boson g x) (e p))) =
      ∑ p : SpaceIndex × ColorIndex N, M.kineticSkewLinear α (G.boson g (e p))
        (fderiv ℝ (h : Boson N → Fermion N) (G.boson g x) (G.boson g (e p))) := by
          exact (sourceKineticSkewContraction_basisInvariant M G α
            h (G.boson g x) g).symm
    _ = ∑ p : SpaceIndex × ColorIndex N, M.kineticSkewLinear α (G.boson g (e p))
        (G.fermion g (fderiv ℝ (f : Boson N → Fermion N) x (e p))) := by
          apply Finset.sum_congr rfl
          intro p _
          rw [related_fderiv M G g f h hr x (e p)]
    _ = ∑ p : SpaceIndex × ColorIndex N, G.fermion g
        (M.kineticSkewLinear α (e p) (fderiv ℝ (f : Boson N → Fermion N) x (e p))) := by
          apply Finset.sum_congr rfl
          intro p _
          exact (G.kineticSkewLinear_covariant g α (e p)
            (fderiv ℝ (f : Boson N → Fermion N) x (e p))).symm
    _ = G.fermion g (∑ p : SpaceIndex × ColorIndex N, M.kineticSkewLinear α (e p)
        (fderiv ℝ (f : Boson N → Fermion N) x (e p))) := by rw [map_sum]

theorem original_charge_contracted {N : ℕ} (M : AlgebraData N)
    (α : SpinIndex) (f : SmoothCore N) (x : Boson N) :
    M.charge α f x =
      (∑ p : SpaceIndex × ColorIndex N,
        M.kineticSkewLinear α (EuclideanSpace.single p 1)
          (fderiv ℝ (f : Boson N → Fermion N) x (EuclideanSpace.single p 1))) +
      M.deformedPotentialMultiplier 1 0 x α (f x) := by
  rw [← sourceUnconditionalCoreCharge_equal M α f]
  change MixedEnergy.firstOrder (M.kineticSkewSymbol α) f x +
    MixedEnergy.field (M.deformedRealField 1 0 α)
      (M.deformedRealField_contDiff 1 0 α) f x = _
  rw [MixedEnergy.firstOrder_apply]
  simp only [MixedEnergy.delta_apply, MixedEnergy.field_apply, ← M.kineticSkewLinear_basis]
  rfl

theorem original_charge_related {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (α : SpinIndex) (f h : SmoothCore N)
    (hr : ∀ y : Boson N, h (G.boson g y) = G.fermion g (f y))
    (x : Boson N) :
    M.charge α h (G.boson g x) = G.fermion g (M.charge α f x) := by
  rw [original_charge_contracted M α h (G.boson g x),
    original_charge_contracted M α f x, map_add]
  congr 1
  · exact related_kinetic M G g α f h hr x
  · rw [hr x]
    exact (G.deformedPotentialMultiplier_covariant g 1 0 x α (f x)).symm

#print axioms related_fderiv
#print axioms related_kinetic
#print axioms original_charge_contracted
#print axioms original_charge_related

end
end FCP.BFSSUGC0
