import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS3BFullPlaneSpinVectorCovarianceProbe

/-!
# BFSS SU(2) S3L1 — orbital plane generator on the ORIGINAL smooth core

This generator uses only the genuine upstream AlgebraData.position and
AlgebraData.coordinateDerivative maps specialized to pairedAlgebraData.
The source smooth core is preserved by construction, because each summand
is a composition of the original SmoothCore endomorphisms.

This is an infinitesimal orbital differential operator, NOT an integrated
one-parameter unitary or a Hamiltonian symmetry claim. No surrogate
functions or extra analytic assumptions.
-/

namespace FCP.BFSSSU2PhysicalDomainS3L1
noncomputable section

open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

/-- The actual source orbital generator L_ij = sum_A
 x_i^A partial_(j,A) - x_j^A partial_(i,A) on the original smooth core. -/
noncomputable def pairedSourceOrbitalPlaneGenerator
    (i j : SpaceIndex) : SmoothCore 2 →ₗ[ℂ] SmoothCore 2 :=
  ∑ A : ColorIndex 2,
    ((position (N := 2) i A).comp
      (coordinateDerivative (N := 2) j A) -
     (position (N := 2) j A).comp
      (coordinateDerivative (N := 2) i A))

/-- Evaluation of the literal upstream smooth test-function space at
a bosonic configuration is additive. No auxiliary function space. -/
private def sourceSmoothCoreEval (x : Boson 2) :
    SmoothCore 2 →+ Fermion 2 where
  toFun := fun f => f x
  map_zero' := by rfl
  map_add' := by intro f g; rfl

/-- This is exactly the true BFSS 27-variable orbital differential
expression, with the original fderiv and source coordinate directions. -/
theorem pairedSourceOrbitalPlaneGenerator_apply
    (i j : SpaceIndex) (f : SmoothCore 2) (x : Boson 2) :
    pairedSourceOrbitalPlaneGenerator i j f x =
      ∑ A : ColorIndex 2,
        ((((x (i, A) : ℝ) : ℂ) •
          fderiv ℝ (f : Boson 2 → Fermion 2) x
            (EuclideanSpace.single (j, A) 1)) -
         (((x (j, A) : ℝ) : ℂ) •
          fderiv ℝ (f : Boson 2 → Fermion 2) x
            (EuclideanSpace.single (i, A) 1))) := by
  unfold pairedSourceOrbitalPlaneGenerator
  simp only [LinearMap.sum_apply, LinearMap.sub_apply, LinearMap.comp_apply]
  change sourceSmoothCoreEval x
    (∑ A : ColorIndex 2,
      ((position (N := 2) i A) ((coordinateDerivative (N := 2) j A) f) -
       (position (N := 2) j A) ((coordinateDerivative (N := 2) i A) f))) = _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro A _
  change
    (((x (i, A) : ℝ) : ℂ) •
      (coordinateDerivative (N := 2) j A f) x) -
    (((x (j, A) : ℝ) : ℂ) •
      (coordinateDerivative (N := 2) i A f) x) = _
  rw [coordinateDerivative_apply,
      coordinateDerivative_apply]

#print axioms pairedSourceOrbitalPlaneGenerator_apply

end
end FCP.BFSSSU2PhysicalDomainS3L1

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS3L1SourceOrbitalSmoothCoreProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
