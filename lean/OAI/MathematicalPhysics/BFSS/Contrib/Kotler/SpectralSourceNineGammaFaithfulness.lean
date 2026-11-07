import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineGammaCovariance

/-!
Original gamma faithfulness, using only positive vector squares, exact global
covariance and the qualified two-sign natural-action kernel. No injectivity
of an even Clifford algebra map, covering, or Fock-vector lift is assumed.
The stabilizer criterion identifies a subgroup of the actual source group;
it does not identify that subgroup with Spin(8).
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineGammaFaithfulness
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9DetFixture FCP.BFSSSourceNineGammaCovariance

/-- Positive original vector squares make the original vector gamma map faithful. -/
theorem gammaNineRealLinear_injective : Function.Injective gammaNineRealLinear := by
  intro v w h
  have hz : gammaNineRealLinear (v - w) = 0 := by
    rw [map_sub, h, sub_self]
  have hs := gammaNineRealLinear_sq (v - w)
  rw [hz, zero_mul] at hs
  have hd := congrArg (fun A : GammaMatrix => A (0 : SpinIndex) 0) hs
  have hq : source9Quadratic (v - w) = 0 := by
    simpa using hd.symm
  exact sub_eq_zero.mp ((source9Quadratic_eq_zero_iff (v - w)).mp hq)

/-- The actual negative source central element evaluates to minus the original identity. -/
theorem source9NegativeCentral_gamma :
    ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) = -1 := by
  rw [source9SpinGammaSpecialOrthogonalHom_apply, source9NegativeCentral_coe,
    map_neg, map_one]

/-- The original gamma image distinguishes the two actual central signs. -/
theorem source9NegativeCentral_gamma_ne_one :
    ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) ≠ 1 := by
  rw [source9NegativeCentral_gamma]
  intro h
  have hd := congrArg (fun A : GammaMatrix => A (0 : SpinIndex) 0) h
  norm_num at hd

/-- The original SO(16)-valued gamma map has trivial kernel in the literal source group. -/
theorem source9SpinGamma_eq_one_iff (g : spinGroup source9Quadratic) :
    source9SpinGammaSpecialOrthogonalHom g = 1 ↔ g = 1 := by
  constructor
  · intro hg
    have ha (v : SpaceIndex → ℝ) : source9SpinVectorRepresentation g v = v := by
      apply gammaNineRealLinear_injective
      have hi := source9GammaSpecialOrthogonal_intertwines g v
      rw [hg] at hi
      change (1 : GammaMatrix) * gammaNineRealLinear v =
        gammaNineRealLinear (source9SpinVectorRepresentation g v) * (1 : GammaMatrix) at hi
      simpa only [one_mul, mul_one] using hi.symm
    have hm : ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 := by
      apply Matrix.mulVec_injective
      funext v
      rw [source9SpinVectorOrthogonalHom_mulVec, Matrix.one_mulVec]
      exact ha v
    rcases (source9NaturalMatrix_eq_one_iff_two_signs g).mp hm with hpos | hneg
    · exact hpos
    · subst g
      exact False.elim (source9NegativeCentral_gamma_ne_one (by rw [hg]; rfl))
  · rintro rfl
    exact map_one source9SpinGammaSpecialOrthogonalHom

/-- Unconditional faithfulness of the original source gamma group homomorphism. -/
theorem source9SpinGammaSpecialOrthogonalHom_injective :
    Function.Injective source9SpinGammaSpecialOrthogonalHom := by
  intro g h heq
  have hk : source9SpinGammaSpecialOrthogonalHom (g * h⁻¹) = 1 := by
    rw [map_mul, map_inv, heq, mul_inv_cancel]
  have hrel := (source9SpinGamma_eq_one_iff (g * h⁻¹)).mp hk
  calc
    g = (g * h⁻¹) * h := by rw [mul_assoc, inv_mul_cancel, mul_one]
    _ = h := by rw [hrel, one_mul]

/-- Exact vector stabilizer/commutator criterion inside the actual original gamma image. -/
theorem source9SpinGamma_fixes_iff_commutes
    (g : spinGroup source9Quadratic) (v : SpaceIndex → ℝ) :
    source9SpinVectorRepresentation g v = v ↔
      ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear v =
        gammaNineRealLinear v * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) := by
  constructor
  · intro hv
    simpa only [hv] using source9GammaSpecialOrthogonal_intertwines g v
  · intro hc
    apply gammaNineRealLinear_injective
    have hi := (source9GammaSpecialOrthogonal_intertwines g v).symm.trans hc
    have hinv : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) *
        ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) = 1 := by
      calc
        _ = ((source9SpinGammaSpecialOrthogonalHom (g * g⁻¹)) : GammaMatrix) := by
          rw [map_mul]
          rfl
        _ = 1 := by
          rw [mul_inv_cancel, map_one]
          rfl
    have he := congrArg (fun A : GammaMatrix =>
      A * ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix)) hi
    simpa only [mul_assoc, hinv, mul_one] using he

#print axioms FCP.BFSSSourceNineGammaFaithfulness.gammaNineRealLinear_injective
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9NegativeCentral_gamma
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9NegativeCentral_gamma_ne_one
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGamma_eq_one_iff
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGammaSpecialOrthogonalHom_injective
#print axioms FCP.BFSSSourceNineGammaFaithfulness.source9SpinGamma_fixes_iff_commutes
#eval IO.println "SPECTRAL_SOURCE_NINE_GAMMA_FAITHFULNESS_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineGammaFaithfulness
