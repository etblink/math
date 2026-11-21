import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D37OriginalGammaComplexInnerProductCore

/-!
# RHOPF-P9C3D2G1D38 — source-Q norm candidate and isolated normed group

D37 R2 strictly qualified the source-original Gamma9 Q-based
`InnerProductSpace.Core ℂ` on the isolated D31 complex carrier.
The pinned Mathlib API constructs a normed additive group from an
InnerProductSpace.Core. This bounded gate first derives an explicit
source Q square-root length and its exact squared-Q identity,
then constructs the corresponding normed group as a standalone
value, NOT a registered ambient or global typeclass instance.

No replacement of coordinate Euclidean dot, no global NormedSpace
or InnerProductSpace instance, no C² frame/Hopf quotient and no
physical BFSS Fock/Gauss/Hamiltonian/soliton conclusions.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D38
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D37

/-- Source-derived positive length, using original Gamma9 Q, not the
default Euclidean norm on the noncanonical four real coordinates. -/
noncomputable def relationalSourceComplexFourQNorm
    (x : RelationalSourceComplexFour) : ℝ :=
  Real.sqrt (relationalRangeCoordinateDotSelf x.coordinates)

/-- The original source Gamma9 Q length is nonnegative. -/
theorem relationalSourceComplexFourQNorm_nonneg
    (x : RelationalSourceComplexFour) :
    0 ≤ relationalSourceComplexFourQNorm x := by
  exact Real.sqrt_nonneg _

/-- Original Gamma9 source quadratic Q is exactly the squared
source-compatible length, independently of any global norm instance. -/
theorem relationalSourceComplexFourQNorm_sq
    (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourQNorm x) ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates := by
  have hQ : 0 ≤ relationalRangeCoordinateDotSelf x.coordinates := by
    rw [← relationalSourceComplexFourInnerProductCore_self_re_quadratic]
    exact relationalSourceComplexFourHermitian_self_re_nonneg x
  exact Real.sq_sqrt hQ

/-- The explicit source Q length agrees with the square-root
diagonal of the strictly qualified original Gamma9 inner product. -/
theorem relationalSourceComplexFourQNorm_eq_core_sqrt
    (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourQNorm x =
      Real.sqrt
        ((relationalSourceComplexFourInnerProductCore.inner x x).re) := by
  change Real.sqrt (relationalRangeCoordinateDotSelf x.coordinates) =
    Real.sqrt
      ((relationalSourceComplexFourInnerProductCore.inner x x).re)
  rw [relationalSourceComplexFourInnerProductCore_self_re_quadratic]

/-- The source Q length is strictly positive away from zero. -/
theorem relationalSourceComplexFourQNorm_pos_of_ne_zero
    (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < relationalSourceComplexFourQNorm x := by
  exact Real.sqrt_pos.2 (by
    rw [← relationalSourceComplexFourInnerProductCore_self_re_quadratic]
    exact relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero x hx)

/-- Standalone pinned-Mathlib normed additive group derived from
the exact original Gamma9 positive inner-product Core.
This definition is NOT installed as a global instance. -/
@[instance_reducible]
noncomputable def relationalSourceComplexFourNormedAddCommGroup :
    NormedAddCommGroup RelationalSourceComplexFour := by
  letI : InnerProductSpace.Core ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductCore
  exact InnerProductSpace.Core.toNormedAddCommGroup
    (𝕜 := ℂ) (F := RelationalSourceComplexFour)

#print axioms relationalSourceComplexFourQNorm
#print axioms relationalSourceComplexFourQNorm_nonneg
#print axioms relationalSourceComplexFourQNorm_sq
#print axioms relationalSourceComplexFourQNorm_eq_core_sqrt
#print axioms relationalSourceComplexFourQNorm_pos_of_ne_zero
#print axioms relationalSourceComplexFourNormedAddCommGroup

end
end FCP.RHOPFP9C3D2G1D38
