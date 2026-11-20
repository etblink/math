import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D18OriginalGammaRangeQUnitCircleEquivariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D11OriginalGammaPhasePreservesTransportedQuadratic

/-!
# RHOPF-P9C3D2G1D19 — original transported quadratic polarization under J4

The exact original Gamma9 source Euclidean quadratic form transported to
real-four coordinates by E is the strictly positive Q(x). The accepted
source-exact real-linear J4 satisfies J4² = -I and Q(J4 x)=Q(x).

The symmetric polarization candidate B_Q(x,y) := (Q(x+y)-Q(x)-Q(y))/2
must be preserved by the original J4. This small, source-exact gate
establishes the compatibility equation needed before attempting the
separate proofs of B_Q bilinearity, positive-definiteness, a Hermitian
inner product, and a complex-orthonormal frame.

Do not identify Q with standard Euclidean dot or assume classical Hopf
scalar equivariance, quotient, physical Fock implementer or soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D19
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D11

/-- Polarization of the original Gamma9 quadratic transported by E,
before separately qualifying that it equals a real inner product. -/
noncomputable def relationalSourcePolarQuadratic
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeCoordinateDotSelf (x + y) -
    relationalRangeCoordinateDotSelf x -
      relationalRangeCoordinateDotSelf y) / 2

/-- The source-original real-four complex structure J4 preserves the
polarization of the original transported quadratic Q. -/
theorem relationalSourcePolarQuadratic_J4_invariant
    (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
        relationalSourcePolarQuadratic x y := by
  unfold relationalSourcePolarQuadratic
  rw [← map_add,
    relationalPhaseJFourLinear_preserves_original_quadratic (x + y),
    relationalPhaseJFourLinear_preserves_original_quadratic x,
    relationalPhaseJFourLinear_preserves_original_quadratic y]

#print axioms relationalSourcePolarQuadratic
#print axioms relationalSourcePolarQuadratic_J4_invariant

end
end FCP.RHOPFP9C3D2G1D19
