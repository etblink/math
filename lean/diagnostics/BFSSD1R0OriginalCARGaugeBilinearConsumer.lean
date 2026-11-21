import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1R0OriginalCARGaugeBilinearPilot
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent original-source typed consumer of D1R0. -/
set_option autoImplicit false

namespace FCP.BFSSHopfD1R0Consumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

/-- Consumer asserts literal pairedAlgebraData's theta CAR. -/
theorem exact_original_theta_car
    (α β : SpinIndex) (A B : ColorIndex 2) :
    pairedAlgebraData.theta α A * pairedAlgebraData.theta β B +
      pairedAlgebraData.theta β B * pairedAlgebraData.theta α A =
      (if α = β ∧ A = B then (1 : ℂ) else 0) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) :=
  FCP.BFSSHopfD1R0.originalThetaCAR α β A B

/-- Consumer independently instantiates source pairedGaugeData. -/
theorem exact_original_theta_pair_gauge
    (g : GaugeGroup 2) (α β : SpinIndex)
    (A B : ColorIndex 2) (v : Fermion 2) :
    pairedGaugeData.fermion g
        (pairedAlgebraData.theta α A (pairedAlgebraData.theta β B v)) =
      ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
        ((pairedAlgebraData.adjointCoefficient g A C : ℂ) *
          (pairedAlgebraData.adjointCoefficient g B D : ℂ)) •
          pairedAlgebraData.theta α C
            (pairedAlgebraData.theta β D (pairedGaugeData.fermion g v)) :=
  FCP.BFSSHopfD1R0.originalThetaPair_covariant g α β A B v

/-- Literal source Fermion 2 carries the exact zero-matrix quadratic. -/
theorem exact_original_quadratic_zero :
    FCP.BFSSHopfD1R0.originalCARQuadratic (fun _ _ => 0) =
      (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  FCP.BFSSHopfD1R0.originalCARQuadratic_zero

#print axioms exact_original_theta_car
#print axioms exact_original_theta_pair_gauge
#print axioms exact_original_quadratic_zero

end
end FCP.BFSSHopfD1R0Consumer
