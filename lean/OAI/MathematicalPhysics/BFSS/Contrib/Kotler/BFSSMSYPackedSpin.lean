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

-- Generic double sum: never normalize a specialized large Fock expression.
private theorem double_transport {I E F : Type*} [Fintype I]
    [AddCommGroup E] [Module ℂ E] [AddCommGroup F] [Module ℂ F]
    (J : E →ₗ[ℂ] F) (w : I → I → ℂ) (p : I → I → E) (q : I → I → F)
    (h : ∀ i j, J (p i j) = q i j) :
    J (∑ i, ∑ j, w i j • p i j) = ∑ i, ∑ j, w i j • q i j := by
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro j _
  rw [map_smul, h]

private theorem weighted_double_apply {I E : Type*} [Fintype I]
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (a : I → I → ℝ) (g : I → E →L[ℂ] E) (v : E) :
    (∑ p, ∑ q, a p q • (g p * g q)) v =
      ∑ p, ∑ q, (a p q : ℂ) • g p (g q v) := by
  simp only [_root_.sum_apply]
  apply Finset.sum_congr rfl
  intro p _
  apply Finset.sum_congr rfl
  intro q _
  change a p q • g p (g q v) = _
  exact RCLike.real_smul_eq_coe_smul (K := ℂ) (a p q) _

-- Compose the two already elaborated finite-sum interfaces on abstract carriers.
-- Specialize only once, after all equality transitivity has been resolved.
private theorem double_operator_transport {I E F : Type*} [Fintype I]
    [AddCommGroup E] [Module ℂ E] [NormedAddCommGroup F] [NormedSpace ℂ F]
    (J : E →ₗ[ℂ] F) (a : I → I → ℝ) (p : I → I → E)
    (g : I → F →L[ℂ] F) (v : F)
    (h : ∀ i j, J (p i j) = g i (g j v)) :
    J (∑ i, ∑ j, (a i j : ℂ) • p i j) =
      (∑ i, ∑ j, a i j • (g i * g j)) v :=
  (double_transport J (fun i j => (a i j : ℂ)) p
    (fun i j => g i (g j v)) h).trans (weighted_double_apply a g v).symm

/-- The exact quarter-weighted original 48-real matrix contraction. -/
noncomputable def packedBivector
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates) :
    PackedCoordinates :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    ((A p q / 4 : ℝ) : ℂ) • packedBilinear (packedLabel p) (packedLabel q) x

theorem packedBivector_intertwines
    (A : Matrix Source48Label Source48Label ℝ) (x : PackedCoordinates) :
    packedCarrier (packedBivector A x) =
      originalSource48BivectorK A (packedCarrier x) := by
  exact double_operator_transport (I := Source48Label) (E := PackedCoordinates)
    (F := Fermion 2) packedCarrier.toLinearEquiv.toLinearMap
    (fun p q => A p q / 4)
    (fun p q => packedBilinear (packedLabel p) (packedLabel q) x)
    sourceNormalizedGamma (packedCarrier x)
    (fun p q => packedBilinear_source48 p q x)

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
  by_cases hab : a = b <;> simp [hab] <;> ring

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
