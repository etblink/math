import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG16SourceGammaWordFrobenius
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! G16 D1A: literal paired gamma Frobenius and word-support independent controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16SourceGammaWordFrobeniusIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius

example (s t : Finset SpaceIndex) (hs : s.card ≤ 4) (ht : t.card ≤ 4) :
    Matrix.trace ((OAI.BFSSGamma.word pairedAlgebraData.gamma s).transpose *
      OAI.BFSSGamma.word pairedAlgebraData.gamma t) =
        if s = t then 16 else 0 :=
  originalGamma_frobenius_word pairedAlgebraData s t hs ht

example (s : Finset SpaceIndex) (hs : s.card ≤ 4) :
    Matrix.trace ((OAI.BFSSGamma.word pairedAlgebraData.gamma s).transpose *
      OAI.BFSSGamma.word pairedAlgebraData.gamma s) = 16 :=
  originalGamma_frobenius_self pairedAlgebraData s hs

example (s t : Finset SpaceIndex) (hs : s.card ≤ 4) (ht : t.card ≤ 4)
    (hst : s ≠ t) :
    Matrix.trace ((OAI.BFSSGamma.word pairedAlgebraData.gamma s).transpose *
      OAI.BFSSGamma.word pairedAlgebraData.gamma t) = 0 :=
  originalGamma_frobenius_cross pairedAlgebraData s t hs ht hst

example :
    Matrix.trace ((OAI.BFSSGamma.word pairedAlgebraData.gamma
      ({0} : Finset SpaceIndex)).transpose *
      OAI.BFSSGamma.word pairedAlgebraData.gamma
      ({0} : Finset SpaceIndex)) = 16 :=
  originalGamma_frobenius_self pairedAlgebraData
    ({0} : Finset SpaceIndex) (by decide)

example :
    Matrix.trace ((OAI.BFSSGamma.word pairedAlgebraData.gamma
      ({0} : Finset SpaceIndex)).transpose *
      OAI.BFSSGamma.word pairedAlgebraData.gamma
      ({0, 2, 3} : Finset SpaceIndex)) = 0 :=
  originalGamma_frobenius_cross pairedAlgebraData
    ({0} : Finset SpaceIndex) ({0, 2, 3} : Finset SpaceIndex)
    (by decide) (by decide) (by decide)

#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_word
#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_self
#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_cross
#print axioms OAI.BFSSGamma.trace_reverseWord_word

end
end FCP.BFSSP3AuxHardyG16SourceGammaWordFrobeniusIndependentConsumer
