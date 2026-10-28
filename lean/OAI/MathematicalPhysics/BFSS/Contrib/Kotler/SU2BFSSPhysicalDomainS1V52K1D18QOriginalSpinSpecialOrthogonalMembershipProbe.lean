import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V52K1D18POriginalSpinQuadraticIsometryDetOneProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V52K1D15OriginalSpin48QuadraticPreservationProbe

/-!
K1D18Q: exact original-source quadratic-preserving GL subgroup,
determinant-one intersection, and genuine Spin48 membership.
No substitute action, alternative 48-vector form, Spin word
factorization, SO-group map, surjectivity, covering, Spin9
global covariance or BFSS spectral claim. Candidate only.
-/
set_option autoImplicit false

namespace FCP.BFSSS1V52K1D18Q
noncomputable section
open FCP.BFSSS1V0

private abbrev Q : QuadraticForm ℝ Source48Vector := source48Quadratic
private abbrev GL48 := Source48Vector ≃ₗ[ℝ] Source48Vector

/-- Genuine original quadratic-form-preserving real GL subgroup. -/
noncomputable def source48QuadraticPreservingGL : Subgroup GL48 where
  carrier := {f | ∀ v, Q (f v) = Q v}
  one_mem' := by
    intro v
    have hOne : ((1 : GL48) v) = v := rfl
    exact congrArg Q hOne
  mul_mem' := by
    intro f g hf hg v
    have hMul : ((f * g : GL48) v) = f (g v) := rfl
    have hQuad : Q (f (g v)) = Q v :=
      (hf (g v)).trans (hg v)
    exact (congrArg Q hMul).trans hQuad
  inv_mem' := by
    intro f hf v
    have hInv : ((f⁻¹ : GL48) v) = f.symm v := rfl
    have hApply : f (f.symm v) = v := f.apply_symm_apply v
    have hQuad : Q (f.symm v) = Q v :=
      (hf (f.symm v)).symm.trans (congrArg Q hApply)
    exact (congrArg Q hInv).trans hQuad

/-- Pinned Mathlib's actual invertible determinant character. -/
noncomputable def source48DetCharacter : GL48 →* ℝˣ :=
  LinearEquiv.det

/-- Original quadratic preservation AND real determinant one. -/
noncomputable def source48SpecialOrthogonalGL : Subgroup GL48 :=
  source48QuadraticPreservingGL ⊓ source48DetCharacter.ker

/-- The original Spin48 action lands in the exact source special
orthogonal subgroup, using K1D15 and P, not an invented action. -/
theorem originalSourceSpin48_mem_sourceSO (s : spinGroup Q) :
    FCP.BFSSS1V52K1D13.originalSourceSpin48LinearRepresentation s ∈
      source48SpecialOrthogonalGL := by
  constructor
  · change ∀ v : Source48Vector,
        Q (FCP.BFSSS1V31.sourceSpin48VectorAction s v) = Q v
    exact FCP.BFSSS1V52K1D15.originalSourceSpin48VectorAction_preserves_sourceQuadratic s
  · change source48DetCharacter
      (FCP.BFSSS1V52K1D13.originalSourceSpin48LinearEquiv s) = 1
    apply Units.ext
    change ((LinearEquiv.det
      (FCP.BFSSS1V52K1D13.originalSourceSpin48LinearEquiv s) : ℝˣ) : ℝ) = 1
    rw [LinearEquiv.coe_det,
      ← FCP.BFSSS1V52K1D16.originalSourceSpin48QuadraticIsometry_underlyingLinearEquiv]
    exact FCP.BFSSS1V52K1D18P.originalSourceSpin48_quadraticIsometry_det_one s

#print axioms source48QuadraticPreservingGL
#print axioms source48DetCharacter
#print axioms source48SpecialOrthogonalGL
#print axioms originalSourceSpin48_mem_sourceSO

end
end FCP.BFSSS1V52K1D18Q
