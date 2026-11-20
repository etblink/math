import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F4OriginalGammaRelationalUnitCircleJointContinuity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B1OriginalGammaRelationalRank

/-!
# RHOPF-P9C3D2G0A — nontrivial exact original relational projector image

The source-original real-16-spinor relational projector has accepted
image finrank exactly four. This small gate certifies that the exact
original image carries a Nontrivial real linear-space instance.

This does NOT construct a norm-one vector, a coordinate R4 identification,
an S3 homeomorphism, Hopf quotient, Fock implementer, or a physical soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G0A
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1

/-- Source-original Gamma9 relational projector has a nontrivial range. -/
theorem relationalProjector_range_nontrivial :
    Nontrivial (LinearMap.range (Matrix.toLin' relationalProjector)) := by
  apply (Module.finrank_pos_iff (R := ℝ)).1
  rw [relationalProjector_range_finrank_four]
  decide

#print axioms relationalProjector_range_nontrivial

end
end FCP.RHOPFP9C3D2G0A
