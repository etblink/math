import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1c0OriginalS1JAxisGammaColorSum

/-!
# C48-1A1c0 independent consumer: original identity-color Fock Gamma column

Consequence of the imported S1J/Gamma linear interface and genuine original
S1J identity action. This is NOT source-gauge Fock unitary intertwining,
not arbitrary-Source48 covariance, and not a physical Hamiltonian statement.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1c0OriginalS1JAxisGammaIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Independent operator-valued color-sum identity, requiring the
imported new Gamma interface as well as the original source identity. -/
theorem originalGamma_identityColorColumn_reconstruct
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    (∑ B : ColorIndex 2,
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
        (1 : GaugeGroup 2) B A) •
        sourceGammaRealLinear (sourceBlockColorAxis (j,s) B)) =
      sourceGammaRealLinear (sourceBlockColorAxis (j,s) A) := by
  calc
    _ = sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix
            (1 : GaugeGroup 2)).mulVec
              (sourceBlockColorAxis (j,s) A)) :=
        (FCP.BFSSC48C1A1c0OriginalS1JAxisGammaColorSum.originalS1J_axis_gamma_color_sum
          (1 : GaugeGroup 2) j s A).symm
    _ = sourceGammaRealLinear (sourceBlockColorAxis (j,s) A) := by
      simp [FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix_one]

#print axioms FCP.BFSSC48C1A1c0OriginalS1JAxisGammaColorSum.originalS1J_axis_gamma_color_sum
#print axioms originalGamma_identityColorColumn_reconstruct

end
end FCP.BFSSC48C1A1c0OriginalS1JAxisGammaIndependentConsumer
