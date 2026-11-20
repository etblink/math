import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D2OriginalGammaInterSphereHomeomorph

/-!
# RHOPF-P9C3D2G1D3 — original projector-range unit sphere ↔ transported Q-unit sphere

The accepted original Gamma9 range carries its inherited unit
sphere, and the accepted G1C0 continuous real-linear equivalence
E maps that actual range to Fin 4 → ℝ. Its inverse transports the
ORIGINAL real-16-spinor Euclidean dot-self as Q(x), so E restricts
to a homeomorphism from source range unit sphere to Q-unit sphere.

This is NOT an equivariance theorem. The coordinate equivalence
is noncanonical and is not assumed to preserve the original Circle
action, to be a Euclidean isometry, or to intertwine the Hopf action.
Neither a Hopf quotient nor a physical Fock implementation follows.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D3
noncomputable section

open FCP.RHOPFP9C3D2G1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C7

/-- The canonical restriction of the previously qualified
continuous real-linear coordinate equivalence E to the original
unit level set of real-spinor Euclidean dot-self and its transported
Q-unit coordinate level set. -/
noncomputable def relationalRangeUnitHomeomorphQUnit :
    RelationalRangeUnitSphere ≃ₜ RelationalQUnitCoordinates := by
  let E := relationalRangeContinuousLinearEquivFinFour
  let F : RelationalRangeUnitSphere → RelationalQUnitCoordinates :=
    fun v => ⟨E v.1, by
      change (E.symm (E v.1)).1 ⬝ᵥ (E.symm (E v.1)).1 = 1
      rw [E.symm_apply_apply]
      exact v.2⟩
  let G : RelationalQUnitCoordinates → RelationalRangeUnitSphere :=
    fun v => ⟨E.symm v.1, by
      exact v.2⟩
  refine {
    toFun := F
    invFun := G
    left_inv := ?_
    right_inv := ?_
    continuous_toFun := ?_
    continuous_invFun := ?_
  }
  · intro v
    apply Subtype.ext
    exact E.symm_apply_apply v.1
  · intro v
    apply Subtype.ext
    exact E.apply_symm_apply v.1
  · have hbase : Continuous (fun v : RelationalRangeUnitSphere => E v.1) :=
      E.continuous.comp continuous_subtype_val
    exact hbase.subtype_mk (fun v => (F v).2)
  · have hbase : Continuous (fun v : RelationalQUnitCoordinates => E.symm v.1) :=
      E.symm.continuous.comp continuous_subtype_val
    exact hbase.subtype_mk (fun v => (G v).2)

/-- The forward homeomorphism applies the accepted continuous
linear original-source Gamma9 range coordinate map. -/
theorem relationalRangeUnitHomeomorphQUnit_apply
    (v : RelationalRangeUnitSphere) :
    (relationalRangeUnitHomeomorphQUnit v).1 =
      relationalRangeContinuousLinearEquivFinFour v.1 := by
  rfl

/-- The reverse homeomorphism uses the accepted inverse
continuous real-linear coordinate map. -/
theorem relationalRangeUnitHomeomorphQUnit_symm_apply
    (v : RelationalQUnitCoordinates) :
    (relationalRangeUnitHomeomorphQUnit.symm v).1 =
      relationalRangeContinuousLinearEquivFinFour.symm v.1 := by
  rfl

#print axioms relationalRangeUnitHomeomorphQUnit
#print axioms relationalRangeUnitHomeomorphQUnit_apply
#print axioms relationalRangeUnitHomeomorphQUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D3
