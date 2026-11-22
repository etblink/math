import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA2cOriginalFrequencyQuantizerSelfAdjoint
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S3OriginalFermionCoefficientSkewProbe

/-!
FCP BFSS ADJ-A2d — independent source-exact finite-Fock quantizer
consumers for original boson-dependent real fermion coefficient and
literal paired SU(2) AlgebraData. Use qualified source A2c and D1S3.
No edits to original BFSS or frozen D1S4; no unbounded operator,
Gauss-domain, spectral or physical Hopfion claim.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA2d
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- For every original BFSS algebra data and bosonic configuration x,
the *finite-Fock* original source fermionic quantizer is self-adjoint. -/
theorem originalFermionCoefficient_quantize_isSelfAdjoint {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    IsSelfAdjoint (M.quantizeFrequency (M.fermionCoefficient x)) :=
  FCP.BFSSAdjointA2c.originalSkewFrequencyMatrix_quantize_isSelfAdjoint
    M (M.fermionCoefficient x)
    (FCP.BFSSHopfD1S3.originalFermionCoefficient_skew M x)

/-- The same exact source conclusion for the qualified paired SU(2)
48-Majorana (24-complex-mode) original AlgebraData and any x. -/
theorem pairedOriginalFermionCoefficient_quantize_isSelfAdjoint
    (x : Boson 2) :
    IsSelfAdjoint
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
        (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x)) :=
  FCP.BFSSAdjointA2c.originalSkewFrequencyMatrix_quantize_isSelfAdjoint
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x)
    (FCP.BFSSHopfD1S3.pairedOriginalFermionCoefficient_skew x)

#print axioms originalFermionCoefficient_quantize_isSelfAdjoint
#print axioms pairedOriginalFermionCoefficient_quantize_isSelfAdjoint

end
end FCP.BFSSAdjointA2d
