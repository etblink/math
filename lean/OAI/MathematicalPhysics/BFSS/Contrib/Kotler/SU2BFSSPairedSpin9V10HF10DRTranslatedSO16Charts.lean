import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DQCayleySO16OpenPartialHomeomorph
import Mathlib.Geometry.Manifold.ChartedSpace

/-! F10DR: translated Cayley charts covering the original native SO(16).
Prove topological-group continuity in the existing matrix-subtype topology, then reuse
F10DE's accepted translation construction with the exact F10DQ chart and its 120 coordinates.
Expose the inverse, overlap formula and exact overlap source; package a named covering atlas.
No global charted-space instance, smooth compatibility, IsManifold, derivative normalization,
intrinsic tangent identification, Lie-group structure or representation differential is asserted.
Candidate until complete strict source compilation and independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology Matrix.Norms.Elementwise

private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ

/-- Native group inversion is literally transpose on the original real matrices. -/
theorem gamma16SO_inv_coe_eq_transpose (g : SO) :
    ((g⁻¹ : SO) : GammaMatrix) = (g : GammaMatrix).transpose := rfl

/-- Native inversion is continuous for the inherited matrix topology. -/
theorem gamma16SO_inv_continuous : Continuous (fun g : SO => g⁻¹) := by
  have hcoerced : Continuous (fun g : SO => ((g⁻¹ : SO) : GammaMatrix)) := by
    have hfun : (fun g : SO => ((g⁻¹ : SO) : GammaMatrix)) =
        (fun g : SO => (g : GammaMatrix).transpose) := by
      funext g
      exact gamma16SO_inv_coe_eq_transpose g
    rw [hfun]
    exact continuous_subtype_val.matrix_transpose
  exact continuous_induced_rng.mpr hcoerced

/-- Native multiplication is jointly continuous for the inherited matrix topology. -/
theorem gamma16SO_mul_continuous : Continuous (fun gh : SO × SO => gh.1 * gh.2) := by
  apply continuous_induced_rng.mpr
  change Continuous (fun gh : SO × SO => (gh.1 : GammaMatrix) * (gh.2 : GammaMatrix))
  exact (continuous_subtype_val.comp continuous_fst).mul
    (continuous_subtype_val.comp continuous_snd)

/-- The existing native SO(16) group is topological, without changing its topology or norm. -/
theorem gamma16SO_isTopologicalGroup : IsTopologicalGroup SO where
  continuous_mul := gamma16SO_mul_continuous
  continuous_inv := gamma16SO_inv_continuous

local instance f10drLocalTopologicalGroup : IsTopologicalGroup SO := gamma16SO_isTopologicalGroup

/-- Left translate the accepted Cayley identity chart in the unchanged native matrix-subtype topology. -/
noncomputable def gamma16SOLeftTranslatedChart (g : SO) :
    OpenPartialHomeomorph (SO) (Q) :=
  (Homeomorph.mulLeft g⁻¹).transOpenPartialHomeomorph gamma16CayleyOpenPartialHomeomorph

theorem gamma16SOLeftTranslatedChart_source (g : SO) :
    (gamma16SOLeftTranslatedChart g).source =
      (fun h : SO => g⁻¹ * h) ⁻¹' gamma16CayleyOpenPartialHomeomorph.source := rfl

theorem gamma16SOLeftTranslatedChart_target (g : SO) :
    (gamma16SOLeftTranslatedChart g).target = gamma16CayleyOpenPartialHomeomorph.target :=
  Homeomorph.transOpenPartialHomeomorph_target
    (Homeomorph.mulLeft g⁻¹) gamma16CayleyOpenPartialHomeomorph

theorem gamma16SOLeftTranslatedChart_apply (g h : SO) :
    gamma16SOLeftTranslatedChart g h = gamma16CayleyOpenPartialHomeomorph (g⁻¹ * h) := rfl

theorem gamma16SOLeftTranslatedChart_symm_apply
    (g : SO) (t : Q) :
    (gamma16SOLeftTranslatedChart g).symm t = g * gamma16CayleyChartInv t :=
  congrArg (fun h : SO => h * gamma16CayleyChartInv t) (inv_inv g)

theorem gamma16SOLeftTranslatedChart_self_mem_source (g : SO) :
    g ∈ (gamma16SOLeftTranslatedChart g).source := by
  simpa only [gamma16SOLeftTranslatedChart_source, Set.mem_preimage, inv_mul_cancel]
    using gamma16CayleyOpenPartialHomeomorph_source_one

theorem gamma16SOLeftTranslatedChart_self (g : SO) :
    gamma16SOLeftTranslatedChart g g = 0 :=
  (congrArg (fun h : SO => gamma16CayleyOpenPartialHomeomorph h)
    (inv_mul_cancel g)).trans gamma16CayleyOpenPartialHomeomorph_one

/-- A covering topological atlas value; no global instance or smoothness data is installed. -/
@[instance_reducible]
noncomputable def gamma16SOTranslatedChartedSpace :
    ChartedSpace (Q) (SO) where
  atlas := Set.range gamma16SOLeftTranslatedChart
  chartAt := gamma16SOLeftTranslatedChart
  mem_chart_source := gamma16SOLeftTranslatedChart_self_mem_source
  chart_mem_atlas g := ⟨g, rfl⟩

/-- Total transition function formula, separate from its restricted source domain and regularity. -/
theorem gamma16SOLeftTranslatedChart_transition_apply
    (g h : SO) (t : Q) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm t) =
      gamma16CayleyOpenPartialHomeomorph (g⁻¹ * (h * gamma16CayleyChartInv t)) :=
  (gamma16SOLeftTranslatedChart_apply g _).trans
    (congrArg (fun k : SO => gamma16CayleyOpenPartialHomeomorph (g⁻¹ * k))
      (gamma16SOLeftTranslatedChart_symm_apply h t))

/-- The exact overlap source for transition from h-coordinates to g-coordinates. -/
theorem gamma16SOLeftTranslatedChart_transition_source
    (g h : SO) :
    ((gamma16SOLeftTranslatedChart h).symm.trans (gamma16SOLeftTranslatedChart g)).source =
      gamma16CayleyOpenPartialHomeomorph.target ∩
        (fun t : Q => g⁻¹ * (h * gamma16CayleyChartInv t)) ⁻¹'
          gamma16CayleyOpenPartialHomeomorph.source := by
  ext t
  simp only [OpenPartialHomeomorph.trans_source, OpenPartialHomeomorph.symm_source,
    gamma16SOLeftTranslatedChart_target, gamma16SOLeftTranslatedChart_source,
    Set.mem_inter_iff, Set.mem_preimage, gamma16SOLeftTranslatedChart_symm_apply]

#print axioms gamma16SO_inv_coe_eq_transpose
#print axioms gamma16SO_inv_continuous
#print axioms gamma16SO_mul_continuous
#print axioms gamma16SO_isTopologicalGroup
#print axioms gamma16SOLeftTranslatedChart
#print axioms gamma16SOLeftTranslatedChart_source
#print axioms gamma16SOLeftTranslatedChart_target
#print axioms gamma16SOLeftTranslatedChart_apply
#print axioms gamma16SOLeftTranslatedChart_symm_apply
#print axioms gamma16SOLeftTranslatedChart_self_mem_source
#print axioms gamma16SOLeftTranslatedChart_self
#print axioms gamma16SOTranslatedChartedSpace
#print axioms gamma16SOLeftTranslatedChart_transition_apply
#print axioms gamma16SOLeftTranslatedChart_transition_source
end
end FCP.BFSSPairedSpin9Clifford
