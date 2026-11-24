import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQG0LiteralPhysicalSquare

/-! CSQ-E0a: isolate the original coordinate-spinor selector after two E0 native REDs.
No square, energy, closed-domain or spectral assertion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0a
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

#print axioms basisSpinor_norm
#print axioms basisWeightedSum
#print axioms basisCharge
end
end FCP.BFSSCSQE0a
