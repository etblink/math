import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0AOriginalGramTraceBound

/-!
# NORM-0D / D0-A — source-original spatial Gram and trace continuity

This is the first, bounded continuity microgate for the original
Boson 2 geometry. Reuse upstream spatialColorMap and the accepted
NORM-0A Gram trace, without unfolding the Fock or Clifford models.

This source does NOT assert continuity of the normalized Fock field,
construct a FullL2 multiplier, or make physical spectral claims.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D0OriginalGramContinuity
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSNORM0AOriginalGramTraceBound

/-- Each coefficient of the genuine 9-by-9 source spatial Gram
matrix varies continuously over the original SU(2) bosonic carrier. -/
theorem originalSpatialGram_continuous (i j : SpaceIndex) :
    Continuous (fun x : Boson 2 => originalSpatialGram x i j) := by
  change Continuous (fun x : Boson 2 =>
    inner ℝ (spatialColor x i) (spatialColor x j))
  have hi : Continuous (fun x : Boson 2 => spatialColor x i) :=
    (spatialColorMap (N := 2) i).continuous_of_finiteDimensional
  have hj : Continuous (fun x : Boson 2 => spatialColor x j) :=
    (spatialColorMap (N := 2) j).continuous_of_finiteDimensional
  exact continuous_inner.comp (hi.prodMk hj)

/-- Finite summation preserves continuity of the exact original
Gram trace, without any finite-measure assumption. -/
theorem originalGramTrace_continuous :
    Continuous (originalGramTrace : Boson 2 → ℝ) := by
  change Continuous (fun x : Boson 2 =>
    ∑ i : SpaceIndex, originalSpatialGram x i i)
  exact continuous_finsetSum _ (fun i _ => originalSpatialGram_continuous i i)

#print axioms originalSpatialGram_continuous
#print axioms originalGramTrace_continuous

end
end FCP.BFSSNORM0D0OriginalGramContinuity
