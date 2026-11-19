import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D0OriginalGammaCircleGroupRepresentation

/-! Independent original-source Circle group representation type consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D0Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D0

example : relationalCircleMatrix 1 = (1 : GammaMatrix) :=
  relationalCircleMatrix_one

example (z w : Circle) :
    relationalCircleMatrix (z * w) =
      relationalCircleMatrix z * relationalCircleMatrix w :=
  relationalCircleMatrix_mul z w

example (z : Circle) :
    (relationalCircleMatrix z).transpose * relationalCircleMatrix z =
      (1 : GammaMatrix) :=
  relationalCircleMatrix_orthogonal z

example : Circle →* GammaMatrix := relationalCircleRepresentation

#print axioms FCP.RHOPFP9C3D0.relationalCircleMatrix_one
#print axioms FCP.RHOPFP9C3D0.relationalCircleMatrix_mul
#print axioms FCP.RHOPFP9C3D0.relationalCircleMatrix_orthogonal
#print axioms FCP.RHOPFP9C3D0.relationalCircleRepresentation

end
end FCP.RHOPFP9C3D0Independent
