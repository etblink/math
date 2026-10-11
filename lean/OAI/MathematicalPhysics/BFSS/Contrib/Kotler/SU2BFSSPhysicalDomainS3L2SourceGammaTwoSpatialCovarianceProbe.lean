import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS3L0SourceKineticSpinorCoefficientProbe

/-!
# S3L2 — source-defined spatial two-form gamma covariance

The cubic term in the literal BFSS supercharge uses M.gammaTwo k l,
not an independent abstract bivector. The two-form coefficient must
rotate with the same real source-plane generator as the gamma vector.

This module proves the exact derivation identity and the correctly
oriented transpose-coefficient cancellation, with no new axioms.

It does NOT claim the commutator with the genuine full BFSS supercharge:
the original coordinate/derivative product rules, fermionic theta
covariance on SmoothCore, and contraction of all source indices are
distinct subsequent obligations.
-/

namespace FCP.BFSSSU2PhysicalDomainS3L2
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3B

/-- Explicit source rotation of a spatial gamma vector under J_ij,
using the convention already kernel-checked in S3B. -/
def sourceGammaVariation
    (i j k : SpaceIndex) : GammaMatrix :=
  if k = j then pairedAlgebraData.gamma i
  else if k = i then -(pairedAlgebraData.gamma j)
  else 0

theorem sourceGammaVariation_eq_comm
    (i j k : SpaceIndex) (hij : i ≠ j) :
    sourceGammaVariation i j k =
      pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma k -
      pairedAlgebraData.gamma k * pairedPlaneSpinGenerator i j := by
  exact (pairedPlaneGenerator_comm_gamma_all i j k hij).symm

/-- The original gammaTwo is an exterior two-form of the source
nine-dimensional Clifford family. Its true commutator follows from
the *already accepted* concrete vector commutators. -/
theorem pairedGammaTwo_source_spatial_commutator
    (i j k l : SpaceIndex) (hij : i ≠ j) :
    pairedPlaneSpinGenerator i j * pairedAlgebraData.gammaTwo k l -
      pairedAlgebraData.gammaTwo k l * pairedPlaneSpinGenerator i j =
      (1 / 2 : ℝ) •
        ((sourceGammaVariation i j k * pairedAlgebraData.gamma l +
          pairedAlgebraData.gamma k * sourceGammaVariation i j l) -
         (sourceGammaVariation i j l * pairedAlgebraData.gamma k +
          pairedAlgebraData.gamma l * sourceGammaVariation i j k)) := by
  rw [sourceGammaVariation_eq_comm i j k hij,
      sourceGammaVariation_eq_comm i j l hij]
  change
    pairedPlaneSpinGenerator i j *
        ((1 / 2 : ℝ) • (pairedAlgebraData.gamma k * pairedAlgebraData.gamma l -
          pairedAlgebraData.gamma l * pairedAlgebraData.gamma k)) -
      ((1 / 2 : ℝ) • (pairedAlgebraData.gamma k * pairedAlgebraData.gamma l -
        pairedAlgebraData.gamma l * pairedAlgebraData.gamma k)) *
        pairedPlaneSpinGenerator i j = _
  simp only [mul_smul_comm, smul_mul_assoc, mul_sub, sub_mul,
    mul_add, add_mul, smul_sub, smul_add, Matrix.mul_assoc]
  module

/-- The source cubic gammaTwo coefficient has the same correct
spinor-index sign as the S3L0 kinetic coefficient. The subtracted term
is the spatial two-form variation; the remaining coefficient is minus
J_ij acting on the *free spinor index*. -/
theorem pairedGammaTwo_potential_spinor_coefficient_exact
    (i j k l : SpaceIndex) (hij : i ≠ j) :
    pairedAlgebraData.gammaTwo k l *
        (pairedPlaneSpinGenerator i j).transpose -
      (1 / 2 : ℝ) •
        ((sourceGammaVariation i j k * pairedAlgebraData.gamma l +
          pairedAlgebraData.gamma k * sourceGammaVariation i j l) -
         (sourceGammaVariation i j l * pairedAlgebraData.gamma k +
          pairedAlgebraData.gamma l * sourceGammaVariation i j k)) =
      -(pairedPlaneSpinGenerator i j * pairedAlgebraData.gammaTwo k l) := by
  rw [pairedPlaneSpinGenerator_skew]
  simp only [mul_neg]
  rw [← pairedGammaTwo_source_spatial_commutator i j k l hij]
  abel

#print axioms pairedGammaTwo_source_spatial_commutator
#print axioms pairedGammaTwo_potential_spinor_coefficient_exact

end
end FCP.BFSSSU2PhysicalDomainS3L2

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS3L2SourceGammaTwoSpatialCovarianceProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
