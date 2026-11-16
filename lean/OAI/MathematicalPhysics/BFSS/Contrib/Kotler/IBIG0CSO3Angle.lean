import Mathlib

/-!
# IBI-G0C-SO3-ANGLE0 — source-independent angle existence

The abstract real unit circle is parameterized by cosine and sine.
This lemma is completely independent of BFSS, its spin representation,
gauge group, physical Hilbert space, and its SO(3) surjectivity target.

Proof strategy adapted from the public LionSR/QICLean
QICLean/Algebra/SpinCover/EulerAngles.lean at pinned donor
603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac.
The donor package is NOT imported; this exact code must independently
compile in the frozen native Lean 4.34.1 / Mathlib environment.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CSO3Angle
noncomputable section

/-- Every real point on the unit circle has a cosine/sine angle witness.
No branch choice, inequality assumption or SO(3) decomposition is hidden. -/
theorem unitCircle_exists_angle {c s : ℝ} (h : c ^ 2 + s ^ 2 = 1) :
    ∃ θ : ℝ, Real.cos θ = c ∧ Real.sin θ = s := by
  have hn : ‖(⟨c, s⟩ : ℂ)‖ = 1 := by
    rw [Complex.norm_def, Complex.normSq_mk,
      show c * c + s * s = 1 by nlinarith only [h]]
    simp
  have hz : (⟨c, s⟩ : ℂ) ≠ 0 := by
    intro hzero
    rw [hzero] at hn
    norm_num at hn
  exact ⟨Complex.arg (⟨c, s⟩ : ℂ), by rw [Complex.cos_arg hz, hn]; simp,
    by rw [Complex.sin_arg, hn]; simp⟩

#print axioms unitCircle_exists_angle

end
end FCP.BFSSIBIG0CSO3Angle
