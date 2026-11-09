import SU2BFSSPhysicalDomainS3GActualFermionSpinGaugeCompatibilityProbe

/-!
# BFSS SU(2) S3G2 — gauge-invariant true-color Majorana pair contractions

For two distinct spinor labels alpha,beta (not necessarily distinct),
the sum over the three original colors of theta[alpha,A] theta[beta,A]
commutes pointwise with the accepted fermionGaugeUnitaryHom. The key
input is the exact G4H Majorana covariance and the source-derived
real row orthogonality of G3A; no replacement gauge action is used.

This establishes invariance of every spinor quadratic color
contraction. The source S3D weighted K_ij follows by finite sums.
-/

namespace FCP.BFSSSU2PhysicalDomainS3G2
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG3A
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2PhysicalDomainS3G

/-- The row-orthogonal double contraction acts as the identity on
the actual Fermion 2 values, for arbitrary spinor-labelled vectors. -/
theorem source_color_pair_contraction
    (g : GaugeGroup 2)
    (X : ColorIndex 2 → ColorIndex 2 → Fermion 2) :
    (∑ A : ColorIndex 2,
      ∑ B : ColorIndex 2,
        ∑ D : ColorIndex 2,
          (adjointColorMatrix g B A : ℂ) •
            ((adjointColorMatrix g D A : ℂ) • X B D)) =
      ∑ B : ColorIndex 2, X B B := by
  calc
    _ = ∑ B : ColorIndex 2,
          ∑ D : ColorIndex 2,
            ∑ A : ColorIndex 2,
              (adjointColorMatrix g B A : ℂ) •
                ((adjointColorMatrix g D A : ℂ) • X B D) := by
          rw [Finset.sum_comm]
          apply Finset.sum_congr rfl
          intro B _
          rw [Finset.sum_comm]
    _ = ∑ B : ColorIndex 2,
          ∑ D : ColorIndex 2,
            (∑ A : ColorIndex 2,
                (adjointColorMatrix g B A : ℂ) *
                  (adjointColorMatrix g D A : ℂ)) • X B D := by
          apply Finset.sum_congr rfl
          intro B _
          apply Finset.sum_congr rfl
          intro D _
          rw [Finset.sum_smul]
          apply Finset.sum_congr rfl
          intro A _
          rw [smul_smul]
    _ = ∑ B : ColorIndex 2,
          ∑ D : ColorIndex 2,
            (if B = D then (1 : ℂ) else 0) • X B D := by
          simp only [source_color_rows_contraction_complex]
    _ = ∑ B : ColorIndex 2, X B B := by
          apply Finset.sum_congr rfl
          intro B _
          simp

/-- Exact original gauge action on a *product* of two actual
Majorana operators, preserving all color-output cross terms. -/
theorem pairedTheta_pair_gauge_covariance
    (g : GaugeGroup 2) (α β : SpinIndex)
    (A : ColorIndex 2) (v : Fermion 2) :
    fermionGaugeUnitaryHom g
        ((pairedTheta α A * pairedTheta β A) v) =
      ∑ B : ColorIndex 2,
        ∑ D : ColorIndex 2,
          (adjointColorMatrix g B A : ℂ) •
            ((adjointColorMatrix g D A : ℂ) •
              (pairedTheta α B * pairedTheta β D)
                (fermionGaugeUnitaryHom g v)) := by
  change fermionGaugeUnitaryHom g
      (pairedTheta α A (pairedTheta β A v)) = _
  calc
    _ = ∑ B : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) •
          pairedTheta α B
            (fermionGaugeUnitaryHom g (pairedTheta β A v)) :=
        pairedTheta_gauge_covariance_source g α A (pairedTheta β A v)
    _ = ∑ B : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) •
          pairedTheta α B
            (∑ D : ColorIndex 2,
              (adjointColorMatrix g D A : ℂ) •
                pairedTheta β D (fermionGaugeUnitaryHom g v)) := by
        rw [pairedTheta_gauge_covariance_source g β A v]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro B _
      simp only [map_sum, map_smul, smul_sum, smul_smul,
        ContinuousLinearMap.mul_apply]

/-- Nontrivial SU(2) gauge invariance of the source sum of
three same-color fermionic Majorana bilinears. -/
theorem pairedTheta_colorPairSum_gauge_invariant
    (g : GaugeGroup 2) (α β : SpinIndex) (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      ((∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A) v) =
      (∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A)
        (fermionGaugeUnitaryHom g v) := by
  simp only [ContinuousLinearMap.sum_apply]
  calc
    fermionGaugeUnitaryHom g
      (∑ A : ColorIndex 2,
        (pairedTheta α A * pairedTheta β A) v) =
      ∑ A : ColorIndex 2,
        fermionGaugeUnitaryHom g
          ((pairedTheta α A * pairedTheta β A) v) := by
          rw [map_sum]
    _ = ∑ A : ColorIndex 2,
          ∑ B : ColorIndex 2,
            ∑ D : ColorIndex 2,
              (adjointColorMatrix g B A : ℂ) •
                ((adjointColorMatrix g D A : ℂ) •
                  (pairedTheta α B * pairedTheta β D)
                    (fermionGaugeUnitaryHom g v)) := by
          apply Finset.sum_congr rfl
          intro A _
          rw [pairedTheta_pair_gauge_covariance]
    _ = ∑ B : ColorIndex 2,
          (pairedTheta α B * pairedTheta β B)
            (fermionGaugeUnitaryHom g v) := by
          exact source_color_pair_contraction g
            (fun B D => (pairedTheta α B * pairedTheta β D)
              (fermionGaugeUnitaryHom g v))

#print axioms source_color_pair_contraction
#print axioms pairedTheta_pair_gauge_covariance
#print axioms pairedTheta_colorPairSum_gauge_invariant

end
end FCP.BFSSSU2PhysicalDomainS3G2
