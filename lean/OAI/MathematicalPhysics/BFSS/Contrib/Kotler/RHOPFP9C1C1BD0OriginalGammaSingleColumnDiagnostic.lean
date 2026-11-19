import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C1AOriginalGammaCommonActionEqualizer

/-!
# RHOPF-P9C1C1B-D0 — source-original single-gamma column microgate

The accepted original gamma signed-permutation source has a public
GammaMatrix `gamma`. To assess the remaining source-specific Hopf
coordinate witness, compute only ONE direct original gamma action:
  gamma 3 * e0 = e10.
This follows from the original source's integer signed permutation
(row 10 maps to col 0 with sign +1), as independently fixture-checked.

Crucially, use pinned Mathlib `Matrix.mulVec_single_one` to eliminate
the matrix-vector summation BEFORE inspecting the 16 public-source
entries of a single gamma column. This differs from previously
unsuccessful two-cell product `rfl` and 16-term real-product expansion.

No surrogate gamma model, copied private source table, import-all,
resource override, Fock/observable/Hamiltonian or physical claim.
This candidate is strictly unqualified until native and independent
source-exact CI passes with no sorryAx.
-/

set_option autoImplicit false
namespace FCP.RHOPFP9C1C1BD0
noncomputable section

open scoped Matrix
open OAI.BFSSQuantum
open FCP.BFSSGamma9

theorem originalGamma3_on_basis0 :
    gamma (3 : SpaceIndex) *ᵥ
        (Pi.single (0 : SpinIndex) (1 : ℝ)) =
      Pi.single (10 : SpinIndex) (1 : ℝ) := by
  rw [Matrix.mulVec_single_one]
  funext i
  change (gamma (3 : SpaceIndex)) i (0 : SpinIndex) =
    (Pi.single (10 : SpinIndex) (1 : ℝ)) i
  fin_cases i <;> norm_num [gamma, Matrix.map_apply, Pi.single]

#print axioms originalGamma3_on_basis0

end
end FCP.RHOPFP9C1C1BD0
