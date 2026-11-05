import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DGWholeTargetInverseRegularity

/-! F10DH: every-order regularity of the existing translated-chart transitions.
Use finite original matrix entries of the actual natural homomorphism, then compose
with DG's same parameter inverse on the exact DE overlap source. No source-group
norm, new chart or manifold instance is introduced.
Candidate until strict source compilation and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped ContDiff Matrix.Norms.Elementwise

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic

/-- Original upper coordinates of a product are the actual finite matrix product entries. -/
theorem source9SpinUpperCoordinates_mul_entry (g h : G) (i : Fin 36) :
    source9SpinUpperCoordinates (g * h) i =
      ∑ j : SpaceIndex,
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
          (source9StrictPlaneRow i) j *
        ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ)
          j (source9StrictPlaneColumn i) := by
  have hm : ((source9SpinVectorOrthogonalHom (g * h)) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) *
        ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) :=
    map_mul source9SpinVectorMatrixHom g h
  calc
    source9SpinUpperCoordinates (g * h) i =
        ((source9SpinVectorOrthogonalHom (g * h)) : Matrix SpaceIndex SpaceIndex ℝ)
          (source9StrictPlaneRow i) (source9StrictPlaneColumn i) :=
      source9OrderedUpperProjection_apply _ i
    _ = _ := by rw [hm, Matrix.mul_apply]

/-- Left multiplication by a fixed original Spin element preserves parameter smoothness. -/
theorem source9SpinLeftWord_upperCoordinates_contDiff (n : ℕ∞ω) (g : G) :
    ContDiff ℝ n (fun t : P =>
      source9SpinUpperCoordinates (g * source9OrderedStrictPlaneWord t)) := by
  apply contDiff_pi.2
  intro i
  have heq : (fun t : P =>
      source9SpinUpperCoordinates (g * source9OrderedStrictPlaneWord t) i) =
      (fun t : P => ∑ j : SpaceIndex,
        ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)
          (source9StrictPlaneRow i) j *
        ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
          Matrix SpaceIndex SpaceIndex ℝ) j (source9StrictPlaneColumn i)) := by
    funext t
    exact source9SpinUpperCoordinates_mul_entry g (source9OrderedStrictPlaneWord t) i
  rw [heq]
  apply ContDiff.sum
  intro j _
  exact contDiff_const.mul
    (source9OrderedStrictPlaneWord_matrix_entry_contDiff n j (source9StrictPlaneColumn i))

/-- The same total transition is the accepted parameter inverse of the actual upper entries. -/
theorem source9SpinLeftTranslatedChart_transition_coordinates (g h : G) (t : P) :
    source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t) =
      source9OrderedUpperCoordinateLocalHomeomorph.symm
        (source9SpinUpperCoordinates (g⁻¹ * (h * source9OrderedStrictPlaneWord t))) :=
  (source9SpinLeftTranslatedChart_transition_apply g h t).trans
    (congrFun source9SpinIdentityLocalChart_coe (g⁻¹ * (h * source9OrderedStrictPlaneWord t)))

/-- Exact overlap membership supplies the inverse's existing target-membership premise. -/
theorem source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget (g h : G) :
    Set.MapsTo
      (fun t : P => source9SpinUpperCoordinates (g⁻¹ * (h * source9OrderedStrictPlaneWord t)))
      ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)).source
      source9OrderedUpperCoordinateLocalHomeomorph.target := by
  intro t ht
  rw [source9SpinLeftTranslatedChart_transition_source] at ht
  have hk : g⁻¹ * (h * source9OrderedStrictPlaneWord t) ∈
      source9SpinExactRecoveryNeighborhood := by
    rw [← source9SpinIdentityLocalChart_source]
    exact ht.2
  exact (source9SpinNaturalMatrixRecoveryNeighborhood_conditions _
    (source9SpinExactRecoveryNeighborhood_conditions _ hk).1).1

/-- All translated transitions are C^n on their actual existing overlap sources. -/
theorem source9SpinLeftTranslatedChart_transition_contDiffOn (n : ℕ∞ω) (g h : G) :
    ContDiffOn ℝ n
      (fun t : P => source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t))
      ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)).source := by
  have hinner : ContDiff ℝ n (fun t : P =>
      source9SpinUpperCoordinates (g⁻¹ * (h * source9OrderedStrictPlaneWord t))) := by
    simpa only [mul_assoc] using source9SpinLeftWord_upperCoordinates_contDiff n (g⁻¹ * h)
  have hc : ContDiffOn ℝ n
      (source9OrderedUpperCoordinateLocalHomeomorph.symm ∘
        (fun t : P => source9SpinUpperCoordinates (g⁻¹ * (h * source9OrderedStrictPlaneWord t))))
      ((source9SpinLeftTranslatedChart h).symm.trans (source9SpinLeftTranslatedChart g)).source :=
    (source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffOn_target n).comp
      hinner.contDiffOn (source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget g h)
  have heq :
      (fun t : P => source9SpinLeftTranslatedChart g ((source9SpinLeftTranslatedChart h).symm t)) =
      (source9OrderedUpperCoordinateLocalHomeomorph.symm ∘
        (fun t : P => source9SpinUpperCoordinates (g⁻¹ * (h * source9OrderedStrictPlaneWord t)))) := by
    funext t
    exact source9SpinLeftTranslatedChart_transition_coordinates g h t
  rw [← heq] at hc
  exact hc

#print axioms source9SpinUpperCoordinates_mul_entry
#print axioms source9SpinLeftWord_upperCoordinates_contDiff
#print axioms source9SpinLeftTranslatedChart_transition_coordinates
#print axioms source9SpinLeftTranslatedChart_transition_mapsTo_coordinateTarget
#print axioms source9SpinLeftTranslatedChart_transition_contDiffOn
end
end FCP.BFSSPairedSpin9Clifford
