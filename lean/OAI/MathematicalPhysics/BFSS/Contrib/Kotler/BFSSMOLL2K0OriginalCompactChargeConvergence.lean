import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2J0OriginalChargeDecomposition

/-! MOL-L2K0: original compact kinetic weak-pair approximation and strong
convergence of the actual bundled charge. The input pairing is kinetic;
conversion of a full charge weak pair to this hypothesis is a later gate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2K0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLE0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open FCP.BFSSMOLL2F0 FCP.BFSSMOLL2I0 FCP.BFSSMOLL2J0
open MeasureTheory Filter
open scoped Topology

def KineticWeakPair {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u w : Boson N → Fermion N) : Prop :=
  ∀ f : SmoothCore N,
    (∫ x, inner ℂ (kineticCore M a f x) (u x)) =
      ∫ x, inner ℂ (f x) (w x)

theorem kineticCore_mollified_eq {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u w : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hw : LocallyIntegrable w volume) (hsu : HasCompactSupport u)
    (hsw : HasCompactSupport w) (h : KineticWeakPair M a u w)
    (k : ScalarCore N) :
    kineticCore M a (mollifiedCore k u hu hsu) = mollifiedCore k w hw hsw := by
  have hpair : ∀ f : SmoothCore N,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y) := by
    intro f
    simpa only [kineticCore_apply] using h f
  apply DFunLike.ext
  intro x
  rw [kineticCore_apply]
  exact mollified_kinetic_eq M a u w hu hw hsu hsw hpair k x

theorem concrete_mollified_kinetic_tendsto {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u w : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hw : LocallyIntegrable w volume)
    (hsu : HasCompactSupport u) (hsw : HasCompactSupport w)
    (hsmw : StronglyMeasurable w) (h2w : MemLp w 2 volume)
    (h : KineticWeakPair M a u w) :
    Tendsto (fun n => coreToL2 (kineticCore M a
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu)))
      atTop (𝓝 (h2w.toLp w)) := by
  have he : (fun n => coreToL2 (kineticCore M a
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu))) =
      (fun n => coreToL2 (mollifiedCore
        (normalizedKernel (shrinkingBump N n)) w hw hsw)) := by
    funext n
    rw [kineticCore_mollified_eq M a u w hu hw hsu hsw h]
  rw [he]
  exact concrete_mollified_tendsto w hsmw h2w hw hsw

theorem concrete_mollified_charge_tendsto {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u w : Boson N → Fermion N)
    (hsmu : StronglyMeasurable u) (h2u : MemLp u 2 volume)
    (hsmw : StronglyMeasurable w) (h2w : MemLp w 2 volume)
    (hu : LocallyIntegrable u volume) (hw : LocallyIntegrable w volume)
    (hsu : HasCompactSupport u) (hsw : HasCompactSupport w)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : KineticWeakPair M a u w) :
    Tendsto (fun n => coreToL2 (M.charge a
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu)))
      atTop (𝓝 (h2w.toLp w +
        potentialL2 M a u hsmu h2u (R + 1) (input_support_enlarged u R hR))) := by
  let f : ℕ → SmoothCore N := fun n =>
    mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hsu
  have hf : ∀ n, tsupport (f n : Boson N → Fermion N) ⊆
      Metric.closedBall 0 (R + 1) :=
    concrete_mollified_uniform_support u hu hsu R hR
  have hk : Tendsto (fun n => coreToL2 (kineticCore M a (f n)))
      atTop (𝓝 (h2w.toLp w)) :=
    concrete_mollified_kinetic_tendsto M a u w hu hw hsu hsw hsmw h2w h
  have hp : Tendsto (fun n => corePotentialL2 M a (f n) (R + 1) (hf n))
      atTop (𝓝 (potentialL2 M a u hsmu h2u (R + 1)
        (input_support_enlarged u R hR))) :=
    concrete_mollified_potential_tendsto M a u hsmu h2u hu hsu R hR
  have he : (fun n => coreToL2 (M.charge a (f n))) =
      (fun n => coreToL2 (kineticCore M a (f n)) +
        corePotentialL2 M a (f n) (R + 1) (hf n)) := by
    funext n
    exact chargeL2_split M a (f n) (R + 1) (hf n)
  change Tendsto (fun n => coreToL2 (M.charge a (f n))) atTop _
  rw [he]
  exact hk.add hp

#print axioms KineticWeakPair
#print axioms kineticCore_mollified_eq
#print axioms concrete_mollified_kinetic_tendsto
#print axioms concrete_mollified_charge_tendsto

end
end FCP.BFSSMOLL2K0
