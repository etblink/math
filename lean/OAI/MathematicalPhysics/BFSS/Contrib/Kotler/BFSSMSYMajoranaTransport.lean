import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYReflectedGammaBasis
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3JIndependentUnitaryExistenceProbe

/-! The reflected Appendix A spinor basis lifts to the original Fock fiber
for any finite-dimensional irreducible Hermitian delta-one CAR realization. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYMajorana

open OAI.BFSSQuantum
open FCP.BFSSMSYGamma FCP.BFSSSU2GaugeG1A
open scoped Matrix

/-- Columns are original spinor coordinates expressed in the Appendix A basis. -/
noncomputable def spinBasis : GammaMatrix := (1 / 2 : ℝ) • doubledBasis

theorem spinBasis_transpose_mul : spinBasis.transpose * spinBasis = 1 := by
  rw [spinBasis, Matrix.transpose_smul, Matrix.smul_mul, Matrix.mul_smul,
    doubledBasis_transpose_mul, smul_smul, smul_smul]
  norm_num

private noncomputable def basisComplex : Matrix SpinIndex SpinIndex ℂ :=
  spinBasis.map Complex.ofReal

private theorem basisComplex_gram : basisComplex.transpose * basisComplex = 1 := by
  let f := Complex.ofRealHom.mapMatrix (m := SpinIndex)
  change f spinBasis.transpose * f spinBasis = 1
  rw [← map_mul, spinBasis_transpose_mul, map_one]

private theorem basisComplex_rows : basisComplex * basisComplex.transpose = 1 :=
  mul_eq_one_comm.mp basisComplex_gram

section Fiber

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- The same real change of spinor coordinates acts at each of the three colors. -/
noncomputable def pullMajorana (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (α : SpinIndex) (C : ColorIndex 2) : Module.End ℂ E :=
  ∑ β, basisComplex β α • theta β C

theorem pullMajorana_apply (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (α : SpinIndex) (C : ColorIndex 2) (w : E) :
    pullMajorana theta α C w = ∑ β, (spinBasis β α : ℂ) • theta β C w := by
  simp only [pullMajorana, LinearMap.sum_apply, LinearMap.smul_apply, basisComplex, Matrix.map_apply]

private theorem pullMajorana_symmetric
    (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (h : ∀ α C, (theta α C).IsSymmetric) (α : SpinIndex) (C : ColorIndex 2) :
    (pullMajorana theta α C).IsSymmetric := by
  unfold pullMajorana
  have hs (β : SpinIndex) : (basisComplex β α • theta β C).IsSymmetric :=
    (h β C).smul (by simp [basisComplex])
  classical
  generalize (Finset.univ : Finset SpinIndex) = s
  induction s using Finset.induction_on with
  | empty => simpa only [Finset.sum_empty] using LinearMap.IsSymmetric.zero
  | insert β s hβ ih => rw [Finset.sum_insert hβ]; exact (hs β).add ih

private theorem anticommutator_sum
    {R : Type*} [Ring R] {ι κ : Type*} [Fintype ι] [Fintype κ]
    (f : ι → R) (g : κ → R) :
    (∑ i, f i) * (∑ j, g j) + (∑ j, g j) * (∑ i, f i) =
      ∑ i, ∑ j, (f i * g j + g j * f i) := by
  simp_rw [Finset.sum_mul, Finset.mul_sum, Finset.sum_add_distrib]
  congr 1
  exact Finset.sum_comm

private theorem pullMajorana_car
    (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (h : ∀ α β C D, theta α C * theta β D + theta β D * theta α C =
      (if α = β ∧ C = D then (1 : ℂ) else 0) • (1 : Module.End ℂ E))
    (α γ : SpinIndex) (C D : ColorIndex 2) :
    pullMajorana theta α C * pullMajorana theta γ D +
      pullMajorana theta γ D * pullMajorana theta α C =
        (if α = γ ∧ C = D then (1 : ℂ) else 0) • (1 : Module.End ℂ E) := by
  have gram := congrFun (congrFun basisComplex_gram α) γ
  change (∑ β, basisComplex β α * basisComplex β γ) = _ at gram
  unfold pullMajorana
  rw [anticommutator_sum]
  simp only [smul_mul_assoc, mul_smul_comm, smul_smul]
  simp_rw [mul_comm (basisComplex _ γ) (basisComplex _ α), ← smul_add, h]
  by_cases hCD : C = D
  · simp only [hCD, and_true, one_smul, zero_smul, smul_ite, smul_zero,
      Finset.sum_ite_eq, Finset.mem_univ, ite_true]
    rw [← Finset.sum_smul, gram]
    simp [Matrix.one_apply, ite_smul]
  · simp [hCD]

private theorem recoverMajorana (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (β : SpinIndex) (C : ColorIndex 2) :
    (∑ α, basisComplex β α • pullMajorana theta α C) = theta β C := by
  unfold pullMajorana
  simp_rw [Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  calc
    _ = ∑ γ, (basisComplex * basisComplex.transpose) β γ • theta γ C := by
      simp only [Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_smul]
    _ = theta β C := by
      rw [basisComplex_rows]
      simp [Matrix.one_apply, ite_smul]

/-- The spin contraction used in the fermionic color generators survives a
spinor basis change at all colors. -/
theorem color_bilinear_eq (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (C D : ColorIndex 2) :
    (∑ α, pullMajorana theta α C * pullMajorana theta α D) =
      ∑ β, theta β C * theta β D := by
  unfold pullMajorana
  simp_rw [Finset.sum_mul, Finset.mul_sum, smul_mul_assoc, mul_smul_comm, smul_smul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro β _
  rw [Finset.sum_comm]
  calc
    _ = ∑ γ, (basisComplex * basisComplex.transpose) β γ • (theta β C * theta γ D) := by
      simp only [Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_smul]
    _ = theta β C * theta β D := by
      rw [basisComplex_rows]
      simp [Matrix.one_apply, ite_smul]

/-- A unitary sends the Appendix A generators pulled back by the reflected
spinor basis to the corresponding original paired Majoranas. -/
theorem exists_original_fock_isometry [FiniteDimensional ℂ E] [Nontrivial E]
    (theta : SpinIndex → ColorIndex 2 → Module.End ℂ E)
    (hHermitian : ∀ α C, (theta α C).IsSymmetric)
    (hCAR : ∀ α β C D,
      theta α C * theta β D + theta β D * theta α C =
        (if α = β ∧ C = D then (1 : ℂ) else 0) • (1 : Module.End ℂ E))
    (hirr : ∀ W : Submodule ℂ E,
      (∀ α C, ∀ w ∈ W, theta α C w ∈ W) → W = ⊥ ∨ W = ⊤) :
    ∃ J : E ≃ₗᵢ[ℂ] Fermion 2, ∀ (α : SpinIndex) (C : ColorIndex 2) (w : E),
      J (pullMajorana theta α C w) = pairedTheta α C (J w) := by
  apply FCP.BFSSS1V52M3JIndependent.independent_original_generator_unitary
    (pullMajorana theta) (pullMajorana_symmetric theta hHermitian) (pullMajorana_car theta hCAR)
  intro W hW
  apply hirr W
  intro β C w hw
  rw [← recoverMajorana theta β C, LinearMap.sum_apply]
  exact Submodule.sum_mem W fun α _ => W.smul_mem _ (hW α C w hw)

end Fiber

#print axioms spinBasis_transpose_mul
#print axioms color_bilinear_eq
#print axioms exists_original_fock_isometry

end FCP.BFSSMSYMajorana
