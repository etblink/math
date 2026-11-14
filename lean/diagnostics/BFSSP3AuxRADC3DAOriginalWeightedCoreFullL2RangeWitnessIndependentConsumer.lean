import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness
set_option autoImplicit false
namespace BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitnessIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness

example (ε : ℝ) (g : SmoothCore 2) :
    Continuous (originalWeightedCoreField ε g) :=
  originalWeightedCoreField_continuous ε g

example (ε : ℝ) (g : SmoothCore 2) :
    HasCompactSupport (originalWeightedCoreField ε g) :=
  originalWeightedCoreField_hasCompactSupport ε g

example (ε : ℝ) (g : SmoothCore 2) :
    FullL2 2 := originalWeightedCoreFieldL2 ε g

example {ε : ℝ} (hε : 0 < ε) (g : SmoothCore 2) :
    originalReciprocalFullL2CLM hε (originalWeightedCoreFieldL2 ε g) =
      coreToL2 g :=
  originalReciprocalFullL2CLM_core_witness hε g

example {ε : ℝ} (hε : 0 < ε) (g : SmoothCore 2) :
    coreToL2 g ∈
      LinearMap.range (originalReciprocalFullL2CLM hε).toLinearMap :=
  originalCoreToL2_mem_reciprocalRange hε g

#print axioms FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreField_continuous
#print axioms FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreField_hasCompactSupport
#print axioms FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalWeightedCoreFieldL2
#print axioms FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalReciprocalFullL2CLM_core_witness
#print axioms FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.originalCoreToL2_mem_reciprocalRange
end
end BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitnessIndependentConsumer
