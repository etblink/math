import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientMatrixUnitDiagnostic

/-!
Independent symbolic consumer of exact half-normalized matrix-unit and
skew-plane formulas. This does NOT qualify source Fock specialization
or the frozen original literal F1F production map.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractMatrixUnitIndependentAudit
noncomputable section

open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FAbstractMatrixUnits

example (T : Fin 2 → Fin 2 → ℝ) (p q : Fin 2) :
    rawCoefficientSum T (Matrix.single p q (1 : ℝ)) = T p q :=
  rawCoefficientSum_matrixUnit T p q

example (T : Fin 2 → Fin 2 → ℝ) (p q : Fin 2) :
    halfCoefficientLinearMap T (Matrix.single p q (1 : ℝ)) =
      (1 / 2 : ℝ) • T p q :=
  halfCoefficientLinearMap_matrixUnit T p q

example (T : Fin 2 → Fin 2 → ℝ) (p q : Fin 2) :
    halfCoefficientLinearMap T
        (Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ)) =
      (1 / 2 : ℝ) • (T p q - T q p) :=
  halfCoefficientLinearMap_skewPlane T p q

#print axioms FCP.BFSSF1FAbstractMatrixUnits.rawCoefficientSum_matrixUnit
#print axioms FCP.BFSSF1FAbstractMatrixUnits.halfCoefficientLinearMap_matrixUnit
#print axioms FCP.BFSSF1FAbstractMatrixUnits.halfCoefficientLinearMap_skewPlane

end
end FCP.BFSSF1FAbstractMatrixUnitIndependentAudit
