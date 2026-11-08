import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCovering

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoveringIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineAxisProjection FCP.BFSSSourceNineAxisCovering Topology

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ

-- Exact carriers and projection; do not substitute an abstract compact group.
example : (source9Axis8SpinStabilizer : Set G) =
    {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} := rfl

example : (source9Axis8MatrixStabilizer : Set SO9) =
    {A : SO9 | (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec
      (source9CoordinateVector 8) = source9CoordinateVector 8} := rfl

example (g : K) : (source9Axis8ProjectionHom g : SO9) =
    source9SpinVectorSpecialOrthogonalHom (g : G) := rfl

example : Continuous (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_continuous_pbw

example : Continuous (fun g : K =>
    (source9Axis8ProjectionHom g : SO9)) :=
  continuous_subtype_val.comp source9Axis8ProjectionHom_continuous_pbw

example : CompactSpace K := source9Axis8SpinStabilizer_compactSpace_pbw

example : PathConnectedSpace K := source9Axis8SpinStabilizer_pathConnectedSpace_pbw

example : IsTopologicalGroup K := by
  let : IsTopologicalGroup G := source9Spin_isTopologicalGroup_pbw
  infer_instance

example : IsClosedMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isClosedMap_pbw

example : Topology.IsQuotientMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isQuotientMap_pbw

example : IsDiscrete (source9Axis8ProjectionHom.ker : Set K) :=
  source9Axis8ProjectionHom_ker_isDiscrete_pbw

example : (source9Axis8ProjectionHom.ker : Set K).Finite :=
  source9Axis8ProjectionHom_ker_finite

example : (source9Axis8ProjectionHom.ker : Set K).ncard = 2 :=
  source9Axis8ProjectionHom_ker_ncard

example : IsQuotientCoveringMap (source9Axis8ProjectionHom : K → H)
    source9Axis8ProjectionHom.ker := source9Axis8ProjectionHom_isQuotientCoveringMap_pbw

example : IsCoveringMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isCoveringMap_pbw

example : IsOpenMap (source9Axis8ProjectionHom : K → H) :=
  source9Axis8ProjectionHom_isCoveringMap_pbw.isOpenMap

example (A : H) : {g : K | source9Axis8ProjectionHom g = A}.ncard = 2 :=
  source9Axis8ProjectionHom_fiber_ncard A

-- Independent numerical consumer on the full original fiber subtype.
example (A : H) : Nat.card {g : K // source9Axis8ProjectionHom g = A} = 2 := by
  change ({g : K | source9Axis8ProjectionHom g = A} : Set K).ncard = 2
  exact source9Axis8ProjectionHom_fiber_ncard A

example (A : H) : ∃ g : K, source9Axis8ProjectionHom g = A ∧
    (∀ h : K, source9Axis8ProjectionHom h = A ↔
      h = g ∨ h = source9Axis8NegativeCentral * g) ∧
    g ≠ source9Axis8NegativeCentral * g :=
  source9Axis8ProjectionHom_fiber_exact_pair A

example : (source9Axis8NegativeCentral : G) = source9NegativeCentral ∧
    ((source9Axis8NegativeCentral : G) : CliffordAlgebra source9Quadratic) = -1 :=
  ⟨rfl, source9NegativeCentral_coe⟩

example : source9Axis8ProjectionHom source9Axis8NegativeCentral = 1 :=
  source9Axis8NegativeCentral_image

example : source9Axis8NegativeCentral ≠ (1 : K) :=
  source9Axis8NegativeCentral_ne_one

-- A covering with two sheets remains non-injective.
example : ¬ Function.Injective (source9Axis8ProjectionHom : K → H) := by
  intro h
  apply source9Axis8NegativeCentral_ne_one
  apply h
  exact source9Axis8NegativeCentral_image.trans (map_one source9Axis8ProjectionHom).symm

example {X : Type*} [TopologicalSpace X] (f : H → X) :
    Continuous f ↔ Continuous (f ∘ (source9Axis8ProjectionHom : K → H)) :=
  source9Axis8ProjectionHom_isQuotientMap_pbw.continuous_iff

example : Continuous (fun g : K => g⁻¹) := by
  let : IsTopologicalGroup K := source9Axis8SpinStabilizer_isTopologicalGroup_pbw
  exact continuous_inv

example (g : K) (z : V) :
    ((source9Axis8ProjectionHom g : SO9) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z =
      source9SpinVectorRepresentation (g : G) z :=
  source9Axis8ProjectionHom_mulVec g z

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
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COVERING_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoveringIndependentAudit
