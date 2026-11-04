import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CPNaturalActionKernelCommutant
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditKernelPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditKernelPBWCoordinates.toAddMonoidHom auditKernelPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditKernelPBWCoordinates

@[instance_reducible] private def auditKernelSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditKernelMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditKernelPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditKernelPBWCoordinates.toAddMonoidHom auditKernelPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditKernelPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditKernelSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditKernelMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∀ z : SpaceIndex → ℝ, source9SpinVectorConjugation g z = z :=
  source9NaturalMatrix_eq_one_iff_trivialAction g
example (g : spinGroup source9Quadratic) :
    (∀ z : SpaceIndex → ℝ, source9SpinVectorConjugation g z = z) ↔
      ∀ z : SpaceIndex → ℝ,
        (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z =
          CliffordAlgebra.ι source9Quadratic z * (g : CliffordAlgebra source9Quadratic) :=
  source9Spin_trivialAction_iff_generator_commutes g
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∀ z : SpaceIndex → ℝ,
        (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z =
          CliffordAlgebra.ι source9Quadratic z * (g : CliffordAlgebra source9Quadratic) :=
  source9NaturalMatrix_eq_one_iff_generator_commutes g
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∀ x : CliffordAlgebra source9Quadratic,
        (g : CliffordAlgebra source9Quadratic) * x = x * (g : CliffordAlgebra source9Quadratic) :=
  source9NaturalMatrix_eq_one_iff_clifford_commutes g
example (g : spinGroup source9Quadratic)
    (hc : ∀ x : CliffordAlgebra source9Quadratic,
      (g : CliffordAlgebra source9Quadratic) * x = x * (g : CliffordAlgebra source9Quadratic))
    (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      (1 : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A i j)
    ((source9NaturalMatrix_eq_one_iff_clifford_commutes g).2 hc)
example (g : spinGroup source9Quadratic)
    (hm : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1)
    (z : SpaceIndex → ℝ) :
    (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.ι source9Quadratic z :=
  (source9SpinVectorConjugation_ι g z).symm.trans
    (congrArg (CliffordAlgebra.ι source9Quadratic)
      ((source9NaturalMatrix_eq_one_iff_trivialAction g).1 hm z))
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
    ((source9SpinVectorOrthogonalHom (g * h⁻¹)) : Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  source9NaturalMatrix_eq_iff_relative_kernel g h
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
      ∀ x : CliffordAlgebra source9Quadratic,
        ((g * h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) * x =
          x * ((g * h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) :=
  source9NaturalMatrix_eq_iff_relative_commutes g h
example (g h : spinGroup source9Quadratic)
    (hm : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ))
    (x : CliffordAlgebra source9Quadratic) :
    ((g : CliffordAlgebra source9Quadratic) *
      ((h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) * x =
      x * ((g : CliffordAlgebra source9Quadratic) *
        ((h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) :=
  (source9NaturalMatrix_eq_iff_relative_commutes g h).1 hm x
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ((source9SpinVectorOrthogonalHom (source9SpinCoordinateReconstruction g * g⁻¹)) :
      Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  source9Reconstruction_relative_kernel_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∀ x : CliffordAlgebra source9Quadratic,
      ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) * x =
      x * ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) :=
  source9Reconstruction_relative_commutes_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (x : CliffordAlgebra source9Quadratic) :
    (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) * CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic)) * x =
      x * (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) * CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic)) := by
  have hc := source9Reconstruction_relative_commutes_on_sourceNeighborhood g hg x
  change (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) *
      ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) * x =
    x * (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) *
      ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) at hc
  rw [source9Spin_inv_coe_eq_reverse] at hc
  exact hc
example (g : spinGroup source9Quadratic) :
    ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) ∈ CliffordAlgebra.even source9Quadratic :=
  spinGroup.mem_even (source9SpinCoordinateReconstruction g * g⁻¹).property
example (g : spinGroup source9Quadratic) :
    CliffordAlgebra.involute
      ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) =
      ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) :=
  spinGroup.involute_eq (source9SpinCoordinateReconstruction g * g⁻¹).property

-- Actual natural-action noninjectivity: the accepted negative central source element is in this kernel.
private theorem auditKernel_negativeMatrix_one :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
  apply (source9NaturalMatrix_eq_one_iff_generator_commutes source9NegativeCentral).2
  intro z
  simp only [source9NegativeCentral_coe, neg_one_mul, mul_neg_one]
private theorem auditKernel_negative_ne_one :
    source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) := by
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
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) := by
  intro hinj
  have hone : ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) :
      Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
    change source9SpinVectorMatrixHom (1 : spinGroup source9Quadratic) = 1
    exact map_one source9SpinVectorMatrixHom
  exact auditKernel_negative_ne_one (hinj (auditKernel_negativeMatrix_one.trans hone.symm))

#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_trivialAction
#print axioms FCP.BFSSPairedSpin9Clifford.source9Spin_trivialAction_iff_generator_commutes
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_generator_commutes
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_clifford_commutes
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_relative_kernel
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_relative_commutes
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_kernel_on_sourceNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_commutes_on_sourceNeighborhood
end
