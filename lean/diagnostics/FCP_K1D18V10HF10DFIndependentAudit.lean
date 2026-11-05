import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DFCoordinateDerivativeInvertibility

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
-- Independently spell out each original natural-matrix coordinate of the original word.
private def auditDFCoordinates (t : P) (i : Fin 36) : ℝ :=
  ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
    Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i) (source9StrictPlaneColumn i)
private abbrev auditDFChart : OpenPartialHomeomorph P P :=
  source9OrderedUpperCoordinateLocalHomeomorph

example : auditDFCoordinates = source9OrderedUpperCoordinateMap := rfl
example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : ‖ContinuousLinearMap.id ℝ P‖₊ = 1 := ContinuousLinearMap.nnnorm_id
example : (0 : P) ∈ auditDFChart.source :=
  source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
example : IsOpen auditDFChart.source := auditDFChart.open_source
example : auditDFChart.source = Classical.choose
    (source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl.approximates_deriv_on_open_nhds
      (f' := ContinuousLinearEquiv.refl ℝ P)) := rfl

-- Check all seven roots at complete consumer types and the independently spelled-out map.
example : ApproximatesLinearOn auditDFCoordinates (ContinuousLinearMap.id ℝ P)
    auditDFChart.source (1 / 2) :=
  source9UpperCoordinateMap_approximates_on_chart_source
example : LipschitzOnWith (1 / 2) (fun t : P => auditDFCoordinates t - t)
    auditDFChart.source := source9UpperCoordinateMap_residual_lipschitzOn_chart_source
example (t u : P) (ht : t ∈ auditDFChart.source) (hu : u ∈ auditDFChart.source) :
    ‖auditDFCoordinates t - auditDFCoordinates u - (t - u)‖ ≤
      ((1 / 2 : ℝ≥0) : ℝ) * ‖t - u‖ :=
  source9UpperCoordinateMap_chart_source_deviation t u ht hu
example (t : P) (ht : t ∈ auditDFChart.source) :
    ‖fderiv ℝ (fun u : P => auditDFCoordinates u - u) t‖ ≤ ((1 / 2 : ℝ≥0) : ℝ) :=
  source9UpperCoordinateMap_residual_fderiv_norm_le t ht
example (t : P) (ht : t ∈ auditDFChart.source) :
    ‖fderiv ℝ auditDFCoordinates t - ContinuousLinearMap.id ℝ P‖ ≤
      ((1 / 2 : ℝ≥0) : ℝ) := source9UpperCoordinateMap_fderiv_sub_id_norm_le t ht
example (t : P) (ht : t ∈ auditDFChart.source) :
    IsUnit (fderiv ℝ auditDFCoordinates t) :=
  source9UpperCoordinateMap_fderiv_isUnit_on_chart_source t ht
example (t : P) (ht : t ∈ auditDFChart.source) :
    Function.Bijective (fderiv ℝ auditDFCoordinates t) :=
  source9UpperCoordinateMap_fderiv_bijective_on_chart_source t ht

-- Invertibility is available at each inverse point of the exact accepted target.
example (y : P) (hy : y ∈ auditDFChart.target) :
    Function.Bijective (fderiv ℝ auditDFCoordinates (auditDFChart.symm y)) :=
  source9UpperCoordinateMap_fderiv_bijective_on_chart_source _ (auditDFChart.map_target hy)
example (t : P) (ht : t ∈ auditDFChart.source) (y : P) :
    ∃ x : P, (fderiv ℝ auditDFCoordinates t) x = y :=
  (source9UpperCoordinateMap_fderiv_bijective_on_chart_source t ht).surjective y
example (t : P) (ht : t ∈ auditDFChart.source) (v : P)
    (hv : (fderiv ℝ auditDFCoordinates t) v = 0) : v = 0 :=
  (source9UpperCoordinateMap_fderiv_bijective_on_chart_source t ht).injective
    (hv.trans (map_zero (fderiv ℝ auditDFCoordinates t)).symm)
example : fderiv ℝ auditDFCoordinates 0 = ContinuousLinearMap.id ℝ P :=
  source9OrderedUpperCoordinateMap_hasFDerivAt_zero.fderiv
example (y : P) (hy : y ∈ auditDFChart.target) :
    auditDFCoordinates (auditDFChart.symm y) = y :=
  source9OrderedUpperCoordinateLocalHomeomorph_right_inv y hy

-- Parameter derivative bijectivity does not assert global injectivity of the source natural action.
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9UpperCoordinateMap_approximates_on_chart_source
#print axioms source9UpperCoordinateMap_residual_lipschitzOn_chart_source
#print axioms source9UpperCoordinateMap_chart_source_deviation
#print axioms source9UpperCoordinateMap_residual_fderiv_norm_le
#print axioms source9UpperCoordinateMap_fderiv_sub_id_norm_le
#print axioms source9UpperCoordinateMap_fderiv_isUnit_on_chart_source
#print axioms source9UpperCoordinateMap_fderiv_bijective_on_chart_source
end
end FCP.BFSSPairedSpin9Clifford
