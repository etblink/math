import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C0OriginalPauliPotentialBinding

/-!
# P2-C0 independent consumer — orientation and nonnegative original potential

This is a separately compiled diagnostic, NOT an importable OAI source
module. Do not depend on its local declarations in later source theorems.
A historical strict-green diagnostic is not an importable source module.
-/

set_option autoImplicit false

namespace BFSSP2C0IndependentConsumer

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C0OriginalPauliPotentialBinding

/-- Positive ordered Pauli cyclic orientation. -/
example :
    FCP.BFSSSU2Full.concreteAlgebraData.structureConstant
      (0 : Fin 3) (1 : Fin 3) (2 : Fin 3) = Real.sqrt 2 := by
  rw [originalPauli_structureConstant]
  norm_num [FCP.BFSSSU2.epsilon3]

/-- Reversing color orientation reverses the source coefficient sign. -/
example :
    FCP.BFSSSU2Full.concreteAlgebraData.structureConstant
      (0 : Fin 3) (2 : Fin 3) (1 : Fin 3) = -Real.sqrt 2 := by
  rw [originalPauli_structureConstant]
  norm_num [FCP.BFSSSU2.epsilon3]

/-- Every repeated color entry vanishes on the original source. -/
example :
    FCP.BFSSSU2Full.concreteAlgebraData.structureConstant
      (0 : Fin 3) (0 : Fin 3) (1 : Fin 3) = 0 := by
  rw [originalPauli_structureConstant]
  norm_num [FCP.BFSSSU2.epsilon3]

/-- A non-identical consequence of the potential theorem: nonnegativity
of the genuine concrete source bosonic potential (not a surrogate). -/
example (x : Boson 2) :
    0 ≤ FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x := by
  rw [originalPauli_masslessPotential_eq_wedge]
  apply Finset.sum_nonneg
  intro p hp
  unfold FCP.BFSSSU2.colorWedgeSquared
  positivity

end BFSSP2C0IndependentConsumer
