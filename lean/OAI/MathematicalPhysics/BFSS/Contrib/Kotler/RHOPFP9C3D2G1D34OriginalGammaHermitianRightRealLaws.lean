import Mathlib.Tactic.Ring
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D33OriginalGammaHermitianRealLinearAdditive

/-!
# RHOPF-P9C3D2G1D34 — original Gamma9 Hermitian right-variable real laws

D33 R2 strictly qualified the original source-Q Hermitian candidate's
first-variable additivity and real homogeneity and wrapper additivity.
D22 independently qualifies real bilinearity of the original Gamma9
transported Q inner core. This bounded gate establishes the matching
second-variable real laws directly through that accepted bilinear core,
then binds right additivity to the isolated D31 Module ℂ carrier.

Do not introduce a new inner product, replace Q by coordinate dot,
install a norm, assume complex sesquilinearity, or assert Hopf or
physical BFSS Fock/Hamiltonian/soliton conclusions.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D34
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D22
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32

/-- Exact original source Hermitian candidate is additive in the
second real coordinate argument, by the accepted Gamma9 Q bilinear form. -/
theorem relationalSourceHermitianCandidate_add_right
    (x y z : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (y + z) =
      relationalSourceHermitianCandidate x y +
        relationalSourceHermitianCandidate x z := by
  apply Complex.ext
  · change relationalSourceInnerCore.inner x (y + z) =
        relationalSourceInnerCore.inner x y +
          relationalSourceInnerCore.inner x z
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_add_right x y z
  · change -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) (y + z) =
        -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y +
          -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) z
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    rw [relationalSourceTransportedDot_add_right]
    ring

/-- For real scalars, source H is homogeneous in its right variable
by original Gamma9 transported Q real bilinearity. -/
theorem relationalSourceHermitianCandidate_real_smul_right
    (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (a • y) =
      (a : ℂ) * relationalSourceHermitianCandidate x y := by
  apply Complex.ext
  · rw [Complex.re_ofReal_mul]
    change relationalSourceInnerCore.inner x (a • y) =
        a * relationalSourceInnerCore.inner x y
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_smul_right a x y
  · rw [Complex.im_ofReal_mul]
    change -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) (a • y) =
        a * (-relationalSourceInnerCore.inner
          (relationalPhaseJFourLinear x) y)
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    rw [relationalSourceTransportedDot_smul_right]
    ring

/-- Transport right additivity of the *same* original source form to
the isolated Gamma9 complex module carrier. -/
theorem relationalSourceComplexFourHermitian_add_right
    (x y z : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (y + z) =
      relationalSourceComplexFourHermitian x y +
        relationalSourceComplexFourHermitian x z := by
  change relationalSourceHermitianCandidate
      x.coordinates (y.coordinates + z.coordinates) =
    relationalSourceHermitianCandidate x.coordinates y.coordinates +
      relationalSourceHermitianCandidate x.coordinates z.coordinates
  exact relationalSourceHermitianCandidate_add_right _ _ _

#print axioms relationalSourceHermitianCandidate_add_right
#print axioms relationalSourceHermitianCandidate_real_smul_right
#print axioms relationalSourceComplexFourHermitian_add_right

end
end FCP.RHOPFP9C3D2G1D34
