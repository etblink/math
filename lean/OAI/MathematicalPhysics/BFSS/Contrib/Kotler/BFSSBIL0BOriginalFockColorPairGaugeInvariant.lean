import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0AOriginalGaugeColorRowOrthogonality
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4HExactThetaCovarianceProbe

/-!
# BIL-0B — exact original color-contracted Majorana pair gauge invariance

Port the historically strict-green FCP S3G/S3G2 proof *logic* to the
already qualified G3A/BIL-0A and G4H original-source interfaces.
All operators act on the literal original 24-mode `Fermion 2`.
No surrogate Spin9 vector action or physical Hamiltonian assertion.
The archived S3G/S3G2 files are retained byte for byte.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0BOriginalFockColorPairGaugeInvariant
noncomputable section

open scoped BigOperators
open Matrix Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG3A
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2GaugeG4H

/-- This duplicates only the scalar transport of the qualified BIL-0A
row theorem; the old BIL-0A consumer is a diagnostic, not an importable
new source module. Original FCP S3G used this exact cast sequence. -/
theorem originalColorRows_contraction_complex
    (g : GaugeGroup 2) (B D : ColorIndex 2) :
    (∑ A : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) *
          (adjointColorMatrix g D A : ℂ)) =
      if B = D then 1 else 0 := by
  have hreal : (∑ A : ColorIndex 2,
          adjointColorMatrix g B A * adjointColorMatrix g D A) =
        (if B = D then 1 else 0 : ℝ) := by
    have h := congrArg
      (fun R : Matrix (ColorIndex 2) (ColorIndex 2) ℝ => R B D)
      (FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality.originalColorRow_matrix_orthogonal g)
    simpa only [Matrix.mul_apply, Matrix.transpose_apply, Matrix.one_apply] using h
  calc
    _ = ∑ A : ColorIndex 2,
          ((adjointColorMatrix g B A *
            adjointColorMatrix g D A : ℝ) : ℂ) := by
        apply Finset.sum_congr rfl
        intro A _
        exact (Complex.ofReal_mul _ _).symm
    _ = ((∑ A : ColorIndex 2,
          adjointColorMatrix g B A *
            adjointColorMatrix g D A : ℝ) : ℂ) := by
        simp
    _ = ((if B = D then (1 : ℝ) else 0) : ℂ) := by
        rw [hreal]
        by_cases hBD : B = D
        · simp [hBD]
        · simp [hBD]
    _ = if B = D then 1 else 0 := by
        by_cases hBD : B = D
        · simp [hBD]
        · simp [hBD]

/-- Literal source G4H covariance, with output color B and input A. -/
theorem originalTheta_gauge_covariance
    (g : GaugeGroup 2) (α : SpinIndex) (A : ColorIndex 2)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g (pairedTheta α A v) =
      ∑ B : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) •
          pairedTheta α B (fermionGaugeUnitaryHom g v) := by
  simpa only [pairedAlgebraData_theta, adjointColorMatrix] using
    (pairedAlgebraData_fermion_adjoint g α A v)

/-- Historical S3G2 row contraction, using *actual Fock vectors* as
the arbitrary output values. No abstract replacement gauge action. -/
theorem originalColor_double_contraction
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
          simp only [originalColorRows_contraction_complex]
    _ = ∑ B : ColorIndex 2, X B B := by
          apply Finset.sum_congr rfl
          intro B _
          simp

/-- Historical S3G2 exact pair transport; the output cross colors
must be retained until the orthogonal contraction is applied. -/
theorem originalTheta_pair_gauge_covariance
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
      originalTheta_gauge_covariance g α A (pairedTheta β A v)
    _ = ∑ B : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) •
          pairedTheta α B
            (∑ D : ColorIndex 2,
              (adjointColorMatrix g D A : ℂ) •
                pairedTheta β D (fermionGaugeUnitaryHom g v)) := by
      rw [originalTheta_gauge_covariance g β A v]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro B _
      simp only [map_sum, map_smul, smul_sum, smul_smul,
        ContinuousLinearMap.mul_apply]

/-- **BIL-0B root**: every literal original color-contracted 2-Majorana
operator commutes, pointwise on actual `Fermion 2`, with the genuine
SU2 Fock unitary. Different spinor labels are unrestricted. -/
theorem originalColorPair_gauge_invariant
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
          rw [originalTheta_pair_gauge_covariance]
    _ = ∑ B : ColorIndex 2,
          (pairedTheta α B * pairedTheta β B)
            (fermionGaugeUnitaryHom g v) := by
          exact originalColor_double_contraction g
            (fun B D => (pairedTheta α B * pairedTheta β D)
              (fermionGaugeUnitaryHom g v))

#print axioms originalColorRows_contraction_complex
#print axioms originalTheta_gauge_covariance
#print axioms originalColor_double_contraction
#print axioms originalTheta_pair_gauge_covariance
#print axioms originalColorPair_gauge_invariant

end
end FCP.BFSSBIL0BOriginalFockColorPairGaugeInvariant
