import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D49OriginalGammaQUnitCircleEquivariance

/-!
# RHOPF-P9C3D2G1D50 — original Gamma9 source-Q Circle-orbit correspondence

D49 strictly established pointwise conjugacy of the ORIGINAL Gamma9
Circle matrix action on its Q-unit carrier with standard complex
scalar action on the complex Euclidean unit sphere, by the D48
source-Q homeomorphism.

This deliberately bounded gate proves that the corresponding
two-point Circle reachability relations coincide under that exact
homeomorphism. This is not yet a formal MulAction instance, quotient,
Hopf fibration, characteristic class or physical BFSS assertion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D50
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D49

/-- Two source ORIGINAL Gamma9 Q-unit vectors are related when an
actual original source Gamma9 Circle transformation carries one
to the other. No separate hypothetical phase action is introduced. -/
def relationalSourceQUnitCircleRelated
    (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) : Prop :=
  ∃ z : Circle, relationalSourceQUnitCircleAction z x = y

/-- The standard two-point Circle-scalar relation on unit ℂ²
vectors, through the genuine complex scalar Circle action. -/
def relationalEuclideanUnitCircleRelated
    (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) : Prop :=
  ∃ z : Circle, relationalEuclideanUnitCircleAction z x = y

/-- The source-exact D48 homeomorphism preserves and reflects
the actual Gamma9 Circle reachability relation, not merely
the underlying S³ topological type. -/
theorem relationalSourceQUnitCircleRelated_iff_euclidean
    (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalEuclideanUnitCircleRelated
        (relationalSourceQUnitEuclideanUnitHomeomorph x)
        (relationalSourceQUnitEuclideanUnitHomeomorph y) := by
  constructor
  · rintro ⟨z, hz⟩
    refine ⟨z, ?_⟩
    calc
      relationalEuclideanUnitCircleAction z
          (relationalSourceQUnitEuclideanUnitHomeomorph x) =
        relationalSourceQUnitEuclideanUnitHomeomorph
          (relationalSourceQUnitCircleAction z x) :=
        (relationalSourceQUnitHomeomorph_circle z x).symm
      _ = relationalSourceQUnitEuclideanUnitHomeomorph y :=
        congrArg relationalSourceQUnitEuclideanUnitHomeomorph hz
  · rintro ⟨z, hz⟩
    refine ⟨z, ?_⟩
    apply relationalSourceQUnitEuclideanUnitHomeomorph.injective
    calc
      relationalSourceQUnitEuclideanUnitHomeomorph
          (relationalSourceQUnitCircleAction z x) =
        relationalEuclideanUnitCircleAction z
          (relationalSourceQUnitEuclideanUnitHomeomorph x) :=
        relationalSourceQUnitHomeomorph_circle z x
      _ = relationalSourceQUnitEuclideanUnitHomeomorph y := hz

#print axioms relationalSourceQUnitCircleRelated
#print axioms relationalEuclideanUnitCircleRelated
#print axioms relationalSourceQUnitCircleRelated_iff_euclidean

end
end FCP.RHOPFP9C3D2G1D50
