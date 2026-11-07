import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSpinWordContinuity
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Topology.Compactness.Compact

/-!
C0-A5c candidate: compactness of the ORIGINAL Q-unit locus, its finite
eight-coordinate parameter space, and the ACTUAL source Spin group in its
existing PBW topology. Use the qualified fixed continuous surjection.
No replacement norm, topology, source group or continuous word selection.
This compactness result alone gives no physical confinement or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineCompactness
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineEightInputSpinMap FCP.BFSSSourceNineSpinWordContinuity

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev E := EuclideanSpace ℝ SpaceIndex
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev P := Fin 8 → {u : V // source9Quadratic u = 1}

/-- The original Q-unit set is the exact same-label Euclidean sphere preimage. -/
theorem source9QUnit_eq_euclidean_sphere_preimage :
    {u : V | source9Quadratic u = 1} =
      source9ToEuclidean ⁻¹' Metric.sphere (0 : E) 1 := by
  ext u
  change source9Quadratic u = 1 ↔ dist (source9ToEuclidean u) 0 = 1
  rw [dist_zero_right, source9Quadratic_eq_euclidean_norm_sq]
  constructor
  · intro h
    nlinarith [norm_nonneg (source9ToEuclidean u)]
  · intro h
    nlinarith

/-- Compactness of the ORIGINAL Q-unit locus in its ordinary original-coordinate topology. -/
theorem source9QUnit_isCompact : IsCompact {u : V | source9Quadratic u = 1} := by
  have hsphere : IsCompact (Metric.sphere (0 : E) 1) := isCompact_sphere 0 1
  rw [source9QUnit_eq_euclidean_sphere_preimage]
  exact source9ToEuclidean.toContinuousLinearEquiv.toHomeomorph.isCompact_preimage.mpr hsphere

/-- The exact eight-input Q-unit parameter space is compact in the existing Pi/subtype topology. -/
theorem source9EightUnitParameters_isCompact : IsCompact (Set.univ : Set P) := by
  let : CompactSpace {u : V // source9Quadratic u = 1} :=
    isCompact_iff_compactSpace.mp source9QUnit_isCompact
  exact isCompact_univ

/-- The qualified fixed map attains exactly the whole original source group. -/
theorem source9EightUnitSpinWord_range_eq_univ :
    Set.range source9EightUnitSpinWord = (Set.univ : Set (spinGroup source9Quadratic)) :=
  Set.range_eq_univ.mpr source9EightUnitSpinWord_surjective

/-- Compactness of the whole ACTUAL source group for its inherited original PBW topology. -/
theorem source9Spin_univ_isCompact_pbw :
    IsCompact (Set.univ : Set (spinGroup source9Quadratic)) := by
  have h := source9EightUnitParameters_isCompact.image source9EightUnitSpinWord_continuous_pbw
  simpa only [Set.image_univ, source9EightUnitSpinWord_range_eq_univ] using h

/-- Named compact-space value; no global instance or new source topology is registered. -/
theorem source9Spin_compactSpace_pbw : CompactSpace (spinGroup source9Quadratic) :=
  isCompact_univ_iff.mp source9Spin_univ_isCompact_pbw

/-- The original source Spin set is compact inside its original PBW Clifford algebra. -/
theorem source9Spin_isCompact_pbw : IsCompact (spinGroup source9Quadratic : Set C) :=
  isCompact_iff_compactSpace.mpr source9Spin_compactSpace_pbw

/-- The same actual source subset is closed in the Hausdorff original PBW Clifford topology. -/
theorem source9Spin_isClosed_pbw : IsClosed (spinGroup source9Quadratic : Set C) :=
  source9Spin_isCompact_pbw.isClosed

#print axioms FCP.BFSSSourceNineCompactness.source9QUnit_eq_euclidean_sphere_preimage
#print axioms FCP.BFSSSourceNineCompactness.source9QUnit_isCompact
#print axioms FCP.BFSSSourceNineCompactness.source9EightUnitParameters_isCompact
#print axioms FCP.BFSSSourceNineCompactness.source9EightUnitSpinWord_range_eq_univ
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_univ_isCompact_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_compactSpace_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_isCompact_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_isClosed_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_COMPACTNESS_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineCompactness
