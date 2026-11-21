import Mathlib.Analysis.InnerProductSpace.PiL2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D44OriginalGammaComplexLinearEquivFinTwo

/-!
# RHOPF-P9C3D2G1D45 — source-Q orthonormal representation

Use the detached original Gamma9 Q-inner product of D41 and
the original Gamma9 J4-derived complex finrank-two proof D43.
Obtain an orthonormal basis with pinned Mathlib stdOrthonormalBasis
and use OrthonormalBasis.repr as a true complex-linear isometry.

The three metric instances stay local, without a substitute Q,
classical Hopf quotient/Chern or BFSS physical claim.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D45
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D42
open FCP.RHOPFP9C3D2G1D43

@[instance_reducible]
noncomputable def relationalSourceComplexFourSourceQOrthonormalBasis :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    OrthonormalBasis (Fin 2) ℂ RelationalSourceComplexFour := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  letI : FiniteDimensional ℂ RelationalSourceComplexFour :=
    FiniteDimensional.of_finrank_eq_succ
      (show Module.finrank ℂ RelationalSourceComplexFour = Nat.succ 1 from by
        simpa using relationalSourceComplexFour_finrank_complex)
  exact (stdOrthonormalBasis ℂ RelationalSourceComplexFour).reindex
    (finCongr relationalSourceComplexFour_finrank_complex)

@[instance_reducible]
noncomputable def relationalSourceComplexFourSourceQIsometricRepr :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    RelationalSourceComplexFour ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2) := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  exact relationalSourceComplexFourSourceQOrthonormalBasis.repr

theorem relationalSourceComplexFourSourceQIsometricRepr_norm_sq
    (x : RelationalSourceComplexFour) :
    ‖relationalSourceComplexFourSourceQIsometricRepr x‖ ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  calc
    ‖relationalSourceComplexFourSourceQIsometricRepr x‖ ^ 2 = ‖x‖ ^ 2 := by
      rw [LinearIsometryEquiv.norm_map]
    _ = relationalRangeCoordinateDotSelf x.coordinates :=
      relationalSourceComplexFourInnerProductSpace_norm_sq x

theorem relationalSourceComplexFourSourceQIsometricRepr_circle
    (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourSourceQIsometricRepr
      (relationalSourceComplexFourCircleAction z x) =
        (z : ℂ) • relationalSourceComplexFourSourceQIsometricRepr x := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  rw [relationalSourceComplexFourCircleAction_eq_smul]
  exact map_smul
    (relationalSourceComplexFourSourceQIsometricRepr.toLinearEquiv) (z : ℂ) x

#print axioms relationalSourceComplexFourSourceQOrthonormalBasis
#print axioms relationalSourceComplexFourSourceQIsometricRepr
#print axioms relationalSourceComplexFourSourceQIsometricRepr_norm_sq
#print axioms relationalSourceComplexFourSourceQIsometricRepr_circle

end
end FCP.RHOPFP9C3D2G1D45
