import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G0COriginalGammaRelationalUnitSphereNonempty

/-!
# RHOPF-P9C3D2G1A — original relational sphere / projector range equivalence

Establish an exact, basis-free *equivalence of underlying sets* between
the source-original projector-fixed norm-one spinor subtype and the unit
sphere formed inside the actual range of the original Gamma9 projector.

The previously accepted original projector is idempotent, so its range
is precisely its fixed-point subspace. This is only a type equivalence.
Topological homeomorphism, metric isometry, S³, equivariance and the
actual Hopf quotient remain separate obligations.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1A
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C3D2F1

/-- Unit-sphere subtype in the original rank-four relational
projector image, with no source-coordinate basis assumption. -/
abbrev RelationalRangeUnitSphere : Type :=
  {v : LinearMap.range (Matrix.toLin' relationalProjector) //
    v.1 ⬝ᵥ v.1 = 1}

/-- The source-original projector-fixed unit spinors are equivalent,
without any choice of basis, to the unit sphere of the projector range.
This is a set-level equivalence, not yet a homeomorphism. -/
noncomputable def relationalUnitSpinorEquivRange :
    RelationalUnitSpinor ≃ RelationalRangeUnitSphere where
  toFun := fun v =>
    ⟨⟨v.1, ⟨v.1, v.2.1⟩⟩, v.2.2⟩
  invFun := fun w => by
    have hProj : LinearMap.IsProj
        (LinearMap.range (Matrix.toLin' relationalProjector))
        (Matrix.toLin' relationalProjector) :=
      (LinearMap.isProj_range_iff_isIdempotentElem
        (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
    have hfixed : relationalProjector.mulVec w.1.1 = w.1.1 :=
      hProj.map_id w.1.1 w.1.2
    exact ⟨w.1.1, ⟨hfixed, w.2⟩⟩
  left_inv := by
    intro v
    apply Subtype.ext
    rfl
  right_inv := by
    intro w
    apply Subtype.ext
    apply Subtype.ext
    rfl

#print axioms relationalUnitSpinorEquivRange

end
end FCP.RHOPFP9C3D2G1A
