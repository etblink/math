import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P0BOriginalSource48SkewPlaneNormalization

/-! Independent native original-Fock consumers and three source controls. -/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalizationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane
open FCP.BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalization

theorem originalSource48BivectorK_plane_antisym_consumer
    (i j : Source48Label) :
    originalSource48BivectorK (originalSource48SkewPlane i j) =
      (1 / 4 : ℝ) •
        (sourceNormalizedGamma i * sourceNormalizedGamma j -
          sourceNormalizedGamma j * sourceNormalizedGamma i) :=
  originalSource48BivectorK_plane_antisym i j

theorem originalSource48BivectorK_plane_half_consumer
    (i j : Source48Label) (hij : i ≠ j) :
    originalSource48BivectorK (originalSource48SkewPlane i j) =
      (1 / 2 : ℝ) • (sourceNormalizedGamma i * sourceNormalizedGamma j) :=
  originalSource48BivectorK_plane_half i j hij

-- Diagonal control uses only the arbitrary-label theorem.
example (i : Source48Label) :
    originalSource48BivectorK (originalSource48SkewPlane i i) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) := by
  rw [originalSource48BivectorK_plane_antisym, sub_self,
    FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
  ext v
  simp

-- Reversing plane orientation must reverse the generator sign.
example (i j : Source48Label) :
    originalSource48BivectorK (originalSource48SkewPlane j i) =
      -(originalSource48BivectorK (originalSource48SkewPlane i j)) := by
  rw [originalSource48BivectorK_plane_antisym,
    originalSource48BivectorK_plane_antisym]
  simp only [smul_sub]
  abel

-- Actual distinct paired source labels, not an abstract toy carrier.
example :
    originalSource48BivectorK
      (originalSource48SkewPlane
        ((0 : Fin 24), (0 : Fin 2)) ((0 : Fin 24), (1 : Fin 2))) =
      (1 / 2 : ℝ) •
        (sourceNormalizedGamma ((0 : Fin 24), (0 : Fin 2)) *
          sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2))) :=
  originalSource48BivectorK_plane_half _ _ (by decide)

#print axioms originalSource48BivectorK_plane_antisym_consumer
#print axioms originalSource48BivectorK_plane_half_consumer

end
end FCP.BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalizationIndependentConsumer
