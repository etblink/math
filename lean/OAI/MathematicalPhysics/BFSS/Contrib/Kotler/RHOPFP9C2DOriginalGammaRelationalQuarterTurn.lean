import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2COriginalGammaRelationalPhasePartialIsometry

/-!
# RHOPF-P9C2D — original real quarter-turn extension of relational phase

The accepted original Gamma9 rank-four orthogonal projector P and
source phase J=K13 P satisfy:
  P²=P, Pᵀ=P; J²=-P, Jᵀ=-J; PJ=JP=J.
Define U=(I-P)+J, a quarter turn on the original common-action
image of P, and the identity on its orthogonal complement.

Bounded source-exact goals:
  UᵀU=I;
  U²=I-2P.
Continuous U(1) action and literal Hopf quotient remain separate.
No expanded gamma tables, source edits, private import, Fock action,
Hamiltonian, Noether charge, or particle claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C2D
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2B
open FCP.RHOPFP9C2C

/-- Original-source full-carrier quarter turn:
identity off im(P), orthogonal J on im(P). -/
noncomputable def relationalQuarterTurn : GammaMatrix :=
  1 - relationalProjector + relationalPhaseJ

/-- Transpose of the original real 16-carrier quarter-turn. -/
theorem relationalQuarterTurn_transpose :
    relationalQuarterTurn.transpose =
      1 - relationalProjector - relationalPhaseJ := by
  unfold relationalQuarterTurn
  simp only [Matrix.transpose_add, Matrix.transpose_sub, Matrix.transpose_one,
    relationalProjector_transpose_eq, relationalPhaseJ_transpose_neg]
  abel

/-- An exact ambient orthogonality identity, no real matrix entries. -/
theorem relationalQuarterTurn_transpose_mul_self :
    relationalQuarterTurn.transpose * relationalQuarterTurn =
      (1 : GammaMatrix) := by
  rw [relationalQuarterTurn_transpose]
  change (1 - relationalProjector - relationalPhaseJ) *
      (1 - relationalProjector + relationalPhaseJ) = 1
  calc
    (1 - relationalProjector - relationalPhaseJ) *
        (1 - relationalProjector + relationalPhaseJ) =
      1 - relationalProjector - relationalProjector +
      relationalProjector * relationalProjector +
      relationalPhaseJ - relationalProjector * relationalPhaseJ -
      relationalPhaseJ + relationalPhaseJ * relationalProjector -
      relationalPhaseJ * relationalPhaseJ := by noncomm_ring
    _ = 1 := by
      rw [relationalProjector_idempotent,
        relationalProjector_mul_phaseJ,
        relationalPhaseJ_mul_projector,
        relationalPhaseJ_square_neg_projector]
      module

/-- The quarter-turn square flips the source-original rank-four
common-action sector and fixes its orthogonal complement. -/
theorem relationalQuarterTurn_square :
    relationalQuarterTurn * relationalQuarterTurn =
      (1 : GammaMatrix) - (2 : ℝ) • relationalProjector := by
  change (1 - relationalProjector + relationalPhaseJ) *
      (1 - relationalProjector + relationalPhaseJ) =
        (1 : GammaMatrix) - (2 : ℝ) • relationalProjector
  calc
    (1 - relationalProjector + relationalPhaseJ) *
        (1 - relationalProjector + relationalPhaseJ) =
      1 - relationalProjector - relationalProjector +
      relationalProjector * relationalProjector +
      relationalPhaseJ - relationalProjector * relationalPhaseJ +
      relationalPhaseJ - relationalPhaseJ * relationalProjector +
      relationalPhaseJ * relationalPhaseJ := by noncomm_ring
    _ = (1 : GammaMatrix) - (2 : ℝ) • relationalProjector := by
      rw [relationalProjector_idempotent,
        relationalProjector_mul_phaseJ,
        relationalPhaseJ_mul_projector,
        relationalPhaseJ_square_neg_projector]
      module

#print axioms relationalQuarterTurn_transpose
#print axioms relationalQuarterTurn_transpose_mul_self
#print axioms relationalQuarterTurn_square

end
end FCP.RHOPFP9C2D
