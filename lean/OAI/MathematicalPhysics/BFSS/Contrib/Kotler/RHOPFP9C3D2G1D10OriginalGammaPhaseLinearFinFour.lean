import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D9OriginalGammaPhaseLinearOnProjectorRange
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C0OriginalGammaRangeContinuousLinearEquivFinFour

/-!
# RHOPF-P9C3D2G1D10 — source-exact Gamma9 J transported to real-four coordinates

Conjugate the accepted original projector-range real-linear phase operator
through the accepted G1C0 noncanonical real-linear equivalence
E : im(P) ≃L[ℝ] (Fin 4 → ℝ). The resulting real-four linear
endomorphism J₄ squares to -I, even though E is not asserted to be
an isometry or an intertwiner with the classical Hopf Circle action.

No added original gamma entries, complex orthonormal basis, physical
Fock/Hamiltonian theory, Hopf quotient, or topological charge.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D10
noncomputable section

open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1D9

/-- Transport original source Gamma9 J by the accepted noncanonical
real-four continuous linear coordinate equivalence. -/
noncomputable def relationalPhaseJFourLinear :
    (Fin 4 → ℝ) →ₗ[ℝ] (Fin 4 → ℝ) :=
  relationalRangeContinuousLinearEquivFinFour.toLinearEquiv.toLinearMap.comp
    (relationalPhaseJRangeLinear.comp
      relationalRangeContinuousLinearEquivFinFour.symm.toLinearEquiv.toLinearMap)

/-- The real-four operator is literally the original J conjugated
by the same accepted real-linear coordinate equivalence. -/
theorem relationalPhaseJFourLinear_apply (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear x =
      relationalRangeContinuousLinearEquivFinFour
        (relationalPhaseJRangeLinear
          (relationalRangeContinuousLinearEquivFinFour.symm x)) := by
  rfl

/-- The transported original Gamma9 complex-structure endomorphism
on real-four coordinates has square minus identity. -/
theorem relationalPhaseJFourLinear_square (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear (relationalPhaseJFourLinear x) = -x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  calc
    relationalPhaseJFourLinear (relationalPhaseJFourLinear x) =
        E (relationalPhaseJRangeLinear
          (E.symm (E (relationalPhaseJRangeLinear (E.symm x))))) := by
            rfl
    _ = E (relationalPhaseJRangeLinear
          (relationalPhaseJRangeLinear (E.symm x))) := by
            rw [E.symm_apply_apply]
    _ = E (-(E.symm x)) := by
          rw [relationalPhaseJRangeLinear_square]
    _ = -x := by
          rw [map_neg, E.apply_symm_apply]

#print axioms relationalPhaseJFourLinear
#print axioms relationalPhaseJFourLinear_apply
#print axioms relationalPhaseJFourLinear_square

end
end FCP.RHOPFP9C3D2G1D10
