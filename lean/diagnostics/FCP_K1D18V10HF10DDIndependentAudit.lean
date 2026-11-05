import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DDDerivativeRangeGammaLieHom
import Mathlib.Tactic.NormNum

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open scoped BigOperators

attribute [local instance 100] LieRing.ofAssociativeRing

private abbrev C := CliffordAlgebra source9Quadratic
private abbrev N := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev T := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev S := source9IdentityChartDerivativeLieSubalgebra
private abbrev e := source9NativeSkewDerivativeRangeLieEquiv
private abbrev H := source9DerivativeRangeGammaSkewLieHom

example : GammaMatrix = Matrix SpinIndex SpinIndex ℝ := rfl
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : LieRing C := inferInstance
example : LieRing GammaMatrix := inferInstance
example : LieAlgebra ℝ C := inferInstance
example : LieAlgebra ℝ GammaMatrix := inferInstance
example : (S : Submodule ℝ C) = source9IdentityChartDerivativeRange := rfl
example (x y : S) : ((⁅x, y⁆ : S) : C) = (x : C) * (y : C) - (y : C) * (x : C) := rfl

-- Check every new interface with the original gamma function and canonical skew target explicit.
example (x : S) : source9GammaCliffordAlgHom (x : C) ∈ T :=
  source9DerivativeLieSubalgebra_gamma_mem_so x
example : S →ₗ⁅ℝ⁆ T := source9DerivativeRangeGammaSkewLieHom
example (x : S) : (H x : GammaMatrix) = source9GammaCliffordAlgHom (x : C) :=
  source9DerivativeRangeGammaSkewLieHom_apply x
example (A : N) : H (e A) = coordinateToOriginalGammaSkewLieHom A :=
  source9DerivativeRangeGammaSkewLieHom_native_apply A
example : H.comp e.toLieHom = coordinateToOriginalGammaSkewLieHom :=
  source9DerivativeRangeGammaSkewLieHom_comp_native
example : H = coordinateToOriginalGammaSkewLieHom.comp e.symm.toLieHom :=
  source9DerivativeRangeGammaSkewLieHom_factor

-- Full underlying linear operator is literal original evaluation restricted by subtype inclusion.
example :
    let inclusion : T →ₗ[ℝ] GammaMatrix := (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype
    let evaluation : S →ₗ[ℝ] GammaMatrix :=
      source9GammaCliffordAlgHom.toLinearMap.comp S.toSubmodule.subtype
    inclusion.comp H.toLinearMap = evaluation := by
  apply LinearMap.ext
  intro x
  rfl
example (x y : S) : H (x + y) = H x + H y := map_add H x y
example (c : ℝ) (x : S) : H (c • x) = c • H x := map_smul H c x
example (x y : S) : H ⁅x, y⁆ = ⁅H x, H y⁆ := LieHom.map_lie H x y
example (x : S) : H x = coordinateToOriginalGammaSkewLieHom (e.symm x) :=
  congrArg (fun f : S →ₗ⁅ℝ⁆ T => f x) source9DerivativeRangeGammaSkewLieHom_factor
example (x : S) (a b : SpinIndex) :
    (H x : GammaMatrix) a b = source9GammaCliffordAlgHom (x : C) a b :=
  congrArg (fun M : GammaMatrix => M a b) (source9DerivativeRangeGammaSkewLieHom_apply x)
example (x y : S) :
    source9GammaCliffordAlgHom ((x : C) * (y : C) - (y : C) * (x : C)) =
      source9GammaCliffordAlgHom (x : C) * source9GammaCliffordAlgHom (y : C) -
        source9GammaCliffordAlgHom (y : C) * source9GammaCliffordAlgHom (x : C) :=
  congrArg (fun M : T => (M : GammaMatrix)) (LieHom.map_lie H x y)

-- Retain the original quarter double sum and positive half-gamma coordinate-plane normalization.
example (A : N) : (H (e A) : GammaMatrix) =
    (1 / 4 : ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex, A.val r s • (gamma r * gamma s) := by
  have hvalue : (H (e A) : GammaMatrix) = (coordinateToOriginalGammaSkewLieHom A : GammaMatrix) :=
    congrArg (fun M : T => (M : GammaMatrix)) (source9DerivativeRangeGammaSkewLieHom_native_apply A)
  have hcoeff : (coordinateToOriginalGammaSkewLieHom A : GammaMatrix) =
      (1 / 4 : ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex, A.val r s • (gamma r * gamma s) :=
    coordinateToOriginalGammaLinearMap_apply A.val
  exact hvalue.trans hcoeff
example (r s : SpaceIndex) (hrs : r ≠ s) :
    (H (e (source9CoordinatePlaneInSo r s)) : GammaMatrix) = (1 / 2 : ℝ) • (gamma r * gamma s) :=
  (congrArg (fun M : T => (M : GammaMatrix))
    (source9DerivativeRangeGammaSkewLieHom_native_apply (source9CoordinatePlaneInSo r s))).trans
      (coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply r s hrs)

-- Identity belongs to the ambient algebra, but it is excluded from the actual range domain.
example : (1 : C) ∉ S := by
  intro hx
  have hxR : (1 : C) ∈ source9IdentityChartDerivativeRange := hx
  rcases hxR with ⟨v, hv⟩
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
example : source9GammaCliffordAlgHom (1 : C) = 1 := map_one source9GammaCliffordAlgHom
example : source9GammaCliffordAlgHom (1 : C) ≠ 0 := by
  intro h
  have hone : (1 : GammaMatrix) = 0 := (map_one source9GammaCliffordAlgHom).symm.trans h
  have hentry := congrArg (fun M : GammaMatrix => M (0 : SpinIndex) 0) hone
  norm_num at hentry
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9DerivativeLieSubalgebra_gamma_mem_so
#print axioms source9DerivativeRangeGammaSkewLieHom
#print axioms source9DerivativeRangeGammaSkewLieHom_apply
#print axioms source9DerivativeRangeGammaSkewLieHom_native_apply
#print axioms source9DerivativeRangeGammaSkewLieHom_comp_native
#print axioms source9DerivativeRangeGammaSkewLieHom_factor
end
end FCP.BFSSPairedSpin9Clifford
