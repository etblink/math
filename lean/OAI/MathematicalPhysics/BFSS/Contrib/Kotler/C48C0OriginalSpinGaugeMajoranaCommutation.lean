import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3B24ModeOrthogonalLiftProbe

/-!
# BFSS C48-0 — original source Spin(9) / SU(2) color commutation

Use exactly the accepted F10F Spin(9) orthogonal action on the original
G1A `Source48Label = Fin 24 × Fin 2` and the genuine G3A SU(2) color-adjoint
matrix. Both actions are transported through ONE AND THE SAME accepted
`pairedColorSpinEquiv` into original 48 Majorana source labels.

The color action is `R_color ⊗ I_spin16`, NOT a color-major surrogate
on the output carrier. Its entries reproduce the source G3B 24-complex-mode
real one-particle rotation identically on both paired real/imag components.
The Spin(9) action is the accepted `I_color ⊗ R_spin16` from F10F.
Their exact 48×48 commutation uses only the Kronecker multiplication law
and the existing reindexing ring equivalence, with no 48×48 expansion.

This is a REAL SOURCE-GENERATOR-level algebraic identity only.
It does not yet imply Fock-vector implementers commute, the scalar
character obstruction is trivial, the gauge-fixed projector is fixed,
continuity, unbounded physical-domain invariance or a BFSS mass gap.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
open FCP.BFSSSU2GaugeG3A
open FCP.BFSSSU2GaugeG3B
open Matrix
open scoped Kronecker

private abbrev Source48Matrix :=
  Matrix Source48Label Source48Label ℝ

/-- Exact original 48-real-label SU(2) gauge action, induced by the
qualified G3A adjoint color matrix. Same G1A permutation as F10F. -/
noncomputable def sourceGaugeOriginalPaired48 (q : GaugeGroup 2) :
    Source48Matrix :=
  (Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv)
    ((adjointColorMatrix q) ⊗ₖ (1 : GammaMatrix))

/-- The original source gauge action is identity at the gauge identity. -/
theorem sourceGaugeOriginalPaired48_one :
    sourceGaugeOriginalPaired48 (1 : GaugeGroup 2) =
      (1 : Source48Matrix) := by
  unfold sourceGaugeOriginalPaired48
  rw [adjointColorMatrix_one, Matrix.one_kronecker_one, map_one]

/-- The original gauge action has exact same-order SU(2) multiplication. -/
theorem sourceGaugeOriginalPaired48_mul (q h : GaugeGroup 2) :
    sourceGaugeOriginalPaired48 (q * h) =
      sourceGaugeOriginalPaired48 q *
        sourceGaugeOriginalPaired48 h := by
  let E := Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv
  change E ((adjointColorMatrix (q * h)) ⊗ₖ (1 : GammaMatrix)) =
    E ((adjointColorMatrix q) ⊗ₖ (1 : GammaMatrix)) *
      E ((adjointColorMatrix h) ⊗ₖ (1 : GammaMatrix))
  rw [adjointColorMatrix_mul, ← map_mul]
  apply congrArg E
  simpa only [one_mul] using
    (Matrix.mul_kronecker_mul
      (adjointColorMatrix q) (adjointColorMatrix h)
      (1 : GammaMatrix) (1 : GammaMatrix))

/-- The coefficient is color output/input, with a Kronecker delta in
the exact 16-real-spinor source indices, never an untyped relabel. -/
theorem sourceGaugeOriginalPaired48_entry
    (q : GaugeGroup 2) (A B : ColorIndex 2) (α β : SpinIndex) :
    sourceGaugeOriginalPaired48 q
        (pairedColorSpinEquiv (A, α))
        (pairedColorSpinEquiv (B, β)) =
      if α = β then adjointColorMatrix q A B else 0 := by
  simp [sourceGaugeOriginalPaired48, Matrix.reindex,
    Matrix.kronecker, Matrix.one_apply]

/-- The original paired real/imaginary gauge coefficients recover
exactly the qualified G3B 24-complex-mode one-particle matrix entries
on each source spin pair. The G1A block and F10F index maps have
identical explicit formulas and no ad-hoc equivFin ordering. -/
theorem sourceGaugeOriginalPaired48_G3B_mode_entry
    (q : GaugeGroup 2) (j k : Fin 8) (r s : Fin 2)
    (A B : ColorIndex 2) :
    sourceGaugeOriginalPaired48 q
        (pairedColorSpinEquiv
          (A, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, r)))
        (pairedColorSpinEquiv
          (B, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (k, s))) =
      (oneParticleMatrix q
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A))
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B))) *
          (1 : Matrix (Fin 2) (Fin 2) ℝ) r s := by
  rw [sourceGaugeOriginalPaired48_entry, oneParticleMatrix_block]
  have hs :
      (FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, r) =
        FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (k, s)) ↔
      j = k ∧ r = s := by
    constructor
    · intro heq
      have h := congrArg FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv heq
      simpa only [Equiv.apply_symm_apply, Prod.mk.injEq] using h
    · rintro ⟨rfl, rfl⟩
      rfl
  by_cases hj : j = k <;> by_cases hr : r = s <;>
    simp [hs, hj, hr, Matrix.one_apply]

/-- Main C48-0 obligation: genuine original source Spin(9) and
actual source SU(2) gauge color transformations commute on all
forty-eight real G1A paired-Majorana labels. -/
theorem source9SpinOriginalPaired48_commutes_sourceGauge
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2) :
    ((source9SpinOriginalPaired48OrthogonalHom g) :
      Source48Matrix) * sourceGaugeOriginalPaired48 q =
    sourceGaugeOriginalPaired48 q *
      ((source9SpinOriginalPaired48OrthogonalHom g) :
        Source48Matrix) := by
  let E := Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv
  let R : Matrix (ColorIndex 2) (ColorIndex 2) ℝ :=
    adjointColorMatrix q
  let A : GammaMatrix :=
    ((source9SpinGammaOrthogonalHom g) : GammaMatrix)
  change E ((1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ) ⊗ₖ A) *
      E (R ⊗ₖ (1 : GammaMatrix)) =
    E (R ⊗ₖ (1 : GammaMatrix)) *
      E ((1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ) ⊗ₖ A)
  rw [← map_mul, ← map_mul]
  apply congrArg E
  calc
    ((1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ) ⊗ₖ A) *
        (R ⊗ₖ (1 : GammaMatrix)) =
      ((1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ) * R) ⊗ₖ
        (A * (1 : GammaMatrix)) := by
          exact (Matrix.mul_kronecker_mul
            (1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ)
            R A (1 : GammaMatrix)).symm
    _ = R ⊗ₖ A := by rw [one_mul, mul_one]
    _ = (R * (1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ)) ⊗ₖ
        ((1 : GammaMatrix) * A) := by rw [mul_one, one_mul]
    _ = (R ⊗ₖ (1 : GammaMatrix)) *
        ((1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ) ⊗ₖ A) := by
          exact Matrix.mul_kronecker_mul
            R (1 : Matrix (ColorIndex 2) (ColorIndex 2) ℝ)
            (1 : GammaMatrix) A

#print axioms sourceGaugeOriginalPaired48
#print axioms sourceGaugeOriginalPaired48_one
#print axioms sourceGaugeOriginalPaired48_mul
#print axioms sourceGaugeOriginalPaired48_entry
#print axioms sourceGaugeOriginalPaired48_G3B_mode_entry
#print axioms source9SpinOriginalPaired48_commutes_sourceGauge

end
end FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation
