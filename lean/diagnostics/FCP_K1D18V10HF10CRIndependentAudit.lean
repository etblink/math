import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CRExteriorContractionTransport
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditExteriorPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditExteriorPBWCoordinates.toAddMonoidHom auditExteriorPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditExteriorPBWCoordinates

@[instance_reducible] private def auditExteriorSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditExteriorMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditExteriorPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditExteriorPBWCoordinates.toAddMonoidHom auditExteriorPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditExteriorPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditExteriorSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditExteriorMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example : CliffordAlgebra source9Quadratic ≃ₗ[ℝ] ExteriorAlgebra ℝ (SpaceIndex → ℝ) :=
  CliffordAlgebra.equivExterior source9Quadratic
example (d : Module.Dual ℝ (SpaceIndex → ℝ)) (x : CliffordAlgebra source9Quadratic) :
    ((CliffordAlgebra.equivExterior source9Quadratic) (CliffordAlgebra.contractLeft d x) :
      ExteriorAlgebra ℝ (SpaceIndex → ℝ)) =
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ))) d
        ((CliffordAlgebra.equivExterior source9Quadratic) x) :=
  source9Clifford_exterior_contractLeft_transport d x
example (d : Module.Dual ℝ (SpaceIndex → ℝ)) :
    (CliffordAlgebra.equivExterior source9Quadratic).toLinearMap.comp
        (CliffordAlgebra.contractLeft (Q := source9Quadratic) d) =
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ))) d).comp
        (CliffordAlgebra.equivExterior source9Quadratic).toLinearMap := by
  apply LinearMap.ext
  intro x
  exact source9Clifford_exterior_contractLeft_transport d x
example (d : Module.Dual ℝ (SpaceIndex → ℝ)) (x : CliffordAlgebra source9Quadratic) :
    CliffordAlgebra.contractLeft (Q := source9Quadratic) d x = 0 ↔
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ))) d
        ((CliffordAlgebra.equivExterior source9Quadratic) x) = 0 :=
  source9Clifford_contractLeft_zero_iff_exterior d x
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 ↔
      ∀ v : SpaceIndex → ℝ,
        CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
          (source9Quadratic.polarBilin v)
          ((CliffordAlgebra.equivExterior source9Quadratic) (g : CliffordAlgebra source9Quadratic)) = 0 :=
  source9NaturalMatrix_eq_one_iff_exteriorPolarContractions_zero g
example (g : spinGroup source9Quadratic)
    (hz : ∀ v : SpaceIndex → ℝ,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (source9Quadratic.polarBilin v)
        ((CliffordAlgebra.equivExterior source9Quadratic) (g : CliffordAlgebra source9Quadratic)) = 0)
    (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      (1 : Matrix SpaceIndex SpaceIndex ℝ) i j :=
  congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A i j)
    ((source9NaturalMatrix_eq_one_iff_exteriorPolarContractions_zero g).2 hz)
example (g : spinGroup source9Quadratic)
    (hg : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1) :
    ∀ j : SpaceIndex,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
        ((CliffordAlgebra.equivExterior source9Quadratic) (g : CliffordAlgebra source9Quadratic)) = 0 :=
  source9NaturalKernel_exteriorCoordinateContractions_zero g hg
