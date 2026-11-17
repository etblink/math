import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk

/-!
# BFSS W0A0 — all original 48 Majorana labels, exact M3I Clifford-axis image

Only transport the accepted OP3-A2 8×2×3 original-source equality through
the actual S1V5 sourceBlockColorEquiv. No new representation, no claim of
generator spanning, scalar commutant or complete witness map.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A0OriginalSourceAxisWitness
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis
open scoped TensorProduct

/-- Every original 48-label unit axis, not merely a selected tuple
of spin, Majorana bit and color, maps to the actual normalized
Majorana on the original 24-mode Fock space. -/
theorem originalComplexEquiv_allLabelAxis_eq_activeGamma
    (p : Source48Label) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (Pi.single p (1 : ℝ)))) =
      sourceNormalizedGamma p := by
  let q : RealSpinBlock × ColorLabel := sourceBlockColorEquiv.symm p
  have hlabel : sourceBlockColorLabel q.1 q.2 = p := by
    change sourceBlockColorEquiv q = p
    exact sourceBlockColorEquiv.apply_symm_apply p
  have haxis : sourceBlockColorAxis q.1 q.2 =
      Pi.single p (1 : ℝ) := by
    change Pi.single (sourceBlockColorLabel q.1 q.2) (1 : ℝ) =
      Pi.single p (1 : ℝ)
    rw [hlabel]
  simpa only [haxis, hlabel] using
    (originalComplexEquiv_sourceAxis_eq_activeGamma
      q.1.1 q.1.2 q.2)

#print axioms originalComplexEquiv_allLabelAxis_eq_activeGamma

end
end FCP.BFSSP3M4W0A0OriginalSourceAxisWitness
