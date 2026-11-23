import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYReflectedGammaBasis

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYIndependent

open OAI.BFSSQuantum FCP.BFSSMSYGamma
open scoped Matrix

/-- Exercise the two one-generator signs and a mixed-sign plane on the actual
imported original gamma, with the Gram normalization of the same map. -/
theorem originalGammaBasisAudit :
    (appendixGamma 0 * doubledBasis = doubledBasis * FCP.BFSSGamma9.gamma 0) ∧
    (appendixGamma 8 * doubledBasis = -(doubledBasis * FCP.BFSSGamma9.gamma 8)) ∧
    ((appendixGamma 0 * appendixGamma 8) * doubledBasis =
      -(doubledBasis * (FCP.BFSSGamma9.gamma 0 * FCP.BFSSGamma9.gamma 8))) ∧
    (doubledBasis.transpose * doubledBasis = (4 : ℝ) • (1 : GammaMatrix)) := by
  exact ⟨by simpa using appendixGamma_mul_doubledBasis 0,
    by simpa using appendixGamma_mul_doubledBasis 8,
    by simpa using appendixGamma_pair_mul_doubledBasis 0 8,
    doubledBasis_transpose_mul⟩

#print axioms originalGammaBasisAudit

end FCP.BFSSMSYIndependent
