import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DFCoordinateDerivativeInvertibility

/-! F10DG: every-order regularity of the existing parameter inverse on its exact target.
Use DF's actual derivative bijectivity at each inverse point and the existing inverse
regularity API. No smaller replacement chart or additional invertibility premise is used.
This does not establish smooth compatibility of the translated group charts.
Candidate until strict source compilation and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open scoped ContDiff

private abbrev P := Fin 36 → ℝ

/-- Package the proved actual derivative as an equivalence, without assuming one. -/
theorem source9UpperCoordinateMap_fderiv_equiv_on_chart_source
    (t : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    ∃ e : P ≃L[ℝ] P,
      (e : P →L[ℝ] P) = fderiv ℝ source9OrderedUpperCoordinateMap t := by
  have h := source9UpperCoordinateMap_fderiv_bijective_on_chart_source t ht
  have hker : (fderiv ℝ source9OrderedUpperCoordinateMap t).ker = ⊥ :=
    LinearMap.ker_eq_bot.mpr h.1
  have hrange : (fderiv ℝ source9OrderedUpperCoordinateMap t).range = ⊤ :=
    LinearMap.range_eq_top.mpr h.2
  refine ⟨ContinuousLinearEquiv.ofBijective
    (fderiv ℝ source9OrderedUpperCoordinateMap t) hker hrange, ?_⟩
  exact ContinuousLinearEquiv.coe_ofBijective _ _ _

/-- The unchanged inverse is regular at every point of the entire accepted target. -/
theorem source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target
    (n : ℕ∞ω) (y : P)
    (hy : y ∈ source9OrderedUpperCoordinateLocalHomeomorph.target) :
    ContDiffAt ℝ n source9OrderedUpperCoordinateLocalHomeomorph.symm y := by
  obtain ⟨e, he⟩ := source9UpperCoordinateMap_fderiv_equiv_on_chart_source
    (source9OrderedUpperCoordinateLocalHomeomorph.symm y)
    (source9OrderedUpperCoordinateLocalHomeomorph.map_target hy)
  apply source9OrderedUpperCoordinateLocalHomeomorph.contDiffAt_symm (f₀' := e) hy
  · rw [source9OrderedUpperCoordinateLocalHomeomorph_coe, he]
    exact ((source9OrderedUpperCoordinateMap_contDiff (1 : ℕ∞ω)).differentiable
      one_ne_zero (source9OrderedUpperCoordinateLocalHomeomorph.symm y)).hasFDerivAt
  · rw [source9OrderedUpperCoordinateLocalHomeomorph_coe]
    exact (source9OrderedUpperCoordinateMap_contDiff n).contDiffAt

/-- Every-order regularity on the exact target, retaining its membership restriction. -/
theorem source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target
    (n : ℕ∞ω) :
    ContDiffOn ℝ n source9OrderedUpperCoordinateLocalHomeomorph.symm
      source9OrderedUpperCoordinateLocalHomeomorph.target := by
  intro y hy
  exact
    (source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target n y hy).contDiffWithinAt

#print axioms source9UpperCoordinateMap_fderiv_equiv_on_chart_source
#print axioms source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target
#print axioms source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target
end
end FCP.BFSSPairedSpin9Clifford
