import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CQPolarContractionKernel
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditPolarPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPolarPBWCoordinates.toAddMonoidHom auditPolarPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPolarPBWCoordinates

@[instance_reducible] private def auditPolarSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditPolarMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditPolarPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPolarPBWCoordinates.toAddMonoidHom auditPolarPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPolarPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditPolarSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditPolarMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example (v : SpaceIndex → ℝ) (x : CliffordAlgebra source9Quadratic) :
    CliffordAlgebra.ι source9Quadratic v * x -
      CliffordAlgebra.involute x * CliffordAlgebra.ι source9Quadratic v =
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v) x :=
  source9Clifford_gradedCommutator_eq_polarContraction v x
example (v : SpaceIndex → ℝ) (x : CliffordAlgebra source9Quadratic)
    (hx : x ∈ CliffordAlgebra.even source9Quadratic) :
    CliffordAlgebra.ι source9Quadratic v * x - x * CliffordAlgebra.ι source9Quadratic v =
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v) x :=
  source9Clifford_evenCommutator_eq_polarContraction v x hx
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∀ v : SpaceIndex → ℝ,
        CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v)
          (g : CliffordAlgebra source9Quadratic) = 0 :=
  source9NaturalMatrix_eq_one_iff_polarContractions_zero g
example (g : spinGroup source9Quadratic)
    (hz : ∀ v : SpaceIndex → ℝ,
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v)
        (g : CliffordAlgebra source9Quadratic) = 0) (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      (1 : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A i j)
    ((source9NaturalMatrix_eq_one_iff_polarContractions_zero g).2 hz)
example (j : SpaceIndex) :
    source9Quadratic.polarBilin ((1 / 2 : ℝ) • source9CoordinateVector j) =
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) :=
  source9Polar_halfCoordinate_eq_coordinateDual j
example (j : SpaceIndex) :
    source9Quadratic.polarBilin ((1 / 2 : ℝ) • (Pi.single j (1 : ℝ) : SpaceIndex → ℝ)) =
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) :=
  source9Polar_halfCoordinate_eq_coordinateDual j
example (j : SpaceIndex) (v : SpaceIndex → ℝ) :
    source9Quadratic.polarBilin ((1 / 2 : ℝ) • source9CoordinateVector j) v = v j :=
  congrArg (fun d : Module.Dual ℝ (SpaceIndex → ℝ) => d v)
    (source9Polar_halfCoordinate_eq_coordinateDual j)
example (j : SpaceIndex) (v : SpaceIndex → ℝ) :
    source9Quadratic.polarBilin (source9CoordinateVector j) v = 2 * v j :=
  source9Quadratic_polar_coordinate j v
example (g : spinGroup source9Quadratic)
    (hg : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1) :
    ∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := source9Quadratic)
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (g : CliffordAlgebra source9Quadratic) = 0 :=
  source9NaturalKernel_coordinateContractions_zero g hg
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
      ∀ v : SpaceIndex → ℝ,
        CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v)
          ((g * h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) = 0 :=
  source9NaturalMatrix_eq_iff_relative_polarContractions_zero g h
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∀ v : SpaceIndex → ℝ,
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v)
        ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
          CliffordAlgebra source9Quadratic) = 0 :=
  source9Reconstruction_relative_polarContractions_zero_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := source9Quadratic)
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) = 0 :=
  source9Reconstruction_relative_coordinateContractions_zero_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (j : SpaceIndex) :
    CliffordAlgebra.contractLeft (Q := source9Quadratic)
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) * CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic)) = 0 := by
  have hzero := source9Reconstruction_relative_coordinateContractions_zero_on_sourceNeighborhood g hg j
  change CliffordAlgebra.contractLeft (Q := source9Quadratic)
    (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
    (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) *
      ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) = 0 at hzero
  rw [source9Spin_inv_coe_eq_reverse] at hzero
  exact hzero

-- Odd-vector control: dropping involution from the arbitrary-element identity is false.
private theorem auditPolar_coordinateSelf (j : SpaceIndex) :
    CliffordAlgebra.contractLeft (Q := source9Quadratic)
      (source9Quadratic.polarBilin (source9CoordinateVector j))
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j)) =
      algebraMap ℝ (CliffordAlgebra source9Quadratic) 2 := by
  have hcoord : source9Quadratic.polarBilin (source9CoordinateVector j) (source9CoordinateVector j) = 2 := by
    change QuadraticMap.polar source9Quadratic (source9CoordinateVector j) (source9CoordinateVector j) = 2
    rw [source9Quadratic_polar_coordinate]
    simp [source9CoordinateVector]
  rw [CliffordAlgebra.contractLeft_ι, hcoord]
example : ¬ (∀ (v : SpaceIndex → ℝ) (x : CliffordAlgebra source9Quadratic),
    CliffordAlgebra.ι source9Quadratic v * x - x * CliffordAlgebra.ι source9Quadratic v =
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v) x) := by
  intro h
  have hv := h (source9CoordinateVector (0 : SpaceIndex))
    (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (0 : SpaceIndex)))
  rw [sub_self, auditPolar_coordinateSelf (0 : SpaceIndex)] at hv
  have hmap : algebraMap ℝ (CliffordAlgebra source9Quadratic) 0 =
      algebraMap ℝ (CliffordAlgebra source9Quadratic) 2 := by
    rw [map_zero]
    exact hv
  have hreal : (0 : ℝ) = 2 :=
    (FaithfulSMul.algebraMap_injective ℝ (CliffordAlgebra source9Quadratic)) hmap
  norm_num at hreal

-- Actual natural-action noninjectivity: the accepted negative central source element is in this kernel.
private theorem auditPolar_negativeMatrix_one :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
  apply (source9NaturalMatrix_eq_one_iff_generator_commutes source9NegativeCentral).2
  intro z
  simp only [source9NegativeCentral_coe, neg_one_mul, mul_neg_one]
private theorem auditPolar_negative_ne_one :
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
  exact auditPolar_negative_ne_one (hinj (auditPolar_negativeMatrix_one.trans hone.symm))

-- Vanishing contractions do not by themselves select the source identity sign.
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ∀ v : SpaceIndex → ℝ,
      CliffordAlgebra.contractLeft (Q := source9Quadratic) (source9Quadratic.polarBilin v)
        (source9NegativeCentral : CliffordAlgebra source9Quadratic) = 0 :=
  ⟨auditPolar_negative_ne_one,
    (source9NaturalMatrix_eq_one_iff_polarContractions_zero source9NegativeCentral).1
      auditPolar_negativeMatrix_one⟩

#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_gradedCommutator_eq_polarContraction
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_evenCommutator_eq_polarContraction
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_polarContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Polar_halfCoordinate_eq_coordinateDual
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalKernel_coordinateContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_relative_polarContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_polarContractions_zero_on_sourceNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_coordinateContractions_zero_on_sourceNeighborhood
end
