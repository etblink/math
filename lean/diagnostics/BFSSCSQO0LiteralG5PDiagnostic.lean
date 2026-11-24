import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5QOriginalDiagonalMixedCommutatorProbe

/-! D2: retain the literal G5P left-hand side throughout.
No half-square wrapper, wrapper equality or conversion to an abstract
evaluation-map argument on the left. Single-spinor diagnostic only. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQO0LiteralG5PDiagnostic
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5C
open FCP.BFSSSU2PhysicalDomainL6G5D
open FCP.BFSSSU2PhysicalDomainL6G5E
open FCP.BFSSSU2PhysicalDomainL6G5F
open FCP.BFSSSU2PhysicalDomainL6G5P
open FCP.BFSSSU2PhysicalDomainL6G5Q

/-- Arbitrary source endomorphisms; evaluate only after the small
scalar normalization. No coefficient square enters this equality. -/
theorem evaluateHalfDouble (A B C : SourceEnd 2)
    (h : B = (2 : ℂ) • C) (f : SmoothCore 2) (x : Boson 2) :
    ((A + (1 / 2 : ℂ) • B) f) x = (A f) x + (C f) x := by
  have hn : (1 / 2 : ℂ) * 2 = 1 := by norm_num
  calc
    _ = ((A + C) f) x := by rw [h, smul_smul, hn, one_smul]
    _ = _ := rfl

/-- Single-spinor RHS normalization, with the actual G5Q equation.
The kinetic coefficient and original right-ordered operator remain named. -/
theorem normalizeRight (M : AlgebraData 2)
    (hcolor : ∀ a : ColorIndex 2, M.color a = FCP.BFSSSU2.normalizedPauli a)
    (w : SpinIndex → ℝ) (f : SmoothCore 2) (x : Boson 2) :
    (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) f) x =
      (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2)) f) x +
      (sourceSpinorRightOrderedMixed M w f) x :=
  evaluateHalfDouble
    ((-(spinorSquareNorm w : ℂ) / 2) • sourceOriginalSecondDerivativeSum (N := 2))
    (sourceSpinorOrderedMixedTerm M w) (sourceSpinorRightOrderedMixed M w)
    (sourceSpinorOrderedMixedTerm_eq_rightOrdered M hcolor w) f x

/-- Literal donor equation, rewriting only its RHS. No new wrapper
or equality of separately elaborated coefficient-square endomorphisms. -/
theorem literalSingleSpinor (M : AlgebraData 2)
    (hcolor : ∀ a : ColorIndex 2, M.color a = FCP.BFSSSU2.normalizedPauli a)
    (w : SpinIndex → ℝ) (hgamma : M.gamma = originalGamma)
    (f : SmoothCore 2) (x : Boson 2) :
    (((1 / 2 : ℂ) •
      (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x =
      (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2)) f) x +
      (sourceSpinorRightOrderedMixed M w f) x +
      ((spinorSquareNorm w : ℂ) *
        (sourceNineSpatialQuarticPotential M x : ℂ)) • f x := by
  calc
    _ = (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) f) x +
      ((spinorSquareNorm w : ℂ) *
        (sourceNineSpatialQuarticPotential M x : ℂ)) • f x :=
      sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply M hcolor w hgamma f x
    _ = _ := congrArg
      (fun v : Fermion 2 => v + ((spinorSquareNorm w : ℂ) *
        (sourceNineSpatialQuarticPotential M x : ℂ)) • f x)
      (normalizeRight M hcolor w f x)

#print axioms evaluateHalfDouble
#print axioms normalizeRight
#print axioms literalSingleSpinor
end
end FCP.BFSSCSQO0LiteralG5PDiagnostic
