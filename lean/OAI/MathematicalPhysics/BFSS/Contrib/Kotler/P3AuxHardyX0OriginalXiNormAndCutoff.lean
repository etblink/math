import OAI.MathematicalPhysics.BFSS.CliffordSymbols

/-!
HARDY-X0 R1: native Xi coefficient norm and actual smooth-core cutoff role.
PROSPECTIVE until exact strict source and independent paired consumer acceptance.
No physical Spin9, tau algebra, Hardy/fidelity or spectral theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

noncomputable def originalHardyXi (M : AlgebraData 2)
    (α : SpinIndex) (X : Boson 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  M.principalSymbol (Pi.single α 1) X

theorem originalHardyXi_apply (M : AlgebraData 2)
    (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalHardyXi M α X v =
      ∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        ((M.gamma i α β * X (i, A) : ℝ) : ℂ) • M.theta β A v :=
  M.principalSymbol_basis_apply α X v

theorem originalHardyXi_norm_sq (M : AlgebraData 2)
    (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    ‖originalHardyXi M α X v‖ ^ 2 =
      (1 / 2 : ℝ) * ‖X‖ ^ 2 * ‖v‖ ^ 2 := by
  have hv : (∑ β : SpinIndex,
      ((Pi.single α (1 : ℝ) : SpinIndex → ℝ) β) ^ 2 : ℝ) = 1 := by
    simp [Pi.single_apply]
  exact M.principalSymbol_unit_norm_sq (Pi.single α 1) hv X v

theorem originalHardyXi_sum_norm_sq (M : AlgebraData 2)
    (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex, ‖originalHardyXi M α X v‖ ^ 2) =
      8 * ‖X‖ ^ 2 * ‖v‖ ^ 2 := by
  simp_rw [originalHardyXi_norm_sq]
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  ring

theorem originalHardyXi_charge_realCutoff (M : AlgebraData 2)
    (α : SpinIndex) (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (f : SmoothCore 2) (X : Boson 2) :
    M.charge α (realCutoff χ hχ f) X =
      (χ X : ℂ) • M.charge α f X +
        (-Complex.I) • originalHardyXi M α (cutoffGradient χ X) (f X) :=
  M.charge_realCutoff α χ hχ f X

#print axioms originalHardyXi
#print axioms originalHardyXi_apply
#print axioms originalHardyXi_norm_sq
#print axioms originalHardyXi_sum_norm_sq
#print axioms originalHardyXi_charge_realCutoff

end
end FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff
