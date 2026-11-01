import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF9GeneratorDeterminantMagnitudeProbe

/-!
K1D18V10H-F10 — exact positive-sign ANCHOR on the original
ninth gamma matrix in the frozen real signed-permutation
representation, not a replacement Clifford model.

The original source SU2RealGammaProbe encodes gamma (8 : Fin 9)
as the diagonal 16x16 real matrix with eight +1 and eight -1
entries. The determinant should therefore be (-1)^8 = +1.
This test forces the actual original gamma source to elaborate
into this explicit matrix and proves its exact determinant,
then transfers the anchor into gammaNineRealLinear.

This is deliberately a BASIS ANCHOR, not a proof that every
Clifford vector generator has determinant +Q(v)^8, nor a
connectedness or Lipschitz-closure proof.

No changes to accepted gamma source, original labels,
pinned toolchains, recursion limits, or assumptions.
F10 CANDIDATE until fresh warning-as-error and independent
source-exact declaration/axiom verification.
-/

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9DetFixture
noncomputable section

open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSGamma9
open FCP.BFSSS1V0
open OAI.BFSSQuantum
open Matrix

/-- The ACTUAL ninth accepted real gamma matrix equals
an explicit 16-index diagonal with exactly eight +1
and eight -1 coefficients. -/
theorem originalGamma8_eq_diagonal :
    gamma (8 : SpaceIndex) =
      Matrix.diagonal
        (fun i : SpinIndex =>
          if i.val < 8 then (1 : ℝ) else (-1 : ℝ)) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    first
    | rfl
    | norm_num [gamma, Matrix.diagonal, Matrix.map_apply] <;> rfl

/-- The determinant of the actual ninth original real
gamma, not an arbitrary substitute, equals +1. -/
theorem originalGamma8_det_one :
    (gamma (8 : SpaceIndex)).det = 1 := by
  rw [originalGamma8_eq_diagonal, Matrix.det_diagonal]
  norm_num [Fin.prod_univ_succ]

/-- The original Clifford gamma linear map has determinant
+1 on the original ninth coordinate unit vector.
The general determinant sign remains an OPEN obligation. -/
theorem gammaNineRealLinear_axis8_det_one :
    (gammaNineRealLinear
      (fun i : SpaceIndex => if i = 8 then (1 : ℝ) else 0)).det = 1 := by
  have haxis :
      gammaNineRealLinear
        (fun i : SpaceIndex => if i = 8 then (1 : ℝ) else 0) =
        gamma (8 : SpaceIndex) := by
    change
      (∑ i : SpaceIndex, (if i = 8 then (1 : ℝ) else 0) • gamma i) =
        gamma (8 : SpaceIndex)
    simp
  rw [haxis]
  exact originalGamma8_det_one

#print axioms originalGamma8_eq_diagonal
#print axioms originalGamma8_det_one
#print axioms gammaNineRealLinear_axis8_det_one

end
end FCP.BFSSPairedSpin9DetFixture
