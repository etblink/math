import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-!
D1R0 — smallest source-exact CAR and gauge-bilinear pilot.

Original pairedAlgebraData, pairedGaugeData, 48 source theta generators,
Fermion 2, and exact G4J color action. This is NOT a rank-one Gaussian
projector, Berry-flat lift, invariant SmoothCore trial, or spectral theorem.

Compiler qualification requires a new native, independent-consumer,
allowed-axiom strict gate. No untested definitions are promoted as proofs.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1R0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData

/-- Exact source-paired 48-Majorana CAR, on literal Fermion 2. -/
theorem originalThetaCAR
    (α β : SpinIndex) (A B : ColorIndex 2) :
    M.theta α A * M.theta β B + M.theta β B * M.theta α A =
      (if α = β ∧ A = B then (1 : ℂ) else 0) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  change pairedTheta α A * pairedTheta β B +
      pairedTheta β B * pairedTheta α A = _
  exact pairedTheta_CAR α β A B

/-- Transport of an ORIGINAL ordered theta-theta product by G4J.
    Both color output indices use original adjointCoefficient's input-
    to-output convention. This is a prerequisite to covariance of the
    source flattened Gaussian quadratic operator. -/
theorem originalThetaPair_covariant
    (g : GaugeGroup 2) (α β : SpinIndex)
    (A B : ColorIndex 2) (v : Fermion 2) :
    G.fermion g (M.theta α A (M.theta β B v)) =
      ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
        ((M.adjointCoefficient g A C : ℂ) *
          (M.adjointCoefficient g B D : ℂ)) •
          M.theta α C (M.theta β D (G.fermion g v)) := by
  calc
    G.fermion g (M.theta α A (M.theta β B v)) =
        ∑ C : ColorIndex 2, (M.adjointCoefficient g A C : ℂ) •
          M.theta α C (G.fermion g (M.theta β B v)) :=
      G.fermion_adjoint g α A _
    _ = ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
          ((M.adjointCoefficient g A C : ℂ) *
            (M.adjointCoefficient g B D : ℂ)) •
            M.theta α C (M.theta β D (G.fermion g v)) := by
      rw [G.fermion_adjoint g β B v]
      simp only [map_sum, map_smul, Finset.smul_sum, smul_smul]

/-- The original-carrier flattened Gaussian quadratic operator at
    arbitrary (not yet proved skew) complex 48-by-48 coefficients.
    Its -i/2 double-sum normalization matches gamma=sqrt(2)*theta
    and H_C=-(i/4) sum C_ab gamma_a gamma_b.
    No rank-one/projector statement is made in this gate. -/
noncomputable def originalCARQuadratic
    (C : (SpinIndex × ColorIndex 2) →
      (SpinIndex × ColorIndex 2) → ℂ) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  ((-Complex.I) / 2) •
    ∑ p : SpinIndex × ColorIndex 2,
      ∑ q : SpinIndex × ColorIndex 2,
        (C p q) • (M.theta p.1 p.2 * M.theta q.1 q.2)

/-- Original CAR quadratic vanishes for zero coefficient matrix;
    this basic exact source-carrier consumer is intentionally small. -/
theorem originalCARQuadratic_zero :
    originalCARQuadratic (fun _ _ => 0) = 0 := by
  unfold originalCARQuadratic
  simp only [zero_smul]
  simp

#print axioms originalThetaCAR
#print axioms originalThetaPair_covariant
#print axioms originalCARQuadratic_zero

end
end FCP.BFSSHopfD1R0
