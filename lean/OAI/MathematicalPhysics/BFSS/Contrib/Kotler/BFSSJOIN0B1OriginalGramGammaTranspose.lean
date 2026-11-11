import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0BOriginalGramGammaCoefficient

/-!
# JOIN-0B1 — real source Gram–gamma transpose compatibility

This module proves the general matrix-transpose property of the
already qualified original Boson 2 Gram–gamma coefficient map, for
arbitrary original real 16×16 SpinIndex matrices. No gauge or Fock
operator is redefined; only real inner-product Gram symmetry and
the exact source nine symmetric Clifford gamma matrices are used.

Its skew-matrix consequence is checked in a distinct consumer.
No physical Hilbert domain, Hamiltonian symmetry or BFSS spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B1OriginalGramGammaTranspose
noncomputable section

open scoped BigOperators
open Matrix Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSVLY0BOriginalGramGammaCoefficient

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- The actual real nine-spatial Gram matrix is symmetric. -/
private theorem originalSpatialGram_swap
    (x : Boson 2) (i j : SpaceIndex) :
    originalSpatialGram x i j = originalSpatialGram x j i := by
  change inner ℝ (M.spatialColor x i) (M.spatialColor x j) =
    inner ℝ (M.spatialColor x j) (M.spatialColor x i)
  exact real_inner_comm _ _

/-- Real source Clifford gamma symmetry in the matrix-transpose form. -/
private theorem originalGamma_transpose (i : SpaceIndex) :
    (FCP.BFSSGamma9.gamma i)ᵀ = FCP.BFSSGamma9.gamma i := by
  exact FCP.BFSSGamma9.gamma_symmetric i

/-- Reverse the two real gamma factors under matrix transpose. -/
private theorem gammaTriple_transpose
    (i j : SpaceIndex) (B : GammaMatrix) :
    (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j)ᵀ =
      FCP.BFSSGamma9.gamma j * Bᵀ * FCP.BFSSGamma9.gamma i := by
  calc
    _ = (FCP.BFSSGamma9.gamma j)ᵀ *
        (Bᵀ * (FCP.BFSSGamma9.gamma i)ᵀ) := by
          rw [Matrix.transpose_mul, Matrix.transpose_mul]
    _ = FCP.BFSSGamma9.gamma j *
        (Bᵀ * FCP.BFSSGamma9.gamma i) := by
          rw [originalGamma_transpose j, originalGamma_transpose i]
    _ = FCP.BFSSGamma9.gamma j * Bᵀ *
        FCP.BFSSGamma9.gamma i := (mul_assoc _ _ _).symm

/-- **JOIN-0B1 source root**: for every real original 16×16 input,
the actual Boson 2 Gram–gamma construction commutes with transpose. -/
theorem originalGramGammaCoefficient_transpose
    (x : Boson 2) (B : GammaMatrix) :
    (originalGramGammaCoefficient x B)ᵀ =
      originalGramGammaCoefficient x Bᵀ := by
  unfold originalGramGammaCoefficient
  calc
    (∑ i : SpaceIndex, ∑ j : SpaceIndex,
      originalSpatialGram x i j •
        (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j))ᵀ =
      ∑ i : SpaceIndex, ∑ j : SpaceIndex,
        (originalSpatialGram x i j •
          (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j))ᵀ := by
            simp only [Matrix.transpose_sum]
    _ = ∑ i : SpaceIndex, ∑ j : SpaceIndex,
          originalSpatialGram x i j •
            (FCP.BFSSGamma9.gamma j * Bᵀ *
              FCP.BFSSGamma9.gamma i) := by
          apply Finset.sum_congr rfl
          intro i _
          apply Finset.sum_congr rfl
          intro j _
          rw [Matrix.transpose_smul, gammaTriple_transpose]
    _ = ∑ i : SpaceIndex, ∑ j : SpaceIndex,
          originalSpatialGram x j i •
            (FCP.BFSSGamma9.gamma i * Bᵀ *
              FCP.BFSSGamma9.gamma j) := by
          rw [Finset.sum_comm]
    _ = ∑ i : SpaceIndex, ∑ j : SpaceIndex,
          originalSpatialGram x i j •
            (FCP.BFSSGamma9.gamma i * Bᵀ *
              FCP.BFSSGamma9.gamma j) := by
          apply Finset.sum_congr rfl
          intro i _
          apply Finset.sum_congr rfl
          intro j _
          rw [originalSpatialGram_swap x j i]

#print axioms originalGramGammaCoefficient_transpose

end
end FCP.BFSSJOIN0B1OriginalGramGammaTranspose
