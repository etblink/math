import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA1OriginalThetaPairRealScalarStar

/-!
FCP BFSS ADJ-A2a — source-exact skew FrequencyMatrix entry adapter.
The entire operator identity is a separately typed scalar application
of qualified ADJ-A1. No D1S4 imports, nested K-entry rewrites,
original total quantizer or physical/spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA2a
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The skewness of an actual original frequency matrix implies
an entrywise real scalar identity before any Fock-operator expression. -/
theorem originalSkewFrequencyMatrix_entry {N : ℕ}
    (K : FrequencyMatrix N) (hK : K.transpose = -K)
    (r s : FrequencyIndex N) :
    K r s = -K s r := by
  have h := congrArg (fun A : FrequencyMatrix N => A s r) hK
  simpa only [Matrix.transpose_apply, Matrix.neg_apply] using h

/-- On the actual original BFSS Fock operator carrier, use
separately bound real c,d to instantiate qualified ADJ-A1. -/
theorem originalSkewFrequencyMatrix_thetaPair_star {N : ℕ}
    (M : AlgebraData N)
    (K : FrequencyMatrix N) (hK : K.transpose = -K)
    (r s : FrequencyIndex N) :
    star ((K r s : ℂ) •
      (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -((K s r : ℂ) •
      (M.theta s.1 s.2 * M.theta r.1 r.2)) := by
  let c : ℝ := K r s
  let d : ℝ := K s r
  have hcd : c = -d := by
    change K r s = -(K s r)
    exact originalSkewFrequencyMatrix_entry K hK r s
  change star ((c : ℂ) •
    (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -((d : ℂ) •
      (M.theta s.1 s.2 * M.theta r.1 r.2))
  exact FCP.BFSSAdjointA1.originalThetaPairRealCoefficient_skew
    M r s c d hcd

#print axioms originalSkewFrequencyMatrix_entry
#print axioms originalSkewFrequencyMatrix_thetaPair_star

end
end FCP.BFSSAdjointA2a
