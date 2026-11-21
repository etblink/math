import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D43OriginalGammaComplexFinrankTwo

/-!
# RHOPF-P9C3D2G1D44 — source-exact Gamma9 algebraic complex coordinate model

D43 proved the ORIGINAL Gamma9 J4-induced isolated complex carrier has
complex dimension two. This gate constructs a noncanonical complex-linear
equivalence from that carrier to Fin 2 → ℂ, then proves it intertwines
the ACTUAL original Gamma9 Circle action (D42) with complex scalar
multiplication. The equivalence is not asserted to be isometric with
respect to the transported original source Q.

No chosen source-Q orthonormal frame, classical Hopf quotient, Chern
class, physical Fock implementer, Hamiltonian or stable soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D44
noncomputable section

open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D42
open FCP.RHOPFP9C3D2G1D43

/-- A dimension-qualified abstract COMPLEX-linear coordinate model
of the genuine Gamma9 J4-derived source carrier. No metric claim. -/
noncomputable def relationalSourceComplexFourLinearEquivFinTwo :
    RelationalSourceComplexFour ≃ₗ[ℂ] (Fin 2 → ℂ) := by
  have hfinite : FiniteDimensional ℂ RelationalSourceComplexFour :=
    FiniteDimensional.of_finrank_eq_succ
      (show Module.finrank ℂ RelationalSourceComplexFour = Nat.succ 1 from by
        simpa using relationalSourceComplexFour_finrank_complex)
  letI : FiniteDimensional ℂ RelationalSourceComplexFour := hfinite
  have hdim :
      Module.finrank ℂ RelationalSourceComplexFour =
        Module.finrank ℂ (Fin 2 → ℂ) := by
    rw [relationalSourceComplexFour_finrank_complex]
    exact (Module.finrank_fin_fun ℂ).symm
  exact LinearEquiv.ofFinrankEq _ _ hdim

/-- The ACTUAL source-original Gamma9 Circle matrix action becomes
scalar multiplication in ANY such source-complex-linear coordinates. -/
theorem relationalSourceComplexFourLinearEquivFinTwo_circle
    (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourLinearEquivFinTwo
      (relationalSourceComplexFourCircleAction z x) =
        (z : ℂ) • relationalSourceComplexFourLinearEquivFinTwo x := by
  rw [relationalSourceComplexFourCircleAction_eq_smul]
  exact map_smul relationalSourceComplexFourLinearEquivFinTwo (z : ℂ) x

#print axioms relationalSourceComplexFourLinearEquivFinTwo
#print axioms relationalSourceComplexFourLinearEquivFinTwo_circle

end
end FCP.RHOPFP9C3D2G1D44
