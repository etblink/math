import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaMatrixFiniteCoefficientLinearMap

/-! Independent original Fock and exact 48-source matrix linearity
consumer, with no substitute carrier or assumed Lie-bracket. -/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaLinearMapIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSF1FOriginalThetaCoefficientLinearMap

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (A B : Matrix FCP.BFSSS1V0.Source48Label FCP.BFSSS1V0.Source48Label ℝ) :
    originalThetaCoefficientLinearMap (A + B) =
      originalThetaCoefficientLinearMap A +
        originalThetaCoefficientLinearMap B :=
  map_add originalThetaCoefficientLinearMap A B

example (c : ℝ)
    (A : Matrix FCP.BFSSS1V0.Source48Label FCP.BFSSS1V0.Source48Label ℝ) :
    originalThetaCoefficientLinearMap (c • A) =
      c • originalThetaCoefficientLinearMap A :=
  map_smul originalThetaCoefficientLinearMap c A

example (A : Matrix FCP.BFSSS1V0.Source48Label FCP.BFSSS1V0.Source48Label ℝ) :
    originalThetaCoefficientLinearMap A =
      originalThetaCoefficientFiniteLift A :=
  originalThetaCoefficientLinearMap_apply A

#print axioms FCP.BFSSF1FOriginalThetaCoefficientLinearMap.originalThetaCoefficientFiniteLift
#print axioms FCP.BFSSF1FOriginalThetaCoefficientLinearMap.originalThetaCoefficientLinearMap
#print axioms FCP.BFSSF1FOriginalThetaCoefficientLinearMap.originalThetaCoefficientLinearMap_apply

end
end FCP.BFSSF1FOriginalThetaLinearMapIndependentAudit
