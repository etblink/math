import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DADerivativeRangeCommutatorAction
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Plane
open FCP.BFSSPairedSpin9Clifford
noncomputable section

attribute [local instance 100] LieRing.ofAssociativeRing

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDAPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDAPBWCoordinates.toAddMonoidHom auditDAPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDAPBWCoordinates

@[instance_reducible] private def auditDASpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDAMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditDAParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDATargetTopology :
    TopologicalSpace GammaMatrix := inferInstance
open scoped BigOperators Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditDAPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDAPBWCoordinates.toAddMonoidHom auditDAPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDAPBWCoordinates := rfl
example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) := inferInstance
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) = auditDASpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) = auditDAMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditDAParameterTopology := rfl
example : (inferInstance : TopologicalSpace GammaMatrix) = auditDATargetTopology := rfl
example : GammaMatrix = Matrix SpinIndex SpinIndex ℝ := rfl
example : Fintype.card SpinIndex = 16 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : LieRing GammaMatrix := inferInstance
example : LieRing (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
example : NormedSpace ℝ GammaMatrix := inferInstance

-- These audit-only abbreviations expand to the original native range representatives and iota.
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev N := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev X (A : N) : C := source9NativeSkewDerivativeRangeEquiv A
private abbrev I (z : SpaceIndex → ℝ) : C := CliffordAlgebra.ι source9Quadratic z
private abbrev K (A B : N) : C := X A * X B - X B * X A
private abbrev D (A B : N) : C := K A B - X ⁅A, B⁆

example (A B : N) : ((⁅A, B⁆ : N) : Matrix SpaceIndex SpaceIndex ℝ) =
    A.val * B.val - B.val * A.val := rfl
example (v : Fin 36 → ℝ) (z : SpaceIndex → ℝ) :
    source9PlaneWordVectorVelocity source9StrictPlaneRow source9StrictPlaneColumn
      z (List.finRange 36) v =
      (source9OrderedStrictPlaneModelEquiv v : Matrix SpaceIndex SpaceIndex ℝ).mulVec z :=
  source9OrderedStrictPlaneVectorVelocity_model v z
example (A : N) (z : SpaceIndex → ℝ) :
    X A * I z - I z * X A = I (A.val.mulVec z) :=
  source9NativeSkewDerivativeRangeEquiv_commutator_vector A z
example (x : source9IdentityChartDerivativeRange) (z : SpaceIndex → ℝ) :
    (x : C) * I z - I z * (x : C) =
      I ((source9NativeSkewDerivativeRangeEquiv.symm x).val.mulVec z) :=
  source9DerivativeRange_commutator_vector x z
example : Function.Injective (fun x : source9IdentityChartDerivativeRange =>
    fun z : SpaceIndex → ℝ => (x : C) * I z - I z * (x : C)) :=
  source9DerivativeRange_commutator_vector_injective
example (A B : N) (z : SpaceIndex → ℝ) :
    K A B * I z - I z * K A B = I ((A.val * B.val - B.val * A.val).mulVec z) :=
  source9NativeSkewDerivativeRange_commutator_pair_vector A B z
example (A B : N) (z : SpaceIndex → ℝ) : D A B * I z = I z * D A B :=
  source9NativeSkewDerivativeRange_bracket_defect_commutes A B z
example (A B : N) : source9GammaCliffordAlgHom (K A B) =
    (coordinateToOriginalGammaSkewLieHom ⁅A, B⁆ : GammaMatrix) :=
  source9NativeSkewDerivativeRange_commutator_pair_originalGamma A B
example (A B : N) : source9GammaCliffordAlgHom (D A B) = 0 :=
  source9NativeSkewDerivativeRange_bracket_defect_gamma_zero A B
example (A B : N) : K A B ∈ source9IdentityChartDerivativeRange ↔ K A B = X ⁅A, B⁆ :=
  source9NativeSkewDerivativeRange_commutator_mem_iff_bracket A B

-- Check both directions separately: actual membership is a premise in the forward direction.
example (A B : N) (hmem : K A B ∈ source9IdentityChartDerivativeRange) : K A B = X ⁅A, B⁆ :=
  (source9NativeSkewDerivativeRange_commutator_mem_iff_bracket A B).1 hmem
example (A B : N) (heq : K A B = X ⁅A, B⁆) : K A B ∈ source9IdentityChartDerivativeRange :=
  (source9NativeSkewDerivativeRange_commutator_mem_iff_bracket A B).2 heq
example (A B : N) : source9GammaCliffordAlgHom (K A B) = source9GammaCliffordAlgHom (X ⁅A, B⁆) :=
  (source9NativeSkewDerivativeRange_commutator_pair_originalGamma A B).trans
    (source9NativeSkewDerivativeRangeEquiv_originalGamma ⁅A, B⁆).symm
example (A B : N) (z : SpaceIndex → ℝ) :
    K A B * I z - I z * K A B = X ⁅A, B⁆ * I z - I z * X ⁅A, B⁆ :=
  (source9NativeSkewDerivativeRange_commutator_pair_vector A B z).trans
    (source9NativeSkewDerivativeRangeEquiv_commutator_vector ⁅A, B⁆ z).symm
example (A B : N) (i j : SpaceIndex) :
    source9CliffordVectorProjection (K A B * I (source9CoordinateVector j) -
      I (source9CoordinateVector j) * K A B) i = (A.val * B.val - B.val * A.val) i j := by
  have h := congrArg (fun a : C => source9CliffordVectorProjection a i)
    (source9NativeSkewDerivativeRange_commutator_pair_vector A B (source9CoordinateVector j))
  simpa only [source9CliffordVectorProjection_ι, source9CoordinateVector, Matrix.mulVec_single_one] using h
example (r s : SpaceIndex) (z : SpaceIndex → ℝ) :
    X (source9CoordinatePlaneInSo r s) * I z - I z * X (source9CoordinatePlaneInSo r s) =
      I ((coordinatePlane9 r s).mulVec z) :=
  source9NativeSkewDerivativeRangeEquiv_commutator_vector (source9CoordinatePlaneInSo r s) z
example (x : source9IdentityChartDerivativeRange)
    (hx : ∀ z : SpaceIndex → ℝ, (x : C) * I z - I z * (x : C) = 0) : x = 0 := by
  apply source9DerivativeRange_commutator_vector_injective
  funext z
  exact (hx z).trans (by simp only [ZeroMemClass.coe_zero, zero_mul, mul_zero, sub_self])

-- Zero vector commutator action on the whole Clifford carrier does not imply a zero value.
example (z : SpaceIndex → ℝ) : (1 : C) * I z - I z * (1 : C) = 0 := by
  rw [one_mul, mul_one, sub_self]
example : (1 : C) ≠ 0 := by
  intro h
  have hmap : algebraMap ℝ C (1 : ℝ) = algebraMap ℝ C (0 : ℝ) := by
    simpa only [map_one, map_zero] using h
  have hr := (FaithfulSMul.algebraMap_injective ℝ C) hmap
  norm_num at hr
example : (1 : C) ∉ source9IdentityChartDerivativeRange := by
  rintro ⟨v, hv⟩
  have hvalue : source9IdentityChartDerivative v = (1 : C) := hv
  have hrev : CliffordAlgebra.reverse (source9IdentityChartDerivative v) = -source9IdentityChartDerivative v :=
    source9IdentityChartInverse_clifford_fderiv_zero_reverse v
  have hone : CliffordAlgebra.reverse (1 : C) = -1 :=
    (congrArg (fun a : C => CliffordAlgebra.reverse a) hvalue).symm.trans
      (hrev.trans (congrArg (fun a : C => -a) hvalue))
  have hmap : algebraMap ℝ C (1 : ℝ) = algebraMap ℝ C (-1 : ℝ) := by
    simpa only [map_one, map_neg, CliffordAlgebra.reverse.map_one] using hone
  have hreal : (1 : ℝ) = -1 := (FaithfulSMul.algebraMap_injective ℝ C) hmap
  norm_num at hreal
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

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneVectorVelocity_model
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_commutator_vector
#print axioms FCP.BFSSPairedSpin9Clifford.source9DerivativeRange_commutator_vector
#print axioms FCP.BFSSPairedSpin9Clifford.source9DerivativeRange_commutator_vector_injective
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_commutator_pair_vector
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_bracket_defect_commutes
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_commutator_pair_originalGamma
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_bracket_defect_gamma_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_commutator_mem_iff_bracket
end
