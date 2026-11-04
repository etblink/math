import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditSignsPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditSignsPBWCoordinates.toAddMonoidHom auditSignsPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditSignsPBWCoordinates

@[instance_reducible] private def auditSignsSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditSignsMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditSignsPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditSignsPBWCoordinates.toAddMonoidHom auditSignsPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditSignsPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditSignsSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditSignsMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example (g : spinGroup source9Quadratic) (c : ℝ)
    (hc : (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c) :
    c * c = 1 := source9Spin_scalar_coefficient_square_one g c hc
example (g : spinGroup source9Quadratic) (c : ℝ)
    (hc : (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c) :
    star (g : CliffordAlgebra source9Quadratic) = (g : CliffordAlgebra source9Quadratic) := by
  rw [hc, CliffordAlgebra.star_algebraMap]
example (g : spinGroup source9Quadratic) (c : ℝ)
    (hc : (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c) :
    c = 1 ∨ c = -1 := source9Spin_scalar_coefficient_two_signs g c hc
example (g : spinGroup source9Quadratic)
    (hg : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1) :
    (g : CliffordAlgebra source9Quadratic) = 1 ∨ (g : CliffordAlgebra source9Quadratic) = -1 :=
  source9NaturalKernel_clifford_one_or_neg_one g hg
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      g = 1 ∨ g = source9NegativeCentral := source9NaturalMatrix_eq_one_iff_two_signs g
example (g : spinGroup source9Quadratic) :
    source9SpinVectorOrthogonalHom g = 1 ↔ g = 1 ∨ g = source9NegativeCentral := by
  constructor
  · intro h
    apply (source9NaturalMatrix_eq_one_iff_two_signs g).1
    exact congrArg (fun A : Matrix.orthogonalGroup SpaceIndex ℝ =>
      (A : Matrix SpaceIndex SpaceIndex ℝ)) h
  · intro h
    exact Subtype.ext ((source9NaturalMatrix_eq_one_iff_two_signs g).2 h)
example : ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  source9NegativeCentral_naturalMatrix_one
example (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      (1 : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A i j) source9NegativeCentral_naturalMatrix_one
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
      g = h ∨ g = source9NegativeCentral * h := source9NaturalMatrix_eq_iff_two_sign_fiber g h
example (g h : spinGroup source9Quadratic) :
    source9SpinVectorOrthogonalHom g = source9SpinVectorOrthogonalHom h ↔
      g = h ∨ g = source9NegativeCentral * h := by
  constructor
  · intro hh
    apply (source9NaturalMatrix_eq_iff_two_sign_fiber g h).1
    exact congrArg (fun A : Matrix.orthogonalGroup SpaceIndex ℝ =>
      (A : Matrix SpaceIndex SpaceIndex ℝ)) hh
  · intro hh
    exact Subtype.ext ((source9NaturalMatrix_eq_iff_two_sign_fiber g h).2 hh)
example (g : spinGroup source9Quadratic) : g ≠ source9NegativeCentral * g :=
  source9NaturalMatrix_fiber_signs_distinct g
example (g : spinGroup source9Quadratic) :
    ∃ h : spinGroup source9Quadratic, h ≠ g ∧
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) =
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) :=
  ⟨source9NegativeCentral * g, (source9NaturalMatrix_fiber_signs_distinct g).symm,
    (source9NaturalMatrix_eq_iff_two_sign_fiber (source9NegativeCentral * g) g).2 (Or.inr rfl)⟩
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    source9SpinCoordinateReconstruction g = g ∨
      source9SpinCoordinateReconstruction g = source9NegativeCentral * g :=
  source9Reconstruction_eq_self_or_negative_on_sourceNeighborhood g hg

-- The remaining local obligation is explicit: exclusion of the negative branch gives source recovery.
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (hneg : source9SpinCoordinateReconstruction g ≠ source9NegativeCentral * g) :
    source9SpinCoordinateReconstruction g = g :=
  (source9Reconstruction_eq_self_or_negative_on_sourceNeighborhood g hg).resolve_right hneg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (hneg : source9SpinCoordinateReconstruction g ≠ source9NegativeCentral * g) :
    g ∈ source9OrderedStrictPlaneWordLocalImage :=
  (source9SpinCoordinateReconstruction_eq_self_iff g
    (source9SpinNaturalMatrixRecoveryNeighborhood_conditions g hg).1).1
      ((source9Reconstruction_eq_self_or_negative_on_sourceNeighborhood g hg).resolve_right hneg)

-- Being an exterior scalar is not sufficient for membership in the source Spin group.
example (g : spinGroup source9Quadratic) :
    (g : CliffordAlgebra source9Quadratic) ≠ algebraMap ℝ (CliffordAlgebra source9Quadratic) (2 : ℝ) := by
  intro hc
  have hs := source9Spin_scalar_coefficient_square_one g 2 hc
  norm_num at hs

-- Independently check that the reused negative source sign is different from the identity.
private theorem auditSigns_negative_ne_one : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) := by
  intro heq
  have hc := congrArg (fun g : spinGroup source9Quadratic =>
    (g : CliffordAlgebra source9Quadratic)) heq
  change (-1 : CliffordAlgebra source9Quadratic) = 1 at hc
  have hmap : algebraMap ℝ (CliffordAlgebra source9Quadratic) (-1) =
      algebraMap ℝ (CliffordAlgebra source9Quadratic) 1 := by
    simpa only [map_neg, map_one] using hc
  have hreal : (-1 : ℝ) = 1 :=
    (FaithfulSMul.algebraMap_injective ℝ (CliffordAlgebra source9Quadratic)) hmap
  norm_num at hreal
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  ⟨auditSigns_negative_ne_one, source9NegativeCentral_naturalMatrix_one⟩

#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_scalar_coefficient_square_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_scalar_coefficient_two_signs
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalKernel_clifford_one_or_neg_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_two_signs
#print axioms FCP.BFSSPairedSpin9Clifford.source9NegativeCentral_naturalMatrix_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_two_sign_fiber
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_fiber_signs_distinct
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_not_injective
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_eq_self_or_negative_on_sourceNeighborhood
end
