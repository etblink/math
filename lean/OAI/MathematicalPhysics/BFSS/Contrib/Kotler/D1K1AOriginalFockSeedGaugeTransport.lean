import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-!
D1K1-A: source-typed eight-orbital Fock seed, color gauge orbit and norm.
The finite wedge uses the exact source Gamma9 matrix, original G1A 8×3
mode labels, G4A exterior action, and G4B/G4E/G4J unitary transport.

This microgate does NOT certify the seed's norm as 1, the four-plus/four-minus
Gamma8 sign count, stabilizer descent, spatial Spin48 vector lift, physical
Gauss-law smooth core, a fermion expectation or spectral estimate.
-/

set_option autoImplicit false

namespace FCP.BFSSHopfD1K1A
noncomputable section

open OAI.BFSSQuantum
open OAI.Laughlin.Fock
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4A
open FCP.BFSSSU2GaugeG4B
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2GaugeG4J

/-- The actual original Gamma8 diagonal coefficient on the even member
of spin pair j; it is not a newly chosen sign convention. -/
noncomputable def sourceGamma8Sign (j : Fin 8) : ℝ :=
  pairedAlgebraData.gamma (8 : SpaceIndex)
    (spinPairEquiv.symm (j, (0 : Fin 2)))
    (spinPairEquiv.symm (j, (0 : Fin 2)))

/-- Occupied orbital (color 1 + i s_j color 2)/sqrt 2 in the literal
24-mode source orbital labeling, with source Gamma8 sign s_j. -/
noncomputable def sourceOccupiedOrbital (j : Fin 8) : Orbital 23 :=
  (1 / (Real.sqrt 2 : ℂ)) •
    (mode (colorModeEquiv (j, (1 : ColorIndex 2))) +
      (Complex.I * (sourceGamma8Sign j : ℂ)) •
        mode (colorModeEquiv (j, (2 : ColorIndex 2))))

/-- Ordered list multiplication matters in a fermionic exterior algebra.
List.ofFn fixes j=0,...,7 order without assuming commutativity. -/
noncomputable def sourceExteriorSeed : Space 23 :=
  (List.ofFn (fun j : Fin 8 =>
    ExteriorAlgebra.ι ℂ (sourceOccupiedOrbital j))).prod

/-- Genuine BFSS Fock vector, not just a Gaussian covariance or ray. -/
noncomputable def sourceFockSeed : Fermion 2 :=
  fockAlgebraToBFSS sourceExteriorSeed

/-- Color orbit as the existing source G4A exterior action and G4B transport. -/
noncomputable def sourceColorOrbit (g : GaugeGroup 2) : Fermion 2 :=
  fockAlgebraToBFSS (exteriorGauge g sourceExteriorSeed)

/-- Exact original BFSS GaugeData action on this explicit source Fock seed. -/
theorem sourceColorOrbit_eq_originalGauge (g : GaugeGroup 2) :
    pairedGaugeData.fermion g sourceFockSeed = sourceColorOrbit g := by
  change fermionGaugeLinearEquiv g (fockAlgebraToBFSS sourceExteriorSeed) =
    fockAlgebraToBFSS (exteriorGauge g sourceExteriorSeed)
  exact fermionGaugeLinearEquiv_intertwine g sourceExteriorSeed

/-- The orbit has exactly the original gauge representation's group law. -/
theorem sourceColorOrbit_mul (g h : GaugeGroup 2) :
    pairedGaugeData.fermion g (sourceColorOrbit h) =
      sourceColorOrbit (g * h) := by
  change fermionGaugeLinearEquiv g
      (fockAlgebraToBFSS (exteriorGauge h sourceExteriorSeed)) =
    fockAlgebraToBFSS (exteriorGauge (g * h) sourceExteriorSeed)
  rw [fermionGaugeLinearEquiv_intertwine]
  exact congrArg fockAlgebraToBFSS (exteriorGauge_mul g h sourceExteriorSeed)

/-- Exact isometry on the literal original Fock Hilbert norm. -/
theorem sourceColorOrbit_norm (g : GaugeGroup 2) :
    ‖sourceColorOrbit g‖ = ‖sourceFockSeed‖ := by
  rw [← sourceColorOrbit_eq_originalGauge]
  exact (pairedGaugeData.fermion g).norm_map sourceFockSeed

#print axioms sourceColorOrbit_eq_originalGauge
#print axioms sourceColorOrbit_mul
#print axioms sourceColorOrbit_norm

end
end FCP.BFSSHopfD1K1A
