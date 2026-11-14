import OAI.MathematicalPhysics.BFSS.CliffordSymbols
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe
import diagnostics.BFSSP3AuxHardyG5D0Generic

/-! Canonical complex-zero sum on literal original theta data. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

theorem nativeThetaZeroSum :
    (∑ p : FermionIndex 2, (0 : ℂ) • pairedAlgebraData.theta p.1 p.2) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  finiteComplexZeroSum (fun p : FermionIndex 2 => pairedAlgebraData.theta p.1 p.2)

#print axioms FCP.BFSSP3AuxHardyG5D0.nativeThetaZeroSum

end
end FCP.BFSSP3AuxHardyG5D0
