import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5QOriginalDiagonalMixedCommutatorProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5WOriginalOrbitalGaugeTangentProbe

/-! D2: retain the literal G5P left-hand side throughout.
Native R4 candidate: D2 single-spinor identity plus evaluated subtraction.
No half-square wrapper or conversion to an abstract evaluation-map argument. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQO0Literal
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
open FCP.BFSSSU2PhysicalDomainL6G4A
open FCP.BFSSSU2PhysicalDomainL6G5W

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

/-- Resolve an arbitrary source bosonic direction in the canonical
coordinate basis and apply the original coordinate derivatives. -/
theorem originalFderiv_coordinate_sum
    (f : SmoothCore 2) (x v : Boson 2) :
    fderiv ℝ (f : Boson 2 → Fermion 2) x v =
      ∑ u : BosonLabel 2, (v u) • ((sourceD u f) x) := by
  have hbasis :
      (∑ u : BosonLabel 2, (v u) • EuclideanSpace.single u (1 : ℝ)) = v := by
    simpa only [EuclideanSpace.basisFun_apply, EuclideanSpace.basisFun_repr] using
      (EuclideanSpace.basisFun (BosonLabel 2) ℝ).sum_repr v
  calc
    _ = fderiv ℝ (f : Boson 2 → Fermion 2) x
          (∑ u : BosonLabel 2, (v u) • EuclideanSpace.single u (1 : ℝ)) := by
            rw [hbasis]
    _ = ∑ u : BosonLabel 2, (v u) •
          (fderiv ℝ (f : Boson 2 → Fermion 2) x (EuclideanSpace.single u (1 : ℝ))) := by
            rw [map_sum]
            simp only [map_smul]
    _ = _ := by
          apply Finset.sum_congr rfl
          intro u _
          rcases u with ⟨i, a⟩
          rw [sourceD, coordinateDerivative_apply]

/-- The literal right-ordered mixed operator is minus i times the
directional derivative along the original spinor-weighted tangent. -/
theorem rightOrderedMixed_orbital_apply
    (M : AlgebraData 2) (hgamma : M.gamma = originalGamma)
    (w : SpinIndex → ℝ) (f : SmoothCore 2) (x : Boson 2) :
    ((sourceSpinorRightOrderedMixed M w) f) x =
      (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x
        (M.gaugeTangent x (sourceSpinorWeightedColor M w x)) := by
  let v : Boson 2 := M.gaugeTangent x (sourceSpinorWeightedColor M w x)
  have h := sourceSpinorRightOrderedMixed_eq_originalGaugeTangent_apply M hgamma w f x
  change _ = (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x v
  rw [h, originalFderiv_coordinate_sum f x v, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro u _
  rw [mul_smul]
  exact congrArg (fun a : Fermion 2 => (-Complex.I) • a)
    (IsScalarTower.algebraMap_smul ℂ (v u) ((sourceD u f) x))

/-- Pure additive cancellation after evaluating the original operators. -/
theorem cancelCommonEvaluations {V : Type*} [AddCommGroup V]
    (kW kZ rW rZ pW pZ : V) (hk : kW = kZ) (hp : pW = pZ) :
    (kW + rW + pW) - (kZ + rZ + pZ) = rW - rZ := by
  rw [hk, hp]
  abel

/-- Exact original scalar half-square difference on the smooth core.
The left-hand side is literal G5P, with no new coefficient wrapper.
The two single-spinor equations are joined only after point evaluation. -/
theorem scalarHalfSquare_difference
    (M : AlgebraData 2) (hcolor : ∀ a : ColorIndex 2,
      M.color a = FCP.BFSSSU2.normalizedPauli a)
    (hgamma : M.gamma = originalGamma) (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : SmoothCore 2) (x : Boson 2) :
    (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
      sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x -
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M z p * sourceAllSpinorCoefficient M z p)) f) x =
      (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x
        (M.gaugeTangent x
          (sourceSpinorWeightedColor M w x - sourceSpinorWeightedColor M z x)) := by
  let k : ℝ → Fermion 2 := fun n =>
    (((-(n : ℂ) / 2) • sourceOriginalSecondDerivativeSum (N := 2)) f) x
  let p : ℝ → Fermion 2 := fun n =>
    ((n : ℂ) * (sourceNineSpatialQuarticPotential M x : ℂ)) • f x
  calc
    _ = ((((-(spinorSquareNorm w : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2)) f) x +
        (sourceSpinorRightOrderedMixed M w f) x +
        ((spinorSquareNorm w : ℂ) *
          (sourceNineSpatialQuarticPotential M x : ℂ)) • f x) -
        ((((-(spinorSquareNorm z : ℂ) / 2) •
          sourceOriginalSecondDerivativeSum (N := 2)) f) x +
        (sourceSpinorRightOrderedMixed M z f) x +
        ((spinorSquareNorm z : ℂ) *
          (sourceNineSpatialQuarticPotential M x : ℂ)) • f x) :=
      congrArg₂ (fun a b : Fermion 2 => a - b)
        (literalSingleSpinor M hcolor w hgamma f x)
        (literalSingleSpinor M hcolor z hgamma f x)
    _ = (sourceSpinorRightOrderedMixed M w f) x -
          (sourceSpinorRightOrderedMixed M z f) x :=
      cancelCommonEvaluations (k (spinorSquareNorm w)) (k (spinorSquareNorm z))
        ((sourceSpinorRightOrderedMixed M w f) x)
        ((sourceSpinorRightOrderedMixed M z f) x)
        (p (spinorSquareNorm w)) (p (spinorSquareNorm z))
        (congrArg k hn) (congrArg p hn)
    _ = _ := by
          rw [rightOrderedMixed_orbital_apply M hgamma w f x,
            rightOrderedMixed_orbital_apply M hgamma z f x]
          simp only [map_sub, smul_sub]

#print axioms evaluateHalfDouble
#print axioms normalizeRight
#print axioms literalSingleSpinor
#print axioms originalFderiv_coordinate_sum
#print axioms rightOrderedMixed_orbital_apply
#print axioms cancelCommonEvaluations
#print axioms scalarHalfSquare_difference
end
end FCP.BFSSCSQO0Literal
