import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Topology.Algebra.Module.FiniteDimension

/-!
# OP0: gauge-fixed orthogonal projection, with no BFSS source imports

A group representation by complex-linear endomorphisms has a fixed subspace.
In a finite-dimensional complex Hilbert space, that subspace has its canonical
orthogonal projection. We record the membership, range, idempotence,
self-adjointness and universal range-containment interfaces.

OP0 is abstract: it does not instantiate the original BFSS Fock carrier,
construct a Spin(9) action, or make a spectral assertion. Unitarity is not
needed for these fixed-space statements; the physical binding will require it.
-/

set_option autoImplicit false

namespace FCP.BFSSGaugeFixedProjectionOP0
noncomputable section

variable {G F : Type*} [Group G] [NormedAddCommGroup F]
  [InnerProductSpace ℂ F]

/-- Literal vectors fixed by every element of a complex-linear group representation. -/
def gaugeFixedSubspace (U : G →* Module.End ℂ F) : Submodule ℂ F :=
  ⨅ g : G, LinearMap.ker (U g - LinearMap.id)

/-- The exact, pointwise gauge-fixed characterization; no substitute carrier. -/
theorem mem_gaugeFixedSubspace_iff (U : G →* Module.End ℂ F) (v : F) :
    v ∈ gaugeFixedSubspace U ↔ ∀ g : G, U g v = v := by
  simp only [gaugeFixedSubspace, Submodule.mem_iInf, LinearMap.mem_ker,
    LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

variable [FiniteDimensional ℂ F]

/-- The canonical continuous orthogonal projection onto the fixed subspace. -/
def gaugeFixedProjection (U : G →* Module.End ℂ F) : F →L[ℂ] F := by
  haveI : CompleteSpace (gaugeFixedSubspace U) :=
    FiniteDimensional.complete ℂ (gaugeFixedSubspace U)
  exact (gaugeFixedSubspace U).starProjection

/-- Projection range equals the literal common fixed subspace. -/
theorem range_gaugeFixedProjection (U : G →* Module.End ℂ F) :
    (gaugeFixedProjection U).range = gaugeFixedSubspace U := by
  haveI : CompleteSpace (gaugeFixedSubspace U) :=
    FiniteDimensional.complete ℂ (gaugeFixedSubspace U)
  change (gaugeFixedSubspace U).starProjection.range = gaugeFixedSubspace U
  exact Submodule.range_starProjection _

/-- Every projected vector is fixed by all represented gauge elements. -/
theorem gaugeFixedProjection_fixed (U : G →* Module.End ℂ F) (v : F) (g : G) :
    U g (gaugeFixedProjection U v) = gaugeFixedProjection U v := by
  apply (mem_gaugeFixedSubspace_iff U _).mp
  rw [← range_gaugeFixedProjection U]
  exact ⟨v, rfl⟩

/-- The canonical projection is idempotent. -/
theorem gaugeFixedProjection_idempotent (U : G →* Module.End ℂ F) :
    IsIdempotentElem (gaugeFixedProjection U) := by
  haveI : CompleteSpace (gaugeFixedSubspace U) :=
    FiniteDimensional.complete ℂ (gaugeFixedSubspace U)
  change IsIdempotentElem (gaugeFixedSubspace U).starProjection
  exact Submodule.isIdempotentElem_starProjection _

/-- The canonical projection is an orthogonal (self-adjoint) projection. -/
theorem gaugeFixedProjection_isStarProjection [CompleteSpace F]
    (U : G →* Module.End ℂ F) :
    IsStarProjection (gaugeFixedProjection U) := by
  haveI : CompleteSpace (gaugeFixedSubspace U) :=
    FiniteDimensional.complete ℂ (gaugeFixedSubspace U)
  change IsStarProjection (gaugeFixedSubspace U).starProjection
  exact Submodule.isStarProjection_starProjection

/-- Universal OP0 range bound: any continuous linear operator with pointwise
gauge-fixed output has range inside the literal fixed subspace. In particular,
no idempotence or self-adjointness hypothesis is needed for this implication. -/
theorem range_le_gaugeFixedSubspace (U : G →* Module.End ℂ F)
    (T : F →L[ℂ] F) (hT : ∀ (g : G) (v : F), U g (T v) = T v) :
    T.range ≤ gaugeFixedSubspace U := by
  intro v hv
  obtain ⟨x, rfl⟩ := hv
  exact (mem_gaugeFixedSubspace_iff U (T x)).mpr (fun g => hT g x)

#print axioms mem_gaugeFixedSubspace_iff
#print axioms range_gaugeFixedProjection
#print axioms gaugeFixedProjection_fixed
#print axioms gaugeFixedProjection_idempotent
#print axioms gaugeFixedProjection_isStarProjection
#print axioms range_le_gaugeFixedSubspace

end
end FCP.BFSSGaugeFixedProjectionOP0
