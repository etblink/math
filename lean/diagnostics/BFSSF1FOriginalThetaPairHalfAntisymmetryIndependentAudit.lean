import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaPairHalfAntisymmetryDiagnostic

/-!
Independent source-faithful consumer for original Majorana pair swap
and its external-real-half antisymmetrization. It imports the new
source theorem, but not either failed concrete coefficient-map
C1/C1b proof. Production F1F, Spin and spectral claims are not tested.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaPairHalfAntisymmetryIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (x y : ℝ) (h : y = -x) :
    (1 / 2 : ℝ) • (x - y) = x :=
  half_smul_sub_eq_self_of_reverse_neg x y h

example (p q : Source48Label) (hpq : p ≠ q) :
    majoranaCandidate q * majoranaCandidate p =
      -(majoranaCandidate p * majoranaCandidate q) :=
  originalThetaPair_reverse_eq_neg p q hpq

example (p q : Source48Label) (hpq : p ≠ q) :
    (1 / 2 : ℝ) •
        (majoranaCandidate p * majoranaCandidate q -
          majoranaCandidate q * majoranaCandidate p) =
      majoranaCandidate p * majoranaCandidate q :=
  originalThetaPair_half_antisym_eq_ordered p q hpq

#print axioms FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry.half_smul_sub_eq_self_of_reverse_neg
#print axioms FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry.originalThetaPair_reverse_eq_neg
#print axioms FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry.originalThetaPair_half_antisym_eq_ordered

end
end FCP.BFSSF1FOriginalThetaPairHalfAntisymmetryIndependentAudit
