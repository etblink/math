import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DSCayleyAmbientRegularity
import Mathlib.Geometry.Manifold.IsManifold.Basic

/-! F10DT: exact-overlap smooth compatibility of the original native SO(16) Cayley atlas.
Bind the actual chart and chart inverse to the accepted ambient formulas on their domains,
prove regularity of the literal translated matrix formula, and transport it to the native
transition only on its exact existing overlap. Reuse DI's manifold packaging for the same
named atlas, registered locally. No smooth group operations, derivative normalization,
intrinsic target tangent identification or representation differential is asserted.
Candidate until complete strict source compilation and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

private abbrev M := GammaMatrix
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev U : Set Q := gamma16CayleySource
private abbrev V : Set SO := gamma16CayleyTarget
private abbrev W : Set M := {B | (B + 1).det ≠ 0}
private abbrev overlap (g h : SO) : Set Q :=
  ((gamma16SOLeftTranslatedChart h).symm.trans (gamma16SOLeftTranslatedChart g)).source

/-- The actual native chart inverse has the accepted original matrix value on U. -/
theorem gamma16CayleyChartInv_coe_on_source (c : Q) (hc : c ∈ U) :
    (gamma16CayleyChartInv c : M) = gamma16CayleyMatrix c := by
  rw [gamma16CayleyChartInv_apply c hc, gamma16CayleySO_apply]

/-- The actual chart is the ambient backward coordinate formula on V. -/
theorem gamma16CayleyChart_eq_ambient_on_target (r : SO) (hr : r ∈ V) :
    gamma16CayleyOpenPartialHomeomorph r = gamma16CayleyBackwardAmbientCoordinates (r : M) :=
  (gamma16CayleyOpenPartialHomeomorph_apply r).trans
    ((gamma16CayleyChart_apply r hr).trans
      (gamma16CayleyBackwardAmbientCoordinates_eq_native ⟨r, hr⟩).symm)

/-- Literal ambient matrix formula between the h and g coordinate systems. -/
noncomputable def gamma16CayleyTransitionMatrix (g h : SO) (c : Q) : M :=
  ((g⁻¹ : SO) : M) * ((h : M) * gamma16CayleyMatrix c)

/-- On U the ambient matrix is the original native translated inverse-chart value. -/
theorem gamma16CayleyTransitionMatrix_eq_native (g h : SO) (c : Q) (hc : c ∈ U) :
    gamma16CayleyTransitionMatrix g h c =
      ((g⁻¹ * (h * gamma16CayleyChartInv c) : SO) : M) := by
  change ((g⁻¹ : SO) : M) * ((h : M) * gamma16CayleyMatrix c) =
    ((g⁻¹ : SO) : M) * ((h : M) * (gamma16CayleyChartInv c : M))
  exact congrArg (fun X : M => ((g⁻¹ : SO) : M) * ((h : M) * X))
    (gamma16CayleyChartInv_coe_on_source c hc).symm

/-- Ambient translated-matrix smoothness on the actual forward determinant domain. -/
theorem gamma16CayleyTransitionMatrix_contDiffAt
    (n : ℕ∞ω) (g h : SO) (c : Q) (hc : c ∈ U) :
    ContDiffAt ℝ n (gamma16CayleyTransitionMatrix g h) c := by
  have hC : ContDiffAt ℝ n gamma16CayleyMatrix c := gamma16CayleyMatrix_contDiffAt n c hc
  have hH : ContDiffAt ℝ n (fun x : Q => (h : M) * gamma16CayleyMatrix x) c :=
    (gamma16Matrix_mul_contDiff n).contDiffAt.comp c (contDiffAt_const.prodMk hC)
  have hG : ContDiffAt ℝ n
      (fun x : Q => ((g⁻¹ : SO) : M) * ((h : M) * gamma16CayleyMatrix x)) c :=
    (gamma16Matrix_mul_contDiff n).contDiffAt.comp c (contDiffAt_const.prodMk hH)
  change ContDiffAt ℝ n (gamma16CayleyTransitionMatrix g h) c at hG
  exact hG

/-- Existing overlap membership supplies both original native domain conditions. -/
theorem gamma16CayleyTransition_overlap_conditions (g h : SO) (c : Q)
    (hc : c ∈ overlap g h) :
    c ∈ U ∧ g⁻¹ * (h * gamma16CayleyChartInv c) ∈ V := by
  change c ∈ ((gamma16SOLeftTranslatedChart h).symm.trans
    (gamma16SOLeftTranslatedChart g)).source at hc
  rw [gamma16SOLeftTranslatedChart_transition_source,
    gamma16CayleyOpenPartialHomeomorph_target, gamma16CayleyOpenPartialHomeomorph_source] at hc
  exact hc

/-- The same overlap supplies the ambient backward denominator condition, without a new premise. -/
theorem gamma16CayleyTransitionMatrix_mapsTo_backwardDomain (g h : SO) :
    Set.MapsTo (gamma16CayleyTransitionMatrix g h) (overlap g h) W := by
  intro c hc
  have hdom := gamma16CayleyTransition_overlap_conditions g h c hc
  change (gamma16CayleyTransitionMatrix g h c + 1).det ≠ 0
  rw [gamma16CayleyTransitionMatrix_eq_native g h c hdom.1]
  exact hdom.2

/-- Equality with the actual native transition is asserted only on its original overlap. -/
theorem gamma16SOLeftTranslatedChart_transition_eq_ambient (g h : SO) (c : Q)
    (hc : c ∈ overlap g h) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c) =
      gamma16CayleyBackwardAmbientCoordinates (gamma16CayleyTransitionMatrix g h c) := by
  have hdom := gamma16CayleyTransition_overlap_conditions g h c hc
  calc
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c) =
        gamma16CayleyOpenPartialHomeomorph (g⁻¹ * (h * gamma16CayleyChartInv c)) :=
      gamma16SOLeftTranslatedChart_transition_apply g h c
    _ = gamma16CayleyBackwardAmbientCoordinates
        ((g⁻¹ * (h * gamma16CayleyChartInv c) : SO) : M) :=
      gamma16CayleyChart_eq_ambient_on_target _ hdom.2
    _ = gamma16CayleyBackwardAmbientCoordinates (gamma16CayleyTransitionMatrix g h c) :=
      congrArg gamma16CayleyBackwardAmbientCoordinates
        (gamma16CayleyTransitionMatrix_eq_native g h c hdom.1).symm

/-- Ambient composition regularity on the exact native overlap. -/
theorem gamma16CayleyTransitionAmbient_contDiffOn (n : ℕ∞ω) (g h : SO) :
    ContDiffOn ℝ n
      (gamma16CayleyBackwardAmbientCoordinates ∘ gamma16CayleyTransitionMatrix g h)
      (overlap g h) := by
  intro c hc
  have hdom := gamma16CayleyTransition_overlap_conditions g h c hc
  have hinner : ContDiffAt ℝ n (gamma16CayleyTransitionMatrix g h) c :=
    gamma16CayleyTransitionMatrix_contDiffAt n g h c hdom.1
  have hden : (gamma16CayleyTransitionMatrix g h c + 1).det ≠ 0 :=
    gamma16CayleyTransitionMatrix_mapsTo_backwardDomain g h hc
  have houter : ContDiffAt ℝ n gamma16CayleyBackwardAmbientCoordinates
      (gamma16CayleyTransitionMatrix g h c) :=
    gamma16CayleyBackwardAmbientCoordinates_contDiffAt n _ hden
  exact (houter.comp c hinner).contDiffWithinAt

/-- Actual native chart transitions are smooth on their existing open-partial-homeomorph overlaps. -/
theorem gamma16SOLeftTranslatedChart_transition_contDiffOn (n : ℕ∞ω) (g h : SO) :
    ContDiffOn ℝ n
      (fun c : Q => gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c))
      (overlap g h) :=
  (gamma16CayleyTransitionAmbient_contDiffOn n g h).congr
    (fun c hc => gamma16SOLeftTranslatedChart_transition_eq_ambient g h c hc)

local instance f10dtLocalChartedSpace : ChartedSpace Q SO := gamma16SOTranslatedChartedSpace

/-- Every pair of charts in the same original named target atlas has exact-overlap regularity. -/
theorem gamma16SOTranslatedAtlas_contDiffOn (n : ℕ∞ω)
    (e e' : OpenPartialHomeomorph SO Q) (he : e ∈ atlas Q SO) (he' : e' ∈ atlas Q SO) :
    ContDiffOn ℝ n (fun c : Q => e' (e.symm c)) (e.symm.trans e').source := by
  change e ∈ Set.range gamma16SOLeftTranslatedChart at he
  change e' ∈ Set.range gamma16SOLeftTranslatedChart at he'
  rcases he with ⟨h, rfl⟩
  rcases he' with ⟨g, rfl⟩
  exact gamma16SOLeftTranslatedChart_transition_contDiffOn n g h

/-- Mathlib's manifold property for the unchanged named target atlas at every regularity order. -/
theorem gamma16SOTranslatedAtlas_isManifold (n : ℕ∞ω) :
    IsManifold (modelWithCornersSelf ℝ Q) n SO := by
  apply isManifold_of_contDiffOn (modelWithCornersSelf ℝ Q) n SO
  intro e e' he he'
  have htransition : (id ∘ (e.symm.trans e' : Q → Q) ∘ id) =
      (fun c : Q => e' (e.symm c)) := by
    funext c
    exact OpenPartialHomeomorph.trans_apply e.symm e' (x := c)
  have hc : ContDiffOn ℝ n (id ∘ (e.symm.trans e' : Q → Q) ∘ id)
      (e.symm.trans e').source := by
    rw [htransition]
    exact gamma16SOTranslatedAtlas_contDiffOn n e e' he he'
  simpa only [modelWithCornersSelf_coe, modelWithCornersSelf_coe_symm,
    Set.preimage_id, Set.range_id, Set.inter_univ] using hc

/-- Compatibility with the native C^n structure groupoid of this same target model. -/
theorem gamma16SOTranslatedAtlas_hasGroupoid (n : ℕ∞ω) :
    HasGroupoid SO (contDiffGroupoid n (modelWithCornersSelf ℝ Q)) :=
  (gamma16SOTranslatedAtlas_isManifold n).toHasGroupoid

#print axioms gamma16CayleyChartInv_coe_on_source
#print axioms gamma16CayleyChart_eq_ambient_on_target
#print axioms gamma16CayleyTransitionMatrix
#print axioms gamma16CayleyTransitionMatrix_eq_native
#print axioms gamma16CayleyTransitionMatrix_contDiffAt
#print axioms gamma16CayleyTransition_overlap_conditions
#print axioms gamma16CayleyTransitionMatrix_mapsTo_backwardDomain
#print axioms gamma16SOLeftTranslatedChart_transition_eq_ambient
#print axioms gamma16CayleyTransitionAmbient_contDiffOn
#print axioms gamma16SOLeftTranslatedChart_transition_contDiffOn
#print axioms gamma16SOTranslatedAtlas_contDiffOn
#print axioms gamma16SOTranslatedAtlas_isManifold
#print axioms gamma16SOTranslatedAtlas_hasGroupoid
end
end FCP.BFSSPairedSpin9Clifford
