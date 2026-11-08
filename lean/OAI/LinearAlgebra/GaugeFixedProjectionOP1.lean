import OAI.LinearAlgebra.GaugeFixedProjectionOP0

/-!
# OP1: star automorphisms fixing gauge operators fix the gauge projection

The algebraic core is independent of a gauge group and of the BFSS model.
A genuine star-algebra equivalence fixes a self-adjoint projection P whenever
it fixes all gauge elements and P absorbs exactly their common left-fixed
operator space. Both the equivalence and its inverse are used.

The concrete corollary binds P to the exact OP0 fixed-subspace projection.
It does not construct the original SU(2) action or a Spin(9) automorphism.
-/

set_option autoImplicit false

namespace FCP.BFSSGaugeFixedProjectionOP1
noncomputable section

/-- The abstract two-sided argument. Neither an arbitrary linear equivalence
nor a non-star algebra automorphism satisfies these hypotheses. -/
theorem starAlgEquiv_fixed_absorbing_projection
    {S A I : Type*} [Semiring A] [StarMul A] [SMul S A]
    (U : I → A) (P : A)
    (hP : IsStarProjection P)
    (hUP : ∀ i : I, U i * P = P)
    (hAbsorb : ∀ T : A, (∀ i : I, U i * T = T) → P * T = T)
    (α : A ≃⋆ₐ[S] A)
    (hαU : ∀ i : I, α (U i) = U i) :
    α P = P := by
  have hαfixed (i : I) : U i * α P = α P := by
    calc
      U i * α P = α (U i) * α P := by rw [hαU i]
      _ = α (U i * P) := (map_mul α (U i) P).symm
      _ = α P := by rw [hUP i]
  have hαinvU (i : I) : α.symm (U i) = U i := by
    calc
      α.symm (U i) = α.symm (α (U i)) := congrArg α.symm (hαU i).symm
      _ = U i := α.symm_apply_apply _
  have hαinvfixed (i : I) : U i * α.symm P = α.symm P := by
    calc
      U i * α.symm P = α.symm (U i) * α.symm P := by rw [hαinvU i]
      _ = α.symm (U i * P) := (map_mul α.symm (U i) P).symm
      _ = α.symm P := by rw [hUP i]
  have hRight : α P * P = P := by
    have h := congrArg (fun T : A => α T) (hAbsorb (α.symm P) hαinvfixed)
    simpa only [map_mul, α.apply_symm_apply] using h
  have hLeft : P * α P = P := by
    have h := congrArg star hRight
    simpa only [star_mul, hP.isSelfAdjoint.star_eq,
      (hP.map α).isSelfAdjoint.star_eq] using h
  exact (hAbsorb (α P) hαfixed).symm.trans hLeft

variable {G F : Type*} [Group G] [NormedAddCommGroup F]
  [InnerProductSpace ℂ F] [FiniteDimensional ℂ F] [CompleteSpace F]

open FCP.BFSSGaugeFixedProjectionOP0

/-- Genuine OP0 projection invariance under a complex-linear star-algebra
automorphism fixing all gauge operators pointwise. The bridge hV binds the
continuous operators to exactly the group action defining OP0's fixed space. -/
theorem starAlgEquiv_fixed_gaugeFixedProjection
    (U : G →* Module.End ℂ F)
    (V : G → (F →L[ℂ] F))
    (hV : ∀ (g : G) (v : F), V g v = U g v)
    (α : (F →L[ℂ] F) ≃⋆ₐ[ℂ] (F →L[ℂ] F))
    (hαV : ∀ g : G, α (V g) = V g) :
    α (gaugeFixedProjection U) = gaugeFixedProjection U := by
  let P : F →L[ℂ] F := gaugeFixedProjection U
  have hP : IsStarProjection P := gaugeFixedProjection_isStarProjection U
  have hUP (g : G) : V g * P = P := by
    ext v
    change V g (P v) = P v
    exact (hV g (P v)).trans (gaugeFixedProjection_fixed U v g)
  have hAbsorb (T : F →L[ℂ] F)
      (hT : ∀ g : G, V g * T = T) : P * T = T := by
    ext v
    have hv : T v ∈ gaugeFixedSubspace U :=
      (mem_gaugeFixedSubspace_iff U (T v)).mpr fun g => by
        calc
          U g (T v) = V g (T v) := (hV g (T v)).symm
          _ = T v := by
            have heval := congrArg (fun B : F →L[ℂ] F => B v) (hT g)
            simpa only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply] using heval
    haveI : CompleteSpace (gaugeFixedSubspace U) :=
      FiniteDimensional.complete ℂ (gaugeFixedSubspace U)
    change (gaugeFixedSubspace U).starProjection (T v) = T v
    exact Submodule.starProjection_eq_self_iff.mpr hv
  exact starAlgEquiv_fixed_absorbing_projection V P hP hUP hAbsorb α hαV

#print axioms starAlgEquiv_fixed_absorbing_projection
#print axioms starAlgEquiv_fixed_gaugeFixedProjection

end
end FCP.BFSSGaugeFixedProjectionOP1
