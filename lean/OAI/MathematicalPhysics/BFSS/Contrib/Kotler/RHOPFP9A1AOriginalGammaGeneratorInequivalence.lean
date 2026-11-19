import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10AGOriginalGammaOrderedPairGramProbe

/-!
# RHOPF-P9A1A — inequivalent original Gamma9 full-spinor generators

Reuse the qualified original 36-bivector trace-Gram facts; no replacement
gamma tables and no new representation.  The selected Hopf R4 comparison
is intentionally NOT claimed here.  P9A1B must prove it separately.

No physical Fock implementer, Hamiltonian conservation law or Noether
charge follows from these full 16-real matrix inequalities.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A1A
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Clifford

/-- Two different canonical source gamma pairs cannot give scalar
multiples of one another: their original-source trace Gram
cross-pairing vanishes but the self-pairing is -16. -/
theorem originalGammaPair_ne_scalar_distinct
    (a b c d : SpaceIndex)
    (hab : a < b) (hcd : c < d)
    (hpair : (a, b) ≠ (c, d))
    (r : ℝ) :
    gamma a * gamma b ≠ r • (gamma c * gamma d) := by
  intro h
  have hdiag :
      Matrix.trace ((gamma a * gamma b) *
        (gamma a * gamma b)) = -(16 : ℝ) :=
    source9OriginalGamma_pair_square_trace_neg_sixteen a b (ne_of_lt hab)
  have hcross :
      Matrix.trace ((gamma a * gamma b) *
        (gamma c * gamma d)) = 0 :=
    source9OriginalGamma_ordered_distinct_pair_trace_zero
      a b c d hab hcd hpair
  have hfalse : -(16 : ℝ) = 0 := by
    calc
      -(16 : ℝ) =
          Matrix.trace ((gamma a * gamma b) * (gamma a * gamma b)) :=
        hdiag.symm
      _ = Matrix.trace ((gamma a * gamma b) *
          (r • (gamma c * gamma d))) :=
        congrArg (fun M : GammaMatrix =>
          Matrix.trace ((gamma a * gamma b) * M)) h
      _ = r • Matrix.trace ((gamma a * gamma b) *
          (gamma c * gamma d)) := by
        rw [mul_smul_comm, Matrix.trace_smul]
      _ = 0 := by rw [hcross]; simp
  norm_num at hfalse

/-- First full original 16-real source generator differs from second. -/
theorem K13_ne_K25 :
    gamma 1 * gamma 3 ≠ -(gamma 2 * gamma 5) := by
  simpa only [neg_one_smul] using
    (originalGammaPair_ne_scalar_distinct
      1 3 2 5 (by decide) (by decide) (by decide) (-1 : ℝ))

/-- First full original 16-real source generator differs from third. -/
theorem K13_ne_K46 :
    gamma 1 * gamma 3 ≠ -(gamma 4 * gamma 6) := by
  simpa only [neg_one_smul] using
    (originalGammaPair_ne_scalar_distinct
      1 3 4 6 (by decide) (by decide) (by decide) (-1 : ℝ))

/-- The second and third negative signed pairs also differ. -/
theorem K25_ne_K46 :
    -(gamma 2 * gamma 5) ≠ -(gamma 4 * gamma 6) := by
  have hbase : gamma 2 * gamma 5 ≠ gamma 4 * gamma 6 := by
    simpa only [one_smul] using
      (originalGammaPair_ne_scalar_distinct
        2 5 4 6 (by decide) (by decide) (by decide) (1 : ℝ))
  intro h
  exact hbase (neg_inj.mp h)

#print axioms originalGammaPair_ne_scalar_distinct
#print axioms K13_ne_K25
#print axioms K13_ne_K46
#print axioms K25_ne_K46

end
end FCP.RHOPFP9A1A
