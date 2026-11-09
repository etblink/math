import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C5AOriginalComplexCliffordBaseChange

/-!
# OP3-C5B — original complex Clifford Spin(9) group action

Package the independently qualified C5A pointwise original complex
Clifford AlgEquiv into a genuine MonoidHom from the original source
Spin(9). Reuse the qualified C4 real automorphism-group action, pinned
tensor-product congruence, and Mathlib AlgEquiv.autCongr. Do not rebuild
the original 48-real Clifford action, Fock representation or spin group.

This gate remains entirely algebraic. It asserts no Fock Hilbert
adjoint, star structure, continuity, original parity, gauge action,
closed Hamiltonian form or spectral conclusion.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C4OriginalRealCliffordSpinAction
open FCP.BFSSOP3C5AOriginalComplexCliffordBaseChange

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

private abbrev OriginalComplexTensor :=
  ℂ ⊗[ℝ] RealSourceClifford

private abbrev OriginalComplexClifford :=
  CliffordAlgebra (source48Quadratic.baseChange ℂ)

/-- Original Spin(9) acts on the literal scalar-extended real source
Clifford algebra, with composition transported from accepted C4.
Mathlib's AlgEquiv multiplication is same-order function composition. -/
noncomputable def source9Spin_originalComplexTensorAutomorphismHom :
    spinGroup source9Quadratic →*
      (OriginalComplexTensor ≃ₐ[ℂ] OriginalComplexTensor) where
  toFun g :=
    Algebra.TensorProduct.congr
      (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
      (source9Spin_originalRealCliffordAutomorphismHom g)
  map_one' := by
    change
      Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom
          (1 : spinGroup source9Quadratic)) =
        (1 : OriginalComplexTensor ≃ₐ[ℂ] OriginalComplexTensor)
    rw [map_one]
    exact Algebra.TensorProduct.congr_refl
  map_mul' g h := by
    change
      Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom (g * h)) =
      Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom g) *
      Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom h)
    rw [map_mul]
    change
      Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        ((source9Spin_originalRealCliffordAutomorphismHom h).trans
          (source9Spin_originalRealCliffordAutomorphismHom g)) =
      (Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom h)).trans
        (Algebra.TensorProduct.congr
          (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
          (source9Spin_originalRealCliffordAutomorphismHom g))
    have hrefl :
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ).trans
            (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ) =
          AlgEquiv.refl := by
      simpa only [AlgEquiv.refl_symm] using
        (AlgEquiv.self_trans_symm
          (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ))
    simpa only [hrefl] using
      (Algebra.TensorProduct.congr_trans
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom h)
        (source9Spin_originalRealCliffordAutomorphismHom g))

/-- The original real Spin(9) action transports through the pinned
source Clifford base-change equivalence to an actual group-valued
complex Clifford automorphism action. -/
noncomputable def source9Spin_originalComplexCliffordAutomorphismHom :
    spinGroup source9Quadratic →*
      (OriginalComplexClifford ≃ₐ[ℂ] OriginalComplexClifford) :=
  (AlgEquiv.autCongr
    (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).symm).toMonoidHom.comp
      source9Spin_originalComplexTensorAutomorphismHom

/-- The packaged complex group action is *exactly* the previously
qualified C5A pointwise original complex Clifford AlgEquiv. -/
theorem source9Spin_originalComplexCliffordAutomorphismHom_apply
    (g : spinGroup source9Quadratic) :
    source9Spin_originalComplexCliffordAutomorphismHom g =
      source9Spin_originalComplexCliffordAlgEquiv g := by
  change
    ((CliffordAlgebra.equivBaseChange ℂ source48Quadratic).symm.symm).trans
      ((Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom g)).trans
        (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).symm) =
    (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).trans
      ((Algebra.TensorProduct.congr
        (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ)
        (source9Spin_originalRealCliffordAutomorphismHom g)).trans
        (CliffordAlgebra.equivBaseChange ℂ source48Quadratic).symm)
  rw [AlgEquiv.symm_symm]

/-- All original paired-48 source vectors retain the strictly
qualified C5A complex Clifford generator covariance under the
group-valued source Spin(9) action. -/
theorem source9Spin_originalComplexCliffordAutomorphismHom_generator
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalComplexCliffordAutomorphismHom g
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ]
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v)) := by
  exact
    (congrArg
      (fun e : OriginalComplexClifford ≃ₐ[ℂ] OriginalComplexClifford =>
        e (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)))
      (source9Spin_originalComplexCliffordAutomorphismHom_apply g)).trans
        (source9Spin_originalComplexCliffordAlgEquiv_generator g v)

#print axioms source9Spin_originalComplexTensorAutomorphismHom
#print axioms source9Spin_originalComplexCliffordAutomorphismHom
#print axioms source9Spin_originalComplexCliffordAutomorphismHom_apply
#print axioms source9Spin_originalComplexCliffordAutomorphismHom_generator

end
end FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction
