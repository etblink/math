import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C1OriginalRealCliffordDirectUniversalLift

/-!
Independent OP3-C1 consumer at the actual original real source
CliffordAlgebra source48Quadratic, original Spin(9) group and
original paired Source48Label/Source48Vector carrier.

It checks the direct AlgHom and both exact generator evaluations.
It does not assert a group action, inverse, original physical Fock
operator-star action, continuity, gauge or spectral result.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C1OriginalRealCliffordIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C0OriginalRealCliffordSquare

private abbrev RealSourceClifford := CliffordAlgebra source48Quadratic

example (g : spinGroup source9Quadratic) :
    RealSourceClifford →ₐ[ℝ] RealSourceClifford :=
  FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      source9Spin_originalClifford_generatorLinearMap g v :=
  FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom_generator g v

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
  FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom_generator_covariance g v

#print axioms FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom
#print axioms FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom_generator
#print axioms FCP.BFSSOP3C1OriginalRealCliffordDirectLift.source9Spin_originalRealCliffordAlgHom_generator_covariance

end
end FCP.BFSSOP3C1OriginalRealCliffordIndependentAudit
