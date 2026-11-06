import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DPCayleySO16DomainHomeomorph
import Mathlib.Topology.OpenPartialHomeomorph.Defs

/-! F10DQ: an actual open partial homeomorphism from native SO(16) to its 120 coordinates.
Reuse the accepted two-sided Cayley laws and subtype continuity on the exact determinant domains.
The total functions have fixed default values away from their specified domains; only the proved
open source/target carry the inverse and continuity assertions. No translated atlas, smoothness,
derivative normalization, intrinsic tangent identification or Lie-group structure is asserted.
Candidate until strict source compilation and complete independent consumer audit. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology Matrix.Norms.Elementwise

private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev U := gamma16CayleySource
private abbrev V := gamma16CayleyTarget

/-- The actual accepted backward coordinates on V, extended by zero outside V. -/
noncomputable def gamma16CayleyChart (r : SO) : Q := by
  classical
  exact if h : r ∈ V then gamma16CayleyBackwardCoordinates ⟨r, h⟩ else 0

/-- The actual accepted group-valued forward Cayley map on U, extended by identity outside U. -/
noncomputable def gamma16CayleyChartInv (c : Q) : SO := by
  classical
  exact if h : c ∈ U then gamma16CayleySO ⟨c, h⟩ else 1

theorem gamma16CayleyChart_apply (r : SO) (hr : r ∈ V) :
    gamma16CayleyChart r = gamma16CayleyBackwardCoordinates ⟨r, hr⟩ := by
  classical
  simp only [gamma16CayleyChart, dif_pos hr]

theorem gamma16CayleyChartInv_apply (c : Q) (hc : c ∈ U) :
    gamma16CayleyChartInv c = gamma16CayleySO ⟨c, hc⟩ := by
  classical
  simp only [gamma16CayleyChartInv, dif_pos hc]

theorem gamma16CayleyChart_mem_target (r : SO) (hr : r ∈ V) :
    gamma16CayleyChart r ∈ U := by
  rw [gamma16CayleyChart_apply r hr]
  exact gamma16CayleyBackward_mem_source ⟨r, hr⟩

theorem gamma16CayleyChartInv_mem_source (c : Q) (hc : c ∈ U) :
    gamma16CayleyChartInv c ∈ V := by
  rw [gamma16CayleyChartInv_apply c hc]
  exact gamma16CayleyForward_mem_target ⟨c, hc⟩

theorem gamma16CayleyChart_left_inv (r : SO) (hr : r ∈ V) :
    gamma16CayleyChartInv (gamma16CayleyChart r) = r := by
  have hu : gamma16CayleyBackwardCoordinates ⟨r, hr⟩ ∈ U :=
    gamma16CayleyBackward_mem_source ⟨r, hr⟩
  rw [gamma16CayleyChart_apply r hr, gamma16CayleyChartInv_apply _ hu]
  exact gamma16CayleyForwardSO_backward ⟨r, hr⟩

theorem gamma16CayleyChart_right_inv (c : Q) (hc : c ∈ U) :
    gamma16CayleyChart (gamma16CayleyChartInv c) = c := by
  have hv : gamma16CayleySO ⟨c, hc⟩ ∈ V := gamma16CayleyForward_mem_target ⟨c, hc⟩
  rw [gamma16CayleyChartInv_apply c hc, gamma16CayleyChart_apply _ hv]
  exact gamma16CayleyBackwardCoordinates_forward ⟨c, hc⟩

theorem gamma16CayleyChart_continuousOn : ContinuousOn gamma16CayleyChart V := by
  apply continuousOn_iff_continuous_domRestrict.mpr
  have hfun : V.domRestrict gamma16CayleyChart = gamma16CayleyBackwardCoordinates := by
    funext r
    exact gamma16CayleyChart_apply r.val r.property
  rw [hfun]
  exact gamma16CayleyBackwardCoordinates_continuous

theorem gamma16CayleyChartInv_continuousOn : ContinuousOn gamma16CayleyChartInv U := by
  apply continuousOn_iff_continuous_domRestrict.mpr
  have hfun : U.domRestrict gamma16CayleyChartInv = gamma16CayleySO := by
    funext c
    exact gamma16CayleyChartInv_apply c.val c.property
  rw [hfun]
  exact gamma16CayleySO_continuous

