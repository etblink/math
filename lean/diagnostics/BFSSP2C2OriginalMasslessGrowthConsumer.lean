import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C2OriginalMasslessGrowthBinding

/-!
# P2-C2 independent consumer

Check original concrete growth coefficient, massless vanishing at x=0,
and the matching original Fock quadratic-form lower bound. No imported
diagnostic source, surrogate Fock carrier or replacement Hamiltonian.
-/

set_option autoImplicit false

namespace BFSSP2C2IndependentConsumer

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C2OriginalMasslessGrowth

/-- Nonnegative source growth weight for every bosonic configuration. -/
example (x : Boson 2) :
    0 ≤ FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖ := by
  exact mul_nonneg originalMasslessFermionGrowthConstant_nonneg (norm_nonneg x)

/-- The original massless fermionic field vanishes at the configuration origin. -/
example :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField
      1 0 (0 : Boson 2) = 0 := by
  have h := originalMasslessFermionField_growth (0 : Boson 2)
  have h0 : ‖FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField
      1 0 (0 : Boson 2)‖ ≤ 0 := by
    simpa using h
  exact norm_eq_zero.mp (le_antisymm h0 (norm_nonneg _))

/-- Independent original-source quadratic-form consequence at the origin. -/
example (z : Fermion 2) :
    0 ≤ inner ℝ z
      (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField
        1 0 (0 : Boson 2) z) := by
  have h := originalMasslessFermionField_inner_lower (0 : Boson 2) z
  simpa only [norm_zero, mul_zero, neg_zero, zero_mul] using h

end BFSSP2C2IndependentConsumer
