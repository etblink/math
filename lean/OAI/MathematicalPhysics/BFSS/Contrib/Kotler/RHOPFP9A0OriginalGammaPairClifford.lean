import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-!
# RHOPF-P9A0 — bounded original Gamma9 bivector Clifford gate

Source exact: imported original Gamma9.gamma, not copied 16x16 or toy matrices.
Proves each distinct ordered pair gamma_a gamma_b is a skew 16-real
complex structure (its square is -I). Three chosen source bivectors are
fixed witnesses, NOT yet source-qualified to act equally on the selected
Hopf R4 subcarrier. Their finite-coordinate equivalence is independently
checked by the P9A0 exact-source Python consumer; a later P9A1 Lean gate
must establish it within Lean before proof promotion.

No new fermionic Fock-vector Spin9 implementer, conserved U1 current,
physical Hamiltonian symmetry, eigenpair, soliton or particle claim.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A0
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9

/-- Original, publicly defined source gamma, not a surrogate. -/
private abbrev G := FCP.BFSSGamma9.gamma

/-- Clifford source forces each gamma to square to the identity. -/
theorem originalGamma_sq (a : SpaceIndex) :
    G a * G a = (1 : GammaMatrix) := by
  have h : G a * G a + G a * G a =
      (1 : GammaMatrix) + 1 := by
    simpa only [ite_true, two_smul] using (gamma_clifford a a)
  calc
    G a * G a = (1 / 2 : ℝ) • (G a * G a + G a * G a) := by module
    _ = (1 / 2 : ℝ) • ((1 : GammaMatrix) + 1) := by rw [h]
    _ = 1 := by module

/-- The opposite ordered pair is the negative, for a != b. -/
theorem originalGamma_anticommute (a b : SpaceIndex) (hab : a ≠ b) :
    G b * G a = -(G a * G b) := by
  have h : G a * G b + G b * G a = 0 := by
    simpa only [if_neg hab, zero_smul] using (gamma_clifford a b)
  calc
    G b * G a = (G a * G b + G b * G a) - G a * G b := by module
    _ = -(G a * G b) := by rw [h]; module

/-- Original Spin(9) gamma bivectors square to -I with no expanded matrices. -/
theorem originalGammaPair_sq_neg_one (a b : SpaceIndex) (hab : a ≠ b) :
    (G a * G b) * (G a * G b) = -(1 : GammaMatrix) := by
  calc
    (G a * G b) * (G a * G b) = G a * (G b * G a) * G b := by noncomm_ring
    _ = -(G a * G a) * (G b * G b) := by
      rw [originalGamma_anticommute a b hab]
      noncomm_ring
    _ = -(1 : GammaMatrix) := by rw [originalGamma_sq a, originalGamma_sq b]; simp

/-- The original gamma bivector is real skew-symmetric. -/
theorem originalGammaPair_skew (a b : SpaceIndex) (hab : a ≠ b) :
    (G a * G b).transpose = -(G a * G b) := by
  have hTa : (G a).transpose = G a := gamma_symmetric a
  have hTb : (G b).transpose = G b := gamma_symmetric b
  rw [Matrix.transpose_mul, hTa, hTb]
  exact originalGamma_anticommute a b hab

/-- One of three *full original* gamma source choices. -/
private abbrev K13 : GammaMatrix := G 1 * G 3
private abbrev K25 : GammaMatrix := -(G 2 * G 5)
private abbrev K46 : GammaMatrix := -(G 4 * G 6)

theorem K13_sq : K13 * K13 = -(1 : GammaMatrix) := by
  exact originalGammaPair_sq_neg_one 1 3 (by decide)

theorem K25_sq : K25 * K25 = -(1 : GammaMatrix) := by
  simpa only [K25, neg_mul, mul_neg, neg_neg] using
    (originalGammaPair_sq_neg_one 2 5 (by decide))

theorem K46_sq : K46 * K46 = -(1 : GammaMatrix) := by
  simpa only [K46, neg_mul, mul_neg, neg_neg] using
    (originalGammaPair_sq_neg_one 4 6 (by decide))

theorem K13_skew : K13.transpose = -K13 := by
  exact originalGammaPair_skew 1 3 (by decide)

theorem K25_skew : K25.transpose = -K25 := by
  change (-(G 2 * G 5)).transpose = -(-(G 2 * G 5))
  rw [Matrix.transpose_neg, originalGammaPair_skew 2 5 (by decide)]
  simp

theorem K46_skew : K46.transpose = -K46 := by
  change (-(G 4 * G 6)).transpose = -(-(G 4 * G 6))
  rw [Matrix.transpose_neg, originalGammaPair_skew 4 6 (by decide)]
  simp

#print axioms originalGamma_sq
#print axioms originalGamma_anticommute
#print axioms originalGammaPair_sq_neg_one
#print axioms originalGammaPair_skew
#print axioms K13_sq
#print axioms K25_sq
#print axioms K46_sq
#print axioms K13_skew
#print axioms K25_skew
#print axioms K46_skew

end
end FCP.RHOPFP9A0
