import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA2bOriginalFrequencyDoubleSumSkew

/-!
FCP BFSS ADJ-A2c — original finite-Fock quantizer self-adjointness
for an arbitrary original real skew FrequencyMatrix.
Uses qualified A2b finite theta sum; original source definition
quantizeFrequency = (I/2) • sum. No D1S3 or D1S4 import,
physical coefficient specialization or spectral assertion.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA2c
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The literal original BFSS finite-Fock quantizeFrequency of
any real skew frequency matrix K is self-adjoint. No unbounded
Hamiltonian or physical carrier-domain claim is made. -/
theorem originalSkewFrequencyMatrix_quantize_isSelfAdjoint {N : ℕ}
    (M : AlgebraData N) (K : FrequencyMatrix N)
    (hK : K.transpose = -K) :
    IsSelfAdjoint (M.quantizeFrequency K) := by
  change star ((Complex.I / 2) •
    (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2))) =
    (Complex.I / 2) •
      (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
        (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2))
  have hsum := FCP.BFSSAdjointA2b.originalSkewFrequencyMatrix_finiteSum_star_skew
    M K hK
  have hI : star (Complex.I / (2 : ℂ)) =
      -(Complex.I / (2 : ℂ)) := by
    simp; ring
  rw [star_smul, hsum, hI]
  simp only [neg_smul, smul_neg, neg_neg]

#print axioms originalSkewFrequencyMatrix_quantize_isSelfAdjoint

end
end FCP.BFSSAdjointA2c
