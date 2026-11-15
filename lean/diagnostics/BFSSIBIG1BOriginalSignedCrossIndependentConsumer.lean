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

/-!
Canonical finite-orientation layer. Literal Fin 3 numerals match the
source epsilon3 patterns directly; ColorIndex 2 reduces to Fin 3.
These are *not* assumptions about a surrogate gauge representation.
-/

private theorem epsilon3_canonical_pos :
    FCP.BFSSSU2.epsilon3 (0 : Fin 3) (1 : Fin 3) (2 : Fin 3) = 1 := by
  rfl

private theorem epsilon3_canonical_neg :
    FCP.BFSSSU2.epsilon3 (0 : Fin 3) (2 : Fin 3) (1 : Fin 3) = -1 := by
  rfl

/-- Original source paired-Pauli structure constants, positive 012 orientation.
The arguments use the canonical carrier definitionally equal to ColorIndex 2. -/
example :
    pairedAlgebraData.structureConstant
      (0 : Fin 3) (1 : Fin 3) (2 : Fin 3) =
        Real.sqrt 2 := by
  rw [pairedColor_structureConstant, epsilon3_canonical_pos]
  ring

/-- Original source paired-Pauli structure constants, negative 021 orientation.
This is sign-sensitive: an improper basis reversal must give -sqrt(2). -/
example :
    pairedAlgebraData.structureConstant
      (0 : Fin 3) (2 : Fin 3) (1 : Fin 3) =
        -Real.sqrt 2 := by
  rw [pairedColor_structureConstant, epsilon3_canonical_neg]
  ring

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
