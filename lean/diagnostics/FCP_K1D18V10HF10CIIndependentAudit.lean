import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CIActualWordImageHomeomorph
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditWordImagePBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditWordImagePBWCoordinates.toAddMonoidHom auditWordImagePBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditWordImagePBWCoordinates

@[instance_reducible] private def auditWordImageParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditWordImageSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditWordImagePBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
      auditWordImagePBWCoordinates.toAddMonoidHom auditWordImagePBWCoordinates.injective := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditWordImageParameterTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditWordImageSpinTopology := rfl
example : (inferInstance : TopologicalSpace source9OrderedUpperCoordinateLocalHomeomorph.source) =
    TopologicalSpace.induced
      (Subtype.val : source9OrderedUpperCoordinateLocalHomeomorph.source → (Fin 36 → ℝ))
      auditWordImageParameterTopology := rfl
example : (inferInstance : TopologicalSpace source9OrderedStrictPlaneWordLocalImage) =
    TopologicalSpace.induced
      (Subtype.val : source9OrderedStrictPlaneWordLocalImage → spinGroup source9Quadratic)
      auditWordImageSpinTopology := rfl

example (g : spinGroup source9Quadratic) : Fin 36 → ℝ := source9SpinUpperCoordinates g
example (g : spinGroup source9Quadratic) (i : Fin 36) :
    source9SpinUpperCoordinates g i =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
        (source9StrictPlaneRow i) (source9StrictPlaneColumn i) :=
  source9OrderedUpperProjection_apply _ i
example : Continuous source9SpinUpperCoordinates := source9SpinUpperCoordinates_continuous_pbw
example : Continuous source9OrderedStrictPlaneWord := source9OrderedStrictPlaneWord_continuous_pbw
example : source9OrderedStrictPlaneWordLocalImage =
    source9OrderedStrictPlaneWord '' source9OrderedUpperCoordinateLocalHomeomorph.source := rfl
example : (1 : spinGroup source9Quadratic) ∈ source9OrderedStrictPlaneWordLocalImage :=
  ⟨0, source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source,
    source9OrderedStrictPlaneWord_zero⟩
example (t : Fin 36 → ℝ) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    source9OrderedUpperCoordinateLocalHomeomorph.symm
      (source9SpinUpperCoordinates (source9OrderedStrictPlaneWord t)) = t :=
  source9OrderedStrictPlaneWord_coordinate_recovery t ht

example : source9OrderedUpperCoordinateLocalHomeomorph.source ≃ₜ
    (source9OrderedStrictPlaneWord '' source9OrderedUpperCoordinateLocalHomeomorph.source) :=
  source9OrderedStrictPlaneWordImageHomeomorph
example : Continuous source9OrderedStrictPlaneWordImageHomeomorph :=
  source9OrderedStrictPlaneWordImageHomeomorph.continuous
example : Continuous source9OrderedStrictPlaneWordImageHomeomorph.symm :=
  source9OrderedStrictPlaneWordImageHomeomorph.continuous_symm
example (t : source9OrderedUpperCoordinateLocalHomeomorph.source) :
    (source9OrderedStrictPlaneWordImageHomeomorph t : spinGroup source9Quadratic) =
      source9OrderedStrictPlaneWord t.val := source9OrderedStrictPlaneWordImageHomeomorph_apply t
example (t : source9OrderedUpperCoordinateLocalHomeomorph.source) :
    (source9OrderedStrictPlaneWordImageHomeomorph t : spinGroup source9Quadratic) =
      ((List.finRange 36).map (fun i => source9PlaneSpinCurve (source9StrictPlaneRow i)
        (source9StrictPlaneColumn i) (source9StrictPlaneEnumeration_ne i) (t.val i))).prod :=
  (source9OrderedStrictPlaneWordImageHomeomorph_apply t).trans
    (source9PlaneSpinWord_eq_listProd source9StrictPlaneRow source9StrictPlaneColumn
      source9StrictPlaneEnumeration_ne t.val (List.finRange 36))
example (g : source9OrderedStrictPlaneWordLocalImage) :
    (source9OrderedStrictPlaneWordImageHomeomorph.symm g : Fin 36 → ℝ) =
      source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g.val) :=
  source9OrderedStrictPlaneWordImageHomeomorph_symm_apply g

private theorem auditWordImageActualCoordinates_eq (g : spinGroup source9Quadratic) :
    source9SpinUpperCoordinates g = (fun i : Fin 36 =>
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
        (source9StrictPlaneRow i) (source9StrictPlaneColumn i)) := by
  funext i
  exact source9OrderedUpperProjection_apply _ i
example (g : source9OrderedStrictPlaneWordLocalImage) :
    (source9OrderedStrictPlaneWordImageHomeomorph.symm g : Fin 36 → ℝ) =
      source9OrderedUpperCoordinateLocalHomeomorph.symm (fun i : Fin 36 =>
        ((source9SpinVectorOrthogonalHom g.val) : Matrix SpaceIndex SpaceIndex ℝ)
          (source9StrictPlaneRow i) (source9StrictPlaneColumn i)) :=
  (source9OrderedStrictPlaneWordImageHomeomorph_symm_apply g).trans
    (congrArg (fun y : Fin 36 → ℝ => source9OrderedUpperCoordinateLocalHomeomorph.symm y)
      (auditWordImageActualCoordinates_eq g.val))
example (t : source9OrderedUpperCoordinateLocalHomeomorph.source) :
    source9OrderedStrictPlaneWordImageHomeomorph.symm
      (source9OrderedStrictPlaneWordImageHomeomorph t) = t :=
  source9OrderedStrictPlaneWordImageHomeomorph.symm_apply_apply t
example (g : source9OrderedStrictPlaneWordLocalImage) :
    source9OrderedStrictPlaneWordImageHomeomorph
      (source9OrderedStrictPlaneWordImageHomeomorph.symm g) = g :=
  source9OrderedStrictPlaneWordImageHomeomorph.apply_symm_apply g
example (g : spinGroup source9Quadratic) (hg : g ∈ source9OrderedStrictPlaneWordLocalImage) :
    source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) = g := by
  have h := congrArg (fun h : source9OrderedStrictPlaneWordLocalImage => h.val)
    (source9OrderedStrictPlaneWordImageHomeomorph.apply_symm_apply ⟨g, hg⟩)
  change source9OrderedStrictPlaneWord
    (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) = g at h
  exact h

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinUpperCoordinates
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinUpperCoordinates_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_continuous_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordLocalImage
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_coordinate_recovery
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordImageHomeomorph
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordImageHomeomorph_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordImageHomeomorph_symm_apply
end
