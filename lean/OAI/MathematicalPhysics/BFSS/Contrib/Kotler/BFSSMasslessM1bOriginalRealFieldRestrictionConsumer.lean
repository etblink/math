import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessM1aOriginalComplexQuantizerNormalization
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

/-!
MASSLESS-M1b — original source-exact massless h=1,m=0 field on
the real-linear original Fock carrier, and genuine paired SU(2)
original 48-Majorana specialization.
No failed D1F import, no mass-deformation substitution,
unbounded Hamiltonian domain, physical spectrum or Hopfion claim.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessM1b
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Exact original massless h=1,m=0 fermionic real-linear source field
equals the real restriction of the original complex-linear Fock
quantization of the massless interaction coefficient. -/
theorem originalMasslessFermionField_eq_quantized {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    M.deformedFermionField 1 0 x =
      (M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x)).restrictScalars ℝ := by
  rw [M.deformedFermionField_bracket]
  rw [FCP.BFSSMasslessM1a.originalMasslessQuantizer_eq_cubic M x]

/-- On literal paired SU(2) AlgebraData the source massless field
equals the restriction of the original 48-Majorana Fock quantizer. -/
theorem pairedOriginalMasslessFermionField_eq_quantized
    (x : Boson 2) :
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData.deformedFermionField 1 0 x =
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData x)).restrictScalars ℝ :=
  originalMasslessFermionField_eq_quantized
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData x

#print axioms originalMasslessFermionField_eq_quantized
#print axioms pairedOriginalMasslessFermionField_eq_quantized

end
end FCP.BFSSMasslessM1b
