import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D46OriginalGammaQUnitEuclideanUnitBoundary

/-!
# RHOPF-P9C3D2G1D47 — original Gamma9 Q-unit sphere / Euclidean unit sphere equivalence

D45 is a source-Q-preserving, Gamma9-Circle-equivariant complex-linear
isometry of the original isolated carrier into EuclideanSpace ℂ (Fin 2).
D46 proves source Q(x)=1 iff the image has Euclidean norm 1, and
constructs the forward subtype map. This gate constructs the inverse
subtype map using the SAME D45 isometry and proves both inverse laws.

No homeomorphism, restricted-Circle equivariance, quotient,
Hopf charge, physical Fock or BFSS soliton is asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D47
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D45
open FCP.RHOPFP9C3D2G1D46

/-- Inverse of the D46 forward restriction: Euclidean unit vectors
pull back under the same original Gamma9 Q-isometry to Q-unit vectors. -/
noncomputable def relationalEuclideanUnitToSourceQUnit
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  refine ⟨relationalSourceComplexFourSourceQIsometricRepr.symm y.val, ?_⟩
  apply (relationalSourceQUnit_iff_euclideanUnit _).mpr
  simpa only [LinearIsometryEquiv.apply_symm_apply] using y.property

/-- Actual inverse identities for the ORIGINAL source Q-unit to
standard Euclidean unit correspondence, not merely a dimension count. -/
noncomputable def relationalSourceQUnitEuclideanUnitEquiv :
    {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} ≃
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  refine
    { toFun := relationalSourceQUnitToEuclideanUnit
      invFun := relationalEuclideanUnitToSourceQUnit
      left_inv := ?_
      right_inv := ?_ }
  · intro x
    apply Subtype.ext
    change relationalSourceComplexFourSourceQIsometricRepr.symm
      (relationalSourceComplexFourSourceQIsometricRepr x.val) = x.val
    exact LinearIsometryEquiv.symm_apply_apply _ _
  · intro y
    apply Subtype.ext
    change relationalSourceComplexFourSourceQIsometricRepr
      (relationalSourceComplexFourSourceQIsometricRepr.symm y.val) = y.val
    exact LinearIsometryEquiv.apply_symm_apply _ _

#print axioms relationalEuclideanUnitToSourceQUnit
#print axioms relationalSourceQUnitEuclideanUnitEquiv

end
end FCP.RHOPFP9C3D2G1D47
