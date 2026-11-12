import OAI.MathematicalPhysics.BFSS.PotentialBounds
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSFullAlgebraDataProbe

/-!
# P2-C2 — literal original SU(2) massless fermionic-field growth

Narrow specialization of the existing original-source PotentialBounds theorems
to the concrete AlgebraData 2. No surrogate Hamiltonian, normalized Gram
field, new CAR representation, sharp constant, reducing sector, coercivity
or spectral theorem is constructed.

Candidate until a pinned Lean source and independent-consumer gate qualifies.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C2OriginalMasslessGrowth
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The original source's explicit finite fermionic growth constant is nonnegative. -/
theorem originalMasslessFermionGrowthConstant_nonneg :
    0 ≤ FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant := by
  exact FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant_nonneg

/-- Finite linear-growth bound on the literal original massless fermionic field. -/
theorem originalMasslessFermionField_growth (x : Boson 2) :
    ‖FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x‖ ≤
      FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖ := by
  simpa only [abs_one, abs_zero, one_mul, add_zero] using
    (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField_growth 1 0 x)

/-- Original massless fermionic quadratic-form lower bound, on Fermion 2. -/
theorem originalMasslessFermionField_inner_lower (x : Boson 2) (z : Fermion 2) :
    -(FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖) * ‖z‖ ^ 2 ≤
      inner ℝ z (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x z) := by
  simpa only [abs_one, abs_zero, one_mul, add_zero] using
    (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField_inner_lower 1 0 x z)

#print axioms originalMasslessFermionGrowthConstant_nonneg
#print axioms originalMasslessFermionField_growth
#print axioms originalMasslessFermionField_inner_lower

end

end FCP.BFSSP2C2OriginalMasslessGrowth
