import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0AOriginalBosonFockGaugeCovariance

/-!
# JOIN-0A independent original-Fock norm consumer

Combines the new pointwise boson/Fock covariance theorem with the
separately qualified actual G4E Fock unitary isometry. The result
concerns the genuine Fermion 2 Hilbert norm only, not FullL2.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0AOriginalBosonFockNormConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance

theorem originalFockGramObservable_norm_gauge_covariant
    (g : GaugeGroup 2) (x : Boson 2) (B : GammaMatrix)
    (v : Fermion 2) :
    ‖originalFockGramObservable
        (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B
          (fermionGaugeUnitaryHom g v)‖ =
      ‖originalFockGramObservable x B v‖ := by
  calc
    _ = ‖fermionGaugeUnitaryHom g
        (originalFockGramObservable x B v)‖ := by
        rw [originalFockGramObservable_gauge_covariant g x B v]
    _ = ‖originalFockGramObservable x B v‖ :=
      (fermionGaugeUnitaryHom g).norm_map
        (originalFockGramObservable x B v)

#print axioms FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance.originalFockGramObservable_gauge_covariant
#print axioms originalFockGramObservable_norm_gauge_covariant

end
end FCP.BFSSJOIN0AOriginalBosonFockNormConsumer
