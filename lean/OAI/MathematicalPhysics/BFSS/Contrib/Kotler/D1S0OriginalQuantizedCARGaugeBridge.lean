import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1S0 — changed proof architecture after D1R0 two-native-RED stop.

Original source pairedAlgebraData, pairedGaugeData, Fermion 2 and real
FrequencyMatrix 2, with EXACT original quantizeFrequency.
The two previously source-compiled CAR and gauge-bilinear proofs are
independently consumable here without importing the rejected D1R0 root.

This does NOT prove coefficient transport, a Gaussian rank-one projector,
Berry curvature, SmoothCore membership or a BFSS spectral theorem.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData

/-- The original source theta anticommutator on the genuine Fermion 2. -/
theorem originalThetaCAR
    (α β : SpinIndex) (A B : ColorIndex 2) :
    M.theta α A * M.theta β B + M.theta β B * M.theta α A =
      (if α = β ∧ A = B then (1 : ℂ) else 0) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  change pairedTheta α A * pairedTheta β B +
      pairedTheta β B * pairedTheta α A = _
  exact pairedTheta_CAR α β A B

/-- Original gauge action intertwines the ordered theta-theta product,
    using the source color input/output order in G4J. -/
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

/-- Flattened original CAR quadratic uses the *existing* BFSS source
    quantizeFrequency, NOT the duplicate D1R0 complex quadratic.
    The covariance C is a real 48×48 original FrequencyMatrix 2. -/
noncomputable def originalSourceFlattened (C : FrequencyMatrix 2) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  M.quantizeFrequency (-C)

/-- Source-carrier, source-coefficient identification by definition;
    substantive covariance of this operator is reserved for D1S1. -/
theorem originalSourceFlattened_eq_originalQuantization
    (C : FrequencyMatrix 2) :
    originalSourceFlattened C =
      pairedAlgebraData.quantizeFrequency (-C) := rfl

#print axioms originalThetaCAR
#print axioms originalThetaPair_covariant
#print axioms originalSourceFlattened_eq_originalQuantization

end
end FCP.BFSSHopfD1S0
