import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS2BPotentialChargeEnergyBridgeProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSG4K9DSourcePotentialMultiplierProbe
import OAI.MathematicalPhysics.BFSS.MassiveMoments

/-!
# BFSS SU(2) S2C — actual original core form: kinetic + V - C|x|

This imports (and does NOT recreate) the pinned OAI source results:

* AlgebraData.averaged_core_energy: exact 16-charge quadratic-form
  decomposition into kinetic energy, bosonic potential and fermion field.
* AlgebraData.deformedFermionField_inner_lower: linear-in-|x|
  lower bound on the actual fermionic remainder, with a source-defined
  nonnegative growth constant.
* AlgebraData.weighted_core_square_integrable and its bosonic and
  fermionic integral lemmas: justify integral_mono on the original
  compactly supported smooth core.
* G4K9D.sourceUnconditionalCoreForm_equal:
  the massless undeformed core form is the ORIGINAL pinned coreForm.
* S2A.pairedPotential_eq_spatialWedges:
  true Pauli-normalized source potential equals the 3 spatial wedges.

The result is the original physical input needed before angular
Spin(9) sector coercivity. It is a core-form estimate only. No
Spin(9) representation, form-domain extension, compact resolvent
or positive eigenvalues are proved here.
-/

namespace FCP.BFSSSU2PhysicalDomainS2C
noncomputable section

open Finset MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4K9D
open FCP.BFSSSU2PhysicalDomainS2A

/-- The genuine 48-Majorana source fermion remainder is bounded below
by a linear configuration-norm penalty in the massless BFSS model. -/
theorem pairedFermionRemainder_linearLower
    (x : Boson 2) (z : Fermion 2) :
    -(pairedAlgebraData.fermionGrowthConstant * ‖x‖) * ‖z‖ ^ 2 ≤
      inner ℝ z (pairedAlgebraData.deformedFermionField 1 0 x z) := by
  simpa only [abs_one, abs_zero, one_mul, add_zero] using
    (pairedAlgebraData.deformedFermionField_inner_lower 1 0 x z)

/-- For the exact pinned source coreForm, the kinetic + bosonic
potential - linear fermionic error estimate. No hypothesis about
the other BFSS deformations or an enlarged operator domain. -/
theorem pairedCoreForm_ge_sourcePotential_minusLinearFermion
    (f : SmoothCore 2) :
    (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
      ∫ x : Boson 2,
        (pairedAlgebraData.deformedBosonicPotential 1 0 x -
          pairedAlgebraData.fermionGrowthConstant * ‖x‖) * ‖f x‖ ^ 2 ≤
      pairedAlgebraData.coreForm f := by
  let M : AlgebraData 2 := pairedAlgebraData
  have hw : Integrable (fun x : Boson 2 => ‖x‖ * ‖f x‖ ^ 2) volume :=
    weighted_core_square_integrable
      (fun x : Boson 2 => ‖x‖) (by fun_prop) f
  have hpot : Integrable (fun x : Boson 2 =>
      M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2) volume :=
    M.bosonic_core_integrable 1 0 f
  have hf : Integrable (fun x : Boson 2 =>
      inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) volume :=
    M.fermion_core_integrable 1 0 f
  have hlow : Integrable (fun x : Boson 2 =>
      (M.deformedBosonicPotential 1 0 x -
        M.fermionGrowthConstant * ‖x‖) * ‖f x‖ ^ 2) volume := by
    have heq : (fun x : Boson 2 =>
        (M.deformedBosonicPotential 1 0 x -
          M.fermionGrowthConstant * ‖x‖) * ‖f x‖ ^ 2) =
      (fun x : Boson 2 =>
        M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2 -
          M.fermionGrowthConstant * (‖x‖ * ‖f x‖ ^ 2)) := by
      funext x
      ring
    rw [heq]
    exact hpot.sub (hw.const_mul _)
  have hhigh : Integrable (fun x : Boson 2 =>
      M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2 +
        inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) volume :=
    hpot.add hf
  have hint :
      (∫ x : Boson 2,
        (M.deformedBosonicPotential 1 0 x -
          M.fermionGrowthConstant * ‖x‖) * ‖f x‖ ^ 2) ≤
      ∫ x : Boson 2,
        (M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2 +
          inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) := by
    apply integral_mono hlow hhigh
    intro x
    have hb := pairedFermionRemainder_linearLower x (f x)
    dsimp only [M]
    nlinarith
  have hform : M.deformedCoreEnergy 1 0 f =
      (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
          ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
        ∫ x : Boson 2,
          (M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2 +
            inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) := by
    unfold deformedCoreEnergy
    exact M.averaged_core_energy 1 0 f
  change
    (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
      ∫ x : Boson 2,
        (M.deformedBosonicPotential 1 0 x - M.fermionGrowthConstant * ‖x‖) *
          ‖f x‖ ^ 2 ≤ M.coreForm f
  calc
    _ ≤ (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
          ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
        ∫ x : Boson 2,
          (M.deformedBosonicPotential 1 0 x * ‖f x‖ ^ 2 +
            inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) :=
      add_le_add_right hint _
    _ = M.deformedCoreEnergy 1 0 f := hform.symm
    _ = M.coreForm f := sourceUnconditionalCoreForm_equal M f

/-- The paper's spatial wedge potential, with EXACT massless source
normalization, now occurs in a rigorous original-core lower bound. -/
theorem pairedCoreForm_ge_spatialWedges_minusLinearFermion
    (f : SmoothCore 2) :
    (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 +
      ∫ x : Boson 2,
        ((sourceSpatialWedgeSq x (0 : Fin 3) (1 : Fin 3) +
          sourceSpatialWedgeSq x (0 : Fin 3) (2 : Fin 3) +
          sourceSpatialWedgeSq x (1 : Fin 3) (2 : Fin 3)) -
            pairedAlgebraData.fermionGrowthConstant * ‖x‖) * ‖f x‖ ^ 2 ≤
      pairedAlgebraData.coreForm f := by
  simpa only [pairedPotential_eq_spatialWedges] using
    pairedCoreForm_ge_sourcePotential_minusLinearFermion f

#print axioms pairedFermionRemainder_linearLower
#print axioms pairedCoreForm_ge_sourcePotential_minusLinearFermion
#print axioms pairedCoreForm_ge_spatialWedges_minusLinearFermion

end
end FCP.BFSSSU2PhysicalDomainS2C

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS2CCoreFormLinearFermionBoundProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
