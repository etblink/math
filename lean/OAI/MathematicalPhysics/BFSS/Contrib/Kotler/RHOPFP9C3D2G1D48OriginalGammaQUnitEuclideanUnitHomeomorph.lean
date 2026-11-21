import Mathlib.Topology.Constructions
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D47OriginalGammaQUnitEuclideanUnitEquiv

/-!
# RHOPF-P9C3D2G1D48 — original Gamma9 source-Q unit sphere homeomorphism

D45 proves a source-original Gamma9 Q-preserving complex linear isometric
equivalence with EuclideanSpace ℂ (Fin 2). D46 restricts it to unit-Q
vectors, D47 constructs its inverse subtype function and both
bijection identities. This gate packages that **same** restricted
equivalence as a homeomorphism under the locally installed D38
source-Q normed group, D40 normed complex module, and D41 source-Q
inner product. NO global TopologicalSpace instance or alternative
coordinate norm is installed.

This is a topological sphere equivalence, not a restricted Circle
action conjugacy, Hopf quotient, Chern class, or BFSS physical claim.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D48
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D45
open FCP.RHOPFP9C3D2G1D46
open FCP.RHOPFP9C3D2G1D47

/-- The D47 original Gamma9 Q-unit sphere equivalence is a
homeomorphism in the ACTUAL source-Q topology supplied by detached
D38/D40/D41, and the usual standard Euclidean ℂ² topology.

Topology is explicitly local in the TYPE as in the accepted D45
source-Q isometry; nothing is globally installed on the carrier. -/
@[instance_reducible]
noncomputable def relationalSourceQUnitEuclideanUnitHomeomorph :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} ≃ₜ
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  refine
    { toEquiv := relationalSourceQUnitEuclideanUnitEquiv
      continuous_toFun := ?_
      continuous_invFun := ?_ }
  · change Continuous relationalSourceQUnitToEuclideanUnit
    exact (relationalSourceComplexFourSourceQIsometricRepr.continuous.comp
      continuous_subtype_val).subtype_mk _
  · change Continuous relationalEuclideanUnitToSourceQUnit
    exact (relationalSourceComplexFourSourceQIsometricRepr.symm.continuous.comp
      continuous_subtype_val).subtype_mk _

#print axioms relationalSourceQUnitEuclideanUnitHomeomorph

end
end FCP.RHOPFP9C3D2G1D48
