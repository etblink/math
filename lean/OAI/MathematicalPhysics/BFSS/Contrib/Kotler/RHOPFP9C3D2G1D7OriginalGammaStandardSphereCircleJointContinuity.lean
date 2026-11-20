import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D6OriginalGammaStandardSphereCircleFreeAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F4OriginalGammaRelationalUnitCircleJointContinuity

/-!
# RHOPF-P9C3D2G1D7 — joint continuity of original Gamma9 Circle action transported to S³

The source-exact original relational unit-spinor Circle action is jointly
continuous by accepted F4. The accepted G1D4 source-to-standard sphere
Homeomorph h and accepted D5 transported action make its conjugate
(z, u) ↦ h (z · h⁻¹ u) jointly continuous as a composition of continuous maps.

No claim is made that this is the standard scalar Hopf action; no quotient,
Chern class, physical Fock implementer or Hamiltonian invariance follows.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D7
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2F4
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D4
open FCP.RHOPFP9C3D2G1D5

/-- The exact original Gamma9 free circle action, transported through
the accepted relational-to-standard sphere Homeomorph, is jointly continuous. -/
theorem relationalStandardCircleAction_joint_continuous :
    Continuous (fun p : Circle × StandardUnitCoordinates =>
      relationalStandardCircleAction p.1 p.2) := by
  let e := relationalUnitSpinorHomeomorphStandardUnit
  have hInv : Continuous (fun p : Circle × StandardUnitCoordinates =>
      e.symm p.2) :=
    e.symm.continuous.comp continuous_snd
  have hPair : Continuous (fun p : Circle × StandardUnitCoordinates =>
      (p.1, e.symm p.2)) :=
    continuous_fst.prodMk hInv
  have hSource : Continuous
      ((fun q : Circle × RelationalUnitSpinor =>
          relationalUnitCircleAction q.1 q.2) ∘
        (fun p : Circle × StandardUnitCoordinates => (p.1, e.symm p.2))) :=
    relationalUnitCircleAction_joint_continuous.comp hPair
  have hAction : Continuous (fun p : Circle × StandardUnitCoordinates =>
      relationalUnitCircleAction p.1 (e.symm p.2)) := by
    exact hSource
  have hTransport : Continuous (fun p : Circle × StandardUnitCoordinates =>
      e (relationalUnitCircleAction p.1 (e.symm p.2))) :=
    e.continuous.comp hAction
  exact hTransport

#print axioms relationalStandardCircleAction_joint_continuous

end
end FCP.RHOPFP9C3D2G1D7
