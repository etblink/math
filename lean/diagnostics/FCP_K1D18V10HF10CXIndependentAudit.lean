import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CXIdentityChartInverseCliffordDerivative
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditInversePBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditInversePBWCoordinates.toAddMonoidHom auditInversePBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditInversePBWCoordinates

@[instance_reducible] private def auditInverseSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditInverseMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditInverseParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped ContDiff Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditInversePBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditInversePBWCoordinates.toAddMonoidHom auditInversePBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditInversePBWCoordinates := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditInverseSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditInverseMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw



example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditInverseParameterTopology := rfl
example : source9SpinIdentityLocalChart.source = source9SpinExactRecoveryNeighborhood := rfl
example : source9SpinIdentityLocalChart.target =
    source9OrderedUpperCoordinateLocalHomeomorph.source ∩
      source9OrderedStrictPlaneWord ⁻¹' source9SpinExactRecoveryNeighborhood := rfl
example : (0 : Fin 36 → ℝ) ∈ source9SpinIdentityLocalChart.target :=
  source9SpinIdentityLocalChart_zero_mem_target
example : source9SpinIdentityLocalChart.target ∈ 𝓝 (0 : Fin 36 → ℝ) :=
  source9SpinIdentityLocalChart.open_target.mem_nhds source9SpinIdentityLocalChart_zero_mem_target
example : (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) =
    (fun t : Fin 36 → ℝ => ((source9OrderedStrictPlaneWord t) : CliffordAlgebra source9Quadratic)) :=
  source9IdentityChartInverse_clifford_eq_word
example (t : Fin 36 → ℝ) :
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic) =
      ((source9PlaneSpinWord source9StrictPlaneRow source9StrictPlaneColumn
        source9StrictPlaneEnumeration_ne t (List.finRange 36)) : CliffordAlgebra source9Quadratic) := rfl
example : ((source9SpinIdentityLocalChart.symm (0 : Fin 36 → ℝ)) :
    CliffordAlgebra source9Quadratic) = 1 :=
  congrArg (fun g : spinGroup source9Quadratic => (g : CliffordAlgebra source9Quadratic))
    source9OrderedStrictPlaneWord_zero
example (n : ℕ∞ω) : ContDiff ℝ n (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) :=
  source9IdentityChartInverse_clifford_contDiff_pbw n
example : ContDiff ℝ ω (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) :=
  source9IdentityChartInverse_clifford_contDiff_pbw ω
example (n : ℕ∞ω) : ContDiffOn ℝ n (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic))
    source9SpinIdentityLocalChart.target :=
  (source9IdentityChartInverse_clifford_contDiff_pbw n).contDiffOn
example : HasFDerivAt (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic))
    (source9PlaneSpinWordVelocity source9StrictPlaneRow source9StrictPlaneColumn (List.finRange 36)) 0 :=
  source9IdentityChartInverse_clifford_hasFDerivAt_zero
example : fderiv ℝ (fun t : Fin 36 → ℝ =>
    ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0 =
      source9PlaneSpinWordVelocity source9StrictPlaneRow source9StrictPlaneColumn (List.finRange 36) :=
  source9IdentityChartInverse_clifford_fderiv_zero
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v =
      ((List.finRange 36).map (fun i => v i • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i)))))).sum :=
  source9IdentityChartInverse_clifford_fderiv_zero_apply v

-- Every literal coordinate direction gives exactly its positive original half-bivector.
private theorem auditInverse_coordinate_halfBivector (i : Fin 36) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ)) =
      (1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i))) := by
  have hvalue :
      (fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ)) =
        ((List.finRange 36).map (fun j => (Pi.single i (1 : ℝ) : Fin 36 → ℝ) j • ((1 / 2 : ℝ) •
          (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow j)) *
            CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn j)))))).sum :=
    source9IdentityChartInverse_clifford_fderiv_zero_apply (Pi.single i (1 : ℝ))
  have hsum :
      ((List.finRange 36).map (fun j => (Pi.single i (1 : ℝ) : Fin 36 → ℝ) j • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow j)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn j)))))).sum =
        (1 / 2 : ℝ) •
          (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
            CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i))) := by
    classical
    rw [← Fin.sum_univ_def]
    simp [Pi.single_apply]
  exact hvalue.trans hsum
