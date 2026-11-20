import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E3OriginalGammaCircleIntrinsicNonzeroAction

/-! Independently imported exact source-derived nonzero projector-image action audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E3Independent

open FCP.RHOPFP9C3D2E3

example (v : RelationalNonzeroSpinor) :
    relationalNonzeroCircleAction 1 v = v :=
  relationalNonzeroCircleAction_one v

example (z w : Circle) (v : RelationalNonzeroSpinor) :
    relationalNonzeroCircleAction (z * w) v =
      relationalNonzeroCircleAction z (relationalNonzeroCircleAction w v) :=
  relationalNonzeroCircleAction_mul z w v

example (z : Circle) (v : RelationalNonzeroSpinor)
    (hfix : relationalNonzeroCircleAction z v = v) :
    z = 1 :=
  relationalNonzeroCircleAction_fixed_point_implies_one z v hfix

#print axioms FCP.RHOPFP9C3D2E3.relationalNonzeroCircleAction_one
#print axioms FCP.RHOPFP9C3D2E3.relationalNonzeroCircleAction_mul
#print axioms FCP.RHOPFP9C3D2E3.relationalNonzeroCircleAction_fixed_point_implies_one

end FCP.RHOPFP9C3D2E3Independent
