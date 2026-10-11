import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS3BFullPlaneSpinVectorCovarianceProbe

/-!
# BFSS SU(2) S3L0 — actual Clifford kinetic spinor coefficient test

A source-defined finite-matrix sign and normalization check for the
prospective combined orbital-plus-fermionic rotation identity.

The S3B source gamma commutator gives the orbital variation of the
kinetic coefficient for a spatial plane i,j. The source real spin matrix
is skew by S3A. Their exact combination gives minus J acting on the
supercharge's spinor index, as required by the pinned manuscript.

This module does not assume or prove the orbital action on the original
SmoothCore, a supercharge commutator, closed-form invariance, or spectrum.
-/

namespace FCP.BFSSSU2PhysicalDomainS3L0
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3B

/-- The literal Cl(9) gamma and source spin-plane matrices have the
exact combined kinetic spinor coefficient, including the orbital
correction for all nine coordinate directions. The source commutator
and skewness are proved, not postulated. -/
theorem pairedKineticSpinorCoefficient_exact
    (i j k : SpaceIndex) (hij : i ≠ j) :
    pairedAlgebraData.gamma k * (pairedPlaneSpinGenerator i j).transpose -
      (if k = j then pairedAlgebraData.gamma i
        else if k = i then -(pairedAlgebraData.gamma j)
        else 0) =
      -(pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma k) := by
  rw [← pairedPlaneGenerator_comm_gamma_all i j k hij,
    pairedPlaneSpinGenerator_skew]
  simp only [mul_neg]
  abel

#print axioms pairedKineticSpinorCoefficient_exact

end
end FCP.BFSSSU2PhysicalDomainS3L0

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS3L0SourceKineticSpinorCoefficientProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
