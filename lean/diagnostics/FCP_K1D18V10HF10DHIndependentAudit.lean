import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DHTranslatedTransitionRegularity

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped ContDiff Matrix.Norms.Elementwise

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private def auditDHUpper (g : G) (i : Fin 36) : ℝ :=
  ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
    (source9StrictPlaneRow i) (source9StrictPlaneColumn i)
private abbrev auditDHOverlap (g h : G) : Set P :=
  ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)).source
private def auditDHTransition (g h : G) (t : P) : P :=
  source9OrderedUpperCoordinateLocalHomeomorph.symm
    (auditDHUpper (g⁻¹ * (h * source9OrderedStrictPlaneWord t)))

private theorem auditDHUpper_eq : source9SpinUpperCoordinates = auditDHUpper := by
  funext g i
  unfold source9SpinUpperCoordinates auditDHUpper
  exact source9OrderedUpperProjection_apply _ i

private theorem auditDHTransition_eq (g h : G) :
    (fun t : P => source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t)) =
      auditDHTransition g h := by
  funext t
  unfold auditDHTransition
  rw [← auditDHUpper_eq]
  exact source9SpinLeftTranslatedChart_transition_coordinates g h t

example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide

-- Consume the product formula for the independently spelled original entries.
example (g h : G) (i : Fin 36) :
    auditDHUpper (g * h) i = ∑ j : SpaceIndex,
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
        (source9StrictPlaneRow i) j *
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ)
        j (source9StrictPlaneColumn i) := by
  rw [← auditDHUpper_eq]
  exact source9SpinUpperCoordinates_mul_entry g h i
example (n : ℕ∞ω) (g : G) :
    ContDiff ℝ n (fun t : P => auditDHUpper (g * source9OrderedStrictPlaneWord t)) := by
  rw [← auditDHUpper_eq]
  exact source9SpinLeftWord_upperCoordinates_contDiff n g
example (g h : G) (t : P) :
    source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t) =
      source9OrderedUpperCoordinateLocalHomeomorph.symm
        (auditDHUpper (g⁻¹ * (h * source9OrderedStrictPlaneWord t))) :=
  congrFun (auditDHTransition_eq g h) t

-- Use the actual DE overlap and prove the DG target restriction from it.
example (g h : G) : auditDHOverlap g h =
    source9SpinIdentityLocalChart.target ∩
      (fun t : P => g⁻¹ * (h * source9OrderedStrictPlaneWord t)) ⁻¹'
        source9SpinIdentityLocalChart.source :=
  source9SpinLeftTranslatedChart_transition_source g h
example (g h : G) : Set.MapsTo
    (fun t : P => auditDHUpper (g⁻¹ * (h * source9OrderedStrictPlaneWord t)))
    (auditDHOverlap g h) source9OrderedUpperCoordinateLocalHomeomorph.target := by
  rw [← auditDHUpper_eq]
  exact source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget g h
example (g h : G) (t : P) (ht : t ∈ auditDHOverlap g h) :
    auditDHUpper (g⁻¹ * (h * source9OrderedStrictPlaneWord t)) ∈
      source9OrderedUpperCoordinateLocalHomeomorph.target := by
  rw [← auditDHUpper_eq]
  exact source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget g h ht

-- Both the actual transition and literal entry/inverse formula on that entire overlap.
example (n : ℕ∞ω) (g h : G) : ContDiffOn ℝ n
    (fun t : P => source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t))
    (auditDHOverlap g h) := source9SpinLeftTranslatedChart_transition_contDiffOn n g h
example (n : ℕ∞ω) (g h : G) :
    ContDiffOn ℝ n (auditDHTransition g h) (auditDHOverlap g h) := by
  rw [← auditDHTransition_eq g h]
  exact source9SpinLeftTranslatedChart_transition_contDiffOn n g h
example (g h : G) : ContDiffOn ℝ ω (auditDHTransition g h) (auditDHOverlap g h) := by
  rw [← auditDHTransition_eq g h]
  exact source9SpinLeftTranslatedChart_transition_contDiffOn ω g h
example (g h : G) : ContDiffOn ℝ ∞ (auditDHTransition h g) (auditDHOverlap h g) := by
  rw [← auditDHTransition_eq h g]
  exact source9SpinLeftTranslatedChart_transition_contDiffOn ∞ h g
example (n : ℕ∞ω) (g h : G) (t : P) (ht : t ∈ auditDHOverlap g h) :
    ContDiffWithinAt ℝ n (auditDHTransition g h) (auditDHOverlap g h) t := by
  rw [← auditDHTransition_eq g h]
  exact source9SpinLeftTranslatedChart_transition_contDiffOn n g h t ht

-- Same-chart transitions recover parameters on the established chart target.
example (g : G) (t : P) (ht : t ∈ (source9SpinLeftTranslatedChart g).target) :
    auditDHTransition g g t = t := by
  rw [← congrFun (auditDHTransition_eq g g) t]
  exact (source9SpinLeftTranslatedChart g).right_inv ht
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms source9SpinUpperCoordinates_mul_entry
#print axioms source9SpinLeftWord_upperCoordinates_contDiff
#print axioms source9SpinLeftTranslatedChart_transition_coordinates
#print axioms source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget
#print axioms source9SpinLeftTranslatedChart_transition_contDiffOn
end
end FCP.BFSSPairedSpin9Clifford
