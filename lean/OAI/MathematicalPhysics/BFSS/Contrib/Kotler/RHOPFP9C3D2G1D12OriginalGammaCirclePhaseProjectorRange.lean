import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D11OriginalGammaPhasePreservesTransportedQuadratic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2DOriginalGammaRelationalPhaseOnProjectorImage

/-!
# RHOPF-P9C3D2G1D12 — exact original Gamma9 Circle phase formula on im(P)

The accepted Gamma9 source has a Circle matrix representation
rho(z) = R(re z, im z). The accepted original projector-image
formula R(a,b)v = a v+b Jv must therefore remain true for the
native Mathlib Circle action on original real-16 spinor vectors.

This gate binds the ORIGINAL group action to the ORIGINAL J
on the ORIGINAL rank-four projector image. Its meaning is
not an unproved canonical ℂ² coordinate identification.

No source matrix substitution, new axioms, orthonormal complex
basis, standard Hopf quotient, Fock/Hamiltonian or soliton claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D12
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2D
open FCP.RHOPFP9C3D2G1D9

/-- Exact original Gamma9 native Circle action acts as
its real part times v plus imaginary part times Jv on im(P). -/
theorem relationalCircleVector_phase_on_projector_image
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalCircleVector z v =
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJ.mulVec v := by
  change (relationalCirclePhase (z : ℂ).re (z : ℂ).im).mulVec v =
    (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJ.mulVec v
  exact relationalCirclePhase_mulVec_on_projector_image _ _ v hv

/-- The same native Circle phase formula on every vector in the
exact original Gamma9 rank-four projector range, with J_range. -/
theorem relationalCircleVector_phase_on_projector_range
    (z : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleVector z v.1 =
      (z : ℂ).re • v.1 +
        (z : ℂ).im • (relationalPhaseJRangeLinear v).1 := by
  have hProj : LinearMap.IsProj
      (LinearMap.range (Matrix.toLin' relationalProjector))
      (Matrix.toLin' relationalProjector) :=
    (LinearMap.isProj_range_iff_isIdempotentElem
      (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
  have hv : relationalProjector.mulVec v.1 = v.1 :=
    hProj.map_id v.1 v.2
  change relationalCircleVector z v.1 =
    (z : ℂ).re • v.1 + (z : ℂ).im • relationalPhaseJ.mulVec v.1
  exact relationalCircleVector_phase_on_projector_image z v.1 hv

#print axioms relationalCircleVector_phase_on_projector_image
#print axioms relationalCircleVector_phase_on_projector_range

end
end FCP.RHOPFP9C3D2G1D12
