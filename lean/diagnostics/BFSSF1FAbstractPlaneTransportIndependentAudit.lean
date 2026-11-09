import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientPlaneTransportDiagnostic

/-!
Independent abstract real-module consumer (Fin 2, ℝ). No original
Fock carrier is elaborated here. This audit does NOT qualify an
original 48-label Fock-plane equation or production F1F formula.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractPlaneTransportIndependentAudit
noncomputable section

open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FAbstractPlaneTransport

example (T : Fin 2 → Fin 2 → ℝ) (p q : Fin 2) :
    halfCoefficientLinearMap T
      ((fun i j : Fin 2 =>
        Matrix.single i j (1 : ℝ) - Matrix.single j i (1 : ℝ)) p q) =
      (1 / 2 : ℝ) • (T p q - T q p) :=
  halfCoefficientLinearMap_skewPlane_of_eq T
    (fun i j : Fin 2 =>
      Matrix.single i j (1 : ℝ) - Matrix.single j i (1 : ℝ))
    (by intro i j; rfl) p q

#print axioms FCP.BFSSF1FAbstractPlaneTransport.halfCoefficientLinearMap_skewPlane_of_eq

end
end FCP.BFSSF1FAbstractPlaneTransportIndependentAudit
