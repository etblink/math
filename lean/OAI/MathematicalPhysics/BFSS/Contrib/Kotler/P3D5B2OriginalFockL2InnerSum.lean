import Mathlib.MeasureTheory.Integral.Bochner.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B1OriginalFockL2ColumnSeparation

/-!
# P3-D5B2 — source-original Fock L² inner product as finite sum

The D5B0 projections on the actual Fermion 2 carrier preserve the
full complex Hilbert inner product when summed over all finitely many
columns. Prove the finite-family integral identity generically first
and specialize only at the final proof join.

This is NOT yet an onto linear isometry to finite PiLp of L² columns.
This is not an operator-norm/HS-norm identification, gauge theorem,
physical Hamiltonian graph result, or eigenpair existence statement.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B2OriginalFockL2InnerSum
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- The finite inner-product integral exchange, abstracted away from
the enormous original 48-Majorana physical Fock carrier. -/
private theorem generic_finite_piLp_L2_inner_sum
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (f g : Lp (PiLp 2 (fun _ : ι => E)) 2 μ)
    (P Q : ι → Lp E 2 μ)
    (hP : ∀ i, (P i : X → E) =ᵐ[μ] (fun x => f x i))
    (hQ : ∀ i, (Q i : X → E) =ᵐ[μ] (fun x => g x i)) :
    ⟪f, g⟫_ℂ = ∑ i, ⟪P i, Q i⟫_ℂ := by
  have hcol (i : ι) :
      (fun x => ⟪f x i, g x i⟫_ℂ) =ᵐ[μ]
        (fun x => ⟪(P i : X → E) x, (Q i : X → E) x⟫_ℂ) := by
    filter_upwards [(hP i).symm, (hQ i).symm] with x hp hq
    rw [hp, hq]
  have hint (i : ι) :
      Integrable (fun x => ⟪f x i, g x i⟫_ℂ) μ := by
    exact (L2.integrable_inner (P i) (Q i)).congr (hcol i).symm
  calc
    ⟪f, g⟫_ℂ =
        ∫ x, ∑ i, ⟪f x i, g x i⟫_ℂ ∂μ := by
      simp only [L2.inner_def, PiLp.inner_apply]
    _ = ∑ i, ∫ x, ⟪f x i, g x i⟫_ℂ ∂μ := by
      rw [integral_finsetSum]
      intro i hi
      exact hint i
    _ = ∑ i, ⟪P i, Q i⟫_ℂ := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [L2.inner_def]
      exact integral_congr_ae (hcol i)

/-- The actual source-Fock L² finite Hilbert-column field has
exactly the sum of the individual actual Fock L² inner products. -/
theorem originalFockL2_inner_eq_sum_columns
    (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ⟪f, g⟫_ℂ =
      ∑ i : ι,
        ⟪originalFockL2ColumnProjection μ i f,
          originalFockL2ColumnProjection μ i g⟫_ℂ := by
  apply generic_finite_piLp_L2_inner_sum μ f g
    (fun i => originalFockL2ColumnProjection μ i f)
    (fun i => originalFockL2ColumnProjection μ i g)
  · intro i
    exact originalFockL2ColumnProjection_apply_ae μ i f
  · intro i
    exact originalFockL2ColumnProjection_apply_ae μ i g

#print axioms originalFockL2_inner_eq_sum_columns

end
end FCP.BFSSP3D5B2OriginalFockL2InnerSum
