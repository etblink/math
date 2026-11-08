import OAI.LinearAlgebra.GaugeFixedProjectionOP0

/-!
Independent OP0 consumer: only the abstract Mathlib-only projection API.
Does not import original BFSS carriers or turn an OP0 result into a
Spin(9), gauge, or Hamiltonian theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSGaugeFixedProjectionOP0IndependentAudit
noncomputable section

open FCP.BFSSGaugeFixedProjectionOP0

variable {G F : Type*} [Group G] [NormedAddCommGroup F]
  [InnerProductSpace ℂ F]

example (U : G →* Module.End ℂ F) (v : F) :
    v ∈ gaugeFixedSubspace U ↔ ∀ g : G, U g v = v :=
  mem_gaugeFixedSubspace_iff U v

variable [FiniteDimensional ℂ F]

example (U : G →* Module.End ℂ F) :
    (gaugeFixedProjection U).range = gaugeFixedSubspace U :=
  range_gaugeFixedProjection U

example (U : G →* Module.End ℂ F) (g : G) (v : F) :
    U g (gaugeFixedProjection U v) = gaugeFixedProjection U v :=
  gaugeFixedProjection_fixed U v g

example (U : G →* Module.End ℂ F) :
    IsIdempotentElem (gaugeFixedProjection U) :=
  gaugeFixedProjection_idempotent U

example [CompleteSpace F] (U : G →* Module.End ℂ F) :
    IsStarProjection (gaugeFixedProjection U) :=
  gaugeFixedProjection_isStarProjection U

example (U : G →* Module.End ℂ F) (T : F →L[ℂ] F)
    (hT : ∀ (g : G) (v : F), U g (T v) = T v) :
    T.range ≤ gaugeFixedSubspace U :=
  range_le_gaugeFixedSubspace U T hT

#print axioms FCP.BFSSGaugeFixedProjectionOP0.range_le_gaugeFixedSubspace
#print axioms FCP.BFSSGaugeFixedProjectionOP0.gaugeFixedProjection_isStarProjection

end
end FCP.BFSSGaugeFixedProjectionOP0IndependentAudit
