import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Euler

/-!
Strict independent consumer: exact universal SO(3) domain and the
native subgroup type. No BFSS gauge imports or physical assumptions.
-/
set_option autoImplicit false
namespace BFSSIBIG0CSO3EulerIndependentConsumer
noncomputable section
open FCP.BFSSIBIG0CSO3Euler

example (M : Matrix (Fin 3) (Fin 3) ℝ)
    (hM : M ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ α β γ : ℝ, M = rotZ α * rotX β * rotZ γ :=
  sourceSO3_euler_decomp M hM

example (Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ α β γ : ℝ,
      (Q : Matrix (Fin 3) (Fin 3) ℝ) = rotZ α * rotX β * rotZ γ :=
  sourceSO3_euler_decomp (Q : Matrix (Fin 3) (Fin 3) ℝ) Q.prop

end
end BFSSIBIG0CSO3EulerIndependentConsumer