example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) ↔
      ∀ v : SpaceIndex → ℝ,
        CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
          (source9Quadratic.polarBilin v)
          ((CliffordAlgebra.equivExterior source9Quadratic)
            ((g * h⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) = 0 :=
  source9NaturalMatrix_eq_iff_relative_exteriorPolarContractions_zero g h
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∀ v : SpaceIndex → ℝ,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (source9Quadratic.polarBilin v)
        ((CliffordAlgebra.equivExterior source9Quadratic)
          ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
            CliffordAlgebra source9Quadratic)) = 0 :=
  source9Reconstruction_relative_exteriorPolarContractions_zero_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood) :
    ∀ j : SpaceIndex,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
        ((CliffordAlgebra.equivExterior source9Quadratic)
          ((source9SpinCoordinateReconstruction g * g⁻¹ : spinGroup source9Quadratic) :
            CliffordAlgebra source9Quadratic)) = 0 :=
  source9Reconstruction_relative_exteriorCoordinateContractions_zero_on_sourceNeighborhood g hg
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinNaturalMatrixRecoveryNeighborhood)
    (j : SpaceIndex) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      ((CliffordAlgebra.equivExterior source9Quadratic)
        (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
          CliffordAlgebra source9Quadratic) * CliffordAlgebra.reverse (g : CliffordAlgebra source9Quadratic))) = 0 := by
  have hz := source9Reconstruction_relative_exteriorCoordinateContractions_zero_on_sourceNeighborhood g hg j
  change CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
    (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
    ((CliffordAlgebra.equivExterior source9Quadratic)
      (((source9SpinCoordinateReconstruction g : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic))) = 0 at hz
  rw [source9Spin_inv_coe_eq_reverse] at hz
  exact hz
example (x : CliffordAlgebra source9Quadratic) (c : ℝ) :
    (CliffordAlgebra.equivExterior source9Quadratic) x =
      algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c ↔
      x = algebraMap ℝ (CliffordAlgebra source9Quadratic) c :=
  source9Clifford_exterior_eq_scalar_iff x c
example (c : ℝ) :
    (CliffordAlgebra.equivExterior source9Quadratic)
      (algebraMap ℝ (CliffordAlgebra source9Quadratic) c) =
      algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c :=
  (source9Clifford_exterior_eq_scalar_iff _ c).2 rfl
example (x : CliffordAlgebra source9Quadratic) :
    (∃ c : ℝ, (CliffordAlgebra.equivExterior source9Quadratic) x =
      algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c) ↔
      ∃ c : ℝ, x = algebraMap ℝ (CliffordAlgebra source9Quadratic) c := by
  constructor
  · rintro ⟨c, hc⟩
    exact ⟨c, (source9Clifford_exterior_eq_scalar_iff x c).1 hc⟩
  · rintro ⟨c, hc⟩
    exact ⟨c, (source9Clifford_exterior_eq_scalar_iff x c).2 hc⟩

-- The actual linear equivalence does not preserve arbitrary Clifford products.
private theorem auditExterior_vectorImage (v : SpaceIndex → ℝ) :
    (CliffordAlgebra.equivExterior source9Quadratic) (CliffordAlgebra.ι source9Quadratic v) =
      CliffordAlgebra.ι (0 : QuadraticForm ℝ (SpaceIndex → ℝ)) v := by
  simpa only [CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply]
    using (CliffordAlgebra.changeForm_ι
      (h := CliffordAlgebra.changeForm.associated_neg_proof (Q := source9Quadratic)) v)
private theorem auditExterior_oneImage :
    (CliffordAlgebra.equivExterior source9Quadratic) (1 : CliffordAlgebra source9Quadratic) =
      (1 : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) := by
  have h := (source9Clifford_exterior_eq_scalar_iff
    (algebraMap ℝ (CliffordAlgebra source9Quadratic) 1) 1).2 rfl
  simpa only [map_one] using h
example : ¬ (∀ x y : CliffordAlgebra source9Quadratic,
    (CliffordAlgebra.equivExterior source9Quadratic) (x * y) =
      (CliffordAlgebra.equivExterior source9Quadratic) x *
        (CliffordAlgebra.equivExterior source9Quadratic) y) := by
  intro h
  have hsource : CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (0 : SpaceIndex)) *
      CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (0 : SpaceIndex)) = 1 := by
    rw [CliffordAlgebra.ι_sq_scalar, source9CoordinateVector_unit, map_one]
  have htarget :
      CliffordAlgebra.ι (0 : QuadraticForm ℝ (SpaceIndex → ℝ)) (source9CoordinateVector (0 : SpaceIndex)) *
        CliffordAlgebra.ι (0 : QuadraticForm ℝ (SpaceIndex → ℝ)) (source9CoordinateVector (0 : SpaceIndex)) =
      (0 : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) := by
    rw [CliffordAlgebra.ι_sq_scalar]
    simp
  have hh := h (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (0 : SpaceIndex)))
    (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (0 : SpaceIndex)))
  rw [hsource, auditExterior_oneImage] at hh
  simp only [auditExterior_vectorImage, htarget] at hh
  have hzero : (CliffordAlgebra.equivExterior source9Quadratic) (1 : CliffordAlgebra source9Quadratic) =
      (CliffordAlgebra.equivExterior source9Quadratic) (0 : CliffordAlgebra source9Quadratic) :=
    auditExterior_oneImage.trans
      (hh.trans ((map_zero (CliffordAlgebra.equivExterior source9Quadratic)).symm))
  exact one_ne_zero ((CliffordAlgebra.equivExterior source9Quadratic).injective hzero)

-- Actual natural-action noninjectivity: the accepted negative central source element is in this kernel.
private theorem auditExterior_negativeMatrix_one :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
  apply (source9NaturalMatrix_eq_one_iff_generator_commutes source9NegativeCentral).2
  intro z
  simp only [source9NegativeCentral_coe, neg_one_mul, mul_neg_one]
private theorem auditExterior_negative_ne_one :
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
  exact auditExterior_negative_ne_one (hinj (auditExterior_negativeMatrix_one.trans hone.symm))

-- The distinct negative central source element remains in the transported coordinate kernel.
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ∀ j : SpaceIndex,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
        ((CliffordAlgebra.equivExterior source9Quadratic)
          (source9NegativeCentral : CliffordAlgebra source9Quadratic)) = 0 :=
  ⟨auditExterior_negative_ne_one,
    source9NaturalKernel_exteriorCoordinateContractions_zero source9NegativeCentral
      auditExterior_negativeMatrix_one⟩

#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_exterior_contractLeft_transport
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_contractLeft_zero_iff_exterior
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_one_iff_exteriorPolarContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalKernel_exteriorCoordinateContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_eq_iff_relative_exteriorPolarContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_exteriorPolarContractions_zero_on_sourceNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9Reconstruction_relative_exteriorCoordinateContractions_zero_on_sourceNeighborhood
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_exterior_eq_scalar_iff
end
