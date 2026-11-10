import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0BOriginalFockColorPairGaugeInvariant

/-!
# BIL-0B independent downstream consumer
A genuinely different, operator-commutator-form zero statement, on
the original `Fermion 2`, using the qualified source theorem. It
does not assert a Spin(9) Fock-vector representation or Hamiltonian
commutation.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0BOriginalColorPairCommutatorConsumer
noncomputable section

open scoped BigOperators
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4E

theorem originalColorPair_gauge_commutator_zero
    (g : GaugeGroup 2) (α β : SpinIndex) (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      ((∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A) v) -
      (∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A)
        (fermionGaugeUnitaryHom g v) = 0 := by
  exact sub_eq_zero.mpr
    (FCP.BFSSBIL0BOriginalFockColorPairGaugeInvariant.originalColorPair_gauge_invariant g α β v)

#print axioms FCP.BFSSBIL0BOriginalFockColorPairGaugeInvariant.originalColorPair_gauge_invariant
#print axioms originalColorPair_gauge_commutator_zero

end
end FCP.BFSSBIL0BOriginalColorPairCommutatorConsumer
