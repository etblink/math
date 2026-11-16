import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIP3OriginalPotentialGramConsumer

/-!
Independent literal P2C0/original BFSS source consumer.
Verify that the imported original Gram invariants describe the actual
normalized-Pauli potential and its actual G2A gauge invariance.
-/
set_option autoImplicit false
namespace BFSSIBIP3OriginalPotentialGramIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSIBIG0AOriginalBosonGram
open FCP.BFSSIBIP3OriginalPotentialGramConsumer

example (x : Boson 2) (i j : SpaceIndex) :
    FCP.BFSSSU2.colorWedgeSquared
      (fun a : Fin 3 => x (i,a)) (fun a : Fin 3 => x (j,a)) =
        originalGram x i i * originalGram x j j -
          (originalGram x i j)^2 :=
  sourceColorWedgeSquared_eq_gramMinor x i j

example (x : Boson 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x =
      ∑ p : OAI.BFSSGamma.SpatialPair,
        originalGram x p.1.1 p.1.1 * originalGram x p.1.2 p.1.2 -
          (originalGram x p.1.1 p.1.2)^2 :=
  originalPauli_masslessPotential_eq_gramMinors x

example (g : GaugeGroup 2) (x : Boson 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0
      (FCP.BFSSSU2GaugeG2A.bosonGauge g x) =
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x :=
  originalPauli_masslessPotential_gauge g x

end
end BFSSIBIP3OriginalPotentialGramIndependentConsumer
