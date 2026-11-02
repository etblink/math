import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BCSourceSpinGammaSpecialOrthogonalHom
import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.Geometry.Manifold.GroupLieAlgebra
import Mathlib.Geometry.Manifold.Instances.UnitsOfNormedAlgebra

/-!
F10BD — isolated manifold/typeclass feasibility diagnostic.

This file is intentionally outside the OAI library globs and is run
directly by the F10BD diagnostic workflow. It introduces NO instances,
NO theorem roots, and NO claimed differential result.

Positive controls test Mathlib's existing manifold structure on units
of a complete normed algebra. The remaining queries ask only whether
the exact source Spin9 subtype and exact SO16 subtype already have
the natural topological/charted/Lie-group interfaces under the pinned
Lean/Mathlib environment. A missing instance is a missing library
bridge, not a proof that no such manifold can be constructed.
-/

open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9DetFixture
open OAI.BFSSQuantum
open Matrix
open scoped Manifold ContDiff

-- Positive controls: the pinned UnitsOfNormedAlgebra API must elaborate.
#synth ChartedSpace ℝ ℝˣ
#synth LieGroup 𝓘(ℝ, ℝ) ∞ ℝˣ

-- Exact carrier topology checks.
#synth TopologicalSpace (spinGroup source9Quadratic)
#synth TopologicalSpace (Matrix.specialOrthogonalGroup SpinIndex ℝ)

-- Candidate natural dimensions: dim Spin(9) = 36, dim SO(16) = 120.
#synth ChartedSpace (EuclideanSpace ℝ (Fin 36)) (spinGroup source9Quadratic)
#synth ChartedSpace (EuclideanSpace ℝ (Fin 120))
  (Matrix.specialOrthogonalGroup SpinIndex ℝ)

-- Direct C-infinity Lie-group instance checks on the same carriers.
#synth LieGroup 𝓘(ℝ, EuclideanSpace ℝ (Fin 36)) ∞
  (spinGroup source9Quadratic)
#synth LieGroup 𝓘(ℝ, EuclideanSpace ℝ (Fin 120)) ∞
  (Matrix.specialOrthogonalGroup SpinIndex ℝ)