theorem gamma16CayleyChart_one : gamma16CayleyChart (1 : SO) = 0 := by
  rw [gamma16CayleyChart_apply 1 gamma16CayleyTarget_one]
  exact gamma16CayleyBackwardCoordinates_one

theorem gamma16CayleyChartInv_zero : gamma16CayleyChartInv (0 : Q) = 1 := by
  rw [gamma16CayleyChartInv_apply 0 gamma16CayleySource_zero]
  apply Subtype.ext
  exact (gamma16CayleySO_apply ⟨0, gamma16CayleySource_zero⟩).trans gamma16CayleyMatrix_zero

/-- An open partial homeomorphism on the original SO(16), oriented as a coordinate chart. -/
noncomputable def gamma16CayleyOpenPartialHomeomorph : OpenPartialHomeomorph SO Q where
  toFun := gamma16CayleyChart
  invFun := gamma16CayleyChartInv
  source := V
  target := U
  map_source' := by
    intro r hr
    exact gamma16CayleyChart_mem_target r hr
  map_target' := by
    intro c hc
    exact gamma16CayleyChartInv_mem_source c hc
  left_inv' := by
    intro r hr
    exact gamma16CayleyChart_left_inv r hr
  right_inv' := by
    intro c hc
    exact gamma16CayleyChart_right_inv c hc
  continuousOn_toFun := gamma16CayleyChart_continuousOn
  continuousOn_invFun := gamma16CayleyChartInv_continuousOn
  open_source := gamma16CayleyTarget_isOpen
  open_target := gamma16CayleySource_isOpen

theorem gamma16CayleyOpenPartialHomeomorph_source :
    gamma16CayleyOpenPartialHomeomorph.source = V := rfl

theorem gamma16CayleyOpenPartialHomeomorph_target :
    gamma16CayleyOpenPartialHomeomorph.target = U := rfl

theorem gamma16CayleyOpenPartialHomeomorph_apply (r : SO) :
    gamma16CayleyOpenPartialHomeomorph r = gamma16CayleyChart r := rfl

theorem gamma16CayleyOpenPartialHomeomorph_symm_apply (c : Q) :
    gamma16CayleyOpenPartialHomeomorph.symm c = gamma16CayleyChartInv c := rfl

theorem gamma16CayleyOpenPartialHomeomorph_one :
    gamma16CayleyOpenPartialHomeomorph (1 : SO) = 0 := gamma16CayleyChart_one

theorem gamma16CayleyOpenPartialHomeomorph_symm_zero :
    gamma16CayleyOpenPartialHomeomorph.symm (0 : Q) = 1 := gamma16CayleyChartInv_zero

theorem gamma16CayleyOpenPartialHomeomorph_source_one :
    (1 : SO) ∈ gamma16CayleyOpenPartialHomeomorph.source := gamma16CayleyTarget_one

theorem gamma16CayleyOpenPartialHomeomorph_target_zero :
    (0 : Q) ∈ gamma16CayleyOpenPartialHomeomorph.target := gamma16CayleySource_zero

#print axioms gamma16CayleyChart
#print axioms gamma16CayleyChartInv
#print axioms gamma16CayleyChart_apply
#print axioms gamma16CayleyChartInv_apply
#print axioms gamma16CayleyChart_mem_target
#print axioms gamma16CayleyChartInv_mem_source
#print axioms gamma16CayleyChart_left_inv
#print axioms gamma16CayleyChart_right_inv
#print axioms gamma16CayleyChart_continuousOn
#print axioms gamma16CayleyChartInv_continuousOn
#print axioms gamma16CayleyChart_one
#print axioms gamma16CayleyChartInv_zero
#print axioms gamma16CayleyOpenPartialHomeomorph
#print axioms gamma16CayleyOpenPartialHomeomorph_source
#print axioms gamma16CayleyOpenPartialHomeomorph_target
#print axioms gamma16CayleyOpenPartialHomeomorph_apply
#print axioms gamma16CayleyOpenPartialHomeomorph_symm_apply
#print axioms gamma16CayleyOpenPartialHomeomorph_one
#print axioms gamma16CayleyOpenPartialHomeomorph_symm_zero
#print axioms gamma16CayleyOpenPartialHomeomorph_source_one
#print axioms gamma16CayleyOpenPartialHomeomorph_target_zero
end
end FCP.BFSSPairedSpin9Clifford
