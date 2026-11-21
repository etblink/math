import Mathlib.Algebra.Star.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D35OriginalGammaHermitianComplexScalarLeft

/-!
# RHOPF-P9C3D2G1D36 — original Gamma9 full Hermitian sesquilinearity

D35 strictly qualified H(z⊙x,y)=z H(x,y) for arbitrary z:ℂ on
original Gamma9 source coordinates and isolated Module ℂ.
D26/D32 strictly qualified conjugate symmetry of the *same*
source-derived Q-Hermitian function. Pinned Mathlib star_mul' for
commutative complex scalars combines them directly, with NO
recalculation of original Gamma9 matrices or quadratic source Q.

This gate proves only second-variable conjugate linearity and thereby
completes the already qualified algebraic sesquilinearity laws.
No bundled InnerProductSpace ℂ or norm, Q-isometric C2 coordinates,
classical Hopf quotient/Chern charge, or original physical BFSS
Fock/Gauss/Hamiltonian/hopfion claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D36
noncomputable section

open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D35

/-- Full source-original Gamma9 Hermitian conjugate-linearity for
arbitrary complex scalars in its second argument. Proven from
original-source conjugate symmetry and qualified complex left-linearity. -/
theorem relationalSourceHermitianCandidate_complex_smul_right
    (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x
        (relationalSourceComplexScalarAction z y) =
      star z * relationalSourceHermitianCandidate x y := by
  calc
    relationalSourceHermitianCandidate x
        (relationalSourceComplexScalarAction z y) =
        star (relationalSourceHermitianCandidate
          (relationalSourceComplexScalarAction z y) x) := by
            exact (relationalSourceHermitianCandidate_conj_symm
              x (relationalSourceComplexScalarAction z y)).symm
    _ = star (z * relationalSourceHermitianCandidate y x) := by
          rw [relationalSourceHermitianCandidate_complex_smul_left]
    _ = star z * star (relationalSourceHermitianCandidate y x) := by
          rw [star_mul']
    _ = star z * relationalSourceHermitianCandidate x y := by
          rw [relationalSourceHermitianCandidate_conj_symm]

/-- Full complex conjugate-linearity in the second argument for the
SAME Gamma9-Q Hermitian form on its isolated source-exact Module ℂ. -/
theorem relationalSourceComplexFourHermitian_smul_right
    (z : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (z • y) =
      star z * relationalSourceComplexFourHermitian x y := by
  change relationalSourceHermitianCandidate x.coordinates
      (z • y).coordinates =
    star z * relationalSourceHermitianCandidate
      x.coordinates y.coordinates
  rw [relationalSourceComplexFour_smul_coordinates]
  exact relationalSourceHermitianCandidate_complex_smul_right z _ _

#print axioms relationalSourceHermitianCandidate_complex_smul_right
#print axioms relationalSourceComplexFourHermitian_smul_right

end
end FCP.RHOPFP9C3D2G1D36
