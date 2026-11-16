import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSourceSO3Witness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1NativeDetOne

/-!
# IBI-G0C — original BFSS SU(2) color adjoint as a typed SO(3) homomorphism

Source-exact bridge, deliberately separate from the qualified universal
SO3 matrix witness and the qualified native determinant-one theorem.

Only the original OAI.BFSSQuantum.GaugeGroup 2 and the original G3A
adjointColorMatrix are used. The proof does not assert a kernel, a Fock
representation, physical-state equivalence, or spectral conclusions.

STAGED: this file is not qualified until its own exact-pinned cold source,
independent consumer, and axiom audit pass.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CSO3Hom
noncomputable section

open OAI.BFSSQuantum

/-- Every original BFSS color-adjoint image is a proper orthogonal
real three-by-three matrix. -/
theorem originalAdjointColorMatrix_mem_SO3 (g : GaugeGroup 2) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix g ∈
      Matrix.specialOrthogonalGroup (Fin 3) ℝ := by
  apply Matrix.mem_specialOrthogonalGroup_iff.mpr
  exact ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mpr
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix_orthogonal g),
    FCP.BFSSIBIG0B1NativeDetOne.originalAdjointColorMatrix_det_one g⟩

/-- The actual original BFSS gauge matrix regarded as an SO(3) element. -/
noncomputable def originalAdjointSO3 (g : GaugeGroup 2) :
    Matrix.specialOrthogonalGroup (Fin 3) ℝ :=
  ⟨FCP.BFSSSU2GaugeG3A.adjointColorMatrix g,
    originalAdjointColorMatrix_mem_SO3 g⟩

/-- The actual source-exact group homomorphism, not a substitute SU(2). -/
noncomputable def originalAdjointSO3Hom :
    GaugeGroup 2 →* Matrix.specialOrthogonalGroup (Fin 3) ℝ where
  toFun := originalAdjointSO3
  map_one' := by
    apply Subtype.ext
    exact FCP.BFSSSU2GaugeG3A.adjointColorMatrix_one
  map_mul' := by
    intro g h
    apply Subtype.ext
    exact FCP.BFSSSU2GaugeG3A.adjointColorMatrix_mul g h

/-- A clean consumer-facing matrix equation fixes the source's index convention. -/
@[simp] theorem originalAdjointSO3Hom_coe (g : GaugeGroup 2) :
    ((originalAdjointSO3Hom g : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
        Matrix (Fin 3) (Fin 3) ℝ) =
      FCP.BFSSSU2GaugeG3A.adjointColorMatrix g := rfl

/-- Every SO(3) element has an ORIGINAL BFSS gauge preimage;
this directly consumes the exact-pinned R2 witness. -/
theorem originalAdjointSO3Hom_surjective :
    Function.Surjective originalAdjointSO3Hom := by
  intro Q
  obtain ⟨g, hg⟩ :=
    FCP.BFSSIBIG0CSourceSO3Witness.originalBFSS_adjoint_hits_every_SO3
      (Q : Matrix (Fin 3) (Fin 3) ℝ) Q.prop
  refine ⟨g, ?_⟩
  apply Subtype.ext
  exact hg

#print axioms originalAdjointColorMatrix_mem_SO3
#print axioms originalAdjointSO3
#print axioms originalAdjointSO3Hom
#print axioms originalAdjointSO3Hom_coe
#print axioms originalAdjointSO3Hom_surjective

end
end FCP.BFSSIBIG0CSO3Hom
