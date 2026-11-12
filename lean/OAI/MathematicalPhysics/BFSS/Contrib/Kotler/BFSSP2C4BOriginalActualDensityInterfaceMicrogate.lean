import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C4AOriginalCoreIntegralTransfer

/-!
# P2-C4B-M0 — exact original density abbreviation interface

This gate checks only the pointwise-function addition identity between
qualified P2-C4A's originalActualDensity and the literal original
concreteAlgebraData fields. It does not import unqualified P2-C4B.

Use exact fully qualified source expressions on both sides; simplify only
the named density abbreviation and pointwise function addition, without
unfolding the enormous original concrete SU(2) AlgebraData value.

No energy inequality, integrability, closed domain or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C4BOriginalActualDensityInterfaceMicrogate
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C4AOriginalCoreIntegralTransfer

/-- Original source-defined actual density equals the pointwise sum of
the exact, fully qualified original bosonic and fermionic density functions. -/
theorem originalActualDensity_eq_sourceSum (f : SmoothCore 2) :
    originalActualDensity f =
      (fun x : Boson 2 =>
        FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
          ‖f x‖^2) +
      (fun x : Boson 2 =>
        inner ℝ (f x)
          (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x
            (f x))) := by
  funext x
  simp only [originalActualDensity, Pi.add_apply]

#print axioms originalActualDensity_eq_sourceSum

end
end FCP.BFSSP2C4BOriginalActualDensityInterfaceMicrogate
