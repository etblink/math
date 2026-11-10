import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bAOriginalFockGammaPhysicalStar
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB0OriginalFockAdjointAdditiveBridge
import Mathlib.LinearAlgebra.TensorProduct.Defs

/-!
# BFSS P2b-B1 — full complexified original Clifford generator physical-star gate

Extend strictly qualified P2b-A star compatibility from all complex multiples
of original REAL active Source48 Majoranas to the image under the accepted M3I
AlgEquiv of EVERY generator in the actual complexified 48-source Clifford module.

The key scalar step is the exact z ⊗ v = z • (1 ⊗ v) identity, followed
by complex linearity of the ORIGINAL Clifford generator and M3I equivalence.
TensorProduct.inductionOn handles all complexified source vectors, without
assuming those generators are self-adjoint or borrowing the odd Clifford star.

No full Fock-operator StarAlgEquiv, global vector implementer, gauge/physical
domain identification, Hilbert-Schmidt action or spectral claim follows.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance
open FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis
open FCP.BFSSP2bAOriginalFockGammaPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- The M3I image of a pure complexified source Majorana is EXACTLY
the complex multiple of the corresponding original normalized active
Fock Majorana on the same original Fermion 2 carrier. -/
theorem originalComplexCliffordFockAlgEquiv_tmul_activeGamma
    (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v := by
  calc
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (z ⊗ₜ[ℝ] v)) =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (z • (1 ⊗ₜ[ℝ] v))) := by
            rw [TensorProduct.tmul_eq_smul_one_tmul]
    _ = FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (z • CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) := by
            rw [(CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)).map_smul]
    _ = z • FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) := by
            exact
              (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).toLinearEquiv.map_smul
                z _
    _ = z • sourceGammaRealLinear v := by
            rw [originalComplexEquiv_generator_eq_donor,
                originalFockGammaRealLinear_eq_activeGammaRealLinear]

/-- P2b-B1: exact source Spin(9) Fock-operator action intertwines the
PHYSICAL Hilbert adjoint on all COMPLEXIFIED original Clifford
generators. This includes general sums of complex pure tensors,
not just real original gamma vectors or their individual scalings. -/
theorem source9Spin_originalFockOperator_complexifiedGamma_map_star
    (g : spinGroup source9Quadratic)
    (w : ℂ ⊗[ℝ] Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))) := by
  induction w using TensorProduct.inductionOn with
  | tmul z v =>
      rw [originalComplexCliffordFockAlgEquiv_tmul_activeGamma]
      exact source9Spin_originalFockOperator_activeGamma_complex_smul_map_star g z v
  | add a b ha hb =>
      -- Deliberately avoid generic `map_add` synthesis on the
      -- coerced original Fock AlgEquiv. Bind each exact linear interface.
      have hGammaAdd :
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
              (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (a + b)) =
            FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
                (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) a) +
              FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
                (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) b) := by
        rw [(CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)).map_add]
        exact
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).toLinearEquiv.map_add
            _ _
      -- The separately strict-qualified B0 microgate handles the exact
      -- original-Fock physical Hilbert-adjoint addition boundary.
      -- Only the already proven Clifford-to-Fock additive bridge
      -- remains in this generator-level induction case.
      rw [hGammaAdd]
      exact
        FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge.originalFock_spinStarCompat_add
          g
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
            (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) a))
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
            (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) b))
          ha hb

#print axioms originalComplexCliffordFockAlgEquiv_tmul_activeGamma
#print axioms source9Spin_originalFockOperator_complexifiedGamma_map_star

end
end FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar
