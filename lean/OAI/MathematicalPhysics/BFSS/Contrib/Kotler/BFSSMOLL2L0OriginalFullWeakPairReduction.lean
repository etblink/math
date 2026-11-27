import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2K0OriginalCompactChargeConvergence

/-! MOL-L2L0: reduce the actual original full-charge compact weak pairing
to the kinetic weak pairing using pointwise Hermiticity of the original
potential. No maximal-domain or essential self-adjointness conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2L0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2G0 FCP.BFSSMOLL2H0 FCP.BFSSMOLL2J0 FCP.BFSSMOLL2K0
open MeasureTheory
open scoped ComplexConjugate

theorem potentialOperator_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (x : Boson N) (v w : Fermion N) :
    inner ℂ (potentialOperator M a x v) w =
      inner ℂ v (potentialOperator M a x w) := by
  simp only [potentialOperator_apply, sum_inner, inner_sum]
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
  have hsym : inner ℂ (M.theta b A v) w = inner ℂ v (M.theta b A w) :=
    (M.theta_selfAdjoint b A).isSymmetric v w
  simp only [map_smul, inner_smul_left, inner_smul_right, Complex.conj_ofReal, hsym]

theorem potentialField_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u v : Boson N → Fermion N) (x : Boson N) :
    inner ℂ (potentialField M a u x) (v x) =
      inner ℂ (u x) (potentialField M a v x) :=
  potentialOperator_pairing M a x (u x) (v x)

theorem potentialField_hasCompactSupport {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u : Boson N → Fermion N) (hs : HasCompactSupport u) :
    HasCompactSupport (potentialField M a u) := by
  apply hs.mono
  intro x hx
  change potentialField M a u x ≠ 0 at hx
  change u x ≠ 0
  intro hz
  exact hx (by simp [potentialField, hz])

/-- Pairing integrability on literal original representatives. -/
theorem original_memLp_inner_integrable {N : ℕ}
    (u v : Boson N → Fermion N) (hu : MemLp u 2 volume) (hv : MemLp v 2 volume) :
    Integrable (fun x => inner ℂ (u x) (v x)) volume := by
  have hi := L2.integrable_inner (𝕜 := ℂ) (hu.toLp u) (hv.toLp v)
  refine (integrable_congr ?_).mp hi
  filter_upwards [hu.coeFn_toLp, hv.coeFn_toLp] with x hx hy
  rw [hx, hy]

def ChargeWeakPair {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u v : Boson N → Fermion N) : Prop :=
  ∀ f : SmoothCore N,
    (∫ x, inner ℂ (M.charge a f x) (u x)) = ∫ x, inner ℂ (f x) (v x)

theorem chargeWeakPair_to_kinetic {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u v : Boson N → Fermion N) (h2u : MemLp u 2 volume)
    (h2v : MemLp v 2 volume) (h2V : MemLp (potentialField M a u) 2 volume)
    (h : ChargeWeakPair M a u v) :
    KineticWeakPair M a u (v - potentialField M a u) := by
  intro f
  have h2f : MemLp (f : Boson N → Fermion N) 2 volume :=
    f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport
  have h2k : MemLp (kineticCore M a f : Boson N → Fermion N) 2 volume :=
    (kineticCore M a f).continuous.memLp_of_hasCompactSupport
      (kineticCore M a f).hasCompactSupport
  have hk := original_memLp_inner_integrable (kineticCore M a f) u h2k h2u
  have hv := original_memLp_inner_integrable (f : Boson N → Fermion N) v h2f h2v
  have hp := original_memLp_inner_integrable (f : Boson N → Fermion N)
    (potentialField M a u) h2f h2V
  have he := h f
  simp only [charge_apply_split, inner_add_left, potentialField_pairing] at he
  rw [integral_add hk hp] at he
  simp only [Pi.sub_apply, inner_sub_right]
  rw [integral_sub hv hp]
  exact (eq_sub_iff_add_eq).2 he

theorem compact_chargeWeakPair_reduction {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u v : Boson N → Fermion N) (hsmu : StronglyMeasurable u)
    (hsmv : StronglyMeasurable v) (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    StronglyMeasurable (v - potentialField M a u) ∧
      MemLp (v - potentialField M a u) 2 volume ∧
      LocallyIntegrable (v - potentialField M a u) volume ∧
      HasCompactSupport (v - potentialField M a u) ∧
      KineticWeakPair M a u (v - potentialField M a u) := by
  have h2V := potentialField_memLp M a u hsmu h2u R hR
  have h2w := h2v.sub h2V
  exact ⟨hsmv.sub (potentialField_stronglyMeasurable M a u hsmu),
    h2w, h2w.locallyIntegrable (by norm_num),
    hsv.sub (potentialField_hasCompactSupport M a u hsu),
    chargeWeakPair_to_kinetic M a u v h2u h2v h2V h⟩

#print axioms potentialOperator_pairing
#print axioms potentialField_pairing
#print axioms potentialField_hasCompactSupport
#print axioms original_memLp_inner_integrable
#print axioms ChargeWeakPair
#print axioms chargeWeakPair_to_kinetic
#print axioms compact_chargeWeakPair_reduction

end
end FCP.BFSSMOLL2L0
