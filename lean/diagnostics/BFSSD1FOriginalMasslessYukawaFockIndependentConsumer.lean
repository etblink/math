import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1FOriginalMasslessYukawaFockQuantization
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

/-! Independent consumer on paired AlgebraData 2, the actual 48-Majorana Fock. -/

set_option autoImplicit false

namespace BFSSD1FOriginalMasslessYukawaFockIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSHopfD1F
open FCP.BFSSSU2GaugeG1A

example (x : Boson 2) :
    masslessFrequency pairedAlgebraData x =
      pairedAlgebraData.fermionCoefficient x -
        pairedAlgebraData.fermionCoefficient 0 :=
  masslessFrequency_eq_source_difference pairedAlgebraData x

example (x : Boson 2) :
    pairedAlgebraData.quantizeFrequency (masslessFrequency pairedAlgebraData x) =
      ((-Complex.I) / 2) •
        (∑ j : SpaceIndex, ∑ A : ColorIndex 2,
          pairedAlgebraData.cubicFermionComponent x A j) :=
  quantize_masslessFrequency pairedAlgebraData x

example (x : Boson 2) :
    pairedAlgebraData.deformedFermionField 1 0 x =
      (pairedAlgebraData.quantizeFrequency
        (masslessFrequency pairedAlgebraData x)).restrictScalars ℝ :=
  deformedFermionField_massless_quantized pairedAlgebraData x

#print axioms FCP.BFSSHopfD1F.masslessFrequency_eq_source_difference
#print axioms FCP.BFSSHopfD1F.quantize_masslessFrequency
#print axioms FCP.BFSSHopfD1F.deformedFermionField_massless_quantized

end
end BFSSD1FOriginalMasslessYukawaFockIndependentConsumer
