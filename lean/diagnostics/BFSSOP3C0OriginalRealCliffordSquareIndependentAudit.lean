import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C0OriginalRealCliffordGeneratorSquare

/-!
OP3-C0 independent consumer on the EXACT original relative SU(2)
BFSS source48Quadratic, Source48Vector, paired Source48Label, original
spinGroup source9Quadratic and real source Clifford algebra.

Only the small generator-square input to a future universal lift is
tested. No Clifford AlgHom, Spin group action on the algebra, original
complex Fock action, star continuity, gauge or spectrum is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C0OriginalRealCliffordIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford

private abbrev OriginalClifford :=
  CliffordAlgebra source48Quadratic

example (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ)
    (v : Source48Vector) :
    (CliffordAlgebra.ι source48Quadratic (A.mulVec v)) *
        (CliffordAlgebra.ι source48Quadratic (A.mulVec v)) =
      algebraMap ℝ OriginalClifford (source48Quadratic v) :=
  FCP.BFSSOP3C0OriginalRealCliffordSquare.orthogonal_source48_clifford_generator_square
    A hA v

example (g : spinGroup source9Quadratic) :
    Source48Vector →ₗ[ℝ] OriginalClifford :=
  FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap g v =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
  FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_apply
    g v

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap g v *
        FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap g v =
      algebraMap ℝ OriginalClifford (source48Quadratic v) :=
  FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_square
    g v

#print axioms FCP.BFSSOP3C0OriginalRealCliffordSquare.orthogonal_source48_clifford_generator_square
#print axioms FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap
#print axioms FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_apply
#print axioms FCP.BFSSOP3C0OriginalRealCliffordSquare.source9Spin_originalClifford_generatorLinearMap_square

end
end FCP.BFSSOP3C0OriginalRealCliffordIndependentAudit
