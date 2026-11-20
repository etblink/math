import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D15OriginalGammaCircleQUnitGroupLaws
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F3OriginalGammaCircleVectorJointContinuity

/-!
# RHOPF-P9C3D2G1D16 — source-exact Circle joint continuity on Q-unit coordinates

The accepted original Gamma9 Circle matrix-vector action on real 16-spinors
is jointly continuous by P9C3D2F3. The exact original projector-range
subtype, accepted noncanonical continuous real-linear equivalence E,
and accepted real-four Q-unit subtype transport the *same* native action.

Prove joint continuity on the original projector range, Fin 4 → ℝ,
and the original-source transported Q-unit sphere, using only qualified
source continuity and the actual action definitions from D13/D14.

No alternative Gamma9 data, invented group action, chosen complex basis,
standard scalar Hopf action, quotient/Chern class, Fock or physical soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D16
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F3
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14

/-- Original source Gamma9 Circle action is jointly continuous on
its exact rank-four relational projector range subtype. -/
theorem relationalCircleRangeAction_joint_continuous :
    Continuous (fun p : Circle ×
      (LinearMap.range (Matrix.toLin' relationalProjector)) =>
      relationalCircleRangeAction p.1 p.2) := by
  have hVal : Continuous (fun v :
      LinearMap.range (Matrix.toLin' relationalProjector) => v.1) :=
    continuous_subtype_val
  have hSecond : Continuous (fun p : Circle ×
      (LinearMap.range (Matrix.toLin' relationalProjector)) => p.2.1) :=
    hVal.comp continuous_snd
  have hPair : Continuous (fun p : Circle ×
      (LinearMap.range (Matrix.toLin' relationalProjector)) =>
        (p.1, p.2.1)) :=
    continuous_fst.prodMk hSecond
  have hSource : Continuous
      ((fun q : Circle × (SpinIndex → ℝ) =>
        relationalCircleVector q.1 q.2) ∘
        (fun p : Circle ×
          (LinearMap.range (Matrix.toLin' relationalProjector)) =>
            (p.1, p.2.1))) :=
    relationalCircleVector_joint_continuous.comp hPair
  have hBase : Continuous (fun p : Circle ×
      (LinearMap.range (Matrix.toLin' relationalProjector)) =>
      relationalCircleVector p.1 p.2.1) := by
    exact hSource
  exact hBase.subtype_mk
    (fun p => (relationalCircleRangeAction p.1 p.2).2)

/-- The actual source-derived Gamma9 Circle action is jointly continuous
on the accepted noncanonical real-four coordinates via E. -/
theorem relationalCircleFourAction_joint_continuous :
    Continuous (fun p : Circle × (Fin 4 → ℝ) =>
      relationalCircleFourAction p.1 p.2) := by
  let E := relationalRangeContinuousLinearEquivFinFour
  have hInv : Continuous (fun p : Circle × (Fin 4 → ℝ) =>
      E.symm p.2) :=
    E.symm.continuous.comp continuous_snd
  have hPair : Continuous (fun p : Circle × (Fin 4 → ℝ) =>
      (p.1, E.symm p.2)) :=
    continuous_fst.prodMk hInv
  have hSource : Continuous
      ((fun q : Circle ×
        (LinearMap.range (Matrix.toLin' relationalProjector)) =>
          relationalCircleRangeAction q.1 q.2) ∘
        (fun p : Circle × (Fin 4 → ℝ) => (p.1, E.symm p.2))) :=
    relationalCircleRangeAction_joint_continuous.comp hPair
  have hAction : Continuous (fun p : Circle × (Fin 4 → ℝ) =>
      relationalCircleRangeAction p.1 (E.symm p.2)) := by
    exact hSource
  exact E.continuous.comp hAction

/-- The genuine source-original Gamma9 Circle action restricted to
the transported Q-unit sphere is jointly continuous. -/
theorem relationalCircleQUnitAction_joint_continuous :
    Continuous (fun p : Circle × RelationalQUnitCoordinates =>
      relationalCircleQUnitAction p.1 p.2) := by
  have hVal : Continuous (fun v : RelationalQUnitCoordinates => v.1) :=
    continuous_subtype_val
  have hSecond : Continuous (fun p : Circle × RelationalQUnitCoordinates =>
      p.2.1) :=
    hVal.comp continuous_snd
  have hPair : Continuous (fun p : Circle × RelationalQUnitCoordinates =>
      (p.1, p.2.1)) :=
    continuous_fst.prodMk hSecond
  have hSource : Continuous
      ((fun q : Circle × (Fin 4 → ℝ) =>
          relationalCircleFourAction q.1 q.2) ∘
        (fun p : Circle × RelationalQUnitCoordinates => (p.1, p.2.1))) :=
    relationalCircleFourAction_joint_continuous.comp hPair
  have hBase : Continuous (fun p : Circle × RelationalQUnitCoordinates =>
      relationalCircleFourAction p.1 p.2.1) := by
    exact hSource
  exact hBase.subtype_mk
    (fun p => (relationalCircleQUnitAction p.1 p.2).2)

#print axioms relationalCircleRangeAction_joint_continuous
#print axioms relationalCircleFourAction_joint_continuous
#print axioms relationalCircleQUnitAction_joint_continuous

end
end FCP.RHOPFP9C3D2G1D16
