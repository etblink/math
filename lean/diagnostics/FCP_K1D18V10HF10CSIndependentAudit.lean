import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CSExteriorPBWContractions
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditPBWPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPBWPBWCoordinates.toAddMonoidHom auditPBWPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPBWPBWCoordinates

@[instance_reducible] private def auditPBWSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditPBWMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditPBWPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPBWPBWCoordinates.toAddMonoidHom auditPBWPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPBWPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditPBWSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditPBWMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw
example : source9ExteriorPBWBasis = (Pi.basisFun ℝ SpaceIndex).ExteriorAlgebra := rfl
example (xs : List SpaceIndex) : source9ExteriorCoordinateWord xs =
    (xs.map (fun j => ExteriorAlgebra.ι ℝ
      (Pi.single j (1 : ℝ) : SpaceIndex → ℝ))).prod := rfl
example (I : Finset SpaceIndex) : source9ExteriorPBWOrderedLabels I =
    List.ofFn (fun i : Fin I.card => I.orderEmbOfFin rfl i) := rfl
example (j k : SpaceIndex) : j ≤ k ↔ (j : ℕ) ≤ (k : ℕ) := Iff.rfl
example (I : Finset SpaceIndex) : source9ExteriorPBWOrderedLabels I = I.sort := by
  classical
  change (List.ofFn (fun i : Fin I.card => I.orderEmbOfFin rfl i)) = I.sort
  rw [List.ofFn_eq_map]
  exact Finset.listMap_orderEmbOfFin_finRange I rfl
example (j : SpaceIndex) (xs : List SpaceIndex) : source9ExteriorCoordinateWord (j :: xs) =
    ExteriorAlgebra.ι ℝ (Pi.single j (1 : ℝ) : SpaceIndex → ℝ) *
      source9ExteriorCoordinateWord xs := source9ExteriorCoordinateWord_cons j xs
example (j : SpaceIndex) (xs : List SpaceIndex) (hj : j ∉ xs) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      (source9ExteriorCoordinateWord xs) = 0 :=
  source9ExteriorCoordinateWord_contraction_zero_of_not_mem j xs hj
example (j : SpaceIndex) (xs : List SpaceIndex) (hj : j ∉ xs) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      (source9ExteriorCoordinateWord (j :: xs)) = source9ExteriorCoordinateWord xs :=
  source9ExteriorCoordinateWord_leading_contraction j xs hj
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∈ source9ExteriorPBWOrderedLabels I) :
    j ∈ I := source9ExteriorPBWOrderedLabels_mem_finset I j hj
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∉ I) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorPBWBasis I) = 0 :=
  source9ExteriorPBWBasis_coordinateContraction_zero_of_not_mem I j hj
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∉ I) (J : Finset SpaceIndex) :
    source9ExteriorPBWBasis.repr
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorPBWBasis I)) J = 0 := by
  simp only [source9ExteriorPBWBasis_coordinateContraction_zero_of_not_mem I j hj,
    map_zero, Finsupp.zero_apply]
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∈ I) (hmin : ∀ k ∈ I, j ≤ k) :
    source9ExteriorPBWOrderedLabels I = j :: source9ExteriorPBWOrderedLabels (I.erase j) :=
  source9ExteriorPBWOrderedLabels_cons_of_least I j hj hmin
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∈ I) (hmin : ∀ k ∈ I, j ≤ k) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorPBWBasis I) =
        source9ExteriorPBWBasis (I.erase j) :=
  source9ExteriorPBWBasis_contraction_erase_of_least I j hj hmin
example (I : Finset SpaceIndex) (j : SpaceIndex) (hj : j ∈ I) (hmin : ∀ k ∈ I, j ≤ k) :
    source9ExteriorPBWBasis.repr
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorPBWBasis I))
      (I.erase j) = 1 := by
  rw [source9ExteriorPBWBasis_contraction_erase_of_least I j hj hmin]
  simp
example : source9ExteriorPBWBasis (∅ : Finset SpaceIndex) =
    (1 : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) := source9ExteriorPBWBasis_empty_eq_one
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ))
    (hz : ∀ I : Finset SpaceIndex, I ≠ ∅ → source9ExteriorPBWBasis.repr x I = 0) :
    x = algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ))
      (source9ExteriorPBWBasis.repr x ∅) :=
  source9Exterior_eq_scalar_of_nonempty_coefficients_zero x hz
example (x : ExteriorAlgebra ℝ (SpaceIndex → ℝ))
    (hz : ∀ I : Finset SpaceIndex, I ≠ ∅ → source9ExteriorPBWBasis.repr x I = 0) :
    ∃ c : ℝ, x = algebraMap ℝ (ExteriorAlgebra ℝ (SpaceIndex → ℝ)) c :=
  ⟨source9ExteriorPBWBasis.repr x ∅, source9Exterior_eq_scalar_of_nonempty_coefficients_zero x hz⟩
