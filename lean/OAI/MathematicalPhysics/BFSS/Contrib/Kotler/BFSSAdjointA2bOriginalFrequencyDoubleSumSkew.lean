import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA0AbstractPairSumStarSkew
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA2aOriginalSkewMatrixEntryThetaPair

/-!
FCP BFSS ADJ-A2b — exact original finite-Fock theta-pair double sum.
Uses qualified A2a for the pointwise original coefficient/adjoint
identity and qualified A0 for the generic finite double-sum step.
No D1S4 import, quantizer self-adjointness or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA2b
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The full *finite* original BFSS theta-pair double sum is
star-skew for any original real skew frequency matrix K.
This is the assembly step before (but not including) the original
i/2 quantizer self-adjointness calculation. -/
theorem originalSkewFrequencyMatrix_finiteSum_star_skew {N : ℕ}
    (M : AlgebraData N) (K : FrequencyMatrix N)
    (hK : K.transpose = -K) :
    star (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) := by
  classical
  let U : FrequencyIndex N → FrequencyIndex N →
      (Fermion N →L[ℂ] Fermion N) := fun r s =>
    (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)
  have hpair (r s : FrequencyIndex N) :
      star (U r s) = -(U s r) := by
    change star ((K r s : ℂ) •
      (M.theta r.1 r.2 * M.theta s.1 s.2)) =
      -((K s r : ℂ) •
        (M.theta s.1 s.2 * M.theta r.1 r.2))
    exact FCP.BFSSAdjointA2a.originalSkewFrequencyMatrix_thetaPair_star
      M K hK r s
  have hsum := FCP.BFSSAdjointA0.finitePairSum_star_skew U hpair
  simpa only [U] using hsum

#print axioms originalSkewFrequencyMatrix_finiteSum_star_skew

end
end FCP.BFSSAdjointA2b
