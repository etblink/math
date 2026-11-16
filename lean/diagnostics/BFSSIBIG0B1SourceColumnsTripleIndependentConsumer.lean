import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1SourceColumnsTriple

/-!
# IBI-G0B1 exact source columns/triples — independent original-source consumer

Consume the real G3A color-basis identification and exact original
paired SU(2) color-Lie and signed-cross covariance on arbitrary inputs.
No surrogate SO(3) group and no determinant-one assertion.
-/

set_option autoImplicit false

namespace BFSSIBIG0B1SourceColumnsTripleIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1BOriginalSignedCross
open FCP.BFSSIBIG0B1SourceColumnsTriple

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- Arbitrary original basis input/output indices, not only identity g. -/
example (g : GaugeGroup 2) (A B : ColorIndex 2) :
    (M.colorConjugate (g : ColorMatrix 2)
      (FCP.BFSSSU2GaugeG3A.colorUnit A)) B =
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A :=
  sourceColumn_apply g A B

/-- The original color Lie triple is fully gauge covariant. -/
example (g : GaugeGroup 2) (u v w : ColorVector 2) :
    inner ℝ (M.colorLie
      (M.colorConjugate (g : ColorMatrix 2) u)
      (M.colorConjugate (g : ColorMatrix 2) v))
      (M.colorConjugate (g : ColorMatrix 2) w) =
    inner ℝ (M.colorLie u v) w :=
  sourceColorLieTriple_conjugate g u v w

/-- Independently consume the signed source cross-triple covariance,
retaining the G1B Pauli normalization and original SU(2) action. -/
example (g : GaugeGroup 2) (u v w : ColorVector 2) :
    inner ℝ (sourceCross
      (M.colorConjugate (g : ColorMatrix 2) u)
      (M.colorConjugate (g : ColorMatrix 2) v))
      (M.colorConjugate (g : ColorMatrix 2) w) =
    inner ℝ (sourceCross u v) w :=
  sourceCrossTriple_conjugate g u v w

end
end BFSSIBIG0B1SourceColumnsTripleIndependentConsumer
