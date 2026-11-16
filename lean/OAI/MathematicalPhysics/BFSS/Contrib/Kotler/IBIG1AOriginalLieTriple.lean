import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0AOriginalBosonGram

/-!
# IBI-G1A — original BFSS SU(2) gauge-invariant Lie-triple incidence

Define a genuinely source-exact, orientation-sensitive candidate scalar
on the original Boson 2 carrier from the original color Lie product.
Its gauge invariance follows from the actual G2A group action and
upstream colorConjugate_lie + colorConjugate_inner. No replacement
SO(3) representation, quaternion crosswalk, or physical quotient.

This is NOT a proof of normalization to epsilon/determinants,
source SO(3) image surjectivity, orbit classification or BFSS ontology.
STAGED — strict cold source+consumer Lean qualification required.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG1AOriginalLieTriple

noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- Real trilinear-looking incidence scalar on literal source nine-by-three
boson configurations; source colorLie includes original structure constants. -/
noncomputable def originalLieTriple
    (x : Boson 2) (i j k : SpaceIndex) : ℝ :=
  inner ℝ (M.colorLie (spatialColor x i) (spatialColor x j))
    (spatialColor x k)

/-- The genuine source SU(2) G2A bosonic gauge action preserves this
source color-Lie/incidence triple for every spatial triple. -/
theorem originalLieTriple_gauge (g : GaugeGroup 2) (x : Boson 2)
    (i j k : SpaceIndex) :
    originalLieTriple (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j k =
      originalLieTriple x i j k := by
  change inner ℝ
      (M.colorLie
        (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) i)
        (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) j))
      (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) k) =
    inner ℝ (M.colorLie (spatialColor x i) (spatialColor x j))
      (spatialColor x k)
  simp only [M.spatialColor_gaugeConjugate]
  rw [M.colorConjugate_lie (g : ColorMatrix 2) g.prop.1]
  exact M.colorConjugate_inner (g : ColorMatrix 2) g.prop.1
    (M.colorLie (spatialColor x i) (spatialColor x j))
    (spatialColor x k)

/-- Original SU(2)-related source configurations share each Lie triple.
Only the forward implication is claimed. -/
theorem originalLieTriple_eq_of_gauge_related {x y : Boson 2}
    (h : ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG2A.bosonGauge g x = y)
    (i j k : SpaceIndex) :
    originalLieTriple x i j k = originalLieTriple y i j k := by
  rcases h with ⟨g, rfl⟩
  exact (originalLieTriple_gauge g x i j k).symm

#print axioms originalLieTriple
#print axioms originalLieTriple_gauge
#print axioms originalLieTriple_eq_of_gauge_related

end
end FCP.BFSSIBIG1AOriginalLieTriple
