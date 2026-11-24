import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5POriginalScalarMixedRemainderProbe

/-! Diagnostic only: isolate the first G5P source binding in CSQ-O0 R3.
Do not import the failed CSQ-O0 module or claim full orbital qualification. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQO0G5PBindingDiagnostic
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

-- Record the original inferred donor type before any evaluation-map comparison.
#check @sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply

private def half (M : AlgebraData 2) (w : SpinIndex → ℝ) : SourceEnd 2 :=
  (1 / 2 : ℂ) • (∑ p : FermionLabel 2,
    sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)

private def evalAt (f : SmoothCore 2) (x : Boson 2) :
    SourceEnd 2 →ₗ[ℂ] Fermion 2 where
  toFun A := (A f) x
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

private def kinetic (n : ℝ) : SourceEnd 2 :=
  (-(n : ℂ) / 2) • sourceOriginalSecondDerivativeSum (N := 2)

private def potential (M : AlgebraData 2) (f : SmoothCore 2)
    (x : Boson 2) (n : ℝ) : Fermion 2 :=
  ((n : ℂ) * (sourceNineSpatialQuarticPotential M x : ℂ)) • f x

/-- A: consume the donor at its own literal equation, without the R3 helper. -/
theorem rawDonor (M : AlgebraData 2)
    (hcolor : ∀ a : ColorIndex 2, M.color a = FCP.BFSSSU2.normalizedPauli a)
    (w : SpinIndex → ℝ) (hgamma : M.gamma = originalGamma)
    (f : SmoothCore 2) (x : Boson 2) :
    (((1 / 2 : ℂ) •
      (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x =
      (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) f) x +
      ((spinorSquareNorm w : ℂ) *
        (sourceNineSpatialQuarticPotential M x : ℂ)) • f x :=
  sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply M hcolor w hgamma f x

/-- B: test only the left evaluation boundary. -/
theorem halfEvaluation (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    evalAt f x (half M w) =
      (((1 / 2 : ℂ) •
        (∑ p : FermionLabel 2,
          sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x := by
  rfl

/-- C: test only the right kinetic-plus-mixed evaluation boundary. -/
theorem mixedEvaluation (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    evalAt f x (kinetic (spinorSquareNorm w) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) =
      (((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) f) x := by
  rfl

/-- D: test the quartic evaluation separately. -/
theorem potentialEvaluation (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    potential M f x (spinorSquareNorm w) =
      ((spinorSquareNorm w : ℂ) *
        (sourceNineSpatialQuarticPotential M x : ℂ)) • f x := by
  rfl

/-- E: join exactly one source equation, via the separately checked boundaries.
This is not the two-spinor cancellation or the full CSQ-O0 statement. -/
theorem singleSpinorBinding (M : AlgebraData 2)
    (hcolor : ∀ a : ColorIndex 2, M.color a = FCP.BFSSSU2.normalizedPauli a)
    (w : SpinIndex → ℝ) (hgamma : M.gamma = originalGamma)
    (f : SmoothCore 2) (x : Boson 2) :
    evalAt f x (half M w) =
      evalAt f x (kinetic (spinorSquareNorm w) +
        (1 / 2 : ℂ) • sourceSpinorOrderedMixedTerm M w) +
      potential M f x (spinorSquareNorm w) := by
  rw [halfEvaluation M w f x, mixedEvaluation M w f x,
    potentialEvaluation M w f x]
  exact rawDonor M hcolor w hgamma f x

#print axioms rawDonor
#print axioms halfEvaluation
#print axioms mixedEvaluation
#print axioms potentialEvaluation
#print axioms singleSpinorBinding
end
end FCP.BFSSCSQO0G5PBindingDiagnostic
