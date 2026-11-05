import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DITranslatedAtlasManifold

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped ContDiff Topology Matrix.Norms.Elementwise

-- Independently reconstruct the accepted ambient norm before consuming the named atlas.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDIPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDIPBWCoordinates.toAddMonoidHom auditDIPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDIPBWCoordinates

@[instance_reducible] private def auditDISpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDIParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDICliffordTopology :
    TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance

local instance f10diAuditChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev C := CliffordAlgebra source9Quadratic

example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : NormedSpace ℝ C := inferInstance
example : source9PBWCoordinates = auditDIPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    C (Finset SpaceIndex → ℝ)
    auditDIPBWCoordinates.toAddMonoidHom auditDIPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    C (Finset SpaceIndex → ℝ) auditDIPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace G) = auditDISpinTopology := rfl
example : (inferInstance : TopologicalSpace P) = auditDIParameterTopology := rfl
example : (inferInstance : TopologicalSpace C) = auditDICliffordTopology := rfl
example : (inferInstance : TopologicalSpace G) =
    TopologicalSpace.induced (Subtype.val : G → C) auditDICliffordTopology := rfl

-- Fix the atlas data to DE's named value; a different charted-space premise is not assumed.
example : (inferInstance : ChartedSpace P G) = source9SpinTranslatedChartedSpace := rfl
example : atlas P G = Set.range source9SpinLeftTranslatedChart := rfl
example (g : G) : chartAt P g = source9SpinLeftTranslatedChart g := rfl
example : (⋃ g : G, (chartAt P g).source) = Set.univ := iUnion_source_chartAt P G
example (g : G) : IsOpen (chartAt P g).source := (chartAt P g).open_source
example (g : G) : (chartAt P g).target = source9SpinIdentityLocalChart.target :=
  source9SpinLeftTranslatedChart_target g
example : (modelWithCornersSelf ℝ P).Boundaryless := inferInstance

-- Consume each new interface at complete original-group and parameter-model types.
example (n : ℕ∞ω) (e e' : OpenPartialHomeomorph G P)
    (he : e ∈ atlas P G) (he' : e' ∈ atlas P G) :
    ContDiffOn ℝ n (fun t : P => e' (e.symm t)) (e.symm.trans e').source :=
  source9SpinTranslatedAtlas_contDiffOn n e e' he he'
example (n : ℕ∞ω) : IsManifold (modelWithCornersSelf ℝ P) n G :=
  source9SpinTranslatedAtlas_isManifold n
example (n : ℕ∞ω) : HasGroupoid G (contDiffGroupoid n (modelWithCornersSelf ℝ P)) :=
  source9SpinTranslatedAtlas_hasGroupoid n
example : IsManifold (modelWithCornersSelf ℝ P) ω G := source9SpinTranslatedAtlas_isManifold ω
example : IsManifold (modelWithCornersSelf ℝ P) ∞ G := source9SpinTranslatedAtlas_isManifold ∞

-- Native compatibility includes the reverse direction on its own partial-homeomorphism domain.
example (n : ℕ∞ω) (g h : G) :
    ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)) ∈
      contDiffGroupoid n (modelWithCornersSelf ℝ P) := by
  have hh : source9SpinLeftTranslatedChart h ∈ atlas P G := ⟨h, rfl⟩
  have hg : source9SpinLeftTranslatedChart g ∈ atlas P G := ⟨g, rfl⟩
  exact (source9SpinTranslatedAtlas_hasGroupoid n).compatible hh hg
example (n : ℕ∞ω) (g h : G) :
    ((source9SpinLeftTranslatedChart g).symm.trans (source9SpinLeftTranslatedChart h)) ∈
      contDiffGroupoid n (modelWithCornersSelf ℝ P) := by
  have hg : source9SpinLeftTranslatedChart g ∈ atlas P G := ⟨g, rfl⟩
  have hh : source9SpinLeftTranslatedChart h ∈ atlas P G := ⟨h, rfl⟩
  exact (source9SpinTranslatedAtlas_hasGroupoid n).compatible hg hh
example (g h : G) :
    ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)).source =
      source9SpinIdentityLocalChart.target ∩
        (fun t : P => g⁻¹ * (h * source9OrderedStrictPlaneWord t)) ⁻¹'
          source9SpinIdentityLocalChart.source := source9SpinLeftTranslatedChart_transition_source g h
example (g : G) (t : P) (ht : t ∈ (source9SpinLeftTranslatedChart g).target) :
    source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart g).symm t) = t :=
  (source9SpinLeftTranslatedChart g).right_inv ht
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9SpinTranslatedAtlas_contDiffOn
#print axioms source9SpinTranslatedAtlas_isManifold
#print axioms source9SpinTranslatedAtlas_hasGroupoid
end
end FCP.BFSSPairedSpin9Clifford
