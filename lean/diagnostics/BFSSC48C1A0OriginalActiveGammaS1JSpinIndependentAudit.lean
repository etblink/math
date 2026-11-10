import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A0OriginalActiveGammaS1JSpinCompatibility

/-!
Independent C48-1A0 actual-source consumer.

Verify the original Fock operator-valued normalized Majorana map
commutes with the source S1J color and Spin(9) matrix actions in
the reverse equation, and on an arbitrary original source real axis.

No gauge Fock-vector implementer conjugation or full operator
conjugation action, continuity or spectral assertion is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinCompatibility

private abbrev Source48Matrix :=
  Matrix Source48Label Source48Label ℝ

/-- Independent reversed source action ordering, still on the
actual original Fermion 2 operator algebra. -/
theorem S1J_activeGamma_spin9_reverse
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2)
    (v : Source48Vector) :
    sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Source48Matrix).mulVec v)) =
      source9Spin_originalFockOperatorAutomorphismHom g
        (sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v)) :=
  (spin9_activeGamma_S1J_gauge_commute g q v).symm

/-- Test the new theorem on each genuine original 48-axis,
without replacing the original Fermion 2 carrier or source map. -/
theorem S1J_activeGamma_spin9_source_axis
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2)
    (p : Source48Label) :
    source9Spin_originalFockOperatorAutomorphismHom g
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (Pi.single p (1 : ℝ) : Source48Vector))) =
    sourceGammaRealLinear
      ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Source48Matrix).mulVec
            (Pi.single p (1 : ℝ) : Source48Vector))) :=
  spin9_activeGamma_S1J_gauge_commute g q
    (Pi.single p (1 : ℝ) : Source48Vector)

#print axioms FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinCompatibility.spin9_activeGamma_S1J_gauge_commute
#print axioms S1J_activeGamma_spin9_reverse
#print axioms S1J_activeGamma_spin9_source_axis

end
end FCP.BFSSC48C1A0OriginalActiveGammaS1JSpinIndependentAudit
