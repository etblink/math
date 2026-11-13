import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2AOriginalFockHSFiber

/-! Independent source-exact original Fermion 2 HS-fiber consumer.
No original operator norm replacement, gauge, closed H or spectrum. -/

set_option autoImplicit false

namespace BFSSP3M2AOriginalFockHSFiberIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3D5AOriginalFockHilbertColumns
open FCP.BFSSP3M2AOriginalFockHSFiber

variable {ι : Type*} [Fintype ι]

example (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockHSFiber ι ≃ₗ[ℂ] (Fermion 2 →L[ℂ] Fermion 2) :=
  originalFockHSFiberToOperator b

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) (i : ι) :
    (originalFockHSFiberToOperator b u) (b i) = u i :=
  originalFockHSFiberToOperator_apply b u i

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u v : OriginalFockHSFiber ι) :
    originalFockTracePairing (originalFockHSFiberToOperator b u)
        (originalFockHSFiberToOperator b v) = ⟪u, v⟫_ℂ :=
  originalFockHSFiber_tracePairing b u v

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) :
    originalFockTracePairing (originalFockHSFiberToOperator b u)
        (originalFockHSFiberToOperator b u) = (‖u‖ : ℂ) ^ 2 :=
  originalFockHSFiber_traceSelf b u

example : OriginalFockHSFiber ι ≃ₗᵢ[ℂ]
    PiLp 2 (fun _ : ι => Fermion 2) :=
  originalFockHSFiberColumnsIsometry

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) :
    originalFockOperatorToHSFiber b (originalFockHSFiberToOperator b u) = u := by
  change originalFockHilbertColumns b
    ((originalFockHilbertColumns b).symm u) = u
  exact (originalFockHilbertColumns b).apply_symm_apply u

#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockOperatorToHSFiber
#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockHSFiberToOperator
#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockHSFiberToOperator_apply
#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockHSFiber_tracePairing
#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockHSFiber_traceSelf
#print axioms FCP.BFSSP3M2AOriginalFockHSFiber.originalFockHSFiberColumnsIsometry

end
end BFSSP3M2AOriginalFockHSFiberIndependentConsumer
