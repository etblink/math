import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D8OriginalGammaPhaseComplexStructureOnProjectorImage
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1AOriginalGammaRelationalRangeUnitSphereEquiv

/-!
# RHOPF-P9C3D2G1D9 — original Gamma9 J as a linear endomorphism of im(P)

Package the source-original phase J=K13 P directly as a real-linear
endomorphism of the exact original rank-four projector range. The accepted
G1D8 source-vector identities prove J preserves the image and J²=-I
on that image, without choosing a coordinate basis.

Do not identify this arbitrary real-four coordinate presentation with
complex two-space or assert a Hopf quotient, Fock lift, physical soliton,
or source-equivariant orthonormal basis at this gate.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D9
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2G1D8

/-- Exact image of the accepted original Gamma9 relational projector. -/
private abbrev RelationalProjectorRange : Type :=
  LinearMap.range (Matrix.toLin' relationalProjector)

/-- Source-original phase J packaged as a real-linear map on its
original rank-four projector image, with no coordinate choices. -/
noncomputable def relationalPhaseJRangeLinear :
    RelationalProjectorRange →ₗ[ℝ] RelationalProjectorRange := by
  have hProj : LinearMap.IsProj
      (LinearMap.range (Matrix.toLin' relationalProjector))
      (Matrix.toLin' relationalProjector) :=
    (LinearMap.isProj_range_iff_isIdempotentElem
      (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
  refine {
    toFun := fun v =>
      ⟨relationalPhaseJ.mulVec v.1, by
        have hv : relationalProjector.mulVec v.1 = v.1 :=
          hProj.map_id v.1 v.2
        exact ⟨relationalPhaseJ.mulVec v.1,
          relationalPhaseJ_mulVec_preserves_projector_image v.1 hv⟩⟩
    map_add' := by
      intro v w
      apply Subtype.ext
      change (Matrix.toLin' relationalPhaseJ) (v.1 + w.1) =
        (Matrix.toLin' relationalPhaseJ) v.1 +
          (Matrix.toLin' relationalPhaseJ) w.1
      exact (Matrix.toLin' relationalPhaseJ).map_add v.1 w.1
    map_smul' := by
      intro c v
      apply Subtype.ext
      change (Matrix.toLin' relationalPhaseJ) (c • v.1) =
        c • (Matrix.toLin' relationalPhaseJ) v.1
      exact (Matrix.toLin' relationalPhaseJ).map_smul c v.1
  }

/-- J squares to minus the identity on the exact original
real rank-four projector range. -/
theorem relationalPhaseJRangeLinear_square (v : RelationalProjectorRange) :
    relationalPhaseJRangeLinear (relationalPhaseJRangeLinear v) = -v := by
  have hProj : LinearMap.IsProj
      (LinearMap.range (Matrix.toLin' relationalProjector))
      (Matrix.toLin' relationalProjector) :=
    (LinearMap.isProj_range_iff_isIdempotentElem
      (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
  have hv : relationalProjector.mulVec v.1 = v.1 :=
    hProj.map_id v.1 v.2
  apply Subtype.ext
  change relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v.1) = -v.1
  exact relationalPhaseJ_mulVec_square_on_projector_image v.1 hv

#print axioms relationalPhaseJRangeLinear
#print axioms relationalPhaseJRangeLinear_square

end
end FCP.RHOPFP9C3D2G1D9
