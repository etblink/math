import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0BOriginalFockColorPairGaugeInvariant

/-!
# BFSS BIL-0C — arbitrary real original Fock quadratic coefficients

Source-faithful S3G3 finite weighted-sum method; actual SU(2) Fock unitary,
actual Fermion 2 theta operators, and *any* real 16 by 16 spinor matrix.

This intentionally defines its operator directly from the qualified BIL-0B
color-pair sum, without importing the much larger historical S3D source
Spin-plane generator. Equality with the historical S3D representation is
a separate later interface, not assumed here. There is no physical
Hamiltonian, spatial Spin(9) vector-unitary or spectral assertion.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSBIL0BOriginalFockColorPairGaugeInvariant

private abbrev FermionOp := Fermion 2 →L[ℂ] Fermion 2

/-- The literal original Fock operator with arbitrary real spinor
coefficients, using the already-qualified sum over all original colors. -/
noncomputable def originalColorQuadratic
    (J : Matrix SpinIndex SpinIndex ℝ) : FermionOp :=
  ∑ α : SpinIndex, ∑ β : SpinIndex,
    ((J α β : ℝ) : ℂ) •
      (∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A)

/-- Abstract finite weighted-sum commutation. Keep the original
nested finite-sum proof isolated from concrete Fock elaboration. -/
private theorem finiteWeightedGaugeCommutes (g : GaugeGroup 2)
    (F : SpinIndex → SpinIndex → FermionOp)
    (w : SpinIndex → SpinIndex → ℂ)
    (hF : ∀ α β v,
      fermionGaugeUnitaryHom g (F α β v) =
        F α β (fermionGaugeUnitaryHom g v))
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      ((∑ α : SpinIndex, ∑ β : SpinIndex, w α β • F α β) v) =
    (∑ α : SpinIndex, ∑ β : SpinIndex, w α β • F α β)
      (fermionGaugeUnitaryHom g v) := by
  simp only [ContinuousLinearMap.sum_apply, ContinuousLinearMap.smul_apply]
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          w α β • fermionGaugeUnitaryHom g (F α β v) := by
        simp only [map_sum, map_smul]
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          w α β • F α β (fermionGaugeUnitaryHom g v) := by
        apply Finset.sum_congr rfl
        intro α _
        apply Finset.sum_congr rfl
        intro β _
        rw [hF α β v]

/-- Qualified candidate for *every* real spinor coefficient matrix:
genuine original Fock SU2 action commutes with the original
color-contracted bounded quadratic Majorana operator. -/
theorem originalColorQuadratic_gauge_commutes
    (g : GaugeGroup 2) (J : Matrix SpinIndex SpinIndex ℝ)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g (originalColorQuadratic J v) =
      originalColorQuadratic J (fermionGaugeUnitaryHom g v) := by
  unfold originalColorQuadratic
  apply finiteWeightedGaugeCommutes g
  intro α β w
  exact originalColorPair_gauge_invariant g α β w

#print axioms originalColorQuadratic
#print axioms originalColorQuadratic_gauge_commutes

end
end FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
