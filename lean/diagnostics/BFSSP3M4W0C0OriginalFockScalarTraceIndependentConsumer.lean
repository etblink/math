import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C0OriginalFockScalarTraceSeparation

/-!
# W0C0 R1 independent consumer of original source trace scalar separation

Separately imports the original W0C0 source with exact T1 trace and
Fermion 2 carrier, and tests original zero/one/scalar operators.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C0OriginalFockScalarTraceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4W0C0OriginalFockScalarTraceSeparation

private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

theorem originalFockTrace_one_eq_finrank_consumer :
    originalFockTrace (1 : Op) = (Module.finrank ℂ V : ℂ) :=
  originalFockTrace_one_eq_finrank

theorem originalFockTrace_one_ne_zero_consumer :
    originalFockTrace (1 : Op) ≠ 0 :=
  originalFockTrace_one_ne_zero

theorem originalFockTrace_scalar_one_eq_zero_iff_consumer (z : ℂ) :
    originalFockTrace (z • (1 : Op)) = 0 ↔ z = 0 :=
  originalFockTrace_scalar_one_eq_zero_iff z

example : originalFockTrace (1 : Op) ≠ 0 :=
  originalFockTrace_one_ne_zero_consumer

example : originalFockTrace (0 : Op) = 0 := by
  simp

example (z : ℂ) (hz : originalFockTrace (z • (1 : Op)) = 0) : z = 0 :=
  (originalFockTrace_scalar_one_eq_zero_iff_consumer z).mp hz

#print axioms originalFockTrace_one_eq_finrank_consumer
#print axioms originalFockTrace_one_ne_zero_consumer
#print axioms originalFockTrace_scalar_one_eq_zero_iff_consumer

end
end FCP.BFSSP3M4W0C0OriginalFockScalarTraceIndependentConsumer
