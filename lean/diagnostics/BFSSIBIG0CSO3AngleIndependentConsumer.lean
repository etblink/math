import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Angle

/-!
Independent consumer of the abstract SO(3) Euler circle-angle helper.
These cases include both axes and negative-axis (future gimbal-lock) signs.
No BFSS imports or claims about arbitrary SO(3) rotations.
-/
set_option autoImplicit false

namespace BFSSIBIG0CSO3AngleIndependentConsumer
noncomputable section
open FCP.BFSSIBIG0CSO3Angle

example {c s : ℝ} (h : c ^ 2 + s ^ 2 = 1) :
    ∃ θ : ℝ, Real.cos θ = c ∧ Real.sin θ = s :=
  unitCircle_exists_angle h

example : ∃ θ : ℝ, Real.cos θ = 1 ∧ Real.sin θ = 0 :=
  unitCircle_exists_angle (c := 1) (s := 0) (by norm_num)

example : ∃ θ : ℝ, Real.cos θ = -1 ∧ Real.sin θ = 0 :=
  unitCircle_exists_angle (c := -1) (s := 0) (by norm_num)

example : ∃ θ : ℝ, Real.cos θ = 0 ∧ Real.sin θ = 1 :=
  unitCircle_exists_angle (c := 0) (s := 1) (by norm_num)

example : ∃ θ : ℝ, Real.cos θ = 0 ∧ Real.sin θ = -1 :=
  unitCircle_exists_angle (c := 0) (s := -1) (by norm_num)

end
end BFSSIBIG0CSO3AngleIndependentConsumer
