import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D26OriginalGammaSourceHermitianCandidate

/-! Independent imported consumer, source Gamma9 J4 and original Q
complex Hermitian candidate, no complex typeclass or global norm. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D26Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D26

example (x y : Fin 4 → ℝ) : ℂ :=
  relationalSourceHermitianCandidate x y

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x y).re =
      relationalSourceInnerCore.inner x y :=
  relationalSourceHermitianCandidate_re x y

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x y).im =
      -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) y :=
  relationalSourceHermitianCandidate_im x y

example (x y : Fin 4 → ℝ) :
    star (relationalSourceHermitianCandidate y x) =
      relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_conj_symm x y

example (x : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x x).im = 0 :=
  relationalSourceHermitianCandidate_self_im_zero x

example (x : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x x).re =
      relationalRangeCoordinateDotSelf x :=
  relationalSourceHermitianCandidate_self_re_quadratic x

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < (relationalSourceHermitianCandidate x x).re :=
  relationalSourceHermitianCandidate_self_re_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_re
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_im
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_conj_symm
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_self_im_zero
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_self_re_quadratic
#print axioms FCP.RHOPFP9C3D2G1D26.relationalSourceHermitianCandidate_self_re_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D26Independent
