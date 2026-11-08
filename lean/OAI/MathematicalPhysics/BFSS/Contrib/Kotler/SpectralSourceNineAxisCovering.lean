import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisProjection
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerVectorContinuity
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.Topology.Covering.Quotient
import Mathlib.Data.Set.Card

/-!
Candidate covering of the ACTUAL original ninth-axis matrix stabilizer by the
ACTUAL original source Spin stabilizer. Retain the existing PBW topology and
the unchanged original projection. Transfer qualified continuity/compactness,
then use the pinned quotient-hom/discrete-kernel covering criterion.
No coordinate SO(8) equivalence, Spin(8) classification, branching or physical
spectral result is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCovering
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisStabilizerConnectedness
open FCP.BFSSSourceNineAxisStabilizerQuotient
open FCP.BFSSSourceNineAxisStabilizerVectorContinuity Topology

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev G := spinGroup source9Quadratic
private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer

/-- Compactness transfers to the definitionally identical original subgroup carrier. -/
theorem source9Axis8SpinStabilizer_compactSpace_pbw : CompactSpace K :=
  source9Axis8Stabilizer_compactSpace_pbw

/-- The same carrier remains path connected in the original PBW subtype topology. -/
theorem source9Axis8SpinStabilizer_pathConnectedSpace_pbw : PathConnectedSpace K :=
  source9Axis8Stabilizer_pathConnectedSpace_pbw

/-- Named topological-group value; no new global topology or instance is installed. -/
theorem source9Axis8SpinStabilizer_isTopologicalGroup_pbw : IsTopologicalGroup K := by
  let : IsTopologicalGroup G := source9Spin_isTopologicalGroup_pbw
  infer_instance

/-- The newly bundled projection is the qualified continuous original projection. -/
theorem source9Axis8ProjectionHom_continuous_pbw :
    Continuous (source9Axis8ProjectionHom : K → H) := by
  have h : Continuous (fun g : K => source9SpinVectorSpecialOrthogonalHom g.val) :=
    source9Axis8Stabilizer_vectorSO9_continuous_pbw
  exact h.subtype_mk (fun g => (source9Axis8ProjectionHom g).property)

/-- Compact original source and Hausdorff original matrix target make this map closed. -/
theorem source9Axis8ProjectionHom_isClosedMap_pbw :
    IsClosedMap (source9Axis8ProjectionHom : K → H) := by
  let : CompactSpace K := source9Axis8SpinStabilizer_compactSpace_pbw
  exact source9Axis8ProjectionHom_continuous_pbw.isClosedMap

/-- Exact original projection is a quotient map, using genuine target surjectivity. -/
theorem source9Axis8ProjectionHom_isQuotientMap_pbw :
    Topology.IsQuotientMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isClosedMap_pbw.isQuotientMap
    source9Axis8ProjectionHom_continuous_pbw source9Axis8ProjectionHom_surjective

/-- Kernel finiteness uses the exact pair of original signs, not a covering premise. -/
theorem source9Axis8ProjectionHom_ker_finite :
    (source9Axis8ProjectionHom.ker : Set K).Finite := by
  rw [source9Axis8ProjectionHom_ker_eq]
  exact (Set.finite_singleton source9Axis8NegativeCentral).insert 1

/-- The exact finite kernel is discrete in the original Hausdorff PBW topology. -/
theorem source9Axis8ProjectionHom_ker_isDiscrete_pbw :
    IsDiscrete (source9Axis8ProjectionHom.ker : Set K) :=
  source9Axis8ProjectionHom_ker_finite.isDiscrete

/-- Kernel has exactly two elements; the genuine negative source sign is distinct. -/
theorem source9Axis8ProjectionHom_ker_ncard :
    (source9Axis8ProjectionHom.ker : Set K).ncard = 2 := by
  rw [source9Axis8ProjectionHom_ker_eq]
  exact Set.ncard_pair (Ne.symm source9Axis8NegativeCentral_ne_one)

/-- Main result: original projection is a quotient covering by its actual kernel action. -/
theorem source9Axis8ProjectionHom_isQuotientCoveringMap_pbw :
    IsQuotientCoveringMap (source9Axis8ProjectionHom : K → H)
      source9Axis8ProjectionHom.ker := by
  let : IsTopologicalGroup K := source9Axis8SpinStabilizer_isTopologicalGroup_pbw
  exact source9Axis8ProjectionHom_isQuotientMap_pbw.isQuotientCoveringMap_of_isDiscrete_ker_monoidHom
      source9Axis8ProjectionHom_ker_isDiscrete_pbw

/-- The same unchanged original projection is a genuine topological covering. -/
theorem source9Axis8ProjectionHom_isCoveringMap_pbw :
    IsCoveringMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isQuotientCoveringMap_pbw.isCoveringMap

/-- Every target fiber has exactly two elements, separately from the covering argument. -/
theorem source9Axis8ProjectionHom_fiber_ncard (A : H) :
    {g : K | source9Axis8ProjectionHom g = A}.ncard = 2 := by
  obtain ⟨g, _, hfiber, hne⟩ := source9Axis8ProjectionHom_fiber_exact_pair A
  apply Set.ncard_eq_two.mpr
  refine ⟨g, source9Axis8NegativeCentral * g, hne, ?_⟩
  ext h
  simpa only [Set.mem_ofPred_eq, Set.mem_insert_iff, Set.mem_singleton_iff] using hfiber h

#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8SpinStabilizer_compactSpace_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8SpinStabilizer_pathConnectedSpace_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8SpinStabilizer_isTopologicalGroup_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_isClosedMap_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_isQuotientMap_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_ker_finite
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_ker_isDiscrete_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_ker_ncard
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_isQuotientCoveringMap_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_isCoveringMap_pbw
#print axioms FCP.BFSSSourceNineAxisCovering.source9Axis8ProjectionHom_fiber_ncard
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COVERING_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisCovering
