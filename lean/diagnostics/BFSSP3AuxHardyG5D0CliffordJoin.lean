import diagnostics.BFSSP3AuxHardyG5D0NativeZero

/-! Optional typed source-definition join; not a strict G5 repair. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

theorem nativeCliffordZero :
    pairedAlgebraData.cliffordLinear (fun _ : FermionIndex 2 => (0 : ℝ)) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) := by
  simpa only [AlgebraData.cliffordLinear, Complex.ofReal_zero] using nativeThetaZeroSum

#print axioms FCP.BFSSP3AuxHardyG5D0.nativeCliffordZero

end
end FCP.BFSSP3AuxHardyG5D0
