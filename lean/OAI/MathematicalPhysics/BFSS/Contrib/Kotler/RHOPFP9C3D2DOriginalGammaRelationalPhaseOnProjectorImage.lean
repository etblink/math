import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2COriginalGammaRelationalPhaseKernelOnProjectorImage

/-!
# RHOPF-P9C3D2D — original Gamma9 circle phases on the projector image

The accepted original real 16-spinor relational projector P and phase J
obey P²=P, J²=-P, PJ=JP=J. The qualified phase family is
R(a,b)=Q+aP+bJ, with Q=1-P.

For Pv=v, the full original-source matrix phase reduces to
R(a,b)v=a v+b Jv. This is the exact adapter needed for testing
nonidentity phase fixed points in the rank-four P-image.

No free action, Hopf quotient, Fock lifting, Hamiltonian symmetry,
source-selected coordinate basis, or empirical claim is made here.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2D
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B0

/-- Exact source-original phase multiplication on real vectors
in the rank-four relational projector image. -/
theorem relationalCirclePhase_mulVec_on_projector_image
    (a b : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    (relationalCirclePhase a b).mulVec v =
      a • v + b • relationalPhaseJ.mulVec v := by
  have hQ : relationalComplement.mulVec v = 0 := by
    change ((1 : GammaMatrix) - relationalProjector).mulVec v = 0
    rw [Matrix.sub_mulVec, Matrix.one_mulVec, hv, sub_self]
  rw [relationalCirclePhase_eq_complement_sum]
  simp only [Matrix.add_mulVec, Matrix.smul_mulVec, hQ, hv, zero_add]

#print axioms relationalCirclePhase_mulVec_on_projector_image

end
end FCP.RHOPFP9C3D2D
