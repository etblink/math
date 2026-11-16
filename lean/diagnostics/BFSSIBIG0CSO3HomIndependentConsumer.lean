import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Hom

/-!
Independent consumer of the original BFSS -> SO(3) typed homomorphism.
No replacement SU2, no unproved kernel, and no physical Fock claims.
-/
set_option autoImplicit false

namespace BFSSIBIG0CSO3HomIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CSO3Hom

example (g : GaugeGroup 2) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix g ∈
      Matrix.specialOrthogonalGroup (Fin 3) ℝ :=
  originalAdjointColorMatrix_mem_SO3 g

example (g : GaugeGroup 2) :
    ((originalAdjointSO3Hom g : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
      Matrix (Fin 3) (Fin 3) ℝ) =
        FCP.BFSSSU2GaugeG3A.adjointColorMatrix g :=
  originalAdjointSO3Hom_coe g

example (g h : GaugeGroup 2) :
    originalAdjointSO3Hom (g * h) =
      originalAdjointSO3Hom g * originalAdjointSO3Hom h :=
  map_mul originalAdjointSO3Hom g h

example : Function.Surjective originalAdjointSO3Hom :=
  originalAdjointSO3Hom_surjective

example (Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ g : GaugeGroup 2, originalAdjointSO3Hom g = Q :=
  originalAdjointSO3Hom_surjective Q

end
end BFSSIBIG0CSO3HomIndependentConsumer
