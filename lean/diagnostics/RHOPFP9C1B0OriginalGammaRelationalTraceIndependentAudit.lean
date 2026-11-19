import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B0OriginalGammaRelationalTrace

/-! Independent exact-source P9C1B0 declaration-type and axiom consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C1B0Independent
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B0

example :
    Matrix.trace ((gamma 1 * gamma 3) * (-(gamma 2 * gamma 5))) = 0 :=
  K13K25_trace_zero

example :
    Matrix.trace ((gamma 1 * gamma 3) * (-(gamma 4 * gamma 6))) = 0 :=
  K13K46_trace_zero

example :
    Matrix.trace ((-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6))) = 0 :=
  K25K46_trace_zero

example :
    relationalProjector =
      (1 / 4 : ℝ) •
        ((1 : GammaMatrix) -
          (gamma 1 * gamma 3) * (-(gamma 2 * gamma 5)) -
          (gamma 1 * gamma 3) * (-(gamma 4 * gamma 6)) -
          (-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6))) :=
  relationalProjector_expanded

example : Matrix.trace relationalProjector = (4 : ℝ) :=
  relationalProjector_trace_four

example : relationalProjector ≠ (0 : GammaMatrix) :=
  relationalProjector_ne_zero

#print axioms FCP.RHOPFP9C1B0.K13K25_trace_zero
#print axioms FCP.RHOPFP9C1B0.K13K46_trace_zero
#print axioms FCP.RHOPFP9C1B0.K25K46_trace_zero
#print axioms FCP.RHOPFP9C1B0.relationalProjector_expanded
#print axioms FCP.RHOPFP9C1B0.relationalProjector_trace_four
#print axioms FCP.RHOPFP9C1B0.relationalProjector_ne_zero

end FCP.RHOPFP9C1B0Independent
