import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b3BasisSquareComposition

/-! CSQ-E0: original basis-charge square and energy on the actual
paired invariant smooth core. No closed-domain or spectral claim.
Polarization is a separate subsequent obligation. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Real coordinate spinor in the original 16 labels. -/
def basisSpinor (a : SpinIndex) (b : SpinIndex) : ℝ :=
  if b = a then 1 else 0

/-- Basis norm in the literal original G2 normalization. -/
theorem basisSpinor_norm (a : SpinIndex) :
    spinorSquareNorm (basisSpinor a) = 1 := by
  unfold spinorSquareNorm basisSpinor
  have h (b : SpinIndex) : (if b = a then (1 : ℝ) else 0) ^ 2 =
      (if b = a then (1 : ℝ) else 0) := by
    by_cases hb : b = a <;> simp [hb]
  simp only [h]
  simp

/-- Finite weighted coordinate selector, before specializing any operator. -/
theorem basisWeightedSum {V : Type*} [AddCommGroup V] [Module ℂ V]
    (A : SpinIndex → V) (a : SpinIndex) :
    (∑ b : SpinIndex, (basisSpinor a b : ℂ) • A b) = A a := by
  classical
  have h (b : SpinIndex) :
      (basisSpinor a b : ℂ) • A b = if b = a then A b else 0 := by
    by_cases hb : b = a <;> simp [basisSpinor, hb]
  calc
    (∑ b : SpinIndex, (basisSpinor a b : ℂ) • A b) =
        ∑ b : SpinIndex, if b = a then A b else 0 :=
      Finset.sum_congr rfl (fun b _ => h b)
    _ = A a := by simp

/-- The weighted charge on a coordinate spinor is the original charge. -/
theorem basisCharge (M : AlgebraData 2) (a : SpinIndex) :
    sourceAllSpinorCharge M (basisSpinor a) = M.charge a := by
  unfold sourceAllSpinorCharge
  exact basisWeightedSum M.charge a

/-- Actual equal basis squares, with no assumed differential Hamiltonian. -/
theorem basisSquarePoint (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x =
      ((pairedAlgebraData.charge b * pairedAlgebraData.charge b) f.val) x :=
  FCP.BFSSCSQE0b3.basisSquarePoint a b f x

/-- Recover equality of original smooth-core vectors from pointwise equality. -/
theorem basisSquareCore (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) :=
  FCP.BFSSCSQE0b3.basisSquareCore a b f

/-- Abstract original symmetry-to-energy implication. No charge expansion. -/
theorem symmetricEnergy {A B : SourceEnd 2}
    (hA : CoreSymmetric A) (hB : CoreSymmetric B)
    (f : SmoothCore 2) (h : A (A f) = B (B f)) :
    ‖coreToL2 (A f)‖ ^ 2 = ‖coreToL2 (B f)‖ ^ 2 := by
  have hi : inner ℂ (coreToL2 (A f)) (coreToL2 (A f)) =
      inner ℂ (coreToL2 (B f)) (coreToL2 (B f)) := by
    calc
      _ = inner ℂ (coreToL2 f) (coreToL2 (A (A f))) := hA f (A f)
      _ = inner ℂ (coreToL2 f) (coreToL2 (B (B f))) :=
        congrArg (fun g : SmoothCore 2 => inner ℂ (coreToL2 f) (coreToL2 g)) h
      _ = _ := (hB f (B f)).symm
  rw [norm_sq_eq_re_inner (𝕜 := ℂ) (coreToL2 (A f)),
    norm_sq_eq_re_inner (𝕜 := ℂ) (coreToL2 (B f)), hi]

/-- All sixteen original physical basis-charge energies coincide. -/
theorem basisEnergyEqual (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    ‖coreToL2 (pairedAlgebraData.charge a f.val)‖ ^ 2 =
      ‖coreToL2 (pairedAlgebraData.charge b f.val)‖ ^ 2 := by
  have ha := pairedAlgebraData.charge_symmetric a f.val
    (pairedAlgebraData.charge a f.val)
  have hb := pairedAlgebraData.charge_symmetric b f.val
    (pairedAlgebraData.charge b f.val)
  have hs := basisSquareCore a b f
  rw [hs] at ha
  have hi := ha.trans hb.symm
  rw [norm_sq_eq_re_inner (𝕜 := ℂ)
    (coreToL2 (pairedAlgebraData.charge a f.val)),
    norm_sq_eq_re_inner (𝕜 := ℂ)
      (coreToL2 (pairedAlgebraData.charge b f.val)), hi]

/-- The original normalized sixteen-term average of constant energies. -/
theorem averageConstant (E : SpinIndex → ℝ) (a : SpinIndex)
    (h : ∀ b : SpinIndex, E b = E a) :
    (1 / 16 : ℝ) * (∑ b : SpinIndex, E b) = E a := by
  calc
    _ = (1 / 16 : ℝ) * (∑ _b : SpinIndex, E a) := by
      apply congrArg (fun r : ℝ => (1 / 16 : ℝ) * r)
      apply Finset.sum_congr rfl
      intro b _
      exact h b
    _ = _ := by
      rw [Finset.sum_const, Finset.card_univ]
      change (1 / 16 : ℝ) * ((16 : ℕ) • E a) = E a
      rw [nsmul_eq_mul]
      ring

/-- Each actual physical basis charge encodes the literal coreForm. -/
theorem originalBasisEnergy (a : SpinIndex) (f : pairedGaugeData.invariantCore) :
    ‖coreToL2 (pairedAlgebraData.charge a f.val)‖ ^ 2 =
      pairedAlgebraData.coreForm f.val := by
  unfold coreForm
  exact (averageConstant (fun b : SpinIndex =>
    ‖coreToL2 (pairedAlgebraData.charge b f.val)‖ ^ 2) a
    (fun b => basisEnergyEqual b a f)).symm

#print axioms basisSpinor_norm
#print axioms basisWeightedSum
#print axioms basisCharge
#print axioms basisSquarePoint
#print axioms basisSquareCore
#print axioms symmetricEnergy
#print axioms basisEnergyEqual
#print axioms averageConstant
#print axioms originalBasisEnergy
end
end FCP.BFSSCSQE0
