import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerWords
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSpinWordContinuity
import Mathlib.Analysis.Normed.Module.Connected

/-!
Candidate path connectedness of the ACTUAL original ninth-axis stabilizer.
Use the original perpendicular Q-unit parameters and the restricted existing
continuous eight-word formula. The original source PBW topology is enabled
only through its two existing named values, locally. No covering, Spin(8)
classification, root-data binding, Fock action or spectral conclusion.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerConnectedness
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineAxisStabilizerWords
open FCP.BFSSSourceNineEvenListLift FCP.BFSSSourceNineEightInputSpinMap
open FCP.BFSSSourceNineSpinWordContinuity Submodule

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : V ≃ₗ[ℝ] Euc9 := source9ToEuclidean
private abbrev U := {u : V // source9Quadratic u = 1 ∧ u 8 = 0}
private abbrev P := Fin 8 → U
private abbrev G := spinGroup source9Quadratic

/-- The perpendicular subspace is inside the original same-label Euclidean nine-space. -/
noncomputable def source9Axis8Perpendicular : Submodule ℝ Euc9 :=
  (ℝ ∙ E (source9CoordinateVector 8))ᗮ

/-- Its dimension is exactly eight; the original axis is nonzero. -/
theorem source9Axis8Perpendicular_finrank :
    Module.finrank ℝ source9Axis8Perpendicular = 8 := by
  have he0 : source9CoordinateVector (8 : SpaceIndex) ≠ 0 := by
    intro he
    have hc := congrFun he (8 : SpaceIndex)
    norm_num [source9CoordinateVector] at hc
  have hE0 : E (source9CoordinateVector 8) ≠ 0 := by
    intro he
    exact he0 (E.injective (he.trans (map_zero E).symm))
  let : Fact (Module.finrank ℝ Euc9 = 8 + 1) := ⟨by simp [Euc9, SpaceIndex]⟩
  exact Submodule.finrank_orthogonal_span_singleton (n := 8) hE0

/-- The original perpendicular Q-unit locus is exactly the transported subspace sphere. -/
theorem source9Axis8PerpendicularSphere_image :
    (fun x : source9Axis8Perpendicular => E.symm (x : Euc9)) ''
        Metric.sphere (0 : source9Axis8Perpendicular) 1 =
      {u : V | source9Quadratic u = 1 ∧ u 8 = 0} := by
  ext u
  constructor
  · rintro ⟨x, hx, rfl⟩
    have hn : ‖(x : Euc9)‖ = 1 := by
      have hxnorm : ‖x‖ = 1 := by
        simpa only [Metric.mem_sphere, dist_zero_right] using hx
      exact (Submodule.norm_coe x).trans hxnorm
    have horth : inner ℝ (E (source9CoordinateVector 8)) (x : Euc9) = 0 :=
      x.property _ (Submodule.mem_span_singleton_self _)
    refine ⟨?_, ?_⟩
    · rw [source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply, hn]
      norm_num
    · have hc := source9Axis8_inner (E.symm (x : Euc9))
      rw [E.apply_symm_apply] at hc
      exact hc.symm.trans horth
  · intro hu
    have horth : E u ∈ source9Axis8Perpendicular := by
      apply Submodule.mem_orthogonal_singleton_iff_inner_right.mpr
      exact (source9Axis8_inner u).trans hu.2
    refine ⟨⟨E u, horth⟩, ?_, E.symm_apply_apply u⟩
    have hn : ‖E u‖ = 1 := by
      have hsq : ‖E u‖ ^ 2 = 1 := by
        rw [← source9Quadratic_eq_euclidean_norm_sq, hu.1]
      nlinarith [norm_nonneg (E u)]
    change dist (⟨E u, horth⟩ : source9Axis8Perpendicular) 0 = 1
    rw [dist_zero_right]
    exact hn

/-- Path connectedness holds in the ORIGINAL source-coordinate topology. -/
theorem source9Axis8QUnit_isPathConnected :
    IsPathConnected {u : V | source9Quadratic u = 1 ∧ u 8 = 0} := by
  have hrank : 1 < Module.rank ℝ source9Axis8Perpendicular := by
    rw [← Module.finrank_eq_rank, source9Axis8Perpendicular_finrank]
    norm_num
  have hsphere : IsPathConnected (Metric.sphere (0 : source9Axis8Perpendicular) 1) :=
    isPathConnected_sphere hrank 0 (by norm_num)
  have hf : Continuous (fun x : source9Axis8Perpendicular => E.symm (x : Euc9)) :=
    E.symm.toContinuousLinearEquiv.continuous.comp continuous_subtype_val
  rw [← source9Axis8PerpendicularSphere_image]
  exact hsphere.image hf

/-- Named value for the existing perpendicular Q-unit subtype topology, not a global instance. -/
theorem source9Axis8QUnit_pathConnectedSpace : PathConnectedSpace U :=
  isPathConnected_iff_pathConnectedSpace.mp source9Axis8QUnit_isPathConnected

/-- Restrict the EXISTING original eight-word map to perpendicular Q-unit inputs. -/
noncomputable def source9Axis8EightUnitSpinWord (w : P) : G :=
  source9EightUnitSpinWord (fun i => ⟨(w i).val, (w i).property.1⟩)

/-- Each restricted word lies in the actual original source stabilizer. -/
theorem source9Axis8EightUnitSpinWord_mem (w : P) :
    source9SpinVectorRepresentation (source9Axis8EightUnitSpinWord w)
      (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  apply (source9Axis8Stabilizer_perpendicularWord _).mpr
  refine ⟨fun i => (w i).val, fun i => (w i).property.1, fun i => (w i).property.2, ?_⟩
  exact source9EightUnitSpinWord_coe (fun i => ⟨(w i).val, (w i).property.1⟩)

/-- The restricted map attains exactly the actual source fixed-axis locus, with both signs. -/
theorem source9Axis8EightUnitSpinWord_range :
    Set.range source9Axis8EightUnitSpinWord =
      {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
        source9CoordinateVector 8} := by
  ext g
  constructor
  · rintro ⟨w, rfl⟩
    exact source9Axis8EightUnitSpinWord_mem w
  · intro hg
    obtain ⟨w, hu, hs, hw⟩ := (source9Axis8Stabilizer_perpendicularWord g).mp hg
    let p : P := fun i => ⟨w i, hu i, hs i⟩
    refine ⟨p, ?_⟩
    apply Subtype.ext
    have hp : (source9Axis8EightUnitSpinWord p : CliffordAlgebra source9Quadratic) =
        source9CliffordWord (List.ofFn (fun i => (p i).val)) :=
      source9EightUnitSpinWord_coe (fun i => ⟨(p i).val, (p i).property.1⟩)
    exact hp.trans hw.symm

/-- The restriction is continuous into the literal source Spin group in its existing PBW topology. -/
theorem source9Axis8EightUnitSpinWord_continuous_pbw :
    Continuous source9Axis8EightUnitSpinWord := by
  have hp : Continuous (fun w : P =>
      (fun i => ⟨(w i).val, (w i).property.1⟩ :
        Fin 8 → {u : V // source9Quadratic u = 1})) := by
    apply continuous_pi
    intro i
    have hi : Continuous (fun w : P => ((w i).val : V)) :=
      continuous_subtype_val.comp (continuous_apply i)
    exact hi.subtype_mk (fun w => (w i).property.1)
  exact source9EightUnitSpinWord_continuous_pbw.comp hp

/-- The eight original perpendicular Q-unit parameters are path connected. -/
theorem source9Axis8EightParameters_isPathConnected : IsPathConnected (Set.univ : Set P) := by
  let : PathConnectedSpace U := source9Axis8QUnit_pathConnectedSpace
  exact isPathConnected_univ

/-- Main result: path connectedness of the actual original ninth-axis stabilizer in PBW topology. -/
theorem source9Axis8Stabilizer_isPathConnected_pbw :
    IsPathConnected {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} := by
  have h := source9Axis8EightParameters_isPathConnected.image
    source9Axis8EightUnitSpinWord_continuous_pbw
  simpa only [Set.image_univ, source9Axis8EightUnitSpinWord_range] using h

/-- The same fixed-axis locus is connected, including the actual negative central sign. -/
theorem source9Axis8Stabilizer_isConnected_pbw :
    IsConnected {g : G | source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} :=
  source9Axis8Stabilizer_isPathConnected_pbw.isConnected

/-- Named path-connected-space value for the literal original stabilizer subtype. -/
theorem source9Axis8Stabilizer_pathConnectedSpace_pbw :
    PathConnectedSpace {g : G // source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} :=
  isPathConnected_iff_pathConnectedSpace.mp source9Axis8Stabilizer_isPathConnected_pbw

#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Perpendicular
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Perpendicular_finrank
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8PerpendicularSphere_image
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8QUnit_isPathConnected
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8QUnit_pathConnectedSpace
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_mem
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_range
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightUnitSpinWord_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8EightParameters_isPathConnected
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_isPathConnected_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_isConnected_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_pathConnectedSpace_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_CONNECTEDNESS_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerConnectedness
