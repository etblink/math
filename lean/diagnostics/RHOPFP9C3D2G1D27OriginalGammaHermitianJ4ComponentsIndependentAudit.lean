import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D27OriginalGammaHermitianJ4Components

/-! Independent original-source type audit of exact real and imaginary
components of Gamma9 H under original J4 in both arguments. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D27Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D27

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y).re =
      -(relationalSourceHermitianCandidate x y).im :=
  relationalSourceHermitianCandidate_J4_left_re x y

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y).im =
      (relationalSourceHermitianCandidate x y).re :=
  relationalSourceHermitianCandidate_J4_left_im x y

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y)).re =
      (relationalSourceHermitianCandidate x y).im :=
  relationalSourceHermitianCandidate_J4_right_re x y

example (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y)).im =
      -(relationalSourceHermitianCandidate x y).re :=
  relationalSourceHermitianCandidate_J4_right_im x y

#print axioms FCP.RHOPFP9C3D2G1D27.relationalSourceHermitianCandidate_J4_left_re
#print axioms FCP.RHOPFP9C3D2G1D27.relationalSourceHermitianCandidate_J4_left_im
#print axioms FCP.RHOPFP9C3D2G1D27.relationalSourceHermitianCandidate_J4_right_re
#print axioms FCP.RHOPFP9C3D2G1D27.relationalSourceHermitianCandidate_J4_right_im

end
end FCP.RHOPFP9C3D2G1D27Independent
