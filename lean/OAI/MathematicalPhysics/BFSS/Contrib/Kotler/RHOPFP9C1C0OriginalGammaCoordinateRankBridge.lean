import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B1OriginalGammaRelationalRank

/-!
# RHOPF-P9C1C0 — original projector and selected coordinate plane bridge

The rank-four original Gamma9 relational projector is now strict-qualified.
This bounded gate defines the intended REAL coordinate plane using the
ORIGINAL SpinIndex (Fin 16) with basis indices (0,1,8,9), proves that
the plane has finrank four, and proves the exact rank-saturation bridge:

  if P fixes the four selected coordinate basis vectors,
  then span{e0,e1,e8,e9} = range(P).

This is a CONDITIONAL theorem. This gate does not claim that original
Gamma9 P fixes those basis vectors yet. That source-specific witness
is the explicit remaining obligation, to be proved in a separate gate.

No 16x16 matrix expansion, private-source imports, substitute matrices,
new axiom, physical Fock operator or Hopfion claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C1C0
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1

/-- The exact original four spinor coordinate indices selected by the
independent integer fixture, without importing its private gamma table. -/
def selectedIndex (i : Fin 4) : SpinIndex := ![0, 1, 8, 9] i

theorem selectedIndex_injective : Function.Injective selectedIndex := by
  decide

/-- Intended complex Hopf R4 subspace of the *original* 16-real
spinor coordinate space, defined separately from the projector image. -/
def selectedCoordinatePlane : Submodule ℝ (SpinIndex → ℝ) :=
  Submodule.span ℝ
    (Set.range (fun i : Fin 4 => Pi.single (selectedIndex i) (1 : ℝ)))

/-- The four indexed original spinor coordinate unit vectors are
independent and their span has precisely real dimension four. -/
theorem selectedCoordinatePlane_finrank_four :
    Module.finrank ℝ selectedCoordinatePlane = 4 := by
  have hlin : LinearIndependent ℝ
      (fun i : Fin 4 => Pi.single (selectedIndex i) (1 : ℝ)) :=
    (Pi.linearIndependent_single_one SpinIndex ℝ).comp
      selectedIndex selectedIndex_injective
  simpa only [selectedCoordinatePlane, Fintype.card_fin] using
    (finrank_span_eq_card hlin)

/-- The remaining source-specific witness is exactly four
full-vector action identities, rather than 256 projector entries. -/
def SelectedBasisFixed : Prop :=
  ∀ i : Fin 4,
    Matrix.toLin' relationalProjector
        (Pi.single (selectedIndex i) (1 : ℝ)) =
      Pi.single (selectedIndex i) (1 : ℝ)

/-- Each fixed selected basis vector lies in the range of the actual
original Gamma9 matrix projector. -/
theorem selectedCoordinatePlane_le_projector_range
    (hfixed : SelectedBasisFixed) :
    selectedCoordinatePlane ≤
      LinearMap.range (Matrix.toLin' relationalProjector) := by
  rw [selectedCoordinatePlane, Submodule.span_le]
  intro v hv
  rcases hv with ⟨i, rfl⟩
  exact ⟨Pi.single (selectedIndex i) (1 : ℝ), hfixed i⟩

/-- The exact requested coordinate identification follows from
a future four-basis source witness, by finrank equality. This theorem
is CONDITIONAL and does not assert or construct that witness. -/
theorem selectedCoordinatePlane_eq_projector_range_of_fixed
    (hfixed : SelectedBasisFixed) :
    selectedCoordinatePlane =
      LinearMap.range (Matrix.toLin' relationalProjector) := by
  apply Submodule.eq_of_le_of_finrank_eq
  · exact selectedCoordinatePlane_le_projector_range hfixed
  · exact selectedCoordinatePlane_finrank_four.trans
      relationalProjector_range_finrank_four.symm

#print axioms selectedIndex_injective
#print axioms selectedCoordinatePlane_finrank_four
#print axioms selectedCoordinatePlane_le_projector_range
#print axioms selectedCoordinatePlane_eq_projector_range_of_fixed

end
end FCP.RHOPFP9C1C0
