import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG1BOriginalSignedCross

/-!
# IBI-G1B independent original-source consumer

Use actual original paired AlgebraData 2, source Pauli epsilon order
and G2A source SU(2) action. These are diagnostic Lean statements,
not a stand-in SO(3) group, physical Fock theorem or quotient.
-/

set_option autoImplicit false

namespace BFSSIBIG1BOriginalSignedCrossIndependentConsumer

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1AOriginalLieTriple
open FCP.BFSSIBIG1BOriginalSignedCross

/-- The original positive Pauli 012 color orientation. -/
example :
    pairedAlgebraData.structureConstant
      (⟨0, by decide⟩ : ColorIndex 2) (⟨1, by decide⟩ : ColorIndex 2)
      (⟨2, by decide⟩ : ColorIndex 2) =
        Real.sqrt 2 := by
  rw [pairedColor_structureConstant]
  norm_num [FCP.BFSSSU2.epsilon3]

/-- Reversing the original Pauli colors flips the signed coefficient. -/
example :
    pairedAlgebraData.structureConstant
      (⟨0, by decide⟩ : ColorIndex 2) (⟨2, by decide⟩ : ColorIndex 2)
      (⟨1, by decide⟩ : ColorIndex 2) =
        -Real.sqrt 2 := by
  rw [pairedColor_structureConstant]
  norm_num [FCP.BFSSSU2.epsilon3]

/-- A new consequence combining G1A invariance and G1B normalization,
on arbitrary original bosons, SU(2) elements and spatial labels. -/
example (g : GaugeGroup 2) (x : Boson 2)
    (i j k : SpaceIndex) :
    originalLieTriple (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j k =
      Real.sqrt 2 * originalCrossTriple x i j k := by
  rw [originalLieTriple_gauge]
  exact originalLieTriple_eq_crossTriple x i j k

/-- Consume the independently normalized source cross-triple
gauge invariance rather than reusing the Lie scalar expression. -/
example (g : GaugeGroup 2) (x : Boson 2)
    (i j k : SpaceIndex) :
    originalCrossTriple (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j k =
      originalCrossTriple x i j k := by
  exact originalCrossTriple_gauge g x i j k

end BFSSIBIG1BOriginalSignedCrossIndependentConsumer
