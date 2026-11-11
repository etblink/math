import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0AOriginalBosonFockGaugeCovariance

/-!
# NORM-0B — real-linearity of the original Fock quadratic and Gram expansion

This source imports only the accepted JOIN-0A module, which contains
the exact original BIL-0C real-coefficient quadratic on genuine Fermion 2,
and the original VLY-0B spatial Gram–gamma coefficient on Boson 2.

All manipulations concern finite sums in the actual bounded Fock-operator
carrier; no surrogate gamma, Majorana, original FullL2 multiplier,
supercharge domain, Hamiltonian, or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum
noncomputable section

open Matrix
open Finset
open OAI.BFSSQuantum
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance

/-- Genuine original 48-Majorana color-summed Fock quadratic is additive
in arbitrary real 16-by-16 spinor coefficient matrices. -/
theorem originalColorQuadratic_add
    (J K : GammaMatrix) :
    originalColorQuadratic (J + K) =
      originalColorQuadratic J + originalColorQuadratic K := by
  simp only [originalColorQuadratic, Matrix.add_apply,
    Complex.ofReal_add, add_smul, Finset.sum_add_distrib]

/-- Real coefficient scaling is complex scalar multiplication on the
genuine original bounded Fermion 2 complex-linear operator. -/
theorem originalColorQuadratic_real_smul
    (r : ℝ) (J : GammaMatrix) :
    originalColorQuadratic (r • J) =
      (r : ℂ) • originalColorQuadratic J := by
  simp only [originalColorQuadratic, Matrix.smul_apply,
    smul_eq_mul, Complex.ofReal_mul, mul_smul, Finset.smul_sum]

/-- The original source Fock quadratic sends the zero real matrix
to the zero original bounded operator. -/
theorem originalColorQuadratic_zero :
    originalColorQuadratic (0 : GammaMatrix) = 0 := by
  simp [originalColorQuadratic]

/-- Finite real-matrix sums can be transported through the literal
original Fock quadratic without choosing an auxiliary representation. -/
private theorem originalColorQuadratic_sum
    {ι : Type*} (s : Finset ι) (f : ι → GammaMatrix) :
    originalColorQuadratic (∑ i ∈ s, f i) =
      ∑ i ∈ s, originalColorQuadratic (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
      simpa using originalColorQuadratic_zero
  | @insert a s ha ih =>
      simpa [ha, originalColorQuadratic_add, ih]

/-- Exact 9-by-9 Gram-index expansion of the qualified original
pointwise Boson 2 / Fermion 2 gauge-covariant observable. -/
theorem originalFockGramObservable_sum
    (x : Boson 2) (B : GammaMatrix) :
    originalFockGramObservable x B =
      ∑ i : SpaceIndex, ∑ j : SpaceIndex,
        ((originalSpatialGram x i j : ℝ) : ℂ) •
          originalColorQuadratic
            (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j) := by
  change originalColorQuadratic
      (∑ i : SpaceIndex, ∑ j : SpaceIndex,
        (originalSpatialGram x i j) •
          (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j)) = _
  rw [originalColorQuadratic_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [originalColorQuadratic_sum]
  apply Finset.sum_congr rfl
  intro j _
  rw [originalColorQuadratic_real_smul]

#print axioms originalColorQuadratic_add
#print axioms originalColorQuadratic_real_smul
#print axioms originalColorQuadratic_zero
#print axioms originalFockGramObservable_sum

end
end FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum
