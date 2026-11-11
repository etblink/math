import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0COriginalNormalizedFockField

/-!
# NORM-0C independent actual original Fock consumers

The first consumer uses the new uniform Fock operator bound on actual
Fermion 2 vectors. The second checks genuine G2A/G4E source SU(2)
covariance of the normalized field; its trace-invariance identity
comes from the independently qualified VLY-0A original matrix theorem,
not the nonimportable NORM-0A diagnostic consumer.

No L2 multiplier, unbounded Hamiltonian, or spectral assertion.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0COriginalNormalizedFockFieldConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0AOriginalGramTraceBound
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSSU2GaugeG4E

/-- A new pointwise original Fock-vector consequence, independent of
the norm-source proof architecture. -/
theorem originalNormalizedFockGram_vector_bound
    (x : Boson 2) (B : GammaMatrix) (v : Fermion 2) :
    ‖originalNormalizedFockGramObservable x B v‖ ≤
      originalFockGammaBoundConstant B * ‖v‖ := by
  calc
    ‖originalNormalizedFockGramObservable x B v‖ ≤
        ‖originalNormalizedFockGramObservable x B‖ * ‖v‖ :=
      (originalNormalizedFockGramObservable x B).le_opNorm v
    _ ≤ originalFockGammaBoundConstant B * ‖v‖ :=
      mul_le_mul_of_nonneg_right
        (originalNormalizedFockGram_norm_le x B) (norm_nonneg v)

/-- The true original SU2 boson/Fock action still intertwines the
normalized operator, without constructing a FullL2 multiplier. -/
theorem originalNormalizedFockGram_gauge_covariant
    (g : GaugeGroup 2) (x : Boson 2) (B : GammaMatrix)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      (originalNormalizedFockGramObservable x B v) =
    originalNormalizedFockGramObservable
      (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B
        (fermionGaugeUnitaryHom g v) := by
  have hT :
      originalGramTrace (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) =
        originalGramTrace x := by
    simp only [originalGramTrace, originalSpatialGram_gauge_invariant]
  unfold originalNormalizedFockGramObservable
  simp only [ContinuousLinearMap.smul_apply]
  rw [map_smul, originalFockGramObservable_gauge_covariant, hT]

#print axioms FCP.BFSSNORM0COriginalNormalizedFockField.originalFockGammaBoundConstant_nonneg
#print axioms FCP.BFSSNORM0COriginalNormalizedFockField.originalFockGram_norm_le_trace
#print axioms FCP.BFSSNORM0COriginalNormalizedFockField.originalNormalizedFockGram_norm_le
#print axioms originalNormalizedFockGram_vector_bound
#print axioms originalNormalizedFockGram_gauge_covariant

end
end FCP.BFSSNORM0COriginalNormalizedFockFieldConsumer
