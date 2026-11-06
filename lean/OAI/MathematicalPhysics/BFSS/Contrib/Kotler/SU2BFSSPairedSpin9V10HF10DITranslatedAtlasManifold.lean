import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DHTranslatedTransitionRegularity
import Mathlib.Geometry.Manifold.IsManifold.Basic

/-! F10DI: package the accepted exact-overlap transitions for the existing named atlas.
The original source carrier, inherited PBW topology and translated charts are unchanged.
Only local registrations of the accepted norm values and named atlas are used.
No global manifold instance, Lie-group structure, tangent identification or representation
manifold differential is asserted. Candidate until the full strict source/audit gate passes. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped ContDiff Topology Matrix.Norms.Elementwise

local instance f10diLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10diLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10diLocalChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic

/-- Every pair in the actual named atlas has the accepted regularity on its exact overlap. -/
theorem source9SpinTranslatedAtlas_contDiffOn (n : ℕ∞ω)
    (e e' : OpenPartialHomeomorph G P) (he : e ∈ atlas P G) (he' : e' ∈ atlas P G) :
    ContDiffOn ℝ n (fun t : P => e' (e.symm t)) (e.symm.trans e').source := by
  change e ∈ Set.range source9SpinLeftTranslatedChart at he
  change e' ∈ Set.range source9SpinLeftTranslatedChart at he'
  rcases he with ⟨h, rfl⟩
  rcases he' with ⟨g, rfl⟩
  exact source9SpinLeftTranslatedChart_transition_contDiffOn n g h

/-- The same named atlas satisfies Mathlib's manifold property at every regularity order. -/
theorem source9SpinTranslatedAtlas_isManifold (n : ℕ∞ω) :
    IsManifold (modelWithCornersSelf ℝ P) n G := by
  apply isManifold_of_contDiffOn (modelWithCornersSelf ℝ P) n G
  intro e e' he he'
  have htransition : (id ∘ (e.symm.trans e' : P → P) ∘ id) =
      (fun t : P => e' (e.symm t)) := by
    funext t
    exact OpenPartialHomeomorph.trans_apply e.symm e' (x := t)
  have hc : ContDiffOn ℝ n (id ∘ (e.symm.trans e' : P → P) ∘ id)
      (e.symm.trans e').source := by
    rw [htransition]
    exact source9SpinTranslatedAtlas_contDiffOn n e e' he he'
  simpa only [modelWithCornersSelf_coe, modelWithCornersSelf_coe_symm,
    Set.preimage_id, Set.range_id, Set.inter_univ]
    using hc

/-- Expose compatibility with the native C^n structure groupoid for the unchanged atlas. -/
theorem source9SpinTranslatedAtlas_hasGroupoid (n : ℕ∞ω) :
    HasGroupoid G (contDiffGroupoid n (modelWithCornersSelf ℝ P)) :=
  (source9SpinTranslatedAtlas_isManifold n).toHasGroupoid

#print axioms source9SpinTranslatedAtlas_contDiffOn
#print axioms source9SpinTranslatedAtlas_isManifold
#print axioms source9SpinTranslatedAtlas_hasGroupoid
end
end FCP.BFSSPairedSpin9Clifford
