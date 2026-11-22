import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessM0OriginalBracketNegationProbe

/-!
MASSLESS-M1a: exact original BFSS massless complex-linear source
quantizer normalization via independently qualified M0.
No failed D1F source, massive h=m=1 theorem, real restriction,
bosonic Hilbert domain, spectral or physical Hopfion conclusion.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessM1a
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The original massless interaction frequency is minus the original
source positive gamma/structure-constant bracket, with no massT term. -/
def masslessSourceFrequency {N : ℕ} (M : AlgebraData N)
    (x : Boson N) : FrequencyMatrix N :=
  fun r s => -(FCP.BFSSMasslessM0.sourceBracketCoefficient M x r s)

/-- Exact original source finite-Fock complex-linear quantizer of the
massless h=1,m=0 interaction, without changing the source carrier. -/
theorem originalMasslessQuantizer_eq_cubic {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    M.quantizeFrequency (masslessSourceFrequency M x) =
      ((-Complex.I) / 2) •
        (∑ j : SpaceIndex, ∑ A : ColorIndex N,
          M.cubicFermionComponent x A j) := by
  change (Complex.I / 2) •
    (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      ((-(FCP.BFSSMasslessM0.sourceBracketCoefficient M x r s) : ℝ) : ℂ) •
        (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    ((-Complex.I) / 2) •
      (∑ j : SpaceIndex, ∑ A : ColorIndex N,
        M.cubicFermionComponent x A j)
  rw [FCP.BFSSMasslessM0.sourceBracketCoefficient_negative_contraction M x]
  simp only [smul_neg, neg_div, neg_smul]

#print axioms originalMasslessQuantizer_eq_cubic

end
end FCP.BFSSMasslessM1a
