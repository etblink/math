import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48FockGammaSelfAdjointProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6COriginalFockActiveGammaCovariance

/-!
# BFSS P2a — independent original physical Hilbert-adjoint audit

Consume the UNCHANGED original Source48/Fermion 2 gamma
self-adjointness source and strictly accepted C6C donor-to-active
real-linear map equality. These exact original Majorana operators
are Hilbert self-adjoint for ALL real source vectors.

The physical adjoint is the adjoint on Fermion 2 →L[ℂ] Fermion 2;
this consumer does not use Mathlib's default Clifford star, which
negates odd Clifford generators.

No Spin(9) physical-star automorphism, global Fock-vector unitary,
gauge compatibility, Hamiltonian domain, or spectral result follows.
-/

set_option autoImplicit false

namespace FCP.BFSSP2aOriginalFockGammaIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSSource48FockGammaSelfAdjoint
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance

/-- The actual normalized √2 Majorana for each original paired label
is self-adjoint for the physical Fermion 2 Hilbert adjoint. -/
example (p : Source48Label) :
    IsSelfAdjoint (sourceNormalizedGamma p) :=
  sourceNormalizedGamma_selfAdjoint p

/-- The actual active source real-linear √2 Majorana map sends all
original real source vectors to physically self-adjoint operators. -/
example (v : Source48Vector) :
    IsSelfAdjoint (sourceGammaRealLinear v) :=
  sourceGammaRealLinear_selfAdjoint v

/-- Consume the independently qualified C6C donor/active equality
on ALL source vectors, not just original coordinate axes. -/
example (v : Source48Vector) :
    IsSelfAdjoint (FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v) := by
  rw [originalFockGammaRealLinear_eq_activeGammaRealLinear]
  exact sourceGammaRealLinear_selfAdjoint v

#print axioms FCP.BFSSSource48FockGammaSelfAdjoint.sourceNormalizedGamma_selfAdjoint
#print axioms FCP.BFSSSource48FockGammaSelfAdjoint.sourceGammaRealLinear_selfAdjoint

end
end FCP.BFSSP2aOriginalFockGammaIndependentAudit
