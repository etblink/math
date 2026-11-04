import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CTExteriorScalarKernel
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditScalarPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditScalarPBWCoordinates.toAddMonoidHom auditScalarPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditScalarPBWCoordinates

@[instance_reducible] private def auditScalarSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditScalarMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditScalarPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditScalarPBWCoordinates.toAddMonoidHom auditScalarPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditScalarPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditScalarSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditScalarMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example : source9ExteriorPBWBasis = (Pi.basisFun ℝ SpaceIndex).ExteriorAlgebra := rfl
example (j k : SpaceIndex) : j ≤ k ↔ (j : ℕ) ≤ (k : ℕ) := Iff.rfl
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) : source9ExteriorPBWOccupiedLabels x =
    (source9ExteriorPBWBasis.repr x).support.biUnion (fun I : Finset SpaceIndex => I) := by
  classical
  ext j
  simp only [source9ExteriorPBWOccupiedLabels, Finset.mem_biUnion]
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) (j : SpaceIndex) :
    j ∈ source9ExteriorPBWOccupiedLabels x ↔
      ∃ I ∈ (source9ExteriorPBWBasis.repr x).support, j ∈ I := by
  classical
  simp only [source9ExteriorPBWOccupiedLabels, Finset.mem_biUnion]
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) (j : SpaceIndex)
    (hmin : ∀ J : Finset SpaceIndex, J ∈ (source9ExteriorPBWBasis.repr x).support → ∀ k ∈ J, j ≤ k)
    (I : Finset SpaceIndex) (hI : I ∈ (source9ExteriorPBWBasis.repr x).support) (hj : j ∈ I) :
    source9ExteriorPBWBasis.repr
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) x) (I.erase j) =
      source9ExteriorPBWBasis.repr x I :=
  source9ExteriorPBWLeastContraction_coefficient x j hmin I hI hj
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ))
    (hzero : ∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) x = 0) :
    ∀ I : Finset SpaceIndex, I ≠ ∅ → source9ExteriorPBWBasis.repr x I = 0 :=
  source9Exterior_commonContractions_nonemptyCoefficients_zero x hzero
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ))
    (hzero : ∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) x = 0) :
    x = algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) (source9ExteriorPBWBasis.repr x ∅) :=
  source9Exterior_commonCoordinateKernel_eq_scalar x hzero
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) :
    (∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) x = 0) ↔
      ∃ c : ℝ, x = algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c :=
  source9Exterior_commonCoordinateKernel_iff_scalar x
example (c : ℝ) (j : SpaceIndex) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      (algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c) = 0 :=
  (source9Exterior_commonCoordinateKernel_iff_scalar _).2 ⟨c, rfl⟩ j
example (g : spinGroup source9Quadratic)
    (hg : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1) :
    (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic)
      (source9ExteriorPBWBasis.repr ((CliffordAlgebra.equivExterior source9Quadratic)
        (g : CliffordAlgebra source9Quadratic)) ∅) :=
  source9NaturalKernel_clifford_eq_scalar g hg
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∃ c : ℝ, (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c :=
  source9NaturalMatrix_eq_one_iff_clifford_scalar g
example (g : spinGroup source9Quadratic) (c : ℝ)
    (hc : (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c)
    (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      (1 : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A i j)
    ((source9NaturalMatrix_eq_one_iff_clifford_scalar g).2 ⟨c, hc⟩)
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
      ∃ c : ℝ, ((g * h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) =
        algebraMap ℝ (CliffordAlgebra source9Quadratic) c :=
  source9NaturalMatrix_eq_iff_relative_clifford_scalar g h
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic)
      (source9ExteriorPBWBasis.repr ((CliffordAlgebra.equivExterior source9Quadratic)
        ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
          CliffordAlgebra source9Quadratic)) ∅) :=
  source9Reconstruction_relative_clifford_eq_scalar_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∃ c : ℝ, ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic) c :=
  ⟨_, source9Reconstruction_relative_clifford_eq_scalar_on_sourceNeighborhood g hg⟩

-- One vanishing coordinate is insufficient: a different one-vector word is nonscalar.
private theorem auditScalar_singleCoordinate_insufficient
    (j k : SpaceIndex) (hjk : j ≠ k) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [k]) = 0 ∧
      ∀ c : ℝ, source9ExteriorCoordinateWord [k] ≠
        algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c := by
  constructor
  · exact source9ExteriorCoordinateWord_contraction_zero_of_not_mem j [k] (by simpa using hjk)
  · intro c heq
    have hone : CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [k]) = 1 := by
      simpa only [source9ExteriorCoordinateWord, List.map_nil, List.prod_nil]
        using source9ExteriorCoordinateWord_leading_contraction k [] (by simp)
    have hc := congrArg (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ))) heq
    rw [hone, CliffordAlgebra.contractLeft_algebraMap] at hc
    exact one_ne_zero hc
example : CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
    (LinearMap.proj (0 : SpaceIndex) : Module.Dual ℝ (SpaceIndex → ℝ))
    (source9ExteriorCoordinateWord [(1 : SpaceIndex)]) = 0 ∧
    ∀ c : ℝ, source9ExteriorCoordinateWord [(1 : SpaceIndex)] ≠
      algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c :=
  auditScalar_singleCoordinate_insufficient 0 1 (by decide)

-- Actual natural-action noninjectivity: the accepted negative central source element is in this kernel.
private theorem auditScalar_negativeMatrix_one :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
  apply (source9NaturalMatrix_eq_one_iff_generator_commutes source9NegativeCentral).2
  intro z
  simp only [source9NegativeCentral_coe, neg_one_mul, mul_neg_one]
private theorem auditScalar_negative_ne_one :
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
  exact auditScalar_negative_ne_one (hinj (auditScalar_negativeMatrix_one.trans hone.symm))

-- The distinct negative central source element remains in the transported coordinate kernel.
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ∀ j : SpaceIndex,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
        ((CliffordAlgebra.equivExterior source9Quadratic)
          (source9NegativeCentral : CliffordAlgebra source9Quadratic)) = 0 :=
  ⟨auditScalar_negative_ne_one,
    source9NaturalKernel_exteriorCoordinateContractions_zero source9NegativeCentral
      auditScalar_negativeMatrix_one⟩

example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ∃ c : ℝ, (source9NegativeCentral : CliffordAlgebra source9Quadratic) =
      algebraMap ℝ (CliffordAlgebra source9Quadratic) c :=
  ⟨auditScalar_negative_ne_one,
    (source9NaturalMatrix_eq_one_iff_clifford_scalar source9NegativeCentral).1
      auditScalar_negativeMatrix_one⟩

#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWOccupiedLabels
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWLeastContraction_coefficient
#print axioms FCP.BFSSPairedSpin9Clifford.source9Exterior_commonContractions_nonemptyCoefficients_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Exterior_commonCoordinateKernel_eq_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9Exterior_commonCoordinateKernel_iff_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalKernel_clifford_eq_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_clifford_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_relative_clifford_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_clifford_eq_scalar_on_sourceNeighborhood
end
