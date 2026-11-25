import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedColor
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1SOriginalSource48SkewMatrixFockBivector
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9NormalizedPlaneInterfaceProbe

/-! Transport arbitrary original 48-real bivectors and the normalized
Spin(9) plane generators to packed coordinates. No actual seed assumption. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedSpin
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0 FCP.BFSSFermionF2 FCP.BFSSSU2GaugeG1A
open FCP.BFSSMSYNormalizedToggle FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector FCP.BFSSPairedSpin9Plane

/-- The literal original 48-label inverse, not an arbitrary enumeration. -/
noncomputable def packedLabel (p : Source48Label) : MajoranaLabel :=
  pairedLabelEquiv.symm p

theorem sourceGamma_label (p : Source48Label) :
    sourceNormalizedGamma p = majoranaNormalization •
      pairedTheta (packedLabel p).1 (packedLabel p).2 := by
  change (Real.sqrt 2 : ℂ) • majoranaCandidate p =
    (Real.sqrt 2 : ℂ) • majoranaCandidate (pairedLabelEquiv (pairedLabelEquiv.symm p))
  rw [Equiv.apply_symm_apply]

private theorem normalized_product_apply {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] (A B : E →L[ℂ] E) (v : E) :
    (majoranaNormalization • A) ((majoranaNormalization • B) v) =
      (2 : ℂ) • A (B v) := by
  change majoranaNormalization • A (majoranaNormalization • B v) = _
  rw [map_smul, smul_smul, normalization_square]

theorem packedBilinear_source48 (p q : Source48Label) (x : PackedCoordinates) :
    packedCarrier (packedBilinear (packedLabel p) (packedLabel q) x) =
      sourceNormalizedGamma p (sourceNormalizedGamma q (packedCarrier x)) := by
  rw [sourceGamma_label p, sourceGamma_label q]
  exact (packedBilinear_intertwines (packedLabel p) (packedLabel q) x).trans
    (normalized_product_apply _ _ (packedCarrier x)).symm

-- Additive transport only: no scalar tower, norm, or operator algebra
-- enters the abstract sum comparison. The actual index set is explicit.
private theorem double_map_congr {I E O F : Type*}
    [AddCommMonoid E] [AddCommMonoid O] [AddCommMonoid F]
    (s : Finset I) (J : E →+ F) (ev : O →+ F)
    (P : I → I → E) (Q : I → I → O)
    (h : ∀ p q, J (P p q) = ev (Q p q)) :
    J (∑ p ∈ s, ∑ q ∈ s, P p q) =
      ev (∑ p ∈ s, ∑ q ∈ s, Q p q) := by
  simp only [map_sum]
  apply Finset.sum_congr rfl
  intro p _
  apply Finset.sum_congr rfl
  intro q _
  exact h p q

private abbrev BivectorOp := Fermion 2 →L[ℂ] Fermion 2

private def packedBivectorMap : PackedCoordinates →ₗ[ℂ] Fermion 2 :=
  packedCarrier.toLinearEquiv.toLinearMap

-- Literal evaluation as in the qualified L6G6K source fiber proof.
private def evalBivector (v : Fermion 2) : BivectorOp →ₗ[ℂ] Fermion 2 where
  toFun T := T v
  map_add' _A _B := rfl
  map_smul' _z _A := rfl

private def packedWeightedTerm (A : Matrix Source48Label Source48Label ℝ)
    (x : PackedCoordinates) (p q : Source48Label) : PackedCoordinates :=
  ((A p q / 4 : ℝ) : ℂ) • packedBilinear (packedLabel p) (packedLabel q) x

private def sourceWeightedTerm (A : Matrix Source48Label Source48Label ℝ)
    (p q : Source48Label) : BivectorOp :=
  (A p q / 4 : ℝ) • (sourceNormalizedGamma p * sourceNormalizedGamma q)

private theorem weightedTerm_transport
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates)
    (p q : Source48Label) :
    packedBivectorMap.toAddMonoidHom (packedWeightedTerm A x p q) =
      (evalBivector (packedCarrier x)).toAddMonoidHom (sourceWeightedTerm A p q) := by
  change packedBivectorMap
      (((A p q / 4 : ℝ) : ℂ) • packedBilinear (packedLabel p) (packedLabel q) x) =
    (A p q / 4 : ℝ) •
      sourceNormalizedGamma p (sourceNormalizedGamma q (packedCarrier x))
  rw [map_smul]
  change ((A p q / 4 : ℝ) : ℂ) •
      packedCarrier (packedBilinear (packedLabel p) (packedLabel q) x) =
    (A p q / 4 : ℝ) •
      sourceNormalizedGamma p (sourceNormalizedGamma q (packedCarrier x))
  rw [packedBilinear_source48]
  exact (RCLike.real_smul_eq_coe_smul (K := ℂ) (A p q / 4)
    (sourceNormalizedGamma p (sourceNormalizedGamma q (packedCarrier x)))).symm

/-- The exact quarter-weighted original 48-real matrix contraction. -/
noncomputable def packedBivector
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates) :
    PackedCoordinates :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    ((A p q / 4 : ℝ) : ℂ) • packedBilinear (packedLabel p) (packedLabel q) x

-- Explicit, separately checked boundaries for both original definitions.
private theorem packedBivector_eq_terms
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates) :
    packedBivector A x =
      ∑ p : Source48Label, ∑ q : Source48Label, packedWeightedTerm A x p q := rfl

private theorem originalBivector_eq_terms
    (A : Matrix Source48Label Source48Label ℝ) :
    originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label, sourceWeightedTerm A p q := rfl

theorem packedBivector_intertwines
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates) :
    packedCarrier (packedBivector A x) =
      originalSource48BivectorK A (packedCarrier x) := by
  have h := double_map_congr (Finset.univ : Finset Source48Label)
    packedBivectorMap.toAddMonoidHom
    (evalBivector (packedCarrier x)).toAddMonoidHom
    (packedWeightedTerm A x) (sourceWeightedTerm A) (weightedTerm_transport A x)
  change packedBivectorMap.toAddMonoidHom (packedBivector A x) =
    (evalBivector (packedCarrier x)).toAddMonoidHom (originalSource48BivectorK A)
  rw [packedBivector_eq_terms, originalBivector_eq_terms]
  exact h

/-- A normalized source Spin(9) plane is half the same-color
original gamma product for distinct spatial indices. -/
theorem normalizedPlane_sourceCoefficient (r s : SpaceIndex) (hrs : r ≠ s)
    (a b : ColorIndex 2) (α β : SpinIndex) :
    normalizedPairedPlane r s (pairedLabelEquiv (α, a)) (pairedLabelEquiv (β, b)) =
      if a = b then (pairedAlgebraData.gamma r * pairedAlgebraData.gamma s) α β / 2
      else 0 := by
  have ha : pairedColorSpinEquiv (a, α) = pairedLabelEquiv (α, a) := rfl
  have hb : pairedColorSpinEquiv (b, β) = pairedLabelEquiv (β, b) := rfl
  have hentry :
      originalPairedPlane r s (pairedColorSpinEquiv (a, α)) (pairedColorSpinEquiv (b, β)) =
        (if a = b then (1 : ℝ) else 0) * (-(FCP.BFSSGamma9.gamma r * FCP.BFSSGamma9.gamma s) α β) := by
    simp [originalPairedPlane, Matrix.reindex, plane16, Matrix.one_apply]
  rw [← ha, ← hb, normalizedPairedPlane, zeroDiagonalPairedPlane_of_ne r s hrs]
  change (-(1 / 2 : ℝ)) *
    originalPairedPlane r s (pairedColorSpinEquiv (a, α)) (pairedColorSpinEquiv (b, β)) = _
  rw [hentry]
  have hr : pairedAlgebraData.gamma r = FCP.BFSSGamma9.gamma r := rfl
  have hs : pairedAlgebraData.gamma s = FCP.BFSSGamma9.gamma s := rfl
  rw [hr, hs]
  by_cases hab : a = b
  · simp only [ite_eq_left hab, one_mul]
    ring
  · simp [hab]

noncomputable def packedSpinPlane (r s : SpaceIndex) (x : PackedCoordinates) :
    PackedCoordinates :=
  packedBivector (normalizedPairedPlane r s) x

theorem packedSpinPlane_intertwines (r s : SpaceIndex) (x : PackedCoordinates) :
    packedCarrier (packedSpinPlane r s x) =
      originalSource48BivectorK (normalizedPairedPlane r s) (packedCarrier x) :=
  packedBivector_intertwines (normalizedPairedPlane r s) x

#print axioms sourceGamma_label
#print axioms packedBilinear_source48
#print axioms packedBivector_intertwines
#print axioms normalizedPlane_sourceCoefficient
#print axioms packedSpinPlane_intertwines

end
end FCP.BFSSMSYPackedSpin
