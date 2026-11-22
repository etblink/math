import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessM1bOriginalRealFieldRestrictionConsumer

/-!
MASSLESS-M1c: source-original massless coefficient as the difference
of the existing mass-deformed original coefficient at x and zero.
Original FrequencyMatrix N and literal original paired SU(2) source.
Only bookkeeping, no new field, Hamiltonian/domain or spectrum theorem.
Do not import failed D1F or frozen D1S4.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessM1c
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Subtract the original source coefficient at zero bosons to
remove the exact original massT deformation term. -/
theorem originalMasslessFrequency_eq_sourceDifference {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    FCP.BFSSMasslessM1a.masslessSourceFrequency M x =
      M.fermionCoefficient x - M.fermionCoefficient (0 : Boson N) := by
  ext r s
  simp [FCP.BFSSMasslessM1a.masslessSourceFrequency,
    FCP.BFSSMasslessM0.sourceBracketCoefficient,
    AlgebraData.fermionCoefficient]

/-- Exact existing paired SU(2) 48-Majorana original AlgebraData
specialization, without changing the source coefficient definition. -/
theorem pairedOriginalMasslessFrequency_eq_sourceDifference
    (x : Boson 2) :
    FCP.BFSSMasslessM1a.masslessSourceFrequency
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData x =
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x -
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient
          (0 : Boson 2) :=
  originalMasslessFrequency_eq_sourceDifference
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData x

#print axioms originalMasslessFrequency_eq_sourceDifference
#print axioms pairedOriginalMasslessFrequency_eq_sourceDifference

end
end FCP.BFSSMasslessM1c
