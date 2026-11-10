import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C0OriginalSpinGaugeMajoranaCommutation

/-!
Independent C48-0 consumer. Verify original 48-real-label Spin(9) and
SU(2) gauge multiplication compatibility, literal G3B original
one-particle coefficients, and commutation also on actual source vectors.

No Fock-vector implementing unitary, gauge-projection fixedness,
topology, closed Hamiltonian domain, compactness or spectral result.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutationIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation
open Matrix

private abbrev Source48Matrix :=
  Matrix Source48Label Source48Label ℝ

/-- Genuine group identity on the actual original source index. -/
example :
    sourceGaugeOriginalPaired48 (1 : GaugeGroup 2) =
      (1 : Source48Matrix) :=
  sourceGaugeOriginalPaired48_one

/-- Exact gauge composition from accepted G3A source color action. -/
example (q h : GaugeGroup 2) :
    sourceGaugeOriginalPaired48 (q * h) =
      sourceGaugeOriginalPaired48 q *
        sourceGaugeOriginalPaired48 h :=
  sourceGaugeOriginalPaired48_mul q h

/-- Independent opposite multiplication order tests the actual
48-index commutation claim rather than a tensor surrogate. -/
theorem originalSpinGauge_48_commutation_reverse
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2) :
    sourceGaugeOriginalPaired48 q *
        ((source9SpinOriginalPaired48OrthogonalHom g) :
          Source48Matrix) =
      ((source9SpinOriginalPaired48OrthogonalHom g) :
          Source48Matrix) * sourceGaugeOriginalPaired48 q :=
  (source9SpinOriginalPaired48_commutes_sourceGauge g q).symm

/-- The exact original 48-real-label actions commute on every vector,
not merely in an alternate coordinate matrix type. -/
theorem originalSpinGauge_48_mulVec_commutes
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2)
    (v : Source48Vector) :
    (((source9SpinOriginalPaired48OrthogonalHom g) :
      Source48Matrix) * sourceGaugeOriginalPaired48 q).mulVec v =
    (sourceGaugeOriginalPaired48 q *
      ((source9SpinOriginalPaired48OrthogonalHom g) :
        Source48Matrix)).mulVec v := by
  exact congrArg
    (fun M : Source48Matrix => M.mulVec v)
    (source9SpinOriginalPaired48_commutes_sourceGauge g q)

/-- Verify that the color action was imported from G3B on the literal
G1A paired 24-complex-mode / two-real-coordinate original indexing. -/
example (q : GaugeGroup 2) (j k : Fin 8) (r s : Fin 2)
    (A B : ColorIndex 2) :
    sourceGaugeOriginalPaired48 q
        (FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv
          (A, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, r)))
        (FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv
          (B, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (k, s))) =
      (FCP.BFSSSU2GaugeG3B.oneParticleMatrix q
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A))
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B))) *
          (1 : Matrix (Fin 2) (Fin 2) ℝ) r s :=
  sourceGaugeOriginalPaired48_G3B_mode_entry q j k r s A B

#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.sourceGaugeOriginalPaired48
#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.sourceGaugeOriginalPaired48_one
#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.sourceGaugeOriginalPaired48_mul
#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.sourceGaugeOriginalPaired48_entry
#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.sourceGaugeOriginalPaired48_G3B_mode_entry
#print axioms FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.source9SpinOriginalPaired48_commutes_sourceGauge
#print axioms originalSpinGauge_48_commutation_reverse
#print axioms originalSpinGauge_48_mulVec_commutes

end
end FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutationIndependentAudit
