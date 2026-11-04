import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DBDerivativeRangeCommutatorClosure
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Clifford
noncomputable section

attribute [local instance 100] LieRing.ofAssociativeRing

-- Reconstruct the same PBW norm without registering the imported source instances.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDBPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDBPBWCoordinates.toAddMonoidHom auditDBPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDBPBWCoordinates

@[instance_reducible] private def auditDBSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDBMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditDBParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDBTargetTopology :
    TopologicalSpace GammaMatrix := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditDBPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDBPBWCoordinates.toAddMonoidHom auditDBPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDBPBWCoordinates := rfl
example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) := inferInstance
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) = auditDBSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) = auditDBMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditDBParameterTopology := rfl
example : (inferInstance : TopologicalSpace GammaMatrix) = auditDBTargetTopology := rfl
example : GammaMatrix = Matrix SpinIndex SpinIndex ℝ := rfl
example : Fintype.card SpinIndex = 16 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : LieRing GammaMatrix := inferInstance
example : LieRing (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
example : FaithfulSMul ℝ GammaMatrix := inferInstance
example : NormedSpace ℝ GammaMatrix := inferInstance

private abbrev C := CliffordAlgebra source9Quadratic
private abbrev N := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev X (A : N) : C := source9NativeSkewDerivativeRangeEquiv A
private abbrev I (z : SpaceIndex → ℝ) : C := CliffordAlgebra.ι source9Quadratic z
private abbrev K (A B : N) : C := X A * X B - X B * X A
private abbrev D (A B : N) : C := K A B - X ⁅A, B⁆

-- Audit all three hypotheses explicitly; no Spin group membership or global gamma faithfulness.
example (x : C) (hx : x ∈ CliffordAlgebra.even source9Quadratic)
    (hc : ∀ z : SpaceIndex → ℝ, x * I z = I z * x) :
    ∀ j : SpaceIndex, CliffordAlgebra.contractLeft (Q := source9Quadratic)
      (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) x = 0 :=
  source9Clifford_even_commutes_coordinateContractions_zero x hx hc
example (x : C) (hx : x ∈ CliffordAlgebra.even source9Quadratic)
    (hc : ∀ z : SpaceIndex → ℝ, x * I z = I z * x) :
    ∃ c : ℝ, x = algebraMap ℝ C c := source9Clifford_even_commutes_eq_scalar x hx hc
example (x : C) (hx : x ∈ CliffordAlgebra.even source9Quadratic)
    (hc : ∀ z : SpaceIndex → ℝ, x * I z = I z * x)
    (hgamma : source9GammaCliffordAlgHom x = 0) : x = 0 :=
  source9Clifford_even_commutes_gamma_zero x hx hc hgamma
example (x : source9IdentityChartDerivativeRange) : (x : C) ∈ CliffordAlgebra.even source9Quadratic :=
  source9IdentityChartDerivativeRange_mem_even x
example (A B : N) : D A B ∈ CliffordAlgebra.even source9Quadratic :=
  source9NativeSkewDerivativeRange_bracket_defect_mem_even A B
example (A B : N) : D A B = 0 := source9NativeSkewDerivativeRange_bracket_defect_zero A B
example (A B : N) : K A B = X ⁅A, B⁆ := source9NativeSkewDerivativeRangeEquiv_commutator A B
example (x y : source9IdentityChartDerivativeRange) :
    (x : C) * (y : C) - (y : C) * (x : C) ∈ source9IdentityChartDerivativeRange :=
  source9IdentityChartDerivativeRange_commutator_mem x y
example (x y : C) (hx : x ∈ source9NativeHalfBivectorSpan) (hy : y ∈ source9NativeHalfBivectorSpan) :
    x * y - y * x ∈ source9NativeHalfBivectorSpan := source9NativeHalfBivectorSpan_commutator_mem x y hx hy

-- The actual defect supplies each hypothesis independently through accepted and candidate interfaces.
example (A B : N) : ∀ z : SpaceIndex → ℝ, D A B * I z = I z * D A B :=
  source9NativeSkewDerivativeRange_bracket_defect_commutes A B
example (A B : N) : source9GammaCliffordAlgHom (D A B) = 0 :=
  source9NativeSkewDerivativeRange_bracket_defect_gamma_zero A B
example (A B : N) (j : SpaceIndex) : CliffordAlgebra.contractLeft (Q := source9Quadratic)
    (LinearMap.proj j : Module.Dual ℝ (SpaceIndex → ℝ)) (D A B) = 0 :=
  source9Clifford_even_commutes_coordinateContractions_zero (D A B)
    (source9NativeSkewDerivativeRange_bracket_defect_mem_even A B)
    (source9NativeSkewDerivativeRange_bracket_defect_commutes A B) j
example (A B : N) : K A B ∈ source9IdentityChartDerivativeRange :=
  source9IdentityChartDerivativeRange_commutator_mem
    (source9NativeSkewDerivativeRangeEquiv A) (source9NativeSkewDerivativeRangeEquiv B)
example (A B : N) : source9GammaCliffordAlgHom (K A B) =
    (coordinateToOriginalGammaSkewLieHom ⁅A, B⁆ : GammaMatrix) :=
  (congrArg source9GammaCliffordAlgHom (source9NativeSkewDerivativeRangeEquiv_commutator A B)).trans
    (source9NativeSkewDerivativeRangeEquiv_originalGamma ⁅A, B⁆)
example (x y : C) (hx : x ∈ source9IdentityChartDerivativeRange) (hy : y ∈ source9IdentityChartDerivativeRange) :
    x * y - y * x ∈ source9IdentityChartDerivativeRange :=
  source9IdentityChartDerivativeRange_commutator_mem ⟨x, hx⟩ ⟨y, hy⟩

-- The scalar obstruction is real: nonzero even commutants exist, and gamma detects their scalar.
example (c : ℝ) : algebraMap ℝ C c ∈ CliffordAlgebra.even source9Quadratic :=
  (CliffordAlgebra.even source9Quadratic).algebraMap_mem c
example (c : ℝ) (z : SpaceIndex → ℝ) : algebraMap ℝ C c * I z = I z * algebraMap ℝ C c :=
  Algebra.commutes c (I z)
example (c : ℝ) : source9GammaCliffordAlgHom (algebraMap ℝ C c) = algebraMap ℝ GammaMatrix c :=
  source9GammaCliffordAlgHom.commutes c
example : source9GammaCliffordAlgHom (1 : C) ≠ 0 := by
  intro h
  have hone : (1 : GammaMatrix) = 0 := (map_one source9GammaCliffordAlgHom).symm.trans h
  have hentry := congrArg (fun M : GammaMatrix => M (0 : SpinIndex) 0) hone
  norm_num at hentry

-- A nonzero original coordinate vector is odd, so evenness is an explicit restriction.
example (j : SpaceIndex) : I (source9CoordinateVector j) ∉ CliffordAlgebra.even source9Quadratic := by
  intro heven
  have hfix : CliffordAlgebra.involute
      (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j)) =
      CliffordAlgebra.ι source9Quadratic (source9CoordinateVector j) :=
    CliffordAlgebra.involute_eq_of_mem_even heven
  have hneg : -I (source9CoordinateVector j) = I (source9CoordinateVector j) := by
    simpa only [CliffordAlgebra.involute_ι] using hfix
  have hv : -(source9CoordinateVector j) = source9CoordinateVector j :=
    source9CliffordVectorEmbedding_injective
      ((map_neg (CliffordAlgebra.ι source9Quadratic) (source9CoordinateVector j)).trans hneg)
  have hj := congrFun hv j
  norm_num [source9CoordinateVector] at hj

-- Preserve range properness, half normalization and the separate global two-sign obstruction.
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

#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_even_commutes_coordinateContractions_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_even_commutes_eq_scalar
#print axioms FCP.BFSSPairedSpin9Clifford.source9Clifford_even_commutes_gamma_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivativeRange_mem_even
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_bracket_defect_mem_even
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRange_bracket_defect_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_commutator
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivativeRange_commutator_mem
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeHalfBivectorSpan_commutator_mem
end
