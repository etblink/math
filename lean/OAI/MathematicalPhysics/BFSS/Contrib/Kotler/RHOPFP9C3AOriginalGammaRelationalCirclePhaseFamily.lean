import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2DOriginalGammaRelationalQuarterTurn

/-!
# RHOPF-P9C3A — original real relational algebraic circle-phase family

On the exact original Gamma9 real-16 carrier, source-verified P and J obey
P²=P, Pᵀ=P, J²=-P, Jᵀ=-J, PJ=JP=J.
Define R(a,b)=I-P+aP+bJ for arbitrary real (a,b).
Future circle action requires proving group multiplication and restricting
a²+b²=1, then continuity: no such claim is made in this gate.

Bounded type-level source-exact contracts:
  R(1,0)=I
  R(0,1)=the accepted original quarter-turn U
  R(-1,0)=I-2P
  R(a,b)ᵀ=R(a,-b)

No source gamma entries, alternate gamma data, private imports,
physical Fock/Hamiltonian operators, new axioms or resource changes.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C3A
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2B
open FCP.RHOPFP9C2D

/-- Original Gamma9 source algebraic two-real-parameter phase family. -/
noncomputable def relationalCirclePhase (a b : ℝ) : GammaMatrix :=
  1 - relationalProjector + a • relationalProjector + b • relationalPhaseJ

/-- Unit phase at (1,0) is identity on the original full carrier. -/
theorem relationalCirclePhase_one_zero :
    relationalCirclePhase 1 0 = (1 : GammaMatrix) := by
  change (1 : GammaMatrix) - relationalProjector +
      (1 : ℝ) • relationalProjector + (0 : ℝ) • relationalPhaseJ = 1
  simp

/-- Phase at (0,1) is the independently qualified quarter-turn U. -/
theorem relationalCirclePhase_zero_one :
    relationalCirclePhase 0 1 = relationalQuarterTurn := by
  change (1 : GammaMatrix) - relationalProjector +
      (0 : ℝ) • relationalProjector + (1 : ℝ) • relationalPhaseJ =
        relationalQuarterTurn
  simp [relationalQuarterTurn]

/-- Phase at (-1,0) is the full-carrier original sector sign flip. -/
theorem relationalCirclePhase_neg_one_zero :
    relationalCirclePhase (-1) 0 =
      (1 : GammaMatrix) - (2 : ℝ) • relationalProjector := by
  change (1 : GammaMatrix) - relationalProjector +
      (-1 : ℝ) • relationalProjector + (0 : ℝ) • relationalPhaseJ =
        (1 : GammaMatrix) - (2 : ℝ) • relationalProjector
  simp only [neg_one_smul, zero_smul, add_zero]
  module

/-- The original algebraic phase family respects matrix transpose by
complex conjugation (a,b)↦(a,-b), without a group-law claim. -/
theorem relationalCirclePhase_transpose (a b : ℝ) :
    (relationalCirclePhase a b).transpose =
      relationalCirclePhase a (-b) := by
  change
    ((1 : GammaMatrix) - relationalProjector +
      a • relationalProjector + b • relationalPhaseJ).transpose =
      1 - relationalProjector +
        a • relationalProjector + (-b) • relationalPhaseJ
  simp only [Matrix.transpose_add, Matrix.transpose_sub,
    Matrix.transpose_one, Matrix.transpose_smul,
    relationalProjector_transpose_eq, relationalPhaseJ_transpose_neg,
    smul_neg, neg_smul]

#print axioms relationalCirclePhase_one_zero
#print axioms relationalCirclePhase_zero_one
#print axioms relationalCirclePhase_neg_one_zero
#print axioms relationalCirclePhase_transpose

end
end FCP.RHOPFP9C3A
