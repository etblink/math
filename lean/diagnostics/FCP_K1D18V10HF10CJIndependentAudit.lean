import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CJCoordinateReconstructionDomain
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditReconstructionPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditReconstructionPBWCoordinates.toAddMonoidHom auditReconstructionPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditReconstructionPBWCoordinates

@[instance_reducible] private def auditReconstructionParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditReconstructionSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditReconstructionPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
      auditReconstructionPBWCoordinates.toAddMonoidHom auditReconstructionPBWCoordinates.injective := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditReconstructionParameterTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditReconstructionSpinTopology := rfl
example : (inferInstance : TopologicalSpace source9OrderedUpperCoordinateLocalHomeomorph.source) =
    TopologicalSpace.induced
      (Subtype.val : source9OrderedUpperCoordinateLocalHomeomorph.source → (Fin 36 → ℝ))
      auditReconstructionParameterTopology := rfl
example : (inferInstance : TopologicalSpace source9OrderedStrictPlaneWordLocalImage) =
    TopologicalSpace.induced
      (Subtype.val : source9OrderedStrictPlaneWordLocalImage → spinGroup source9Quadratic)
      auditReconstructionSpinTopology := rfl

example : (inferInstance : TopologicalSpace source9SpinCoordinateReconstructionDomain) =
    TopologicalSpace.induced
      (Subtype.val : source9SpinCoordinateReconstructionDomain → spinGroup source9Quadratic)
      auditReconstructionSpinTopology := rfl
example : source9SpinCoordinateReconstructionDomain =
    source9SpinUpperCoordinates ⁻¹' source9OrderedUpperCoordinateLocalHomeomorph.target := rfl
example : IsOpen source9SpinCoordinateReconstructionDomain :=
  source9SpinCoordinateReconstructionDomain_isOpen_pbw
example : (1 : spinGroup source9Quadratic) ∈ source9SpinCoordinateReconstructionDomain :=
  source9SpinCoordinateReconstructionDomain_one_mem
example : source9SpinCoordinateReconstructionDomain ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinCoordinateReconstructionDomain_isOpen_pbw.mem_nhds
    source9SpinCoordinateReconstructionDomain_one_mem
example (g : spinGroup source9Quadratic) : source9SpinCoordinateReconstruction g =
    source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g)) := rfl
example : ContinuousOn source9SpinCoordinateReconstruction source9SpinCoordinateReconstructionDomain :=
  source9SpinCoordinateReconstruction_continuousOn_pbw
example : source9OrderedStrictPlaneWordLocalImage ⊆ source9SpinCoordinateReconstructionDomain :=
  source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g) ∈
      source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9OrderedUpperCoordinateLocalHomeomorph.map_target hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9SpinCoordinateReconstruction g ∈ source9OrderedStrictPlaneWordLocalImage :=
  source9SpinCoordinateReconstruction_mem_wordImage g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9SpinUpperCoordinates (source9SpinCoordinateReconstruction g) = source9SpinUpperCoordinates g :=
  source9SpinCoordinateReconstruction_upperCoordinates g hg

private theorem auditReconstructionActualCoordinates_eq (g : spinGroup source9Quadratic) :
    source9SpinUpperCoordinates g = (fun i : Fin 36 =>
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
        (source9StrictPlaneRow i) (source9StrictPlaneColumn i)) := by
  funext i
  exact source9OrderedUpperProjection_apply _ i
example (g : spinGroup source9Quadratic) : source9SpinCoordinateReconstruction g =
    source9OrderedStrictPlaneWord
      (source9OrderedUpperCoordinateLocalHomeomorph.symm (fun i : Fin 36 =>
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
          (source9StrictPlaneRow i) (source9StrictPlaneColumn i))) :=
  congrArg (fun y : Fin 36 → ℝ =>
    source9OrderedStrictPlaneWord (source9OrderedUpperCoordinateLocalHomeomorph.symm y))
      (auditReconstructionActualCoordinates_eq g)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain)
    (i : Fin 36) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g)) :
      Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i) (source9StrictPlaneColumn i) =
    ((source9SpinVectorOrthogonalHom g) :
      Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i) (source9StrictPlaneColumn i) := by
  have hleft := congrFun
    (auditReconstructionActualCoordinates_eq (source9SpinCoordinateReconstruction g)) i
  have hright := congrFun (auditReconstructionActualCoordinates_eq g) i
  have hcoords := congrFun (source9SpinCoordinateReconstruction_upperCoordinates g hg) i
  exact hleft.symm.trans (hcoords.trans hright)
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9SpinCoordinateReconstruction g = g ↔ g ∈ source9OrderedStrictPlaneWordLocalImage :=
  source9SpinCoordinateReconstruction_eq_self_iff g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinCoordinateReconstructionDomain) :
    source9SpinCoordinateReconstruction (source9SpinCoordinateReconstruction g) =
      source9SpinCoordinateReconstruction g := by
  have himage := source9SpinCoordinateReconstruction_mem_wordImage g hg
  exact (source9SpinCoordinateReconstruction_eq_self_iff (source9SpinCoordinateReconstruction g)
    (source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain himage)).2 himage
example (t : Fin 36 → ℝ) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    source9SpinCoordinateReconstruction (source9OrderedStrictPlaneWord t) =
      source9OrderedStrictPlaneWord t := by
  have himage : source9OrderedStrictPlaneWord t ∈ source9OrderedStrictPlaneWordLocalImage :=
    ⟨t, ht, rfl⟩
  exact (source9SpinCoordinateReconstruction_eq_self_iff (source9OrderedStrictPlaneWord t)
    (source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain himage)).2 himage

-- Coverage on any smaller set is exactly the extra source reconstruction identity on that set.
example (V : Set (spinGroup source9Quadratic)) (hV : V ⊆ source9SpinCoordinateReconstructionDomain) :
    V ⊆ source9OrderedStrictPlaneWordLocalImage ↔
      ∀ g ∈ V, source9SpinCoordinateReconstruction g = g := by
  constructor
  · intro himage g hg
    exact (source9SpinCoordinateReconstruction_eq_self_iff g (hV hg)).2 (himage hg)
  · intro hfix g hg
    exact (source9SpinCoordinateReconstruction_eq_self_iff g (hV hg)).1 (hfix g hg)

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstructionDomain
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstructionDomain_isOpen_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstructionDomain_one_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_continuousOn_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_mem_wordImage
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_upperCoordinates
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinCoordinateReconstruction_eq_self_iff
end
