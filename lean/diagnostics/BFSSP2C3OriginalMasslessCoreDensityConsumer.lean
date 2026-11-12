import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C3OriginalMasslessCoreDensity

/-!
# P2-C3 independent consumer — source energy and a distinct density consequence

Imports the actual original source lemmas. Checks exact SmoothCore 2
energy interface and derives a weaker, but genuinely distinct, lower bound
using nonnegativity of the original source bosonic potential.
-/

set_option autoImplicit false

namespace BFSSP2C3OriginalMasslessCoreDensityConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C3OriginalMasslessCoreDensity
open MeasureTheory

/-- Source-authentic original smooth-core energy identity, including 1/2. -/
example (f : SmoothCore 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.coreForm f =
      (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      ∫ x : Boson 2,
        (FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
            ‖f x‖^2 +
          inner ℝ (f x)
            (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x (f x))) := by
  exact originalMasslessCoreForm_energy f

/-- Nonnegative original bosonic potential gives a weaker radial-only
lower bound for the true source energy density, not for a replacement field. -/
example (x : Boson 2) (z : Fermion 2) :
    -(FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖) *
        ‖z‖^2 ≤
      FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
        ‖z‖^2 +
      inner ℝ z
        (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x z) := by
  have h := originalMasslessCoreDensity_lower x z
  have hp : 0 ≤
      FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x :=
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential_nonneg 1 0 x
  have hn : 0 ≤ ‖z‖^2 := sq_nonneg _
  have hprod : 0 ≤
      FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
        ‖z‖^2 := mul_nonneg hp hn
  rw [sub_mul] at h
  linarith only [h, hprod]

end
end BFSSP2C3OriginalMasslessCoreDensityConsumer
