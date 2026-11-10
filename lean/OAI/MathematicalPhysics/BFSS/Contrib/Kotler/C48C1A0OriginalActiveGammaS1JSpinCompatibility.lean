import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C0BOriginalSourceGaugeS1JMatrixIdentity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6COriginalFockActiveGammaCovariance

/-!
# BFSS C48-1A0 — original active Fock Majorana / source S1J compatibility

The accepted OP3C6C Spin(9) automorphism acts on the ACTUAL
normalized Fermion 2 Majorana map on each original Source48Vector.
The accepted C48-0B source theorem identifies the G3A/G3B color
Kronecker action on 48 real Majorana labels with S1J's independently
defined sourceRealMajoranaMatrix.

Show that applying the true Spin(9) Fock-OPERATOR automorphism to
a gauge-transformed original gamma equals first applying source
Spin(9) and then the same actual S1J gauge color matrix.

This is one side of the C48-1A covariance bridge. It does NOT
assert that conjugation by the SU(2) fermionGaugeUnitaryHom equals
the S1J action on the active gamma: that requires the separate
G4H -> sourceGammaRealLinear all-vector gate C48-1A1.
No Spin(9) Fock-vector unitary, continuity, original full physical
Hamiltonian, or mass-gap/eigenvalue assertion is inferred.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinCompatibility
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance
open FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation
open FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity

private abbrev Source48Matrix :=
  Matrix Source48Label Source48Label ℝ

/-- The accepted original Spin(9) operator-algebra action sends the
gauge-transformed original normalized Fock Majorana to the same
S1J-gauge transform of the Spin(9)-rotated original source vector.
All objects live on the literal original 48 real Majorana labels. -/
theorem spin9_activeGamma_S1J_gauge_commute
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2)
    (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v)) =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Source48Matrix).mulVec v)) := by
  rw [source9Spin_originalFockOperatorAutomorphismHom_activeGamma]
  have hcomm :
      (((source9SpinOriginalPaired48OrthogonalHom g :
        Matrix.orthogonalGroup Source48Label ℝ) :
        Source48Matrix) *
          FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q) =
        FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q *
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Source48Matrix)) := by
    rw [← sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix]
    exact source9SpinOriginalPaired48_commutes_sourceGauge g q
  have hv := congrArg (fun M : Source48Matrix => M.mulVec v) hcomm
  exact congrArg sourceGammaRealLinear
    (by simpa only [Matrix.mulVec_mulVec] using hv)

#print axioms spin9_activeGamma_S1J_gauge_commute

end
end FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinCompatibility
