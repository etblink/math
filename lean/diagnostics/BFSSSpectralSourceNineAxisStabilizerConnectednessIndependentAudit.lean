import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerConnectedness

/-! Independent original-space and PBW-topology consumers, including both distinct central signs. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerConnectednessIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineAxisStabilizerConnectedness
open FCP.BFSSSourceNineGammaFaithfulness

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private theorem identity_fixes :
    source9SpinVectorRepresentation (1 : spinGroup source9Quadratic)
      (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  rw [map_one]
  rfl

private theorem negative_center_fixes :
    source9SpinVectorRepresentation source9NegativeCentral (source9CoordinateVector 8) =
      source9CoordinateVector 8 := by
  apply (source9SpinGamma_fixes_iff_commutes _ _).mpr
  rw [source9NegativeCentral_gamma]
  simp only [neg_mul, mul_neg, one_mul, mul_one]

example : Module.finrank ℝ source9Axis8Perpendicular = 8 := source9Axis8Perpendicular_finrank

example : IsPathConnected
    {u : SpaceIndex → ℝ | source9Quadratic u = 1 ∧ u 8 = 0} :=
  source9Axis8QUnit_isPathConnected

example : PathConnectedSpace
    {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0} :=
  source9Axis8QUnit_pathConnectedSpace

example : IsPathConnected
    (Set.univ : Set (Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0})) :=
  source9Axis8EightParameters_isPathConnected

example : Set.range source9Axis8EightUnitSpinWord =
    {g : spinGroup source9Quadratic |
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8EightUnitSpinWord_range

example : Continuous (source9Axis8EightUnitSpinWord :
    (Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0}) →
      spinGroup source9Quadratic) := source9Axis8EightUnitSpinWord_continuous_pbw

example : IsPathConnected {g : spinGroup source9Quadratic |
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isPathConnected_pbw

example : IsConnected {g : spinGroup source9Quadratic |
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isConnected_pbw

example : PathConnectedSpace {g : spinGroup source9Quadratic //
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8Stabilizer_pathConnectedSpace_pbw

example (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    JoinedIn {k : spinGroup source9Quadratic |
      source9SpinVectorRepresentation k (source9CoordinateVector 8) = source9CoordinateVector 8}
      (1 : spinGroup source9Quadratic) g :=
  source9Axis8Stabilizer_isPathConnected_pbw.joinedIn 1 identity_fixes g hg

example : source9NegativeCentral ≠ 1 ∧
    JoinedIn {g : spinGroup source9Quadratic |
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}
      (1 : spinGroup source9Quadratic) source9NegativeCentral :=
  ⟨source9NegativeCentral_ne_one,
    source9Axis8Stabilizer_isPathConnected_pbw.joinedIn 1 identity_fixes
      source9NegativeCentral negative_center_fixes⟩

example {X : Type*} [TopologicalSpace X] (f : spinGroup source9Quadratic → X)
    (hf : Continuous f) : IsPathConnected (f '' {g : spinGroup source9Quadratic |
      source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}) :=
  source9Axis8Stabilizer_isPathConnected_pbw.image hf

example : source9CoordinateVector (0 : SpaceIndex) ∈
    {u : SpaceIndex → ℝ | source9Quadratic u = 1 ∧ u 8 = 0} :=
  ⟨source9CoordinateVector_unit 0, by norm_num [source9CoordinateVector]⟩

example (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0}) :
    source9SpinVectorRepresentation (source9Axis8EightUnitSpinWord w)
      (source9CoordinateVector 8) = source9CoordinateVector 8 :=
  source9Axis8EightUnitSpinWord_mem w

#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Perpendicular
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Perpendicular_finrank
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8PerpendicularSphere_image
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8QUnit_isPathConnected
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8QUnit_pathConnectedSpace
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_mem
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_range
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightParameters_isPathConnected
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_isPathConnected_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_isConnected_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_pathConnectedSpace_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_CONNECTEDNESS_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerConnectednessIndependentAudit
