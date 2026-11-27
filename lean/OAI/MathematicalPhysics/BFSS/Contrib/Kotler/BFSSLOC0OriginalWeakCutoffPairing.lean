import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2M0OriginalCompactFullGraph
import OAI.MathematicalPhysics.BFSS.Cutoffs

/-! LOC0: literal original real cutoff weak product rule, conditional
on square integrability of the cutoff fields and commutator. No convergence
or maximal-domain claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2L0
open MeasureTheory
open scoped ComplexConjugate

def cutoffField {N : ℕ} (χ : Boson N → ℝ)
    (u : Boson N → Fermion N) (x : Boson N) : Fermion N :=
  (χ x : ℂ) • u x

def cutoffError {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (u : Boson N → Fermion N) (x : Boson N) : Fermion N :=
  (-Complex.I) • M.principalSymbol (Pi.single a 1) (cutoffGradient χ x) (u x)

theorem cutoffError_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (u v : Boson N → Fermion N) (x : Boson N) :
    inner ℂ (cutoffError M a χ u x) (v x) =
      -inner ℂ (u x) (cutoffError M a χ v x) := by
  let S := M.principalSymbol (Pi.single a 1) (cutoffGradient χ x)
  have hs : IsSelfAdjoint S := M.cliffordLinear_selfAdjoint _
  have hp : inner ℂ (S (u x)) (v x) = inner ℂ (u x) (S (v x)) :=
    hs.isSymmetric _ _
  change inner ℂ ((-Complex.I) • S (u x)) (v x) =
    -inner ℂ (u x) ((-Complex.I) • S (v x))
  rw [inner_smul_left, hp, inner_smul_right]
  simp only [map_neg, Complex.conj_I, neg_neg, neg_mul]

theorem cutoffField_pairing {N : ℕ} (χ : Boson N → ℝ)
    (u v : Boson N → Fermion N) (x : Boson N) :
    inner ℂ (cutoffField χ u x) (v x) =
      inner ℂ (u x) (cutoffField χ v x) := by
  simp only [cutoffField, inner_smul_left, inner_smul_right, Complex.conj_ofReal]

theorem cutoffError_norm_sq {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (u : Boson N → Fermion N) (x : Boson N) :
    ‖cutoffError M a χ u x‖ ^ 2 =
      (1 / 2 : ℝ) * ‖cutoffGradient χ x‖ ^ 2 * ‖u x‖ ^ 2 := by
  unfold cutoffError
  rw [norm_smul, norm_neg, Complex.norm_I, one_mul]
  exact M.principalSymbol_unit_norm_sq _ (basisSpinor_unit a) _ _

theorem chargeWeakPair_cutoff {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (u v : Boson N → Fermion N)
    (hcu : MemLp (cutoffField χ u) 2 volume)
    (hcv : MemLp (cutoffField χ v) 2 volume)
    (he : MemLp (cutoffError M a χ u) 2 volume)
    (h : ChargeWeakPair M a u v) :
    ChargeWeakPair M a (cutoffField χ u)
      (cutoffField χ v + cutoffError M a χ u) := by
  intro f
  have h2f : MemLp (f : Boson N → Fermion N) 2 volume :=
    f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport
  have h2q : MemLp (M.charge a f : Boson N → Fermion N) 2 volume :=
    (M.charge a f).continuous.memLp_of_hasCompactSupport (M.charge a f).hasCompactSupport
  have hi := original_memLp_inner_integrable (M.charge a f) (cutoffField χ u) h2q hcu
  have hj := original_memLp_inner_integrable (f : Boson N → Fermion N)
    (cutoffError M a χ u) h2f he
  have hk := original_memLp_inner_integrable (f : Boson N → Fermion N)
    (cutoffField χ v) h2f hcv
  have htest := h (realCutoff χ hχ f)
  have hl : (∫ x, inner ℂ (M.charge a (realCutoff χ hχ f) x) (u x)) =
      (∫ x, inner ℂ (M.charge a f x) (cutoffField χ u x)) -
        ∫ x, inner ℂ (f x) (cutoffError M a χ u x) := by
    calc
      _ = ∫ x, inner ℂ (M.charge a f x) (cutoffField χ u x) -
          inner ℂ (f x) (cutoffError M a χ u x) := by
        apply integral_congr_ae
        filter_upwards [] with x
        rw [M.charge_realCutoff, inner_add_left]
        change inner ℂ (cutoffField χ (M.charge a f) x) (u x) +
          inner ℂ (cutoffError M a χ f x) (u x) = _
        rw [cutoffField_pairing, cutoffError_pairing, sub_eq_add_neg]
      _ = _ := integral_sub hi hj
  have hr : (∫ x, inner ℂ (realCutoff χ hχ f x) (v x)) =
      ∫ x, inner ℂ (f x) (cutoffField χ v x) := by
    apply integral_congr_ae
    filter_upwards [] with x
    exact cutoffField_pairing χ f v x
  rw [hl, hr] at htest
  simp only [Pi.add_apply, inner_add_right]
  rw [integral_add hk hj]
  exact (sub_eq_iff_eq_add).mp htest

#print axioms cutoffField
#print axioms cutoffError
#print axioms cutoffError_pairing
#print axioms cutoffField_pairing
#print axioms cutoffError_norm_sq
#print axioms chargeWeakPair_cutoff

end
end FCP.BFSSLOC0
