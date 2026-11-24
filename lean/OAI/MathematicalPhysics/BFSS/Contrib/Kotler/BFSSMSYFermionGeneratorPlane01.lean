import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYTypedColorTable
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG1BOriginalSignedCross
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G6KOriginalBoundedFermionColorCurrentProbe

/-! The bounded original paired-Fock generator in the MSY color plane
with zero-based indices 0 and 1. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYFermionGeneratorPlane01

open OAI.BFSSQuantum
open FCP.BFSSSU2 FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1BOriginalSignedCross FCP.BFSSMSYTypedColorTable
open FCP.BFSSSU2PhysicalDomainL6G6K

private theorem color_term (α : SpinIndex) (a b : Fin 3) :
    sourceFiberFermionColorTerm pairedAlgebraData (2 : Fin 3) α a b =
      ((Real.sqrt 2 : ℂ) * (epsilon3 a b (2 : Fin 3) : ℂ)) •
        (pairedTheta α a * pairedTheta α b) := by
  have hc : pairedAlgebraData.structureConstant a b (2 : Fin 3) =
      Real.sqrt 2 * epsilon3 a b (2 : Fin 3) :=
    pairedColor_structureConstant a b (2 : Fin 3)
  unfold sourceFiberFermionColorTerm
  rw [hc, Complex.ofReal_mul, pairedAlgebraData_theta, pairedAlgebraData_theta]

private theorem reverse_product (α : SpinIndex) :
    pairedTheta α (1 : Fin 3) * pairedTheta α (0 : Fin 3) =
      -(pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3)) := by
  rw [eq_neg_iff_add_eq_zero]
  have hne : ¬ (α = α ∧ (1 : Fin 3) = (0 : Fin 3)) :=
    fun h => (by decide : (1 : Fin 3) ≠ (0 : Fin 3)) h.2
  have h := pairedTheta_CAR α α (1 : Fin 3) (0 : Fin 3)
  rw [ite_eq_right hne] at h
  exact h.trans (zero_smul ℂ (1 : SourceFiberEnd))

private theorem spin_contraction (α : SpinIndex) :
    (∑ a : Fin 3, ∑ b : Fin 3,
      sourceFiberFermionColorTerm pairedAlgebraData (2 : Fin 3) α a b) =
      (2 * (Real.sqrt 2 : ℂ)) •
        (pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3)) := by
  let T : Fin 3 → Fin 3 → SourceFiberEnd := fun a b => pairedTheta α a * pairedTheta α b
  calc
    _ = ∑ a : Fin 3, ∑ b : Fin 3,
        ((Real.sqrt 2 : ℂ) * (epsilon3 a b (2 : Fin 3) : ℂ)) • T a b := by
      apply Finset.sum_congr rfl
      intro a _
      apply Finset.sum_congr rfl
      intro b _
      exact color_term α a b
    _ = (Real.sqrt 2 : ℂ) • (T (0 : Fin 3) (1 : Fin 3) - T (1 : Fin 3) (0 : Fin 3)) :=
      contract_plane01 T (Real.sqrt 2 : ℂ)
    _ = _ := by
      change (Real.sqrt 2 : ℂ) •
        (pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3) -
         pairedTheta α (1 : Fin 3) * pairedTheta α (0 : Fin 3)) = _
      rw [reverse_product, sub_neg_eq_add, smul_add, ← add_smul, ← two_mul]

private theorem generator_scale (s : ℂ) : Complex.I * (-Complex.I / 2) * (2 * s) = s := by
  rw [show Complex.I * (-Complex.I / 2) * (2 * s) = -(Complex.I ^ 2) * s by ring,
    Complex.I_sq, neg_neg, one_mul]

-- Unfold the current while the algebra data are a parameter. The
-- specialization below only applies the resulting equality.
private theorem generator_from_spin_contraction
    (M : AlgebraData 2) (T : SpinIndex → SourceFiberEnd)
    (hSpin : ∀ α : SpinIndex,
      (∑ a : Fin 3, ∑ b : Fin 3, sourceFiberFermionColorTerm M (2 : Fin 3) α a b) =
        (2 * (Real.sqrt 2 : ℂ)) • T α) :
    sourceFiberFermionColorGenerator M (2 : Fin 3) =
      (Real.sqrt 2 : ℂ) • (∑ α : SpinIndex, T α) := by
  change Complex.I • ((-Complex.I / 2 : ℂ) •
    (∑ α : SpinIndex, ∑ a : Fin 3, ∑ b : Fin 3,
      sourceFiberFermionColorTerm M (2 : Fin 3) α a b)) = _
  have hsum : (∑ α : SpinIndex, ∑ a : Fin 3, ∑ b : Fin 3,
        sourceFiberFermionColorTerm M (2 : Fin 3) α a b) =
      ∑ α : SpinIndex, (2 * (Real.sqrt 2 : ℂ)) • T α :=
    Finset.sum_congr rfl (fun α _ => hSpin α)
  rw [hsum, ← Finset.smul_sum, smul_smul, smul_smul, generator_scale]

/-- The actual positive-i native color generator uses the forward
Majorana order and contributes the coefficient `√2`. -/
theorem native_fermion_generator_plane01 :
    sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3) =
      (Real.sqrt 2 : ℂ) •
        (∑ α : SpinIndex, pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3)) :=
  generator_from_spin_contraction pairedAlgebraData
    (fun α => pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3)) spin_contraction

#print axioms native_fermion_generator_plane01

end FCP.BFSSMSYFermionGeneratorPlane01
