import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C4OriginalRealCliffordSpinAction
import Mathlib.LinearAlgebra.CliffordAlgebra.BaseChange
import Mathlib.RingTheory.TensorProduct.Maps

/-!
# OP3-C5A — original complex Clifford pointwise base-change transport

Transport the strictly qualified original real Clifford Spin(9) AlgEquiv
through pinned CliffordAlgebra.equivBaseChange and the actual algebra
tensor-product congruence. Establish exact covariance on *all* original
Source48Vector pure complexified Clifford generators. This is a pointwise
complex algebra equivalence, not yet a bundled complex group action,
Fock-operator transport, Hilbert-adjoint star map, continuity or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C4OriginalRealCliffordSpinAction

private abbrev OriginalComplexClifford :=
  CliffordAlgebra (source48Quadratic.baseChange ℂ)

/-- A genuine complex-algebra automorphism for every original source
Spin(9) element, using the same source48Quadratic and paired-48 action. -/
noncomputable def source9Spin_originalComplexCliffordAlgEquiv
    (g : spinGroup source9Quadratic) :
    OriginalComplexClifford ≃ₐ[ℂ] OriginalComplexClifford :=
  (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).trans
    ((Algebra.TensorProduct.congr
       (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
       (source9Spin_originalRealCliffordAutomorphismHom g)).trans
      (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).symm)

/-- On the genuine original complex Clifford pure real generator,
the transported action is exactly the paired-48 source Spin(9) matrix
action, without relabeling or renormalizing Majoranas. -/
theorem source9Spin_originalComplexCliffordAlgEquiv_generator
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalComplexCliffordAlgEquiv g
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ]
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v)) := by
  change CliffordAlgebra.ofBaseChange ℂ source48Quadratic
      ((Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom g))
        (CliffordAlgebra.toBaseChange ℂ source48Quadratic
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v)))) =
      CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ]
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v))
  rw [CliffordAlgebra.toBaseChange_ι,
      Algebra.TensorProduct.congr_apply,
      Algebra.TensorProduct.map_tmul]
  simp only [map_one]
  rw [source9Spin_originalRealCliffordAutomorphismHom_generator]
  exact CliffordAlgebra.ofBaseChange_tmul_ι ℂ source48Quadratic (1 : ℂ)
    (((source9SpinOriginalPaired48OrthogonalHom g :
      Matrix.orthogonalGroup Source48Label ℝ) :
      Matrix Source48Label Source48Label ℝ).mulVec v)

#print axioms source9Spin_originalComplexCliffordAlgEquiv
#print axioms source9Spin_originalComplexCliffordAlgEquiv_generator

end
end FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange
