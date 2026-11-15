import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1FinDet3

/-!
# IBI-G0B1 — exact original source columns and color-triple covariance

Source-specific preparation for the G3A native determinant +1 theorem.
Uses the actual paired AlgebraData 2 color conjugation, source G3A
adjoint coefficient basis identification, and G1B signed color cross.

Does not infer determinant +1, SO3 surjectivity or orbit classification.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0B1SourceColumnsTriple
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1BOriginalSignedCross

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- A literal conjugated original source color basis vector gives
column A of G3A's genuine adjoint matrix, with output row B. -/
theorem sourceColumn_apply (g : GaugeGroup 2)
    (A B : ColorIndex 2) :
    (M.colorConjugate (g : ColorMatrix 2)
      (FCP.BFSSSU2GaugeG3A.colorUnit A)) B =
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A := by
  simpa only [FCP.BFSSSU2GaugeG3A.adjointColorMatrix] using
    FCP.BFSSSU2GaugeG3A.adjointCoefficient_on_basis g A B

/-- The original color Lie triple is invariant under literal paired
gauge color conjugation for arbitrary original color vectors. -/
theorem sourceColorLieTriple_conjugate (g : GaugeGroup 2)
    (u v w : ColorVector 2) :
    inner ℝ (M.colorLie
      (M.colorConjugate (g : ColorMatrix 2) u)
      (M.colorConjugate (g : ColorMatrix 2) v))
      (M.colorConjugate (g : ColorMatrix 2) w) =
    inner ℝ (M.colorLie u v) w := by
  rw [M.colorConjugate_lie (g : ColorMatrix 2) g.prop.1]
  exact M.colorConjugate_inner (g : ColorMatrix 2) g.prop.1
    (M.colorLie u v) w

/-- Cancel the certified positive sqrt(2) normalization to obtain
invariance of the *signed source Pauli cross triple*, not merely norm. -/
theorem sourceCrossTriple_conjugate (g : GaugeGroup 2)
    (u v w : ColorVector 2) :
    inner ℝ (sourceCross
      (M.colorConjugate (g : ColorMatrix 2) u)
      (M.colorConjugate (g : ColorMatrix 2) v))
      (M.colorConjugate (g : ColorMatrix 2) w) =
    inner ℝ (sourceCross u v) w := by
  have h := sourceColorLieTriple_conjugate g u v w
  rw [pairedColorLie_eq_sourceCross, pairedColorLie_eq_sourceCross] at h
  simp only [real_inner_smul_left] at h
  have hs : 0 < Real.sqrt (2 : ℝ) :=
    Real.sqrt_pos.2 (by norm_num)
  nlinarith

#print axioms sourceColumn_apply
#print axioms sourceColorLieTriple_conjugate
#print axioms sourceCrossTriple_conjugate

end
end FCP.BFSSIBIG0B1SourceColumnsTriple
