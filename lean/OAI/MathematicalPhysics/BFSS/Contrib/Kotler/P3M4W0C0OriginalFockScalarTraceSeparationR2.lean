import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.T1OriginalFockTraceInvariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2cNonzeroOriginalGaugeVacuum
import Mathlib.LinearAlgebra.Dimension.Finite
import Mathlib.Tactic

/-!
# W0C0 R1 — original Fock scalar-trace separation

A bounded source-exact bridge: the original finite Fock trace evaluates
the identity as the complex dimension, the original Fock vacuum forces
that dimension nonzero, and a zero-trace scalar original operator is zero.
No gamma witness injectivity or physical admissibility is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C0OriginalFockScalarTraceSeparationR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSST1OriginalFockTraceInvariance

private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

/-- Exact original T1 operator trace of the identity, not a trace
on a replacement matrix algebra or a regular representation. -/
theorem originalFockTrace_one_eq_finrank :
    originalFockTrace (1 : Op) = (Module.finrank ℂ V : ℂ) := by
  rw [originalFockTrace_apply]
  simp only [map_one, LinearMap.trace_one]

/-- The true original transported Fock vacuum is nonzero, so the
ordinary complex trace of the original identity cannot vanish. -/
theorem originalFockTrace_one_ne_zero :
    originalFockTrace (1 : Op) ≠ 0 := by
  let : Nontrivial V :=
    ⟨⟨FCP.BFSSSU2GaugeG4B.fermionVacuum, (0 : V),
      FCP.BFSSOriginalGaugeVacuumOP2C.originalFermionVacuum_ne_zero⟩⟩
  have hpos : 0 < Module.finrank ℂ V := Module.finrank_pos
  have hdim : (Module.finrank ℂ V : ℂ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt hpos)
  rw [originalFockTrace_one_eq_finrank]
  exact hdim

/-- The original ordinary complex trace removes *precisely* the
remaining complex scalar ambiguity, without introducing new axioms. -/
theorem originalFockTrace_scalar_one_eq_zero_iff (z : ℂ) :
    originalFockTrace (z • (1 : Op)) = 0 ↔ z = 0 := by
  constructor
  · intro hz
    rw [map_smul, smul_eq_mul] at hz
    exact (mul_eq_zero.mp hz).resolve_right originalFockTrace_one_ne_zero
  · intro hz
    subst z
    simp

#print axioms originalFockTrace_one_eq_finrank
#print axioms originalFockTrace_one_ne_zero
#print axioms originalFockTrace_scalar_one_eq_zero_iff

end
end FCP.BFSSP3M4W0C0OriginalFockScalarTraceSeparationR2
