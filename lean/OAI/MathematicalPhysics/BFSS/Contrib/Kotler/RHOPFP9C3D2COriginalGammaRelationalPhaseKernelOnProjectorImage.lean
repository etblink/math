import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2BOriginalGammaCircleProjectorImageInvariance

/-!
# RHOPF-P9C3D2C — source-original phase J has no kernel in P-image

The exact original Gamma9 matrices satisfy J² = -P on their real
16-spinor carrier. After strict qualification that the Circle action
preserves the rank-four projector P-image, test a necessary algebraic
ingredient for freeness: Jv = 0 and Pv = v imply v = 0.

No topological quotient, coordinate-selected Hopf fiber, complete
freeness claim, physical Fock action or Hamiltonian symmetry.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2C
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A

/-- The original Gamma9 phase complex structure J has trivial kernel
on the source-original relational projector image. -/
theorem relationalPhaseJ_kernel_zero_on_projector_image
    (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hJ : relationalPhaseJ.mulVec v = 0) :
    v = 0 := by
  have hsq : (relationalPhaseJ * relationalPhaseJ).mulVec v = 0 := by
    rw [← Matrix.mulVec_mulVec, hJ]
    simp
  rw [relationalPhaseJ_square_neg_projector, Matrix.neg_mulVec, hv] at hsq
  exact neg_eq_zero.mp hsq

#print axioms relationalPhaseJ_kernel_zero_on_projector_image

end
end FCP.RHOPFP9C3D2C
