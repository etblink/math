import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6COriginalFockActiveGammaCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB3OriginalFockStarAutomorphismAction

/-!
# BFSS M4-CS0 — negative central Spin9 acts as minus on ORIGINAL Fock gammas

Original genuine Spin9 negative Clifford scalar source9NegativeCentral
has actual original paired-48 SO image -I, proved in F10U; OP3C6C
proved covariance on ALL exact original sourceGammaRealLinear inputs.

This module derives the original Fock OPERATOR group action on each
gamma and keeps the source normalized real-vectors and paired ordering.
This does not posit a Fock-VECTOR group unitary, scalar implementer,
fermion parity, common physical charge domain or spectral result.

STAGED: original native Lean and an independent consumer need a strict
cold pinned gate, with standard-only axiom reports.
-/
set_option autoImplicit false
namespace FCP.BFSSP3M4CS0OriginalSpin9CentralGammaSign
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction

/-- The EXACT 24×2 source paired-label real matrix of the central
element is negative identity, as an orthogonal matrix, not a surrogate
color-major linear action. -/
theorem originalSpin9Central_originalPairedOrthogonal_negativeOne :
    ((source9SpinOriginalPaired48OrthogonalHom source9NegativeCentral :
      Matrix.orthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ) =
      -(1 : Matrix Source48Label Source48Label ℝ) := by
  calc
    ((source9SpinOriginalPaired48OrthogonalHom source9NegativeCentral :
      Matrix.orthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ) =
      ((source9SpinOriginalPaired48SpecialOrthogonalHom source9NegativeCentral :
        Matrix.specialOrthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ) :=
        (source9SpinOriginalPaired48SpecialOrthogonalHom_apply _).symm
    _ = -(1 : Matrix Source48Label Source48Label ℝ) :=
        source9NegativeCentral_originalPairedSO48_image

/-- The literal original source normalized active Fock Majorana map
changes sign under the ACTUAL negative-central Spin9 operator-algebra
automorphism, for EVERY original real 48-vector. -/
theorem originalSpin9Central_activeGamma_negative
    (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom source9NegativeCentral
      (sourceGammaRealLinear v) = -sourceGammaRealLinear v := by
  calc
    source9Spin_originalFockOperatorAutomorphismHom source9NegativeCentral
        (sourceGammaRealLinear v) =
      sourceGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom source9NegativeCentral :
          Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v) :=
        source9Spin_originalFockOperatorAutomorphismHom_activeGamma _ _
    _ = sourceGammaRealLinear
        ((-(1 : Matrix Source48Label Source48Label ℝ)).mulVec v) := by
        rw [originalSpin9Central_originalPairedOrthogonal_negativeOne]
    _ = sourceGammaRealLinear (-v) := by
        rw [Matrix.neg_mulVec, Matrix.one_mulVec]
    _ = -sourceGammaRealLinear v := sourceGammaRealLinear.map_neg v

/-- The SAME sign holds for the existing physical-Hilbert-adjoint
preserving original Fock star-automorphism group action. No
Fock-vector implementing unitary has been constructed. -/
theorem originalSpin9Central_activeGamma_negative_starAction
    (v : Source48Vector) :
    source9Spin_originalFockOperatorStarAutomorphismHom source9NegativeCentral
      (sourceGammaRealLinear v) = -sourceGammaRealLinear v := by
  change source9Spin_originalFockOperatorAutomorphismHom source9NegativeCentral
    (sourceGammaRealLinear v) = -sourceGammaRealLinear v
  exact originalSpin9Central_activeGamma_negative v

/-- On the source 8×2×3 block/color coordinate axis, the negative
central automorphism reverses the original normalized pairedTheta,
not an alternate normalization or source indexing. -/
theorem originalSpin9Central_originalAxis_negative
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    source9Spin_originalFockOperatorStarAutomorphismHom source9NegativeCentral
      (sourceNormalizedGamma (sourceBlockColorLabel (j, s) A)) =
        -sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) := by
  rw [← sourceGammaRealLinear_axis j s A]
  exact originalSpin9Central_activeGamma_negative_starAction
    (sourceBlockColorAxis (j, s) A)

#print axioms originalSpin9Central_originalPairedOrthogonal_negativeOne
#print axioms originalSpin9Central_activeGamma_negative
#print axioms originalSpin9Central_activeGamma_negative_starAction
#print axioms originalSpin9Central_originalAxis_negative

end
end FCP.BFSSP3M4CS0OriginalSpin9CentralGammaSign
