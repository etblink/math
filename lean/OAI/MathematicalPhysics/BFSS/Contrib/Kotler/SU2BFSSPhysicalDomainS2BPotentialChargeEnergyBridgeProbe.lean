import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS2ASpatialWedgePotentialProbe

/-!
# BFSS SU(2) S2B — three-color source wedge estimates and potential-charge energy

S2A identifies the actual, paired AlgebraData 2 bosonic potential
with the spatial wedge energies W_{01}+W_{02}+W_{12}, including
the original Pauli normalization. This module proves that all
three color choices yield the paper's one-color lower bounds.

Crucially, pinned upstream PotentialBasis.deformed_potential_average
identifies the *actual source-defined sixteen potential-charge
multiplier squared norms* with V(x) ||z||². By composing this
pre-existing theorem with S2A, the color-wedge inequality becomes
a true bound on the original BFSS multiplier energy, not an
independent toy potential.

These are pointwise algebraic estimates ONLY. The kinetic, mixed
fermionic, closed-form, Spin(9), compactness, and point-spectrum
steps are not established by this module.
-/

namespace FCP.BFSSSU2PhysicalDomainS2B
noncomputable section

open Finset
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS2A

theorem sourceSpatialWedgeSq_symm (x : Boson 2)
    (a b : ColorIndex 2) :
    sourceSpatialWedgeSq x a b = sourceSpatialWedgeSq x b a := by
  unfold sourceSpatialWedgeSq
  apply Finset.sum_congr rfl
  intro p hp
  ring

theorem pairedPotential_ge_color1_spatialWedges (x : Boson 2) :
    sourceSpatialWedgeSq x (1 : Fin 3) (0 : Fin 3) +
      sourceSpatialWedgeSq x (1 : Fin 3) (2 : Fin 3) ≤
        pairedAlgebraData.deformedBosonicPotential 1 0 x := by
  rw [sourceSpatialWedgeSq_symm x (1 : Fin 3) (0 : Fin 3)]
  rw [pairedPotential_eq_spatialWedges]
  have h := sourceSpatialWedgeSq_nonneg x (0 : Fin 3) (2 : Fin 3)
  linarith

theorem pairedPotential_ge_color2_spatialWedges (x : Boson 2) :
    sourceSpatialWedgeSq x (2 : Fin 3) (0 : Fin 3) +
      sourceSpatialWedgeSq x (2 : Fin 3) (1 : Fin 3) ≤
        pairedAlgebraData.deformedBosonicPotential 1 0 x := by
  rw [sourceSpatialWedgeSq_symm x (2 : Fin 3) (0 : Fin 3),
      sourceSpatialWedgeSq_symm x (2 : Fin 3) (1 : Fin 3)]
  rw [pairedPotential_eq_spatialWedges]
  have h := sourceSpatialWedgeSq_nonneg x (0 : Fin 3) (1 : Fin 3)
  linarith

/-- Literal 16-component source potential-multiplier energy: the
actual Pauli-paired BFSS source identity, not an assumed potential. -/
theorem pairedPotentialMultiplierEnergy_eq_spatialWedges
    (x : Boson 2) (z : Fermion 2) :
    (1 / 16 : ℝ) * ∑ α : SpinIndex,
        ‖pairedAlgebraData.deformedPotentialMultiplier 1 0 x α z‖ ^ 2 =
      (sourceSpatialWedgeSq x (0 : Fin 3) (1 : Fin 3) +
        sourceSpatialWedgeSq x (0 : Fin 3) (2 : Fin 3) +
        sourceSpatialWedgeSq x (1 : Fin 3) (2 : Fin 3)) * ‖z‖ ^ 2 := by
  rw [pairedAlgebraData.deformed_potential_average 1 0 x z,
      pairedPotential_eq_spatialWedges]

/-- Exact BFSS potential-column energy inherits the spatial-wedge
one-color estimate, without substituting a surrogate Hamiltonian. -/
theorem pairedPotentialMultiplierEnergy_ge_twoWedges
    (x : Boson 2) (z : Fermion 2) :
    (sourceSpatialWedgeSq x (0 : Fin 3) (1 : Fin 3) +
      sourceSpatialWedgeSq x (0 : Fin 3) (2 : Fin 3)) * ‖z‖ ^ 2 ≤
      (1 / 16 : ℝ) * ∑ α : SpinIndex,
        ‖pairedAlgebraData.deformedPotentialMultiplier 1 0 x α z‖ ^ 2 := by
  calc
    _ ≤ pairedAlgebraData.deformedBosonicPotential 1 0 x * ‖z‖ ^ 2 :=
      mul_le_mul_of_nonneg_right
        (pairedPotential_ge_two_spatialWedges x) (sq_nonneg _)
    _ = _ := (pairedAlgebraData.deformed_potential_average 1 0 x z).symm

#print axioms sourceSpatialWedgeSq_symm
#print axioms pairedPotential_ge_color1_spatialWedges
#print axioms pairedPotential_ge_color2_spatialWedges
#print axioms pairedPotentialMultiplierEnergy_eq_spatialWedges
#print axioms pairedPotentialMultiplierEnergy_ge_twoWedges

end
end FCP.BFSSSU2PhysicalDomainS2B

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS2BPotentialChargeEnergyBridgeProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
