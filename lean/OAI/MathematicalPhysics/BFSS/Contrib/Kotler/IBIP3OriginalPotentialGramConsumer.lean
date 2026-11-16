import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0AOriginalBosonGram
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C0OriginalPauliPotentialBinding

/-!
# IBI→P3 independent unified-mainline utility check

Use the already-green ORIGINAL BFSS boson Gram incidence theorem as a
meaningful consumer of the accepted normalized-Pauli original potential.
No redefinition of the actual P2C0 potential, new gauge/fermion action,
changed massless normalization, physical-state domain, or spectral claim.

SOURCE CANDIDATE — do not call qualified before fresh cold Lean consumer gate.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIP3OriginalPotentialGramConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSIBIG0AOriginalBosonGram

/-- A three-color wedge square is the Gram 2×2 principal minor on the
literal original nine-by-three real BFSS bosonic configuration. -/
theorem sourceColorWedgeSquared_eq_gramMinor
    (x : Boson 2) (i j : SpaceIndex) :
    FCP.BFSSSU2.colorWedgeSquared
        (fun a : Fin 3 => x (i, a))
        (fun a : Fin 3 => x (j, a)) =
      originalGram x i i * originalGram x j j -
        (originalGram x i j)^2 := by
  simp only [FCP.BFSSSU2.colorWedgeSquared, originalGram,
    PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
    Fin.sum_univ_three]
  ring

/-- The actual original BFSS normalized-Pauli h=1,m=0 potential is
a sum of Gram minors, without an abstract replacement potential. -/
theorem originalPauli_masslessPotential_eq_gramMinors
    (x : Boson 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x =
      ∑ p : OAI.BFSSGamma.SpatialPair,
        (originalGram x p.1.1 p.1.1 *
          originalGram x p.1.2 p.1.2 -
            (originalGram x p.1.1 p.1.2)^2) := by
  rw [FCP.BFSSP2C0OriginalPauliPotentialBinding.originalPauli_masslessPotential_eq_wedge]
  apply Finset.sum_congr rfl
  intro p _
  exact sourceColorWedgeSquared_eq_gramMinor x p.1.1 p.1.2

/-- Physical payoff at the CLASSICAL potential level:
the actual massless original Pauli bosonic potential is invariant under
the genuine source G2A gauge action, by its Gram description. -/
theorem originalPauli_masslessPotential_gauge
    (g : GaugeGroup 2) (x : Boson 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0
      (FCP.BFSSSU2GaugeG2A.bosonGauge g x) =
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x := by
  rw [originalPauli_masslessPotential_eq_gramMinors,
    originalPauli_masslessPotential_eq_gramMinors]
  apply Finset.sum_congr rfl
  intro p _
  rw [originalGram_gauge, originalGram_gauge, originalGram_gauge]

#print axioms sourceColorWedgeSquared_eq_gramMinor
#print axioms originalPauli_masslessPotential_eq_gramMinors
#print axioms originalPauli_masslessPotential_gauge

end
end FCP.BFSSIBIP3OriginalPotentialGramConsumer
