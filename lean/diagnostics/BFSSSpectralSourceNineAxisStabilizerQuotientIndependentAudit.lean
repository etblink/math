import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerQuotient

/-! Independent consumers of the literal source compact parametrization and quotient topology. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerQuotientIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineAxisStabilizerConnectedness FCP.BFSSSourceNineAxisStabilizerQuotient
open FCP.BFSSSourceNineGammaFaithfulness

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev P := Fin 8 →
  {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0}
private abbrev K := {g : spinGroup source9Quadratic //
  source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}

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

example : IsCompact {u : SpaceIndex → ℝ | source9Quadratic u = 1 ∧ u 8 = 0} :=
  source9Axis8QUnit_isCompact

example : CompactSpace {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0} :=
  source9Axis8QUnit_compactSpace

example : IsCompact (Set.univ : Set P) := source9Axis8EightParameters_isCompact

example : CompactSpace P := source9Axis8EightParameters_compactSpace

example : IsCompact {g : spinGroup source9Quadratic |
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isCompact_pbw

example : CompactSpace K := source9Axis8Stabilizer_compactSpace_pbw

example : IsClosed {g : spinGroup source9Quadratic |
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isClosed_pbw

example (w : P) :
    (source9Axis8EightUnitSpinWordToStabilizer w : spinGroup source9Quadratic) =
      source9Axis8EightUnitSpinWord w := rfl

example : Function.Surjective (source9Axis8EightUnitSpinWordToStabilizer : P → K) :=
  source9Axis8EightUnitSpinWordToStabilizer_surjective

example : Continuous (source9Axis8EightUnitSpinWordToStabilizer : P → K) :=
  source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw

example : IsClosedMap (source9Axis8EightUnitSpinWordToStabilizer : P → K) :=
  source9Axis8EightUnitSpinWordToStabilizer_isClosedMap_pbw

example : Topology.IsQuotientMap (source9Axis8EightUnitSpinWordToStabilizer : P → K) :=
  source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw

example {X : Type*} [TopologicalSpace X] (f : K → X) :
    Continuous f ↔ Continuous (f ∘ source9Axis8EightUnitSpinWordToStabilizer) :=
  source9Axis8Stabilizer_continuous_iff_pbw f

example {X : Type*} [TopologicalSpace X] (f : K → X)
    (h : Continuous (f ∘ source9Axis8EightUnitSpinWordToStabilizer)) : Continuous f :=
  (source9Axis8Stabilizer_continuous_iff_pbw f).mpr h

example : ∃ w : P,
    source9Axis8EightUnitSpinWordToStabilizer w = ⟨1, identity_fixes⟩ :=
  source9Axis8EightUnitSpinWordToStabilizer_surjective ⟨1, identity_fixes⟩

example : source9NegativeCentral ≠ 1 ∧ ∃ w : P,
    source9Axis8EightUnitSpinWordToStabilizer w = ⟨source9NegativeCentral, negative_center_fixes⟩ :=
  ⟨source9NegativeCentral_ne_one,
    source9Axis8EightUnitSpinWordToStabilizer_surjective
      ⟨source9NegativeCentral, negative_center_fixes⟩⟩

#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8QUnit_isCompact
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8QUnit_compactSpace
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightParameters_isCompact
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightParameters_compactSpace
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8Stabilizer_isCompact_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8Stabilizer_compactSpace_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8Stabilizer_isClosed_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer_surjective
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer_isClosedMap_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8Stabilizer_continuous_iff_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_QUOTIENT_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerQuotientIndependentAudit
