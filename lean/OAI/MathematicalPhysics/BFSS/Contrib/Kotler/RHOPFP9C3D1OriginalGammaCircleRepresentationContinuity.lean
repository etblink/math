import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D0OriginalGammaCircleGroupRepresentation

/-!
# RHOPF-P9C3D1 — continuous original Gamma9 circle matrix representation

The original source real 16-dimensional Gamma9 carrier supports a
strict-qualified algebraic Mathlib Circle to matrix monoid hom and a
pointwise orthogonality theorem. This gate proves that its matrix-
valued function is continuous with the finite real matrix topology.

The proof uses the frozen source definition, continuity of complex
real/imaginary projections, and continuity of real scalar action and
matrix addition. It does not claim a free action on a sphere, a Hopf
quotient, or a physical Fock-space and Hamiltonian implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D1
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3D0

/-- Continuity of the original source matrix-valued Circle map in
the natural topology on its finite real GammaMatrix carrier. -/
theorem relationalCircleMatrix_continuous :
    Continuous relationalCircleMatrix := by
  have hre : Continuous (fun z : Circle => (z : ℂ).re) :=
    Complex.continuous_re.comp continuous_subtype_val
  have him : Continuous (fun z : Circle => (z : ℂ).im) :=
    Complex.continuous_im.comp continuous_subtype_val
  change Continuous (fun z : Circle =>
    (1 : GammaMatrix) - relationalProjector +
      (z : ℂ).re • relationalProjector +
      (z : ℂ).im • relationalPhaseJ)
  exact ((continuous_const.sub continuous_const).add
    (hre.smul continuous_const)).add (him.smul continuous_const)

#print axioms relationalCircleMatrix_continuous

end
end FCP.RHOPFP9C3D1
