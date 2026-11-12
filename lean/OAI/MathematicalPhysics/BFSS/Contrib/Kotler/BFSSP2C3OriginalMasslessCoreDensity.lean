import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C2OriginalMasslessGrowthBinding
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralMasslessCoreFormIdentity

/-!
# P2-C3 — original massless SU(2) core form and pointwise density lower bound

Specializes the original generic massless_coreForm_energy exactly to the
original Pauli/gamma/Fock AlgebraData 2, then combines the P2-C2 strict
original fermionic inner bound with the unchanged original bosonic potential.
No integrated radial estimate, high-Spin sector or closed-domain transfer is
claimed. These statements require their own independent strict qualification.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C3OriginalMasslessCoreDensity
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- Exact original source core energy with unchanged 1/2 kinetic factor. -/
theorem originalMasslessCoreForm_energy (f : SmoothCore 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.coreForm f =
      (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      ∫ x : Boson 2,
        (FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
            ‖f x‖^2 +
          inner ℝ (f x)
            (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x (f x))) := by
  exact FCP.BFSSSU2Full.concreteAlgebraData.massless_coreForm_energy f

/-- Source-original potential plus fermionic field is bounded below by
the potential minus the P2-C2 explicit finite radial coefficient. -/
theorem originalMasslessCoreDensity_lower (x : Boson 2) (z : Fermion 2) :
    (FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x -
      FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖) *
        ‖z‖^2 ≤
      FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
        ‖z‖^2 +
      inner ℝ z
        (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x z) := by
  have h := FCP.BFSSP2C2OriginalMasslessGrowth.originalMasslessFermionField_inner_lower x z
  rw [sub_mul]
  linarith only [h]

#print axioms originalMasslessCoreForm_energy
#print axioms originalMasslessCoreDensity_lower

end
end FCP.BFSSP2C3OriginalMasslessCoreDensity
