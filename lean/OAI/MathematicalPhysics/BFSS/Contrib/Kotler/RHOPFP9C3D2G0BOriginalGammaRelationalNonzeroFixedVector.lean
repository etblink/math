import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G0AOriginalGammaRelationalRangeNontrivial

/-!
# RHOPF-P9C3D2G0B — source-original nonzero relational fixed vector

The accepted original Gamma9 relational projector image has real
dimension four and has now been certified nontrivial. The exact
original projector is idempotent. The image of an idempotent
is its fixed-point subspace.

Produce a nonzero original real 16-spinor vector in the exact projector
image, without assuming any preferred coordinate basis or normalization.

This does not prove nonemptiness of the unit sphere yet, identify S³,
or construct a Hopf quotient or physical BFSS Fock-space action.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G0B
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C3D2G0A

/-- Existence of a nonzero fixed point of the exact original Gamma9
relational projector on its real 16-spinor carrier. -/
theorem relationalProjector_exists_nonzero_fixed :
    ∃ v : SpinIndex → ℝ,
      (Matrix.toLin' relationalProjector) v = v ∧ v ≠ 0 := by
  let F : (SpinIndex → ℝ) →ₗ[ℝ] (SpinIndex → ℝ) :=
    Matrix.toLin' relationalProjector
  have hIdem : IsIdempotentElem F := relationalProjector_toLin_idempotent
  letI : Nontrivial (LinearMap.range F) :=
    relationalProjector_range_nontrivial
  obtain ⟨v, hv⟩ : ∃ v : LinearMap.range F, v ≠ 0 := exists_ne 0
  refine ⟨v.1, ?_, ?_⟩
  · exact (hIdem.mem_range_iff).mp v.2
  · intro hzero
    apply hv
    exact Subtype.ext hzero

#print axioms relationalProjector_exists_nonzero_fixed

end
end FCP.RHOPFP9C3D2G0B
