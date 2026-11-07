import diagnostics.BFSSAxisCartanSupportDiagnostic

/-! Independent structural consumers. No original-source BFSS identification is asserted. -/
set_option autoImplicit false

namespace FCP.BFSSAxisCartanSupportDiagnosticConsumer
noncomputable section

open Module Submodule FCP.BFSSAxisCartanSupportDiagnostic

example {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (n : ℕ) (φ : F ≃ₗᵢ[ℝ] F) (a : F)
    (ha : φ a = a)
    (hn : finrank ℝ (ContinuousLinearMap.id ℝ F - φ).kerᗮ ≤ n) :
    ∃ l : List F, l.length ≤ n ∧ (∀ u ∈ l, inner ℝ a u = 0) ∧
      φ = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
  reflections_generate_fixing_aux φ a ha hn

example (φ : EuclideanSpace ℝ (Fin 9) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 9))
    (a : EuclideanSpace ℝ (Fin 9)) (ha0 : a ≠ 0) (ha : φ a = a) :
    ∃ l : List (EuclideanSpace ℝ (Fin 9)), l.length ≤ 8 ∧
      (∀ u ∈ l, inner ℝ a u = 0) ∧
      φ = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
  reflections_generate_fixing_nine φ a ha0 ha

example (a : EuclideanSpace ℝ (Fin 9)) :
    ∃ l : List (EuclideanSpace ℝ (Fin 9)), l.length = 0 ∧
      (∀ u ∈ l, inner ℝ a u = 0) ∧
      (1 : EuclideanSpace ℝ (Fin 9) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 9)) =
        (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  exact ⟨[], rfl, by simp, rfl⟩

example {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (a u : F) (hu : inner ℝ a u = 0) :
    (ℝ ∙ u)ᗮ.reflection a = a := by
  apply reflection_mem_subspace_eq_self
  rw [mem_orthogonal_singleton_iff_inner_left]
  exact hu

example {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (a : F) (ha : a ≠ 0) :
    (ℝ ∙ a)ᗮ.reflection a ≠ a := by
  rw [reflection_orthogonalComplement_singleton_eq_neg]
  intro heq
  have hzero : a = 0 := by
    have hsum : a + a = 0 := by
      calc
        a + a = -a + a := congrArg (fun x : F => x + a) heq.symm
        _ = 0 := neg_add_cancel a
    have hsmul : (2 : ℝ) • a = 0 := by
      simpa only [two_smul] using hsum
    exact (smul_eq_zero.mp hsmul).resolve_left (by norm_num)
  exact ha hzero

example {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (u v z : F) :
    ([((ℝ ∙ u)ᗮ.reflection), ((ℝ ∙ v)ᗮ.reflection)].prod) z =
      (ℝ ∙ u)ᗮ.reflection ((ℝ ∙ v)ᗮ.reflection z) := rfl

#print axioms FCP.BFSSAxisCartanSupportDiagnostic.reflections_generate_fixing_aux
#print axioms FCP.BFSSAxisCartanSupportDiagnostic.reflections_generate_fixing_nine
#eval IO.println "BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_CONSUMER_COMPLETE"

end
end FCP.BFSSAxisCartanSupportDiagnosticConsumer
