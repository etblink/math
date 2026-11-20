import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F1OriginalGammaRelationalUnitCircleAction

/-! Independent original-source unit relational spinor Circle action audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F1Independent

open FCP.RHOPFP9C3D2F1

example (v : RelationalUnitSpinor) :
    relationalUnitCircleAction 1 v = v :=
  relationalUnitCircleAction_one v

example (z w : Circle) (v : RelationalUnitSpinor) :
    relationalUnitCircleAction (z * w) v =
      relationalUnitCircleAction z (relationalUnitCircleAction w v) :=
  relationalUnitCircleAction_mul z w v

#print axioms FCP.RHOPFP9C3D2F1.relationalUnitCircleAction_one
#print axioms FCP.RHOPFP9C3D2F1.relationalUnitCircleAction_mul

end FCP.RHOPFP9C3D2F1Independent
