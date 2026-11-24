import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5QOriginalDiagonalMixedCommutatorProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G5WOriginalOrbitalGaugeTangentProbe

/-!
The scalar part of the original charge-square difference for equal-norm
spinors. The right-ordered derivative acts on the core vector at the
spinor-selected tangent. The tangent coefficients are evaluated at the point.
-/

set_option autoImplicit false

namespace FCP.BFSSCSQO0
noncomputable section

open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G4A
open FCP.BFSSSU2PhysicalDomainL6G5C
open FCP.BFSSSU2PhysicalDomainL6G5D
open FCP.BFSSSU2PhysicalDomainL6G5E
open FCP.BFSSSU2PhysicalDomainL6G5F
open FCP.BFSSSU2PhysicalDomainL6G5P
open FCP.BFSSSU2PhysicalDomainL6G5Q
open FCP.BFSSSU2PhysicalDomainL6G5W

/-- The scalar half-square in the original normal-order decomposition. -/
def sourceScalarHalfSquare (M : AlgebraData 2) (w : SpinIndex → ℝ) :
    SourceEnd 2 :=
  (1 / 2 : ℂ) • (∑ p : FermionLabel 2,
    sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)

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

/-- Cancel the common terms before binding the original operators. -/
private theorem halfSquareDifference
    {E V : Type*} [AddCommGroup E] [Module ℂ E] [AddCommGroup V] [Module ℂ V]
    (evaluate : E →ₗ[ℂ] V) (kinetic : ℝ → E) (potential : ℝ → V)
    (normW normZ : ℝ) (halfW halfZ orderedW orderedZ rightW rightZ : E)
    (hw : evaluate halfW =
      evaluate (kinetic normW + (1 / 2 : ℂ) • orderedW) + potential normW)
    (hz : evaluate halfZ =
      evaluate (kinetic normZ + (1 / 2 : ℂ) • orderedZ) + potential normZ)
    (hn : normW = normZ)
    (hmw : orderedW = (2 : ℂ) • rightW) (hmz : orderedZ = (2 : ℂ) • rightZ) :
    evaluate halfW - evaluate halfZ = evaluate rightW - evaluate rightZ := by
  rw [hw, hz, hn, hmw, hmz]
  have htwo : (1 / 2 : ℂ) * 2 = 1 := by norm_num
  simp only [smul_smul, htwo, one_smul, map_add]
  abel

private def evaluateAt (f : SmoothCore 2) (x : Boson 2) :
    SourceEnd 2 →ₗ[ℂ] Fermion 2 where
  toFun A := (A f) x
  map_add' A B := rfl
  map_smul' c A := rfl

/-- Equal spinor norms cancel the common second-derivative and quartic
terms, leaving the original orbital direction for the color difference. -/
theorem scalarHalfSquare_difference
    (M : AlgebraData 2) (hcolor : ∀ a : ColorIndex 2,
      M.color a = FCP.BFSSSU2.normalizedPauli a)
    (hgamma : M.gamma = originalGamma) (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : SmoothCore 2) (x : Boson 2) :
    (sourceScalarHalfSquare M w f) x - (sourceScalarHalfSquare M z f) x =
      (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x
        (M.gaugeTangent x
          (sourceSpinorWeightedColor M w x - sourceSpinorWeightedColor M z x)) := by
  let kinetic : ℝ → SourceEnd 2 := fun n =>
    (-(n : ℂ) / 2) • sourceOriginalSecondDerivativeSum (N := 2)
  let potential : ℝ → Fermion 2 := fun n =>
    ((n : ℂ) * (sourceNineSpatialQuarticPotential M x : ℂ)) • f x
  have hMixed :=
    halfSquareDifference (evaluateAt f x) kinetic potential
      (spinorSquareNorm w) (spinorSquareNorm z)
      (sourceScalarHalfSquare M w) (sourceScalarHalfSquare M z)
      (sourceSpinorOrderedMixedTerm M w) (sourceSpinorOrderedMixedTerm M z)
      (sourceSpinorRightOrderedMixed M w) (sourceSpinorRightOrderedMixed M z)
      (sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply M hcolor w hgamma f x)
      (sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply M hcolor z hgamma f x)
      hn
      (sourceSpinorOrderedMixedTerm_eq_rightOrdered M hcolor w)
      (sourceSpinorOrderedMixedTerm_eq_rightOrdered M hcolor z)
  calc
    _ = (sourceSpinorRightOrderedMixed M w f) x -
          (sourceSpinorRightOrderedMixed M z f) x := hMixed
    _ = _ := by
          rw [rightOrderedMixed_orbital_apply M hgamma w f x,
            rightOrderedMixed_orbital_apply M hgamma z f x]
          simp only [map_sub, smul_sub]

#print axioms originalFderiv_coordinate_sum
#print axioms rightOrderedMixed_orbital_apply
#print axioms scalarHalfSquare_difference

end
end FCP.BFSSCSQO0
