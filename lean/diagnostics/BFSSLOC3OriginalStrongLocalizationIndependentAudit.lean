import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC3OriginalStrongLocalization

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC3Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC3
open MeasureTheory Filter
open scoped Topology

theorem originalSU2StrongCutoffAudit (u : Boson 2 → Fermion 2)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    Tendsto (fun n => expandingFieldL2 n u hu h2) atTop (𝓝 (h2.toLp u)) :=
  expandingFieldL2_tendsto u hu h2

theorem originalSU2VanishingCommutatorAudit (M : AlgebraData 2) (a : SpinIndex)
    (u : Boson 2 → Fermion 2) (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    Tendsto (fun n => expandingErrorL2 M a n u hu h2) atTop (𝓝 0) :=
  expandingErrorL2_tendsto M a u hu h2

#print axioms originalSU2StrongCutoffAudit
#print axioms originalSU2VanishingCommutatorAudit
end
end FCP.BFSSLOC3Independent
