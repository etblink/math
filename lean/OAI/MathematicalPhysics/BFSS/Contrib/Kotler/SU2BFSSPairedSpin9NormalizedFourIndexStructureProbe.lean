import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9NormalizedUniversalScalarBracketProbe

/-!
K1D18V8R — exact normalized source-paired Spin(9) four-index
structure equation on the actual Source48Label = Fin 24 × Fin 2.

Accepted V8Q gives [H_rs,H_tu] = (1/4) • original doubled L RHS.
At H_rs = -(1/2) • L_rs the correct converted RHS has precisely
ONE H per Kronecker-delta term, NOT a doubled H+H: the latter would
be a factor-of-two error. Preserve this normalization distinction.

This is a matrix-generator identity, not yet a Lie algebra map on
all skew matrices, a global Spin(9) lift or a BFSS physical result.
-/

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9Plane
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

/-- The explicit normalized four-delta RHS with SINGLE H terms.
The sign pattern is (-,+,-,+) for conditions (s=u,s=t,r=t,r=u). -/
noncomputable def normalizedFourIndexRHS (r s t u : SpaceIndex) :
    Matrix Source48Label Source48Label ℝ :=
  -(if s = u then normalizedPairedPlane r t else 0) +
  (if s = t then normalizedPairedPlane r u else 0) -
  (if r = t then normalizedPairedPlane s u else 0) +
  (if r = u then normalizedPairedPlane s t else 0)

/-- The original doubled L RHS, scaled by one quarter, transports to
the correctly signed single-H normalized four-index RHS for all indices. -/
theorem normalizedFourIndexRHS_scalar_bridge (r s t u : SpaceIndex) :
    (1 / 4 : ℝ) • zeroDiagonalFourIndexRHS r s t u =
      normalizedFourIndexRHS r s t u := by
  classical
  by_cases hsu : s = u <;>
    by_cases hst : s = t <;>
    by_cases hrt : r = t <;>
    by_cases hru : r = u
  all_goals
    ext i j
    simp [zeroDiagonalFourIndexRHS, normalizedFourIndexRHS,
      normalizedPairedPlane, hsu, hst, hrt, hru,
      Matrix.smul_apply, Matrix.add_apply, Matrix.sub_apply,
      Matrix.neg_apply, smul_eq_mul]
    all_goals ring

/-- Explicit universal normalized commutator for source-original
paired-Fock 48-real plane matrices, including all repeated indices. -/
theorem normalizedPairedPlane_universal_four_index_bracket
    (r s t u : SpaceIndex) :
    normalizedPairedPlane r s * normalizedPairedPlane t u -
      normalizedPairedPlane t u * normalizedPairedPlane r s =
    normalizedFourIndexRHS r s t u := by
  rw [normalizedPairedPlane_universal_scalar_bracket,
    normalizedFourIndexRHS_scalar_bridge]

#print axioms normalizedFourIndexRHS_scalar_bridge
#print axioms normalizedPairedPlane_universal_four_index_bracket

end
end FCP.BFSSPairedSpin9Plane
