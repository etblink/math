import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F3OriginalGammaCircleVectorJointContinuity

/-!
# RHOPF-P9C3D2F4 — jointly continuous Circle action on relational unit spinors

The accepted source-original real 16-spinor Gamma9 Circle action
preserves the intrinsic norm-one projector image. P9C3D2F1/F2
strictly established its algebraic action and trivial stabilizers.
P9C3D2F3 strictly established joint continuity on the original
real-spinor vector carrier.

This bounded gate restricts joint continuity to the exact
source-defined unit spinor subtype using its induced topology.
It does not yet establish nonemptiness or an S³ homeomorphism,
a Hopf quotient, a Fock implementer, Hamiltonian covariance
or a physical topological soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F4
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2F3

/-- The source-original Gamma9 Circle action on the intrinsic
norm-one rank-four relational projector image is jointly continuous. -/
theorem relationalUnitCircleAction_joint_continuous :
    Continuous (fun p : Circle × RelationalUnitSpinor =>
      relationalUnitCircleAction p.1 p.2) := by
  -- R2: isolate each continuous map with an explicit type to avoid
  -- elaboration-time definitional-equality search through the original source.
  have hSnd : Continuous (fun p : Circle × RelationalUnitSpinor => p.2) :=
    continuous_snd
  have hVal : Continuous (fun v : RelationalUnitSpinor => v.1) :=
    continuous_subtypeVal
  have hCarrier : Continuous (fun p : Circle × RelationalUnitSpinor => p.2.1) :=
    hVal.comp hSnd
  have hPair : Continuous (fun p : Circle × RelationalUnitSpinor =>
      (p.1, p.2.1)) :=
    continuous_fst.prodMk hCarrier
  have hbase : Continuous (fun p : Circle × RelationalUnitSpinor =>
      relationalCircleVector p.1 p.2.1) :=
    relationalCircleVector_joint_continuous.comp hPair
  exact hbase.subtype_mk _

#print axioms relationalUnitCircleAction_joint_continuous

end
end FCP.RHOPFP9C3D2F4
