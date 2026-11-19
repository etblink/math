import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C0OriginalGammaCoordinateRankBridge

/-!
# RHOPF-P9C1C1A — original gamma common-action fixed-sector criterion

Exact original original-Gamma9 relational projector and the three source
K structures from accepted P9C1A/C0. Establish the COORDINATE-FREE
equalizer characterization without inspecting original 16x16 entries:

  v ∈ range(P) ↔ K1 v = K2 v ∧ K1 v = K3 v.

Use K1²=-I and the original projector polynomial to prove the
converse. Then reduce the selected real 4-plane source-identification
obligation to checking the source three K actions on four selected
basis vectors. The finite source-specific comparison is NOT claimed
in this gate.

No surrogates, source private imports, gamma entry expansion, physics
Fock action, conserved physical charge or particle claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C1C1A
noncomputable section

open scoped Matrix
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1C0

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

/-- For ANY real original spinor v, equal K1/K2 and K1/K3
actions force the actual original agreement projector to fix v.
Only public Clifford and module algebra is needed. -/
theorem relationalProjector_fixed_of_common_action
    (v : SpinIndex → ℝ)
    (hab : KA *ᵥ v = KB *ᵥ v)
    (hac : KA *ᵥ v = KC *ᵥ v) :
    relationalProjector *ᵥ v = v := by
  have habv : (KA * KB) *ᵥ v = -v := by
    calc
      (KA * KB) *ᵥ v = KA *ᵥ (KB *ᵥ v) :=
        (Matrix.mulVec_mulVec v KA KB).symm
      _ = KA *ᵥ (KA *ᵥ v) := by rw [← hab]
      _ = (KA * KA) *ᵥ v := Matrix.mulVec_mulVec v KA KA
      _ = -(1 : GammaMatrix) *ᵥ v := by rw [K13_sq]
      _ = -v := by rw [Matrix.neg_mulVec, Matrix.one_mulVec]
  have hacv : (KA * KC) *ᵥ v = -v := by
    calc
      (KA * KC) *ᵥ v = KA *ᵥ (KC *ᵥ v) :=
        (Matrix.mulVec_mulVec v KA KC).symm
      _ = KA *ᵥ (KA *ᵥ v) := by rw [← hac]
      _ = (KA * KA) *ᵥ v := Matrix.mulVec_mulVec v KA KA
      _ = -(1 : GammaMatrix) *ᵥ v := by rw [K13_sq]
      _ = -v := by rw [Matrix.neg_mulVec, Matrix.one_mulVec]
  have hfB : (1 - KA * KB) *ᵥ v = (2 : ℝ) • v := by
    rw [Matrix.sub_mulVec, Matrix.one_mulVec, habv]
    module
  have hfC : (1 - KA * KC) *ᵥ v = (2 : ℝ) • v := by
    rw [Matrix.sub_mulVec, Matrix.one_mulVec, hacv]
    module
  change ((1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))) *ᵥ v = v
  calc
    ((1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))) *ᵥ v =
        (1 / 4 : ℝ) • ((1 - KA * KB) *ᵥ ((1 - KA * KC) *ᵥ v)) := by
          rw [Matrix.smul_mulVec, Matrix.mulVec_mulVec]
    _ = (1 / 4 : ℝ) • ((1 - KA * KB) *ᵥ ((2 : ℝ) • v)) := by rw [hfC]
    _ = (1 / 4 : ℝ) • ((2 : ℝ) • ((1 - KA * KB) *ᵥ v)) := by
          rw [Matrix.mulVec_smul]
    _ = (1 / 4 : ℝ) • ((2 : ℝ) • ((2 : ℝ) • v)) := by rw [hfB]
    _ = v := by module

/-- Intrinsic common-action equalizer criterion for the image of the
original real spinor relational projector. The rank-four result is
already separately qualified; this theorem does not select any basis. -/
theorem relationalProjector_range_iff_common_action
    (v : SpinIndex → ℝ) :
    v ∈ LinearMap.range (Matrix.toLin' relationalProjector) ↔
      KA *ᵥ v = KB *ᵥ v ∧ KA *ᵥ v = KC *ᵥ v := by
  constructor
  · rintro ⟨w, hw⟩
    change relationalProjector *ᵥ w = v at hw
    constructor
    · calc
        KA *ᵥ v = (KA * relationalProjector) *ᵥ w := by
          rw [← Matrix.mulVec_mulVec, hw]
        _ = (KB * relationalProjector) *ᵥ w := by
          rw [K13_projected_eq_K25]
        _ = KB *ᵥ v := by
          rw [← Matrix.mulVec_mulVec, hw]
    · calc
        KA *ᵥ v = (KA * relationalProjector) *ᵥ w := by
          rw [← Matrix.mulVec_mulVec, hw]
        _ = (KC * relationalProjector) *ᵥ w := by
          rw [K13_projected_eq_K46]
        _ = KC *ᵥ v := by
          rw [← Matrix.mulVec_mulVec, hw]
  · intro hv
    refine ⟨v, ?_⟩
    change relationalProjector *ᵥ v = v
    exact relationalProjector_fixed_of_common_action v hv.1 hv.2

/-- The exact four selected original basis vectors are fixed as soon as
the three ORIGINAL bivectors are independently shown to agree on them. -/
theorem selectedBasisFixed_of_common_action
    (hcommon : ∀ i : Fin 4,
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KB *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) ∧
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KC *ᵥ (Pi.single (selectedIndex i) (1 : ℝ))) :
    SelectedBasisFixed := by
  intro i
  change relationalProjector *ᵥ
    (Pi.single (selectedIndex i) (1 : ℝ)) =
      Pi.single (selectedIndex i) (1 : ℝ)
  exact relationalProjector_fixed_of_common_action _ (hcommon i).1 (hcommon i).2

/-- CONDITIONAL equality of selected coordinate span and original
relational projector range: P9C1C1B must supply the actual finite
original-source bivector common-action basis witnesses. -/
theorem selectedCoordinatePlane_eq_projector_range_of_common_action
    (hcommon : ∀ i : Fin 4,
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KB *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) ∧
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KC *ᵥ (Pi.single (selectedIndex i) (1 : ℝ))) :
    selectedCoordinatePlane =
      LinearMap.range (Matrix.toLin' relationalProjector) := by
  exact selectedCoordinatePlane_eq_projector_range_of_fixed
    (selectedBasisFixed_of_common_action hcommon)

#print axioms relationalProjector_fixed_of_common_action
#print axioms relationalProjector_range_iff_common_action
#print axioms selectedBasisFixed_of_common_action
#print axioms selectedCoordinatePlane_eq_projector_range_of_common_action

end
end FCP.RHOPFP9C1C1A
