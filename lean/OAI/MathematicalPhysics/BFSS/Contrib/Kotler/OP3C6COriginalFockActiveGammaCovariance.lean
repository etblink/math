import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6BOriginalFockDonorGammaCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3AOriginalCliffordFockGeneratorAxisCrosswalk
import Mathlib.LinearAlgebra.StdBasis

/-!
# OP3-C6C — original donor-to-active Majorana all-vector crosswalk

Identify the already qualified original donor real-linear gamma with
the separately constructed active source real-linear gamma on ALL
original Source48Vector values. Use the exact 8×2×3 sourceBlockColorEquiv
and the standard basis of the literal (Fin 24 × Fin 2) → ℝ module.
The input proof is the qualified OP3-A1 original coordinate-axis match;
no 48-mode Fock operator sum is unfolded or rebuilt.

Then transport the accepted C6B Spin(9) donor-gamma covariance to the
literal active original normalized Majorana map.

The result is still ALGEBRAIC operator covariance. No Hilbert star,
global Fock-vector unitary, continuity, gauge commutation, closed
original Hamiltonian or positive-energy spectral claim is made.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6COriginalFockActiveGammaCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance

/-- Exact equality of the *original* donor and active real-linear Fock
Majorana maps on every one of the 48-real source vector coordinates,
without unfolding either original Fock finite operator sum. -/
theorem originalFockGammaRealLinear_eq_activeGammaRealLinear :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear =
      sourceGammaRealLinear := by
  classical
  apply (Pi.basisFun ℝ Source48Label).ext
  intro p
  rw [Pi.basisFun_apply]
  let q : RealSpinBlock × ColorLabel := sourceBlockColorEquiv.symm p
  have hlabel : sourceBlockColorLabel q.1 q.2 = p := by
    change sourceBlockColorEquiv q = p
    exact sourceBlockColorEquiv.apply_symm_apply p
  have haxis :
      sourceBlockColorAxis q.1 q.2 =
        (Pi.single p (1 : ℝ) : Source48Vector) := by
    simp only [sourceBlockColorAxis, hlabel]
  rw [← haxis]
  exact donor_real_gamma_eq_active_on_source_axis q.1.1 q.1.2 q.2

/-- The fully sourced original Spin(9) operator-algebra action is
covariant on the ACTIVE original normalized-Majorana real-linear map,
for ALL real source vectors, not only the block/color axes. -/
theorem source9Spin_originalFockOperatorAutomorphismHom_activeGamma
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (sourceGammaRealLinear v) =
      sourceGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) := by
  rw [← originalFockGammaRealLinear_eq_activeGammaRealLinear]
  exact source9Spin_originalFockOperatorAutomorphismHom_donorGamma g v

#print axioms originalFockGammaRealLinear_eq_activeGammaRealLinear
#print axioms source9Spin_originalFockOperatorAutomorphismHom_activeGamma

end
end FCP.BFSSOP3C6COriginalFockActiveGammaCovariance
