import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A1AOriginalGammaGeneratorInequivalence

/-!
Independent typed Lean consumer of the original full-spinor inequalities.
No private gamma replacement or physical inference is introduced.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A1AIndependentAudit
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A1A

example : gamma 1 * gamma 3 ≠ -(gamma 2 * gamma 5) :=
  K13_ne_K25

example : gamma 1 * gamma 3 ≠ -(gamma 4 * gamma 6) :=
  K13_ne_K46

example : -(gamma 2 * gamma 5) ≠ -(gamma 4 * gamma 6) :=
  K25_ne_K46

#print axioms FCP.RHOPFP9A1A.originalGammaPair_ne_scalar_distinct
#print axioms FCP.RHOPFP9A1A.K13_ne_K25
#print axioms FCP.RHOPFP9A1A.K13_ne_K46
#print axioms FCP.RHOPFP9A1A.K25_ne_K46

end FCP.RHOPFP9A1AIndependentAudit
