import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineGammaFaithfulness

/-! Independent literal-source consumers, including both signs and axis-sensitive pairs. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineGammaFaithfulnessIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSGamma9 FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineGammaCovariance FCP.BFSSSourceNineGammaFaithfulness

private theorem coordinate_gamma (r : SpaceIndex) :
    gammaNineRealLinear (source9CoordinateVector r) = gamma r := by
  simp [gammaNineRealLinear, source9CoordinateVector, Pi.single_apply]

private theorem coordinate_gamma_square (r : SpaceIndex) : gamma r * gamma r = 1 := by
  simpa only [coordinate_gamma, source9CoordinateVector_unit, one_smul] using
    gammaNineRealLinear_sq (source9CoordinateVector r)

private theorem coordinate_gamma_anti (r s : SpaceIndex) (hrs : r ≠ s) :
    gamma r * gamma s = -(gamma s * gamma r) := by
  exact eq_neg_of_add_eq_zero_left (by simpa [hrs] using gamma_clifford r s)

private theorem coordinate_pair_gamma (r s : SpaceIndex) :
    ((source9SpinGammaSpecialOrthogonalHom
      (source9UnitVectorPairSpin (source9CoordinateVector r) (source9CoordinateVector s)
        (source9CoordinateVector_unit r) (source9CoordinateVector_unit s))) : GammaMatrix) =
      gamma r * gamma s := by
  rw [source9UnitVectorPairSpin_gamma, coordinate_gamma, coordinate_gamma]

private theorem action_of_intertwiner
    (g : spinGroup source9Quadratic) (v w : SpaceIndex → ℝ)
    (h : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear v =
      gammaNineRealLinear w * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix)) :
    source9SpinVectorRepresentation g v = w := by
  apply gammaNineRealLinear_injective
  have he := (source9GammaSpecialOrthogonal_intertwines g v).symm.trans h
  have hinv : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) *
      ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) = 1 := by
    calc
      _ = ((source9SpinGammaSpecialOrthogonalHom (g * g⁻¹)) : GammaMatrix) := by
        rw [map_mul]
        rfl
      _ = 1 := by rw [mul_inv_cancel, map_one]; rfl
  have hc := congrArg (fun A : GammaMatrix =>
    A * ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix)) he
  simpa only [mul_assoc, hinv, mul_one] using hc

example : Function.Injective source9SpinGammaSpecialOrthogonalHom :=
  source9SpinGammaSpecialOrthogonalHom_injective

example (g h : spinGroup source9Quadratic)
    (heq : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) =
      ((source9SpinGammaSpecialOrthogonalHom h) : GammaMatrix)) : g = h :=
  source9SpinGammaSpecialOrthogonalHom_injective (Subtype.ext heq)

example : ((source9SpinGammaSpecialOrthogonalHom (1 : spinGroup source9Quadratic)) :
    GammaMatrix) = 1 := by rw [map_one]; rfl

example : ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) = -1 :=
  source9NegativeCentral_gamma

example : ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) ≠ 1 :=
  source9NegativeCentral_gamma_ne_one

example : ((source9SpinVectorOrthogonalHom source9NegativeCentral) :
    Matrix SpaceIndex SpaceIndex ℝ) = 1 ∧ source9NegativeCentral ≠ 1 :=
  ⟨source9NegativeCentral_naturalMatrix_one, source9NegativeCentral_ne_one⟩

example (g : spinGroup source9Quadratic) :
    source9SpinVectorRepresentation g (source9CoordinateVector (8 : SpaceIndex)) =
        source9CoordinateVector 8 ↔
      ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gamma 8 =
        gamma 8 * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) := by
  simpa only [coordinate_gamma] using
    source9SpinGamma_fixes_iff_commutes g (source9CoordinateVector 8)

example : source9SpinVectorRepresentation (1 : spinGroup source9Quadratic)
    (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  rw [map_one]
  rfl

example : source9SpinVectorRepresentation source9NegativeCentral
    (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  apply (source9SpinGamma_fixes_iff_commutes _ _).mpr
  rw [source9NegativeCentral_gamma]
  simp only [neg_mul, mul_neg, one_mul, mul_one]

example : source9SpinVectorRepresentation
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 1)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 1))
    (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  apply (source9SpinGamma_fixes_iff_commutes _ _).mpr
  rw [coordinate_pair_gamma, coordinate_gamma]
  rw [mul_assoc, coordinate_gamma_anti 1 8 (by decide), mul_neg, ← mul_assoc,
    coordinate_gamma_anti 0 8 (by decide), neg_mul, neg_neg, mul_assoc]

example : source9SpinVectorRepresentation
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8))
    (source9CoordinateVector 8) = -source9CoordinateVector 8 := by
  apply action_of_intertwiner
  rw [coordinate_pair_gamma, map_neg, coordinate_gamma]
  calc
    (gamma 0 * gamma 8) * gamma 8 = gamma 0 := by
      rw [mul_assoc, coordinate_gamma_square, mul_one]
    _ = -gamma 8 * (gamma 0 * gamma 8) := by
      rw [← mul_assoc, neg_mul, coordinate_gamma_anti 8 0 (by decide), neg_neg,
        mul_assoc, coordinate_gamma_square, mul_one]

example : ¬ (((source9SpinGammaSpecialOrthogonalHom
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8))) : GammaMatrix) *
        gamma 8 = gamma 8 * ((source9SpinGammaSpecialOrthogonalHom
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8))) : GammaMatrix)) := by
  rw [coordinate_pair_gamma]
  intro h
  have hc : gamma 0 = -gamma 0 := by
    calc
      gamma 0 = (gamma 0 * gamma 8) * gamma 8 := by
        rw [mul_assoc, coordinate_gamma_square, mul_one]
      _ = gamma 8 * (gamma 0 * gamma 8) := h
      _ = -gamma 0 := by
        rw [← mul_assoc, coordinate_gamma_anti 8 0 (by decide), neg_mul,
          mul_assoc, coordinate_gamma_square, mul_one]
  have hv := gammaNineRealLinear_injective (show
      gammaNineRealLinear (source9CoordinateVector 0) =
        gammaNineRealLinear (-source9CoordinateVector 0) by
    simpa only [coordinate_gamma, map_neg] using hc)
  have hd := congrArg (fun v : SpaceIndex → ℝ => v 0) hv
  norm_num [source9CoordinateVector] at hd

#print axioms FCP.BFSSSourceNineGammaFaithfulness.gammaNineRealLinear_injective
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9NegativeCentral_gamma
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9NegativeCentral_gamma_ne_one
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGamma_eq_one_iff
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGammaSpecialOrthogonalHom_injective
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGamma_fixes_iff_commutes
#eval IO.println "SPECTRAL_SOURCE_NINE_GAMMA_FAITHFULNESS_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineGammaFaithfulnessIndependentAudit
