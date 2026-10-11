import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS2CCoreFormLinearFermionBoundProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSG4K9COrderedPairCoefficientProbe

/-!
# BFSS SU(2) S2D — true 9-dimensional transverse slice wedge geometry

A source-bound, exact version of the manuscript's transverse potential
inequality. Reuses G4K9C's qualified strict-upper-pair/symmetric-double-
sum conversion rather than rebuilding it. Establishes the finite
Lagrange identity, shift-invariance along a slice direction, and
V(x) >= ||u||² (||z1||² + ||z2||²) for the ACTUAL paired color
potential, under explicit slice and transverse-orthogonality hypotheses.

No new Hilbert measure, no spin representation, no oscillator spectrum,
no spectral positivity, and no smooth-core operator claim.
-/

namespace FCP.BFSSSU2PhysicalDomainS2D
noncomputable section

open Finset
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4K9C
open FCP.BFSSSU2PhysicalDomainS2A
open FCP.BFSSSU2PhysicalDomainS2B

/-- Squared spatial 2-form defined on the same 9 spatial index values
as the actual pinned BFSS Euclidean bosonic coordinate space. -/
noncomputable def spatialWedgeSq (u v : SpaceIndex → ℝ) : ℝ :=
  ∑ p : OAI.BFSSGamma.SpatialPair,
    (u p.1.1 * v p.1.2 - u p.1.2 * v p.1.1) ^ 2

/-- The actual, 9-spatial-index Lagrange identity (Gram determinant). -/
theorem spatialWedgeSq_lagrange (u v : SpaceIndex → ℝ) :
    spatialWedgeSq u v =
      (∑ i : SpaceIndex, (u i) ^ 2) *
        (∑ i : SpaceIndex, (v i) ^ 2) -
          (∑ i : SpaceIndex, u i * v i) ^ 2 := by
  have hpair := symmetricZeroDiagonal_halfDoubleSum_eq_upper
    (fun i j : SpaceIndex => (u i * v j - u j * v i) ^ 2)
    (by intro i j; ring)
    (by intro i; ring)
  have hfirst :
      (∑ i : SpaceIndex, ∑ j : SpaceIndex, (u i)^2 * (v j)^2) =
        (∑ i : SpaceIndex, (u i)^2) *
          (∑ j : SpaceIndex, (v j)^2) := by
    calc
      _ = ∑ i : SpaceIndex, (u i)^2 *
          (∑ j : SpaceIndex, (v j)^2) := by
        apply Finset.sum_congr rfl
        intro i _
        rw [Finset.mul_sum]
      _ = _ := by rw [Finset.sum_mul]
  have hsecond :
      (∑ i : SpaceIndex, ∑ j : SpaceIndex, (u j)^2 * (v i)^2) =
        (∑ i : SpaceIndex, (u i)^2) *
          (∑ j : SpaceIndex, (v j)^2) := by
    rw [Finset.sum_comm]
    exact hfirst
  have hcross :
      (∑ i : SpaceIndex, ∑ j : SpaceIndex, (u i * v i) * (u j * v j)) =
        (∑ i : SpaceIndex, u i * v i)^2 := by
    calc
      _ = ∑ i : SpaceIndex, (u i * v i) *
          (∑ j : SpaceIndex, u j * v j) := by
        apply Finset.sum_congr rfl
        intro i _
        rw [Finset.mul_sum]
      _ = (∑ i : SpaceIndex, u i * v i) *
          (∑ j : SpaceIndex, u j * v j) := by rw [Finset.sum_mul]
      _ = _ := by rw [pow_two]
  have hdouble :
      (∑ i : SpaceIndex, ∑ j : SpaceIndex,
          (u i * v j - u j * v i)^2) =
        2 * ((∑ i : SpaceIndex, (u i)^2) *
          (∑ i : SpaceIndex, (v i)^2) -
          (∑ i : SpaceIndex, u i * v i)^2) := by
    calc
      _ = ∑ i : SpaceIndex, ∑ j : SpaceIndex,
            ((u i)^2 * (v j)^2 + (u j)^2 * (v i)^2 -
              2 * ((u i * v i) * (u j * v j))) := by
        apply Finset.sum_congr rfl
        intro i _
        apply Finset.sum_congr rfl
        intro j _
        ring
      _ = (∑ i : SpaceIndex, ∑ j : SpaceIndex, (u i)^2 * (v j)^2) +
            (∑ i : SpaceIndex, ∑ j : SpaceIndex, (u j)^2 * (v i)^2) -
            2 * (∑ i : SpaceIndex, ∑ j : SpaceIndex,
              (u i * v i) * (u j * v j)) := by
        simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
          ← Finset.mul_sum, ← Finset.sum_mul]
      _ = _ := by rw [hfirst, hsecond, hcross]; ring
  change (1 / 2 : ℝ) *
    (∑ i : SpaceIndex, ∑ j : SpaceIndex,
      (u i * v j - u j * v i)^2) = spatialWedgeSq u v at hpair
  rw [← hpair, hdouble]
  ring

/-- Longitudinal translations cancel in every original spatial minor. -/
theorem spatialWedgeSq_longitudinalShift (u v : SpaceIndex → ℝ)
    (s : ℝ) :
    spatialWedgeSq u (fun i => s * u i + v i) = spatialWedgeSq u v := by
  unfold spatialWedgeSq
  apply Finset.sum_congr rfl
  intro p _
  congr 1
  ring

/-- Exact transverse oscillator potential at an orthogonal slice,
without dividing by ||u|| or changing the source bosonic measure. -/
theorem spatialWedgeSq_transverse (u z : SpaceIndex → ℝ) (s : ℝ)
    (huz : (∑ i : SpaceIndex, u i * z i) = 0) :
    spatialWedgeSq u (fun i => s * u i + z i) =
      (∑ i : SpaceIndex, (u i)^2) *
        (∑ i : SpaceIndex, (z i)^2) := by
  rw [spatialWedgeSq_longitudinalShift, spatialWedgeSq_lagrange, huz]
  ring

/-- The accepted source W_ab and the exact spatial slice 2-form use
identical physical bosonic coordinate indices and normalization. -/
theorem sourceSpatialWedgeSq_eq_spatialWedgeSq
    (x : Boson 2) (a b : ColorIndex 2) :
    sourceSpatialWedgeSq x a b =
      spatialWedgeSq (fun i => x (i, a)) (fun i => x (i, b)) := by
  unfold sourceSpatialWedgeSq spatialWedgeSq
  apply Finset.sum_congr rfl
  intro p _
  ring

/-- Material paper slice estimate on the literal paired BFSS potential.
The two transverse vectors are explicitly orthogonal to the chosen
(nonzero or zero) color u; existence of the decomposition for arbitrary
x with u ≠ 0 is separate, and is NOT an assumption-free conclusion. -/
theorem pairedPotential_ge_transverseSlice_color0
    (x : Boson 2) (u z1 z2 : SpaceIndex → ℝ) (s1 s2 : ℝ)
    (hu : ∀ i, x (i, (0 : Fin 3)) = u i)
    (hb : ∀ i, x (i, (1 : Fin 3)) = s1 * u i + z1 i)
    (hc : ∀ i, x (i, (2 : Fin 3)) = s2 * u i + z2 i)
    (hz1 : (∑ i : SpaceIndex, u i * z1 i) = 0)
    (hz2 : (∑ i : SpaceIndex, u i * z2 i) = 0) :
    (∑ i : SpaceIndex, (u i)^2) *
      ((∑ i : SpaceIndex, (z1 i)^2) +
        (∑ i : SpaceIndex, (z2 i)^2)) ≤
      pairedAlgebraData.deformedBosonicPotential 1 0 x := by
  have h1 : sourceSpatialWedgeSq x (0 : Fin 3) (1 : Fin 3) =
      (∑ i : SpaceIndex, (u i)^2) *
        (∑ i : SpaceIndex, (z1 i)^2) := by
    rw [sourceSpatialWedgeSq_eq_spatialWedgeSq]
    have heq : (fun i : SpaceIndex => x (i, (0 : Fin 3))) = u := funext hu
    have heq1 : (fun i : SpaceIndex => x (i, (1 : Fin 3))) =
        (fun i => s1 * u i + z1 i) := funext hb
    rw [heq, heq1]
    exact spatialWedgeSq_transverse u z1 s1 hz1
  have h2 : sourceSpatialWedgeSq x (0 : Fin 3) (2 : Fin 3) =
      (∑ i : SpaceIndex, (u i)^2) *
        (∑ i : SpaceIndex, (z2 i)^2) := by
    rw [sourceSpatialWedgeSq_eq_spatialWedgeSq]
    have heq : (fun i : SpaceIndex => x (i, (0 : Fin 3))) = u := funext hu
    have heq2 : (fun i : SpaceIndex => x (i, (2 : Fin 3))) =
        (fun i => s2 * u i + z2 i) := funext hc
    rw [heq, heq2]
    exact spatialWedgeSq_transverse u z2 s2 hz2
  have hV := pairedPotential_ge_two_spatialWedges x
  rw [h1, h2] at hV
  calc
    _ = (∑ i : SpaceIndex, (u i)^2) *
        (∑ i : SpaceIndex, (z1 i)^2) +
        (∑ i : SpaceIndex, (u i)^2) *
          (∑ i : SpaceIndex, (z2 i)^2) := by ring
    _ ≤ _ := hV

#print axioms spatialWedgeSq_lagrange
#print axioms spatialWedgeSq_longitudinalShift
#print axioms spatialWedgeSq_transverse
#print axioms sourceSpatialWedgeSq_eq_spatialWedgeSq
#print axioms pairedPotential_ge_transverseSlice_color0

end
end FCP.BFSSSU2PhysicalDomainS2D

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS2DTransverseSliceWedgeProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
