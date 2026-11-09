import Mathlib.Data.Matrix.Basis
import Mathlib.Algebra.Module.BigOperators
import Mathlib.Basic.Real.Basic

/-!
# F1F diagnostic — abstract matrix coefficient real-linearity

Prove the finite-coefficient linearity in an arbitrary real module, with
symbolic index types. No BFSS source definitions, Fock-space reduction,
normalized Clifford replacement, or enlarged elaborator limits occur here.

This is an isolated diagnostic interface. It does NOT qualify the original
F1F production module or its independent consumer.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractCoefficient
noncomputable section

open scoped BigOperators

variable {ι : Type*} [Fintype ι]
variable {M : Type*} [AddCommMonoid M] [Module ℝ M]

/-- Symbolic double finite coefficient sum, before the original half factor. -/
noncomputable def rawCoefficientSum
    (T : ι → ι → M) (A : Matrix ι ι ℝ) : M :=
  ∑ p : ι, ∑ q : ι, (A p q) • T p q

/-- Additivity proved without specializing to the enormous original Fock type. -/
theorem rawCoefficientSum_add
    (T : ι → ι → M) (A B : Matrix ι ι ℝ) :
    rawCoefficientSum T (A + B) =
      rawCoefficientSum T A + rawCoefficientSum T B := by
  unfold rawCoefficientSum
  have hentry (p q : ι) :
      ((A + B) p q) • T p q =
        (A p q) • T p q + (B p q) • T p q := by
    calc
      _ = (A p q + B p q) • T p q := rfl
      _ = _ := add_smul (A p q) (B p q) (T p q)
  have hrow (p : ι) :
      (∑ q : ι, ((A + B) p q) • T p q) =
        (∑ q : ι, (A p q) • T p q) +
          (∑ q : ι, (B p q) • T p q) :=
    (Finset.sum_congr rfl (fun q _ => hentry p q)).trans
      Finset.sum_add_distrib
  exact (Finset.sum_congr rfl (fun p _ => hrow p)).trans
    Finset.sum_add_distrib

/-- Real homogeneity of the same abstract double coefficient sum. -/
theorem rawCoefficientSum_smul
    (T : ι → ι → M) (c : ℝ) (A : Matrix ι ι ℝ) :
    rawCoefficientSum T (c • A) = c • rawCoefficientSum T A := by
  unfold rawCoefficientSum
  have hentry (p q : ι) :
      ((c • A) p q) • T p q = c • ((A p q) • T p q) := by
    calc
      _ = (c * A p q) • T p q := rfl
      _ = _ := (smul_smul c (A p q) (T p q)).symm
  have hrow (p : ι) :
      (∑ q : ι, ((c • A) p q) • T p q) =
        c • (∑ q : ι, (A p q) • T p q) :=
    (Finset.sum_congr rfl (fun q _ => hentry p q)).trans
      (Finset.smul_sum).symm
  exact (Finset.sum_congr rfl (fun p _ => hrow p)).trans
    (Finset.smul_sum).symm

/-- Generic coefficient map, with no original-Fock proof elaboration. -/
noncomputable def rawCoefficientLinearMap
    (T : ι → ι → M) : Matrix ι ι ℝ →ₗ[ℝ] M where
  toFun := rawCoefficientSum T
  map_add' := rawCoefficientSum_add T
  map_smul' := rawCoefficientSum_smul T

/-- The half normalization is applied to an already constructed linear map. -/
noncomputable def halfCoefficientLinearMap
    (T : ι → ι → M) : Matrix ι ι ℝ →ₗ[ℝ] M :=
  (1 / 2 : ℝ) • rawCoefficientLinearMap T

/-- Symbolic evaluation of the half-scaled abstract linear map. -/
theorem halfCoefficientLinearMap_apply
    (T : ι → ι → M) (A : Matrix ι ι ℝ) :
    halfCoefficientLinearMap T A =
      (1 / 2 : ℝ) • rawCoefficientSum T A := rfl

#print axioms rawCoefficientSum_add
#print axioms rawCoefficientSum_smul
#print axioms rawCoefficientLinearMap
#print axioms halfCoefficientLinearMap
#print axioms halfCoefficientLinearMap_apply

end
end FCP.BFSSF1FAbstractCoefficient
