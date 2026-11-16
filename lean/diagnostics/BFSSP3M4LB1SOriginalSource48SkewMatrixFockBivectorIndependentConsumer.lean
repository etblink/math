import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1SOriginalSource48SkewMatrixFockBivector

/-!
# Independent M4-LB1S original 48×48 Fock bivector consumer

Exact original Source48Label=Fin24×Fin2, genuine Fermion 2,
and original source 1/4 coefficient. No physical charge claim.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivectorIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector

theorem originalSource48BivectorK_raw_consumer
    (A : Matrix Source48Label Source48Label ℝ) :
    originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q) := by
  rfl

theorem originalSource48BivectorK_entrySkew_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p)) :
    star (originalSource48BivectorK A) =
      -(originalSource48BivectorK A) :=
  originalSource48BivectorK_skewAdjoint A hA

theorem originalSource48BivectorK_transposeSkew_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A) :
    star (originalSource48BivectorK A) =
      -(originalSource48BivectorK A) :=
  originalSource48BivectorK_skewAdjoint_of_transpose A hA

theorem originalSource48BivectorK_zero_consumer :
    originalSource48BivectorK
      (0 : Matrix Source48Label Source48Label ℝ) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  originalSource48BivectorK_zero

#print axioms originalSource48BivectorK_raw_consumer
#print axioms originalSource48BivectorK_entrySkew_consumer
#print axioms originalSource48BivectorK_transposeSkew_consumer
#print axioms originalSource48BivectorK_zero_consumer

end
end FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivectorIndependentConsumer
