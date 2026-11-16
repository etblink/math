import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4CS0OriginalSpin9CentralGammaSign

/-!
# M4-CS0 original source central Spin9 sign — independent consumer
Original 24×2 paired label order and literal normalized Fock Majoranas.
No scalar-implementer or global physical Fock unitary is invented.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M4CS0OriginalSpin9CentralGammaSignIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
open FCP.BFSSP3M4CS0OriginalSpin9CentralGammaSign

/-- The source Spin9 central transformation negates every actual
original paired 48-component real source vector. -/
theorem originalCentral_source48_vector_negative
    (v : Source48Vector) :
    (((source9SpinOriginalPaired48OrthogonalHom source9NegativeCentral :
        Matrix.orthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ).mulVec v) = -v := by
  rw [originalSpin9Central_originalPairedOrthogonal_negativeOne]
  rw [Matrix.neg_mulVec, Matrix.one_mulVec]

/-- The actual source star-automorphism action reverses ALL original
normalized active real-linear Majorana operators. -/
theorem originalCentral_originalGamma_negative
    (v : Source48Vector) :
    source9Spin_originalFockOperatorStarAutomorphismHom source9NegativeCentral
      (sourceGammaRealLinear v) = -sourceGammaRealLinear v :=
  originalSpin9Central_activeGamma_negative_starAction v

/-- This includes the exact original 8×2×3 label normalization. -/
theorem originalCentral_originalAxis_negative
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    source9Spin_originalFockOperatorStarAutomorphismHom source9NegativeCentral
      (sourceNormalizedGamma (sourceBlockColorLabel (j, s) A)) =
        -sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
  originalSpin9Central_originalAxis_negative j s A

#print axioms originalCentral_source48_vector_negative
#print axioms originalCentral_originalGamma_negative
#print axioms originalCentral_originalAxis_negative

end
end FCP.BFSSP3M4CS0OriginalSpin9CentralGammaSignIndependentConsumer