example (v : Fin 36 → ℝ) :
    CliffordAlgebra.reverse ((fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v) =
      -((fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v) :=
  source9IdentityChartInverse_clifford_fderiv_zero_reverse v
example (v : Fin 36 → ℝ) (z : SpaceIndex → ℝ) :
    source9CliffordVectorProjection
      (((fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v) *
          CliffordAlgebra.ι source9Quadratic z -
        CliffordAlgebra.ι source9Quadratic z *
          ((fderiv ℝ (fun t : Fin 36 → ℝ =>
            ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v)) =
      source9PlaneWordVectorVelocity source9StrictPlaneRow source9StrictPlaneColumn z (List.finRange 36) v :=
  source9IdentityChartInverse_fderiv_zero_projected_commutator v z
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9SpinIdentityLocalChart.symm t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) 0) v =
      (source9OrderedStrictPlaneModelEquiv v : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9IdentityChartInverse_naturalMatrix_fderiv_zero_model v
example : Function.Injective (fun v : Fin 36 → ℝ =>
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v) :=
  source9IdentityChartInverse_clifford_fderiv_zero_injective
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) v = 0 ↔ v = 0 := by
  let L : (Fin 36 → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
    fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0
  have hinj : Function.Injective L := source9IdentityChartInverse_clifford_fderiv_zero_injective
  constructor
  · intro h
    exact hinj (h.trans (map_zero L).symm)
  · intro h
    rw [h]
    exact map_zero L

private theorem auditInverse_coordinate_nonzero (i : Fin 36) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ)) ≠ 0 := by
  intro h
  let L : (Fin 36 → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
    fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0
  have hinj : Function.Injective L := source9IdentityChartInverse_clifford_fderiv_zero_injective
  have heq : (Pi.single i (1 : ℝ) : Fin 36 → ℝ) = 0 := hinj (h.trans (map_zero L).symm)
  have hi := congrFun heq i
  norm_num at hi

-- Dropping the half factor or reversing its sign changes the actual coordinate derivative.
example (i : Fin 36) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ)) ≠
      (2 : ℝ) • ((fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ))) := by
  intro h
  let L : (Fin 36 → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
    fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0
  have hinj : Function.Injective L := source9IdentityChartInverse_clifford_fderiv_zero_injective
  have heq : L (Pi.single i (1 : ℝ)) = L ((2 : ℝ) • (Pi.single i (1 : ℝ) : Fin 36 → ℝ)) := by
    rw [map_smul]
    exact h
  have hi := congrFun (hinj heq) i
  norm_num at hi
example (i : Fin 36) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ)) ≠
      -((fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0) (Pi.single i (1 : ℝ))) := by
  intro h
  let L : (Fin 36 → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
    fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0
  have hinj : Function.Injective L := source9IdentityChartInverse_clifford_fderiv_zero_injective
  have heq : L (Pi.single i (1 : ℝ)) = L (-(Pi.single i (1 : ℝ) : Fin 36 → ℝ)) := by
    rw [map_neg]
    exact h
  have hi := congrFun (hinj heq) i
  norm_num at hi
example (i : Fin 36) :
    (1 / 2 : ℝ) •
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i))) ≠ 0 := by
  rw [← auditInverse_coordinate_halfBivector i]
  exact auditInverse_coordinate_nonzero i

-- Total inverse regularity does not enlarge the actual chart source or inverse-law domains.
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinIdentityLocalChart.source) :
    source9SpinIdentityLocalChart.symm (source9SpinIdentityLocalChart g) = g :=
  source9SpinIdentityLocalChart.left_inv hg
example (t : Fin 36 → ℝ) (ht : t ∈ source9SpinIdentityLocalChart.target) :
    source9SpinIdentityLocalChart (source9SpinIdentityLocalChart.symm t) = t :=
  source9SpinIdentityLocalChart.right_inv ht
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_eq_word
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_contDiff_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_fderiv_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_fderiv_zero_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_fderiv_zero_reverse
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_fderiv_zero_projected_commutator
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_naturalMatrix_fderiv_zero_model
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_clifford_fderiv_zero_injective
end
