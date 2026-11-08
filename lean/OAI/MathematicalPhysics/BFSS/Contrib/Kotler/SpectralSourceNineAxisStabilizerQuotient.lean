import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerConnectedness
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Topology.Separation.Hausdorff
import Mathlib.Topology.Maps.Basic

/-!
Candidate compact exact parametrization of the ACTUAL original ninth-axis
stabilizer, in its existing PBW topology. Restrict the existing eight-word
formula to its literal fixed-axis subtype; do not choose a factorization.
No continuity premise for the whole nine-vector action, covering theorem,
Spin(8) classification, Fock action or physical spectral claim is used.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerQuotient
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisStabilizerConnectedness

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev U := {u : V // source9Quadratic u = 1 ∧ u 8 = 0}
private abbrev P := Fin 8 → U
private abbrev G := spinGroup source9Quadratic
private abbrev K := {g : G //
  source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}

/-- Compactness of the original perpendicular Q-unit set in its source-coordinate topology. -/
theorem source9Axis8QUnit_isCompact :
    IsCompact {u : V | source9Quadratic u = 1 ∧ u 8 = 0} := by
  have hsphere : IsCompact (Metric.sphere (0 : source9Axis8Perpendicular) 1) :=
    isCompact_sphere 0 1
  have hf : Continuous (fun x : source9Axis8Perpendicular =>
      source9ToEuclidean.symm (x : Euc9)) :=
    source9ToEuclidean.symm.toContinuousLinearEquiv.continuous.comp continuous_subtype_val
  rw [← source9Axis8PerpendicularSphere_image]
  exact hsphere.image hf

/-- Named compact-space value for the original parameter subtype, not a global instance. -/
theorem source9Axis8QUnit_compactSpace : CompactSpace U :=
  isCompact_iff_compactSpace.mp source9Axis8QUnit_isCompact

/-- The exact eight-fold perpendicular parameter space is compact. -/
theorem source9Axis8EightParameters_isCompact : IsCompact (Set.univ : Set P) := by
  let : CompactSpace U := source9Axis8QUnit_compactSpace
  exact isCompact_univ

/-- Named compact-space value for the original eight-fold parameters. -/
theorem source9Axis8EightParameters_compactSpace : CompactSpace P :=
  isCompact_univ_iff.mp source9Axis8EightParameters_isCompact

/-- The actual original fixed-axis set is compact in the unchanged source PBW topology. -/
theorem source9Axis8Stabilizer_isCompact_pbw :
    IsCompact {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} := by
  have h := source9Axis8EightParameters_isCompact.image
    source9Axis8EightUnitSpinWord_continuous_pbw
  simpa only [Set.image_univ, source9Axis8EightUnitSpinWord_range] using h

/-- Named compact-space value for the literal original stabilizer subtype. -/
theorem source9Axis8Stabilizer_compactSpace_pbw : CompactSpace K :=
  isCompact_iff_compactSpace.mp source9Axis8Stabilizer_isCompact_pbw

/-- Closedness follows from compactness in the original Hausdorff PBW topology. -/
theorem source9Axis8Stabilizer_isClosed_pbw :
    IsClosed {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isCompact_pbw.isClosed

/-- The existing original eight-word formula, now with its literal stabilizer membership proof. -/
noncomputable def source9Axis8EightUnitSpinWordToStabilizer (w : P) : K :=
  ⟨source9Axis8EightUnitSpinWord w, source9Axis8EightUnitSpinWord_mem w⟩

/-- Exact surjectivity onto the actual source stabilizer, retaining both central signs. -/
theorem source9Axis8EightUnitSpinWordToStabilizer_surjective :
    Function.Surjective source9Axis8EightUnitSpinWordToStabilizer := by
  intro g
  have hg : (g : G) ∈ Set.range source9Axis8EightUnitSpinWord := by
    rw [source9Axis8EightUnitSpinWord_range]
    exact g.property
  obtain ⟨w, hw⟩ := hg
  exact ⟨w, Subtype.ext hw⟩

/-- Continuity uses only the qualified original word-map continuity and subtype construction. -/
theorem source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw :
    Continuous source9Axis8EightUnitSpinWordToStabilizer :=
  source9Axis8EightUnitSpinWord_continuous_pbw.subtype_mk source9Axis8EightUnitSpinWord_mem

/-- This exact map is closed because its domain is compact and its codomain Hausdorff. -/
theorem source9Axis8EightUnitSpinWordToStabilizer_isClosedMap_pbw :
    IsClosedMap source9Axis8EightUnitSpinWordToStabilizer := by
  let : CompactSpace P := source9Axis8EightParameters_compactSpace
  exact source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw.isClosedMap

/-- Main result: the original perpendicular eight-word parametrization is a quotient map. -/
theorem source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw :
    Topology.IsQuotientMap source9Axis8EightUnitSpinWordToStabilizer :=
  source9Axis8EightUnitSpinWordToStabilizer_isClosedMap_pbw.isQuotientMap
    source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw
    source9Axis8EightUnitSpinWordToStabilizer_surjective

/-- Continuity on the literal source stabilizer can be tested on the original word parameters. -/
theorem source9Axis8Stabilizer_continuous_iff_pbw
    {X : Type*} [TopologicalSpace X] (f : K → X) :
    Continuous f ↔ Continuous (f ∘ source9Axis8EightUnitSpinWordToStabilizer) :=
  source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw.continuous_iff

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
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_QUOTIENT_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerQuotient
