import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D4OriginalFockCrossPairingColumns

/-!
Independent P3-D4 consumer: recover arbitrary original operator-valued
cross pairing from genuine D3 columns and verify equal columns cannot
be distinguished by pairing against another original Fock operator.
-/

set_option autoImplicit false

namespace BFSSP3D4OriginalFockCrossPairingColumnsIndependentConsumer
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3D3OriginalFockColumns
open FCP.BFSSP3D4OriginalFockCrossPairingColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- The two-source-operator trace pairing is the actual evaluation
pairing on the original 24-mode Fock fiber, not a surrogate. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S T : OriginalFockOp) :
    originalFockTracePairing S T =
      ∑ i : ι, ⟪S (b i), T (b i)⟫_ℂ := by
  simpa only [originalFockColumns_apply] using
    (originalFockTracePairing_eq_sum_columns b S T)

/-- Equal actual original-Fock column evaluations give the same
trace pairing against every bounded source-Fock test operator. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S₁ S₂ T : OriginalFockOp)
    (h : ∀ i : ι, S₁ (b i) = S₂ (b i)) :
    originalFockTracePairing S₁ T =
      originalFockTracePairing S₂ T := by
  rw [originalFockTracePairing_eq_sum_columns b S₁ T,
      originalFockTracePairing_eq_sum_columns b S₂ T]
  apply Finset.sum_congr rfl
  intro i _
  simp only [originalFockColumns_apply, h i]

#print axioms FCP.BFSSP3D4OriginalFockCrossPairingColumns.originalFockTrace_star_mul_eq_sum_cross
#print axioms FCP.BFSSP3D4OriginalFockCrossPairingColumns.originalFockTracePairing_eq_sum_columns

end
end BFSSP3D4OriginalFockCrossPairingColumnsIndependentConsumer
