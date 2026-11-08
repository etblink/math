import OAI.LinearAlgebra.GaugeFixedProjectionOP1

/-! OP1 consumer: exact abstract and OP0-bound star-automorphism contracts. -/
set_option autoImplicit false

namespace FCP.BFSSGaugeFixedProjectionOP1IndependentAudit
noncomputable section

open FCP.BFSSGaugeFixedProjectionOP0
open FCP.BFSSGaugeFixedProjectionOP1

example {S A I : Type*} [Semiring A] [StarMul A] [SMul S A]
    (U : I → A) (P : A)
    (hP : IsStarProjection P)
    (hUP : ∀ i : I, U i * P = P)
    (hAbsorb : ∀ T : A, (∀ i : I, U i * T = T) → P * T = T)
    (α : A ≃⋆ₐ[S] A) (hαU : ∀ i : I, α (U i) = U i) :
    α P = P :=
  starAlgEquiv_fixed_absorbing_projection U P hP hUP hAbsorb α hαU

example {G F : Type*} [Group G] [NormedAddCommGroup F]
    [InnerProductSpace ℂ F] [FiniteDimensional ℂ F] [CompleteSpace F]
    (U : G →* Module.End ℂ F)
    (V : G → (F →L[ℂ] F))
    (hV : ∀ (g : G) (v : F), V g v = U g v)
    (α : (F →L[ℂ] F) ≃⋆ₐ[ℂ] (F →L[ℂ] F))
    (hαV : ∀ g : G, α (V g) = V g) :
    α (gaugeFixedProjection U) = gaugeFixedProjection U :=
  starAlgEquiv_fixed_gaugeFixedProjection U V hV α hαV

#print axioms FCP.BFSSGaugeFixedProjectionOP1.starAlgEquiv_fixed_absorbing_projection
#print axioms FCP.BFSSGaugeFixedProjectionOP1.starAlgEquiv_fixed_gaugeFixedProjection

end
end FCP.BFSSGaugeFixedProjectionOP1IndependentAudit
