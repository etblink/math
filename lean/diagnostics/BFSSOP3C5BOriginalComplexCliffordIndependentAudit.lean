import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C5BOriginalComplexCliffordSpinAction

/-!
Independent original-carrier OP3-C5B consumer, checking the actual
source Spin(9) group, algebraic action on the scalar-extended real
Clifford and source complex Clifford algebras, pointwise equality
with independently qualified C5A, and exact paired-48 generator law.
No original Fock operators, star, topology, gauge or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C5BOriginalComplexCliffordIndependentAudit
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange
open FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

private abbrev OriginalComplexTensor :=
  ℂ ⊗[ℝ] RealSourceClifford

private abbrev OriginalComplexClifford :=
  CliffordAlgebra (source48Quadratic.baseChange ℂ)

example :
    spinGroup source9Quadratic →*
      (OriginalComplexTensor ≃ₐ[ℂ] OriginalComplexTensor) :=
  source9Spin_originalComplexTensorAutomorphismHom

example :
    spinGroup source9Quadratic →*
      (OriginalComplexClifford ≃ₐ[ℂ] OriginalComplexClifford) :=
  source9Spin_originalComplexCliffordAutomorphismHom

example (g : spinGroup source9Quadratic) :
    source9Spin_originalComplexCliffordAutomorphismHom g =
      source9Spin_originalComplexCliffordAlgEquiv g :=
  source9Spin_originalComplexCliffordAutomorphismHom_apply g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalComplexCliffordAutomorphismHom g
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ]
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v)) :=
  source9Spin_originalComplexCliffordAutomorphismHom_generator g v

#print axioms FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction.source9Spin_originalComplexTensorAutomorphismHom
#print axioms FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction.source9Spin_originalComplexCliffordAutomorphismHom
#print axioms FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction.source9Spin_originalComplexCliffordAutomorphismHom_apply
#print axioms FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction.source9Spin_originalComplexCliffordAutomorphismHom_generator

end
end FCP.BFSSOP3C5BOriginalComplexCliffordIndependentAudit
