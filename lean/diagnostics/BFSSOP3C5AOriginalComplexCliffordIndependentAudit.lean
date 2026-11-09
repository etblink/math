import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C5AOriginalComplexCliffordBaseChange

/-!
Independent strict original-carrier C5-A consumer, checking the actual
source Spin(9), 48-real label map, base-changed Clifford algebra and
complex algebra equivalence. No Fock action or star assertions.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C5AOriginalComplexCliffordIndependentAudit
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange

private abbrev OriginalComplexClifford :=
  CliffordAlgebra (source48Quadratic.baseChange ℂ)

example (g : spinGroup source9Quadratic) :
    OriginalComplexClifford ≃ₐ[ℂ] OriginalComplexClifford :=
  source9Spin_originalComplexCliffordAlgEquiv g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalComplexCliffordAlgEquiv g
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ]
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v)) :=
  source9Spin_originalComplexCliffordAlgEquiv_generator g v

#print axioms FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange.source9Spin_originalComplexCliffordAlgEquiv
#print axioms FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange.source9Spin_originalComplexCliffordAlgEquiv_generator

end
end FCP.BFSSOP3C5AOriginalComplexCliffordIndependentAudit
