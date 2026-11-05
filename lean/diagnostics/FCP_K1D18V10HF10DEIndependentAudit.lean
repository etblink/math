import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DETranslatedSourceCharts

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum

-- Reconstruct the accepted norm independently on the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDEPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDEPBWCoordinates.toAddMonoidHom auditDEPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDEPBWCoordinates

@[instance_reducible] private def auditDESpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDEParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDECliffordTopology :
    TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

local instance : IsTopologicalGroup (spinGroup source9Quadratic) :=
  source9Spin_isTopologicalGroup_pbw

private abbrev G := spinGroup source9Quadratic
private abbrev P := Fin 36 → ℝ
private abbrev C := CliffordAlgebra source9Quadratic
-- Give imported objects their complete consumer types before applying their operations.
private abbrev auditDECharts : G → OpenPartialHomeomorph G P := source9SpinLeftTranslatedChart
private def auditDEChartedSpace : ChartedSpace P G := source9SpinTranslatedChartedSpace

example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : NormedSpace ℝ C := inferInstance
example : IsTopologicalGroup G := inferInstance
example : source9PBWCoordinates = auditDEPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    C (Finset SpaceIndex → ℝ)
    auditDEPBWCoordinates.toAddMonoidHom auditDEPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    C (Finset SpaceIndex → ℝ) auditDEPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace G) = auditDESpinTopology := rfl
example : (inferInstance : TopologicalSpace P) = auditDEParameterTopology := rfl
example : (inferInstance : TopologicalSpace C) = auditDECliffordTopology := rfl
example : (inferInstance : TopologicalSpace G) =
    TopologicalSpace.induced (Subtype.val : G → C) auditDECliffordTopology := rfl

-- Check all ten public interfaces on the actual original source group.
example (g : G) : OpenPartialHomeomorph G P := source9SpinLeftTranslatedChart g
example (g : G) : (auditDECharts g).source =
    (fun h : G => g⁻¹ * h) ⁻¹' source9SpinIdentityLocalChart.source :=
  source9SpinLeftTranslatedChart_source g
example (g : G) : (auditDECharts g).target = source9SpinIdentityLocalChart.target :=
  source9SpinLeftTranslatedChart_target g
example (g h : G) : auditDECharts g h = source9SpinIdentityLocalChart (g⁻¹ * h) :=
  source9SpinLeftTranslatedChart_apply g h
example (g : G) (t : P) : (auditDECharts g).symm t = g * source9OrderedStrictPlaneWord t :=
  source9SpinLeftTranslatedChart_symm_apply g t
example (g : G) : g ∈ (auditDECharts g).source :=
  source9SpinLeftTranslatedChart_self_mem_source g
example (g : G) : auditDECharts g g = 0 := source9SpinLeftTranslatedChart_self g
example : ChartedSpace P G := source9SpinTranslatedChartedSpace
example (g h : G) (t : P) : auditDECharts g ((auditDECharts h).symm t) =
    source9SpinIdentityLocalChart (g⁻¹ * (h * source9OrderedStrictPlaneWord t)) :=
  source9SpinLeftTranslatedChart_transition_apply g h t
example (g h : G) : ((auditDECharts h).symm.trans (auditDECharts g)).source =
    source9SpinIdentityLocalChart.target ∩
      (fun t : P => g⁻¹ * (h * source9OrderedStrictPlaneWord t)) ⁻¹'
        source9SpinIdentityLocalChart.source :=
  source9SpinLeftTranslatedChart_transition_source g h

-- Activate the named atlas only inside each consumer check; the source exports no instance.
example (g : G) :
    letI : ChartedSpace P G := auditDEChartedSpace
    chartAt P g = auditDECharts g := rfl
example :
    letI : ChartedSpace P G := auditDEChartedSpace
    atlas P G = Set.range auditDECharts := rfl
example : (⋃ g : G, (auditDECharts g).source) = Set.univ := by
  letI : ChartedSpace P G := auditDEChartedSpace
  exact iUnion_source_chartAt P G
example (g : G) : IsOpen (auditDECharts g).source := (auditDECharts g).open_source
example (g : G) : IsOpen (auditDECharts g).target := (auditDECharts g).open_target
example (g : G) : (0 : P) ∈ (auditDECharts g).target :=
  (source9SpinLeftTranslatedChart_target g).symm ▸ source9SpinIdentityLocalChart_zero_mem_target
example (g : G) : (auditDECharts g).symm (0 : P) = g := by
  rw [source9SpinLeftTranslatedChart_symm_apply, source9OrderedStrictPlaneWord_zero, mul_one]
example (g : G) : (auditDECharts g).source ∈ 𝓝 g :=
  (auditDECharts g).open_source.mem_nhds (source9SpinLeftTranslatedChart_self_mem_source g)
example (g : G) : ContinuousOn (auditDECharts g) (auditDECharts g).source :=
  (auditDECharts g).continuousOn
example (g : G) : ContinuousOn (auditDECharts g).symm (auditDECharts g).target :=
  (auditDECharts g).continuousOn_symm

-- Inverse identities retain the required source or target membership.
example (g h : G) (hh : h ∈ (auditDECharts g).source) :
    g * source9OrderedStrictPlaneWord (auditDECharts g h) = h :=
  (source9SpinLeftTranslatedChart_symm_apply g (auditDECharts g h)).symm.trans
    ((auditDECharts g).left_inv hh)
example (g : G) (t : P) (ht : t ∈ source9SpinIdentityLocalChart.target) :
    auditDECharts g (g * source9OrderedStrictPlaneWord t) = t := by
  have htarget : t ∈ (auditDECharts g).target :=
    (source9SpinLeftTranslatedChart_target g).symm ▸ ht
  exact (congrArg (fun h : G => auditDECharts g h)
    (source9SpinLeftTranslatedChart_symm_apply g t)).symm.trans
      ((auditDECharts g).right_inv htarget)
example (g h : G) (t : P) : ((auditDECharts h).symm.trans (auditDECharts g)) t =
    source9SpinIdentityLocalChart (g⁻¹ * (h * source9OrderedStrictPlaneWord t)) :=
  source9SpinLeftTranslatedChart_transition_apply g h t
example (g h : G) (t : P) :
    t ∈ ((auditDECharts h).symm.trans (auditDECharts g)).source ↔
      t ∈ source9SpinIdentityLocalChart.target ∧
        g⁻¹ * (h * source9OrderedStrictPlaneWord t) ∈ source9SpinIdentityLocalChart.source := by
  rw [source9SpinLeftTranslatedChart_transition_source]

-- Local chart inverses do not make the natural nine-dimensional matrix map globally injective.
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9SpinLeftTranslatedChart
#print axioms source9SpinLeftTranslatedChart_source
#print axioms source9SpinLeftTranslatedChart_target
#print axioms source9SpinLeftTranslatedChart_apply
#print axioms source9SpinLeftTranslatedChart_symm_apply
#print axioms source9SpinLeftTranslatedChart_self_mem_source
#print axioms source9SpinLeftTranslatedChart_self
#print axioms source9SpinTranslatedChartedSpace
#print axioms source9SpinLeftTranslatedChart_transition_apply
#print axioms source9SpinLeftTranslatedChart_transition_source
end
end FCP.BFSSPairedSpin9Clifford
