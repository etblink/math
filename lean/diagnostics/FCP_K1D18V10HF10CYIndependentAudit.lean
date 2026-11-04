import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CYIdentityChartDerivativeRange
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditRangePBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditRangePBWCoordinates.toAddMonoidHom auditRangePBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditRangePBWCoordinates

@[instance_reducible] private def auditRangeSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditRangeMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditRangeParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditRangePBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditRangePBWCoordinates.toAddMonoidHom auditRangePBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditRangePBWCoordinates := rfl
example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) := inferInstance
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditRangeSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditRangeMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw




example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditRangeParameterTopology := rfl
example : Module ℝ source9IdentityChartDerivativeRange := inferInstance
example : Module ℝ (LieAlgebra.Orthogonal.so SpaceIndex ℝ) := inferInstance
example : source9IdentityChartDerivative =
    fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinIdentityLocalChart.symm t) : CliffordAlgebra source9Quadratic)) 0 := rfl
example : source9IdentityChartDerivative =
    source9PlaneSpinWordVelocity source9StrictPlaneRow source9StrictPlaneColumn (List.finRange 36) :=
  source9IdentityChartInverse_clifford_fderiv_zero
example : source9IdentityChartDerivativeRange =
    LinearMap.range source9IdentityChartDerivative.toLinearMap := rfl
example (x : CliffordAlgebra source9Quadratic) :
    x ∈ source9IdentityChartDerivativeRange ↔
      ∃ v : Fin 36 → ℝ, source9IdentityChartDerivative v = x := Iff.rfl
example : source9NativeHalfBivectorSpan =
    Submodule.span ℝ (Set.range (fun p : source9StrictPlaneIndex =>
      (1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.1) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.2)))) := rfl
example (p : source9StrictPlaneIndex) : p.val.1 < p.val.2 := p.property
example (v : Fin 36 → ℝ) :
    source9IdentityChartDerivative v =
      ((List.finRange 36).map (fun i => v i • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i)))))).sum :=
  source9IdentityChartDerivative_apply v
example (i : Fin 36) : source9IdentityChartDerivative (Pi.single i (1 : ℝ)) =
    (1 / 2 : ℝ) •
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i))) :=
  source9IdentityChartDerivative_coordinate i
example : source9IdentityChartDerivativeRange = source9NativeHalfBivectorSpan :=
  source9IdentityChartDerivative_range_eq_halfBivectorSpan
example (v : Fin 36 → ℝ) : source9IdentityChartDerivative v ∈ source9NativeHalfBivectorSpan := by
  have hr : source9IdentityChartDerivative v ∈ source9IdentityChartDerivativeRange := ⟨v, rfl⟩
  exact source9IdentityChartDerivative_range_eq_halfBivectorSpan ▸ hr
example (p : source9StrictPlaneIndex) :
    (1 / 2 : ℝ) •
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.1) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.2)) ∈
      source9IdentityChartDerivativeRange := by
  have hs : (1 / 2 : ℝ) •
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.1) *
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector p.val.2)) ∈ source9NativeHalfBivectorSpan :=
    Submodule.subset_span ⟨p, rfl⟩
  exact source9IdentityChartDerivative_range_eq_halfBivectorSpan.symm ▸ hs
example : (Fin 36 → ℝ) ≃ₗ[ℝ] source9IdentityChartDerivativeRange :=
  source9IdentityChartDerivativeRangeEquiv
example (v : Fin 36 → ℝ) :
    (source9IdentityChartDerivativeRangeEquiv v : CliffordAlgebra source9Quadratic) =
      source9IdentityChartDerivative v := source9IdentityChartDerivativeRangeEquiv_apply v
example (v : Fin 36 → ℝ) :
    source9IdentityChartDerivativeRangeEquiv.symm (source9IdentityChartDerivativeRangeEquiv v) = v :=
  source9IdentityChartDerivativeRangeEquiv.symm_apply_apply v
example (x : source9IdentityChartDerivativeRange) :
    source9IdentityChartDerivativeRangeEquiv (source9IdentityChartDerivativeRangeEquiv.symm x) = x :=
  source9IdentityChartDerivativeRangeEquiv.apply_symm_apply x
example : LieAlgebra.Orthogonal.so SpaceIndex ℝ ≃ₗ[ℝ] source9IdentityChartDerivativeRange :=
  source9NativeSkewDerivativeRangeEquiv
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) =
      source9IdentityChartDerivative (source9OrderedStrictPlaneModelEquiv.symm A) :=
  source9NativeSkewDerivativeRangeEquiv_apply A
example (x : source9IdentityChartDerivativeRange) :
    source9NativeSkewDerivativeRangeEquiv.symm x =
      source9OrderedStrictPlaneModelEquiv (source9IdentityChartDerivativeRangeEquiv.symm x) :=
  source9NativeSkewDerivativeRangeEquiv_symm x
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9NativeSkewDerivativeRangeEquiv.symm (source9NativeSkewDerivativeRangeEquiv A) = A :=
  source9NativeSkewDerivativeRangeEquiv.symm_apply_apply A
example (x : source9IdentityChartDerivativeRange) :
    source9NativeSkewDerivativeRangeEquiv (source9NativeSkewDerivativeRangeEquiv.symm x) = x :=
  source9NativeSkewDerivativeRangeEquiv.apply_symm_apply x
example (v : Fin 36 → ℝ) :
    source9NativeSkewDerivativeRangeEquiv.symm (source9IdentityChartDerivativeRangeEquiv v) =
      source9OrderedStrictPlaneModelEquiv v :=
  (source9NativeSkewDerivativeRangeEquiv_symm (source9IdentityChartDerivativeRangeEquiv v)).trans
    (congrArg source9OrderedStrictPlaneModelEquiv
      (source9IdentityChartDerivativeRangeEquiv.symm_apply_apply v))
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) (i j : SpaceIndex) :
    source9CliffordVectorProjection
      ((source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) -
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) *
          (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic)) i = A.val i j :=
  source9NativeSkewDerivativeRangeEquiv_projected_commutator A i j

-- On an arbitrary actual range value, the inverse native matrix is recovered entry by entry.
example (x : source9IdentityChartDerivativeRange) (i j : SpaceIndex) :
    (source9NativeSkewDerivativeRangeEquiv.symm x).val i j =
      source9CliffordVectorProjection
        ((x : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) -
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) * (x : CliffordAlgebra source9Quadratic)) i := by
  have h := source9NativeSkewDerivativeRangeEquiv_projected_commutator
    (source9NativeSkewDerivativeRangeEquiv.symm x) i j
  have heq : (source9NativeSkewDerivativeRangeEquiv (source9NativeSkewDerivativeRangeEquiv.symm x) :
      CliffordAlgebra source9Quadratic) = (x : CliffordAlgebra source9Quadratic) :=
    congrArg (fun y : source9IdentityChartDerivativeRange => (y : CliffordAlgebra source9Quadratic))
      (source9NativeSkewDerivativeRangeEquiv.apply_symm_apply x)
  exact h.symm.trans (congrArg (fun a : CliffordAlgebra source9Quadratic =>
    source9CliffordVectorProjection
      (a * CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) -
        CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) * a) i) heq)

-- This bivector range is a proper part of the original Clifford space: scalar identity is excluded.
private theorem auditRange_one_not_mem : (1 : CliffordAlgebra source9Quadratic) ∉
    source9IdentityChartDerivativeRange := by
  rintro ⟨v, hv⟩
  have hvalue : source9IdentityChartDerivative v = (1 : CliffordAlgebra source9Quadratic) := hv
  have hrev : CliffordAlgebra.reverse (source9IdentityChartDerivative v) = -source9IdentityChartDerivative v :=
    source9IdentityChartInverse_clifford_fderiv_zero_reverse v
  have hone : CliffordAlgebra.reverse (1 : CliffordAlgebra source9Quadratic) = -1 :=
    (congrArg (fun a : CliffordAlgebra source9Quadratic => CliffordAlgebra.reverse a) hvalue).symm.trans
      (hrev.trans (congrArg (fun a : CliffordAlgebra source9Quadratic => -a) hvalue))
  have hmap : algebraMap ℝ (CliffordAlgebra source9Quadratic) (1 : ℝ) =
      algebraMap ℝ (CliffordAlgebra source9Quadratic) (-1 : ℝ) := by
    simpa only [map_one, map_neg, CliffordAlgebra.reverse.map_one] using hone
  have hreal : (1 : ℝ) = -1 :=
    (FaithfulSMul.algebraMap_injective ℝ (CliffordAlgebra source9Quadratic)) hmap
  norm_num at hreal
example : (1 : CliffordAlgebra source9Quadratic) ∉ source9NativeHalfBivectorSpan := by
  intro hs
  exact auditRange_one_not_mem (source9IdentityChartDerivative_range_eq_halfBivectorSpan.symm ▸ hs)
example : source9NativeHalfBivectorSpan ≠ ⊤ := by
  intro h
  have hs : (1 : CliffordAlgebra source9Quadratic) ∈ source9NativeHalfBivectorSpan := by
    rw [h]
    exact Submodule.mem_top
  exact auditRange_one_not_mem (source9IdentityChartDerivative_range_eq_halfBivectorSpan.symm ▸ hs)

-- Retain the positive-half normalization control and the global source noninjectivity boundary.
example (i : Fin 36) : source9IdentityChartDerivative (Pi.single i (1 : ℝ)) ≠
    (2 : ℝ) • source9IdentityChartDerivative (Pi.single i (1 : ℝ)) := by
  intro h
  have hinj : Function.Injective source9IdentityChartDerivative :=
    source9IdentityChartInverse_clifford_fderiv_zero_injective
  have heq : source9IdentityChartDerivative (Pi.single i (1 : ℝ)) =
      source9IdentityChartDerivative ((2 : ℝ) • (Pi.single i (1 : ℝ) : Fin 36 → ℝ)) := by
    rw [map_smul]
    exact h
  have hi := congrFun (hinj heq) i
  norm_num at hi
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivative
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivativeRange
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeHalfBivectorSpan
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivative_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivative_coordinate
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivative_range_eq_halfBivectorSpan
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivativeRangeEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivativeRangeEquiv_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_symm
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_projected_commutator
end
