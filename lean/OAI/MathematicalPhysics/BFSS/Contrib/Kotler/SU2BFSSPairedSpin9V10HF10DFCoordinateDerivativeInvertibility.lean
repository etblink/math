import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DETranslatedSourceCharts
import Mathlib.Analysis.SpecificLimits.Normed

/-! F10DF: quantitative derivative control on the unchanged CG coordinate-chart source.
Expose the actual IFT construction's half-identity approximation, then bound the
derivative perturbation and prove it invertible at every point of that source.
This is a prerequisite for whole-target inverse regularity, not a smooth atlas,
source tangent identification or full group-representation manifold differential.
Candidate until strict source compilation and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open scoped Topology ContDiff

private abbrev P := Fin 36 → ℝ

/-- The chosen CG source retains the constructor's quantitative identity approximation. -/
theorem source9UpperCoordinateMap_approximates_on_chart_source :
    ApproximatesLinearOn source9OrderedUpperCoordinateMap
      (ContinuousLinearMap.id ℝ P)
      source9OrderedUpperCoordinateLocalHomeomorph.source (1 / 2) := by
  have h : ApproximatesLinearOn source9OrderedUpperCoordinateMap
      (ContinuousLinearMap.id ℝ P)
      source9OrderedUpperCoordinateLocalHomeomorph.source
      (‖ContinuousLinearMap.id ℝ P‖₊⁻¹ / 2) :=
    (Classical.choose_spec
      (source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl.approximates_deriv_on_open_nhds
        (f' := ContinuousLinearEquiv.refl ℝ P))).2.2
  simpa only [ContinuousLinearMap.nnnorm_id, inv_one] using h

/-- The literal nonlinear remainder is half-Lipschitz on that exact source. -/
theorem source9UpperCoordinateMap_residual_lipschitzOn_chart_source :
    LipschitzOnWith (1 / 2) (fun t : P => source9OrderedUpperCoordinateMap t - t)
      source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9UpperCoordinateMap_approximates_on_chart_source.lipschitzOnWith

/-- Explicit two-point estimate, retaining both source-membership premises. -/
theorem source9UpperCoordinateMap_chart_source_deviation
    (t u : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source)
    (hu : u ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    ‖source9OrderedUpperCoordinateMap t - source9OrderedUpperCoordinateMap u - (t - u)‖ ≤
      ((1 / 2 : NNReal) : ℝ) * ‖t - u‖ :=
  source9UpperCoordinateMap_approximates_on_chart_source t ht u hu

/-- Differentiate the actual residual on the open source, rather than assuming a bound. -/
theorem source9UpperCoordinateMap_residual_fderiv_norm_le
    (t : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    ‖fderiv ℝ (fun u : P => source9OrderedUpperCoordinateMap u - u) t‖ ≤
      ((1 / 2 : NNReal) : ℝ) :=
  norm_fderiv_le_of_lipschitzOn ℝ
    (source9OrderedUpperCoordinateLocalHomeomorph.open_source.mem_nhds ht)
    source9UpperCoordinateMap_residual_lipschitzOn_chart_source

/-- The true forward derivative stays within one half of the identity on the exact CG source. -/
theorem source9UpperCoordinateMap_fderiv_sub_id_norm_le
    (t : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    ‖fderiv ℝ source9OrderedUpperCoordinateMap t - ContinuousLinearMap.id ℝ P‖ ≤
      ((1 / 2 : NNReal) : ℝ) := by
  have hf : DifferentiableAt ℝ source9OrderedUpperCoordinateMap t :=
    (source9OrderedUpperCoordinateMap_contDiff (1 : ℕ∞ω)).differentiable one_ne_zero t
  have hd : HasFDerivAt (fun u : P => source9OrderedUpperCoordinateMap u - u)
      (fderiv ℝ source9OrderedUpperCoordinateMap t - ContinuousLinearMap.id ℝ P) t :=
    hf.hasFDerivAt.sub (hasFDerivAt_id t)
  have h := source9UpperCoordinateMap_residual_fderiv_norm_le t ht
  rw [hd.fderiv] at h
  exact h

/-- Neumann invertibility applies to the genuine derivative, on the established source only. -/
theorem source9UpperCoordinateMap_fderiv_isUnit_on_chart_source
    (t : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    IsUnit (fderiv ℝ source9OrderedUpperCoordinateMap t) := by
  have hsmall : ‖(1 : P →L[ℝ] P) - fderiv ℝ source9OrderedUpperCoordinateMap t‖ < 1 := by
    rw [norm_sub_rev]
    exact lt_of_le_of_lt (source9UpperCoordinateMap_fderiv_sub_id_norm_le t ht) (by norm_num)
  have h := isUnit_one_sub_of_norm_lt_one hsmall
  simpa only [sub_sub_cancel] using h

/-- The same derivative is bijective as an actual map of the original parameter space. -/
theorem source9UpperCoordinateMap_fderiv_bijective_on_chart_source
    (t : P) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    Function.Bijective (fderiv ℝ source9OrderedUpperCoordinateMap t) :=
  ContinuousLinearMap.isUnit_iff_bijective.mp
    (source9UpperCoordinateMap_fderiv_isUnit_on_chart_source t ht)

#print axioms source9UpperCoordinateMap_approximates_on_chart_source
#print axioms source9UpperCoordinateMap_residual_lipschitzOn_chart_source
#print axioms source9UpperCoordinateMap_chart_source_deviation
#print axioms source9UpperCoordinateMap_residual_fderiv_norm_le
#print axioms source9UpperCoordinateMap_fderiv_sub_id_norm_le
#print axioms source9UpperCoordinateMap_fderiv_isUnit_on_chart_source
#print axioms source9UpperCoordinateMap_fderiv_bijective_on_chart_source
end
end FCP.BFSSPairedSpin9Clifford
