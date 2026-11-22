import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessM1bOriginalRealFieldRestrictionConsumer
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.CovariantFields

/-!
GM0B — source-exact massless finite-Fock gauge covariance, pointwise.

Key discovery: the ORIGINAL CovariantFields.GaugeData theorem already proves
covariance of M.deformedFermionField h m for the TRUE source boson/Fock
action. Independently qualified MasslessM1b identifies the ORIGINAL
h=1,m=0 field with the real-scalar restriction of its complex-linear
massless frequency quantizer. We compose these two existing source
theorems, without expanding the 48-Majorana quantizer or introducing
new physical assumptions.

Strict scope: POINTWISE Fermion N bounded field for each bosonic x.
NO Lp a.e. transport, natural-domain preservation, Hamiltonian,
spectral assertion, Gamma9 Hopfion, or GUT.
-/
set_option autoImplicit false

namespace FCP.BFSSGM0B
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Genuine upstream GaugeData, arbitrary source N: the original massless
complex-linear finite-Fock quantizer intertwines the ORIGINAL fiber action
with the ORIGINAL bosonic gauge conjugation, at each source point. -/
theorem originalMasslessQuantizer_gauge_covariant
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (x : Boson N) (v : Fermion N) :
    G.fermion g
      (M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) v) =
    M.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency M (G.boson g x))
      (G.fermion g v) := by
  have h := G.deformedFermionField_covariant g (1 : ℝ) (0 : ℝ) x v
  rw [FCP.BFSSMasslessM1b.originalMasslessFermionField_eq_quantized M x,
      FCP.BFSSMasslessM1b.originalMasslessFermionField_eq_quantized M
        (G.boson g x)] at h
  exact h

/-- Strict literal 48-Majorana paired SU(2) consumer of that original
source-covariance identity. Retains pairedAlgebraData and pairedGaugeData. -/
theorem pairedOriginalMasslessQuantizer_gauge_covariant
    (g : GaugeGroup 2) (x : Boson 2) (v : Fermion 2) :
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData x) v) =
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.boson g x))
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g v) :=
  originalMasslessQuantizer_gauge_covariant
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData g x v

#print axioms originalMasslessQuantizer_gauge_covariant
#print axioms pairedOriginalMasslessQuantizer_gauge_covariant

end
end FCP.BFSSGM0B