example (g : spinGroup source9Quadratic)
    (hz : ∀ I : Finset SpaceIndex, I ≠ ∅ → source9ExteriorPBWBasis.repr
      ((CliffordAlgebra.equivExterior source9Quadratic) (g : CliffordAlgebra source9Quadratic)) I = 0) :
    (g : CliffordAlgebra source9Quadratic) = algebraMap ℝ (CliffordAlgebra source9Quadratic)
      (source9ExteriorPBWBasis.repr
        ((CliffordAlgebra.equivExterior source9Quadratic) (g : CliffordAlgebra source9Quadratic)) ∅) :=
  (source9Clifford_exterior_eq_scalar_iff _ _).1
    (source9Exterior_eq_scalar_of_nonempty_coefficients_zero _ hz)

-- A nonleading coordinate has the opposite sign; the least-coordinate hypothesis matters.
private theorem auditPBW_secondCoordinate_contraction
    (j k : SpaceIndex) (hjk : j ≠ k) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ))
      (source9ExteriorCoordinateWord [j, k]) = -source9ExteriorCoordinateWord [j] := by
  rw [source9ExteriorCoordinateWord_cons, CliffordAlgebra.contractLeft_ι_mul]
  have hcoord : (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ))
      (Pi.single j (1 : ℝ) : SpaceIndex → ℝ) = 0 := by
    simp [Ne.symm hjk]
  have hsingle : CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [k]) = 1 := by
    simpa only [source9ExteriorCoordinateWord, List.map_nil, List.prod_nil]
      using source9ExteriorCoordinateWord_leading_contraction k [] (by simp)
  rw [hcoord, hsingle]
  simp [source9ExteriorCoordinateWord]
example (j k : SpaceIndex) (hjk : j ≠ k) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [j, k])) =
      -(1 : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) := by
  rw [auditPBW_secondCoordinate_contraction j k hjk, map_neg]
  have hsingle : CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [j]) = 1 := by
    simpa only [source9ExteriorCoordinateWord, List.map_nil, List.prod_nil]
      using source9ExteriorCoordinateWord_leading_contraction j [] (by simp)
  rw [hsingle]
example (j k : SpaceIndex) (hjk : j ≠ k) :
    CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
      (LinearMap.proj k : Module.Dual ℝ (SpaceIndex → ℝ))
      (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (source9ExteriorCoordinateWord [j, k])) =
      (1 : ExteriorAlgebra ℝ (SpaceIndex → ℝ)) := by
  have hj : j ∉ ([k] : List SpaceIndex) := by simpa using hjk
  rw [source9ExteriorCoordinateWord_leading_contraction j [k] hj]
  simpa only [source9ExteriorCoordinateWord, List.map_nil, List.prod_nil]
    using source9ExteriorCoordinateWord_leading_contraction k [] (by simp)

-- Actual natural-action noninjectivity: the accepted negative central source element is in this kernel.
private theorem auditPBW_negativeMatrix_one :
    ((source9SpinVectorOrthogonalHom source9NegativeCentral) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
  apply (source9NaturalMatrix_eq_one_iff_generator_commutes source9NegativeCentral).2
  intro z
  simp only [source9NegativeCentral_coe, neg_one_mul, mul_neg_one]
private theorem auditPBW_negative_ne_one :
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
  exact auditPBW_negative_ne_one (hinj (auditPBW_negativeMatrix_one.trans hone.symm))

-- The distinct negative central source element remains in the transported coordinate kernel.
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    ∀ j : SpaceIndex,
      CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℝ (SpaceIndex → ℝ)))
        (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ))
        ((CliffordAlgebra.equivExterior source9Quadratic)
          (source9NegativeCentral : CliffordAlgebra source9Quadratic)) = 0 :=
  ⟨auditPBW_negative_ne_one,
    source9NaturalKernel_exteriorCoordinateContractions_zero source9NegativeCentral
      auditPBW_negativeMatrix_one⟩

#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorCoordinateWord_cons
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorCoordinateWord_contraction_zero_of_not_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorCoordinateWord_leading_contraction
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWOrderedLabels_mem_finset
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWBasis_coordinateContraction_zero_of_not_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWOrderedLabels_cons_of_least
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWBasis_contraction_erase_of_least
#print axioms FCP.BFSSPairedSpin9Clifford.source9ExteriorPBWBasis_empty_eq_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9Exterior_eq_scalar_of_nonempty_coefficients_zero
end
