import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DGWholeTargetInverseRegularity

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private def auditDGCoordinates (t : P) (i : Fin 36) : ℝ :=
  ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
    Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i) (source9StrictPlaneColumn i)
private abbrev auditDGChart : OpenPartialHomeomorph P P :=
  source9OrderedUpperCoordinateLocalHomeomorph

-- Reuse the qualified CE/DF pointwise bridge, rather than whole-map conversion.
private theorem auditDGSourceMap_eq_coordinates :
    source9OrderedUpperCoordinateMap = auditDGCoordinates := by
  funext t i
  unfold source9OrderedUpperCoordinateMap auditDGCoordinates
  exact source9OrderedUpperProjection_apply
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
      Matrix SpaceIndex SpaceIndex ℝ) i

example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : (0 : P) ∈ auditDGChart.target :=
  source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
example : IsOpen auditDGChart.target := auditDGChart.open_target
example : auditDGChart.source = Classical.choose
    (source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl.approximates_deriv_on_open_nhds
      (f' := ContinuousLinearEquiv.refl ℝ P)) := rfl

-- The derivative equivalence belongs to the actual original entry function.
example (t : P) (ht : t ∈ auditDGChart.source) :
    ∃ e : P ≃L[ℝ] P, (e : P →L[ℝ] P) = fderiv ℝ auditDGCoordinates t := by
  rw [← auditDGSourceMap_eq_coordinates]
  exact source9UpperCoordinateMap_fderiv_equiv_on_chart_source t ht
example (y : P) (hy : y ∈ auditDGChart.target) :
    ∃ e : P ≃L[ℝ] P,
      (e : P →L[ℝ] P) = fderiv ℝ auditDGCoordinates (auditDGChart.symm y) := by
  rw [← auditDGSourceMap_eq_coordinates]
  exact source9UpperCoordinateMap_fderiv_equiv_on_chart_source _ (auditDGChart.map_target hy)

-- Arbitrary target points and arbitrary orders, including analytic order.
example (n : ℕ∞ω) (y : P) (hy : y ∈ auditDGChart.target) :
    ContDiffAt ℝ n auditDGChart.symm y :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target n y hy
example (n : ℕ∞ω) : ContDiffOn ℝ n auditDGChart.symm auditDGChart.target :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target n
example (y : P) (hy : y ∈ auditDGChart.target) : ContDiffAt ℝ ω auditDGChart.symm y :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target ω y hy
example : ContDiffOn ℝ ∞ auditDGChart.symm auditDGChart.target :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target ∞
example (y : P) (hy : y ∈ auditDGChart.target) :
    DifferentiableAt ℝ auditDGChart.symm y :=
  (source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target 1 y hy).differentiableAt
    one_ne_zero
example : ContDiffAt ℝ ω auditDGChart.symm (0 : P) :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target ω 0
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
example (y : P) (hy : y ∈ auditDGChart.target) :
    auditDGCoordinates (auditDGChart.symm y) = y := by
  rw [← auditDGSourceMap_eq_coordinates]
  exact source9OrderedUpperCoordinateLocalHomeomorph_right_inv y hy

-- Local parameter inverse regularity does not imply global natural-action injectivity.
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9UpperCoordinateMap_fderiv_equiv_on_chart_source
#print axioms source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_on_target
#print axioms source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target
end
end FCP.BFSSPairedSpin9Clifford
