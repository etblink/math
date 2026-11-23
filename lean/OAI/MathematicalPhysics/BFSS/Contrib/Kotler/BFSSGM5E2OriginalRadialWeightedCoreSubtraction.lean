import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E1OriginalRadialWeightedGradientControl

/-! Source-exact subtraction of first-radial-weighted original Fock smooth
vectors in the genuine original FullL2 output. No completed-domain claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E2
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5E1
open MeasureTheory

/-- The genuine original sqrt-radius weighted smooth-core map respects
subtraction in FullL2. This is the missing source interface required to
apply GM5E1 to differences of weighted graph-Cauchy sequences. -/
theorem radialWeightedCore_sub {N : ℕ} (f g : SmoothCore N) :
    radialWeightedCore (f - g) = radialWeightedCore f - radialWeightedCore g := by
  apply Lp.ext
  filter_upwards [
      BFSSSliceSobolev.weightedToL2_ae (volume : Measure (Boson N))
        (fun x : Boson N => Real.sqrt ‖x‖)
        (Real.continuous_sqrt.comp continuous_norm) (f - g),
      BFSSSliceSobolev.weightedToL2_ae (volume : Measure (Boson N))
        (fun x : Boson N => Real.sqrt ‖x‖)
        (Real.continuous_sqrt.comp continuous_norm) f,
      BFSSSliceSobolev.weightedToL2_ae (volume : Measure (Boson N))
        (fun x : Boson N => Real.sqrt ‖x‖)
        (Real.continuous_sqrt.comp continuous_norm) g,
      Lp.coeFn_sub (radialWeightedCore f) (radialWeightedCore g)
    ] with x hsub hf hg hlp
  rw [hsub, hlp, Pi.sub_apply, hf, hg]
  change (Real.sqrt ‖x‖) • (f x - g x) =
    (Real.sqrt ‖x‖) • f x - (Real.sqrt ‖x‖) • g x
  exact smul_sub (Real.sqrt ‖x‖) (f x) (g x)

#print axioms radialWeightedCore_sub

end
end FCP.BFSSGM5E2
