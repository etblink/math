import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6COriginalFockActiveGammaCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48FockGammaSelfAdjointProbe

/-!
# BFSS P2b-A — original Fock Majorana physical-star compatibility

Combine the strictly qualified original active Spin(9) all-vector
Majorana covariance (C6C) with strictly qualified physical Hilbert
self-adjointness of the same original gamma map (P2a).

Prove the exact physical-adjoint intertwining on all original REAL
source gamma vectors and on their COMPLEX scalar multiples. The
scalar theorem explicitly respects conjugate-linearity of Hilbert
adjoint. Both statements use the genuine Spin(9) action on the actual
Fermion 2 continuous complex-linear operator algebra.

Not yet an assertion that the action is star-preserving on ALL
original Fock operators; the complex Clifford generation bridge
remains a separate P2b-B obligation. No new representation,
Hamiltonian domain, gauge projection, unitary Fock-vector lift,
or spectral claim is introduced.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bAOriginalFockGammaPhysicalStar
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSSource48FockGammaSelfAdjoint
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Physical Hilbert-star compatibility of the exact source Spin(9)
algebra automorphism on every REAL original normalized gamma vector.
The underlying Fock adjoint is not the default odd Clifford star. -/
theorem source9Spin_originalFockOperator_activeGamma_map_star
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (sourceGammaRealLinear v)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (sourceGammaRealLinear v)) := by
  rw [(sourceGammaRealLinear_selfAdjoint v).star_eq]
  rw [source9Spin_originalFockOperatorAutomorphismHom_activeGamma g v]
  exact (sourceGammaRealLinear_selfAdjoint _).star_eq.symm

/-- Exact complex anti-linearity of the *physical* adjoint is
respected by the original operator-algebra Spin(9) action on all
complex scalar multiples of original real Majorana generators.
This is stronger than testing only self-adjoint real generators but
does not claim generation of all Fock operators. -/
theorem source9Spin_originalFockOperator_activeGamma_complex_smul_map_star
    (g : spinGroup source9Quadratic) (z : ℂ) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (z • sourceGammaRealLinear v)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (z • sourceGammaRealLinear v)) := by
  -- Keep the scalar-multiplication law on the explicitly typed
  -- original complex-linear equivalence. A bare `rw [map_smul]`
  -- triggers unconstrained MulActionHomClass synthesis here.
  have hsmul (c : ℂ) (T : OriginalFockOp) :
      source9Spin_originalFockOperatorAutomorphismHom g (c • T) =
        c • source9Spin_originalFockOperatorAutomorphismHom g T := by
    exact
      (source9Spin_originalFockOperatorAutomorphismHom g).toLinearEquiv.map_smul c T
  calc
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (z • sourceGammaRealLinear v)) =
      (star z) • source9Spin_originalFockOperatorAutomorphismHom g
        (star (sourceGammaRealLinear v)) := by
          rw [star_smul]
          exact hsmul (star z) (star (sourceGammaRealLinear v))
    _ = (star z) • star
        (source9Spin_originalFockOperatorAutomorphismHom g
          (sourceGammaRealLinear v)) := by
          rw [source9Spin_originalFockOperator_activeGamma_map_star g v]
    _ = star (source9Spin_originalFockOperatorAutomorphismHom g
        (z • sourceGammaRealLinear v)) := by
          rw [hsmul, star_smul]

#print axioms source9Spin_originalFockOperator_activeGamma_map_star
#print axioms source9Spin_originalFockOperator_activeGamma_complex_smul_map_star

end
end FCP.BFSSP2bAOriginalFockGammaPhysicalStar
