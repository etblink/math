import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C0BOriginalSourceGaugeS1JMatrixIdentity

/-!
Independent C48-0B audit on the LITERAL original Source48Label.
Consume the exact S1J source gauge matrix, F10F Spin(9)
orthogonal representation, and C48-0 verified commutator.
No substituted color-major carrier or unproved phase identity.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation
open FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity

private abbrev Source48Matrix :=
  Matrix Source48Label Source48Label ℝ

/-- Independent typed check on the original 48 labels,
not only an arbitrary pair of identically constructed tensors. -/
example (q : GaugeGroup 2) :
    FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q =
      sourceGaugeOriginalPaired48 q :=
  (sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix q).symm

/-- The qualified C48-0 commutator now applies to S1J's actual
independently defined original SU(2) Majorana source matrix. -/
theorem source9Spin_commutes_actual_S1J_sourceGauge
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2) :
    ((source9SpinOriginalPaired48OrthogonalHom g) :
      Source48Matrix) *
        FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q =
      FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q *
        ((source9SpinOriginalPaired48OrthogonalHom g) :
          Source48Matrix) := by
  rw [← sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix]
  exact source9SpinOriginalPaired48_commutes_sourceGauge g q

/-- Same exact original representation identity evaluated on each
actual forty-eight-component real vector, not a surrogate index. -/
theorem source9Spin_commutes_actual_S1J_on_source_vector
    (g : spinGroup source9Quadratic) (q : GaugeGroup 2)
    (v : Source48Vector) :
    (((source9SpinOriginalPaired48OrthogonalHom g) :
      Source48Matrix) *
        FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v =
      (FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q *
        ((source9SpinOriginalPaired48OrthogonalHom g) :
          Source48Matrix)).mulVec v := by
  exact congrArg
    (fun M : Source48Matrix => M.mulVec v)
    (source9Spin_commutes_actual_S1J_sourceGauge g q)

#print axioms FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity.pairedColorSpinEquiv_sourceMode
#print axioms FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity.sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix
#print axioms source9Spin_commutes_actual_S1J_sourceGauge
#print axioms source9Spin_commutes_actual_S1J_on_source_vector

end
end FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIndependentAudit
