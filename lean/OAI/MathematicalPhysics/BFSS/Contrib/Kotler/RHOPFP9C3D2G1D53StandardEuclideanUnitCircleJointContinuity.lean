import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D52OriginalGammaQUnitCircleMulActions

/-!
# RHOPF-P9C3D2G1D53 — standard complex unit-sphere Circle action continuity

D49 supplies the standard unit-complex scalar action on the norm-one
sphere in EuclideanSpace ℂ (Fin 2). D51 establishes its group laws;
D52 packages the *same* action as a detached MulAction Circle value.
This gate proves its JOINT continuity, using pinned Mathlib
continuous scalar multiplication on ambient EuclideanSpace.

The source-original Gamma9 action has NOT yet been proved continuous,
and no alternate source topology or quotient-space theorem is asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D53
noncomputable section

open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D52

/-- The exact D49 standard Circle scalar transformation is jointly
continuous on the *subtype* unit sphere, not merely in the ambient ℂ². -/
theorem relationalEuclideanUnitCircleAction_continuous :
    Continuous (fun p : Circle ×
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
        relationalEuclideanUnitCircleAction p.1 p.2) := by
  apply Continuous.subtype_mk
  change Continuous (fun p : Circle ×
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
      (p.1 : Circle) • p.2.val)
  exact (continuous_smul (M := Circle)
    (X := EuclideanSpace ℂ (Fin 2))).comp
    (continuous_fst.prodMk
      (continuous_subtype_val.comp continuous_snd))

/-- Standalone continuity certificate with the **detached D52**
standard unit-sphere MulAction locally installed in the TYPE.
No global instance is registered. -/
theorem relationalEuclideanUnitCircleContinuousSMul :
    letI : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
        relationalEuclideanUnitCircleMulAction;
    ContinuousSMul Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} := by
  -- The detached action is already fixed in the theorem's scoped type.
  -- Bind its exact value locally as a non-instance `let`, matching
  -- Mathlib's approach for Prop-valued detached structure certificates.
  let : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
    relationalEuclideanUnitCircleMulAction
  refine ⟨?_⟩
  change Continuous (fun p : Circle ×
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
      relationalEuclideanUnitCircleAction p.1 p.2)
  exact relationalEuclideanUnitCircleAction_continuous

#print axioms relationalEuclideanUnitCircleAction_continuous
#print axioms relationalEuclideanUnitCircleContinuousSMul

end
end FCP.RHOPFP9C3D2G1D53
