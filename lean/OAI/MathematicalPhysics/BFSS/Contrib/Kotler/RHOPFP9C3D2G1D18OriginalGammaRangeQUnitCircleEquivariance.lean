import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D17OriginalGammaCircleQUnitFreeness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D3OriginalGammaRangeUnitCoordinateHomeomorph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F0OriginalGammaCircleQuadraticFormInvariance

/-!
# RHOPF-P9C3D2G1D18 — exact Gamma9 range/Q-unit Circle equivariance

The accepted G1D3 Homeomorph E of the original rank-four projector
unit sphere to the transported Q-unit sphere is the restriction of
the exact source Gamma9 continuous real-linear coordinate map E.

The original range Circle action is the actual source Gamma9 matrix
action, not postulated scalar complex multiplication. Equip the original
range unit sphere with this action and prove that the existing source
G1D3 homeomorphism intertwines it with D14's actual Q-unit action.

This does NOT select an orthonormal complex basis, prove equivalence
to standard scalar Hopf action, or construct a quotient/Chern class.
No original gamma entries, Fock, Hamiltonian or physical hopfion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D18
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F0
open FCP.RHOPFP9C3D2G1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D3
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14

/-- Restriction of the *actual* original Gamma9 Circle matrix action
to unit vectors in the original rank-four relational projector image. -/
noncomputable def relationalRangeUnitCircleAction
    (z : Circle) (v : RelationalRangeUnitSphere) :
    RelationalRangeUnitSphere :=
  ⟨relationalCircleRangeAction z v.1, by
    change (relationalCircleVector z v.1.1) ⬝ᵥ
      (relationalCircleVector z v.1.1) = 1
    exact (relationalCircleVector_dot_self z v.1.1).trans v.2⟩

/-- G1D3's pre-existing original Gamma9 E-homeomorphism is explicitly
Circle-equivariant for the source-derived range and Q-unit actions. -/
theorem relationalRangeUnitHomeomorphQUnit_circle_equivariant
    (z : Circle) (v : RelationalRangeUnitSphere) :
    relationalRangeUnitHomeomorphQUnit
      (relationalRangeUnitCircleAction z v) =
      relationalCircleQUnitAction z
        (relationalRangeUnitHomeomorphQUnit v) := by
  apply Subtype.ext
  let E := relationalRangeContinuousLinearEquivFinFour
  change E (relationalCircleRangeAction z v.1) =
    E (relationalCircleRangeAction z (E.symm (E v.1)))
  rw [E.symm_apply_apply]

#print axioms relationalRangeUnitCircleAction
#print axioms relationalRangeUnitHomeomorphQUnit_circle_equivariant

end
end FCP.RHOPFP9C3D2G1D18
