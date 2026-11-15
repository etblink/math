import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3AAdjointColorRepresentationProbe

/-!
# IBI-G0A — literal BFSS bosonic Gram incidence under the original SU(2) action

A deliberately small source-exact prerequisite for incidence reconstruction:
the Gram entry of two original nine-direction color rows is invariant under
the *actual* G2A bosonic gauge action. Reuse the original paired AlgebraData
and colorConjugate_inner, not an unrelated abstract SO(3) model.

This does NOT show determinant +1, full SO(3) image surjectivity,
orientation-sensitive triple invariants, or orbit separation. This file is
a candidate until a cold Lean build and independent consumer are qualified.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0AOriginalBosonGram

noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- One Gram entry on the **literal** original bosonic carrier. -/
noncomputable def originalGram (x : Boson 2) (i j : SpaceIndex) : ℝ :=
  inner ℝ (spatialColor x i) (spatialColor x j)

/-- Genuine G2A SU(2) conjugation preserves every source Gram entry. -/
theorem originalGram_gauge (g : GaugeGroup 2) (x : Boson 2)
    (i j : SpaceIndex) :
    originalGram (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j =
      originalGram x i j := by
  change inner ℝ
      (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) i)
      (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) j) =
    inner ℝ (spatialColor x i) (spatialColor x j)
  rw [M.spatialColor_gaugeConjugate, M.spatialColor_gaugeConjugate]
  exact M.colorConjugate_inner (g : ColorMatrix 2) g.prop.1
    (spatialColor x i) (spatialColor x j)

/-- Orbit-related original configurations have equal source Gram entries.
This proves only the forward implication of a proposed incidence classifier. -/
theorem originalGram_eq_of_gauge_related {x y : Boson 2}
    (h : ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG2A.bosonGauge g x = y)
    (i j : SpaceIndex) :
    originalGram x i j = originalGram y i j := by
  rcases h with ⟨g, rfl⟩
  exact (originalGram_gauge g x i j).symm

#print axioms originalGram
#print axioms originalGram_gauge
#print axioms originalGram_eq_of_gauge_related

end
end FCP.BFSSIBIG0AOriginalBosonGram
