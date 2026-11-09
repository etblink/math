import SU2BFSSPhysicalDomainS3FActualFermionSpinSkewAdjointProbe
import SU2BFSSG4HExactThetaCovarianceProbe

/-!
# BFSS SU(2) S3G — source color orthogonality and real fermionic gauge action

The true paired theta covariance from accepted G4H rotates the
three SU(2)-adjoint colors by the source-defined real matrix R_g.
The quadratic spinor generator is color-contracted using both
copies of R_g. We derive row orthogonality from G3A's accepted
column-orthogonality by the pinned square-matrix ring theorem,
then prove color contraction on the *actual* Fock Hilbert space.

No generic external Spin(9), spectral or gauge-invariance assumption.
-/

namespace FCP.BFSSSU2PhysicalDomainS3G
noncomputable section

open scoped BigOperators
open Matrix Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG3A
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2GaugeG4H
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3D

/-- Row orthogonality of the real source color matrix, *derived*
from the already accepted source column orthogonality. -/
theorem adjointColorMatrix_row_orthogonal (g : GaugeGroup 2) :
    adjointColorMatrix g * (adjointColorMatrix g)ᵀ = 1 :=
  mul_eq_one_comm.mp (adjointColorMatrix_orthogonal g)

/-- The exact color row contraction: output indices B,D, summed input A. -/
theorem source_color_rows_contraction (g : GaugeGroup 2)
    (B D : ColorIndex 2) :
    (∑ A : ColorIndex 2,
      adjointColorMatrix g B A * adjointColorMatrix g D A) =
        if B = D then 1 else 0 := by
  have h := congrArg
    (fun M : Matrix (ColorIndex 2) (ColorIndex 2) ℝ => M B D)
    (adjointColorMatrix_row_orthogonal g)
  simpa only [Matrix.mul_apply, Matrix.transpose_apply,
    Matrix.one_apply] using h

/-- Complex coefficient version, without assuming the source
color matrix is complex unitary or changing its real basis. -/
theorem source_color_rows_contraction_complex (g : GaugeGroup 2)
    (B D : ColorIndex 2) :
    (∑ A : ColorIndex 2,
      (adjointColorMatrix g B A : ℂ) *
        (adjointColorMatrix g D A : ℂ)) =
      if B = D then 1 else 0 := by
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
        rw [source_color_rows_contraction]
        by_cases h : B = D
        · simp [h]
        · simp [h]
    _ = if B = D then 1 else 0 := by
        by_cases h : B = D
        · simp [h]
        · simp [h]

/-- G4H's actual on-vectors covariance of the 48 true Majoranas
in the accepted G3A row/output vs column/input convention. -/
theorem pairedTheta_gauge_covariance_source
    (g : GaugeGroup 2) (α : SpinIndex) (A : ColorIndex 2)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g (pairedTheta α A v) =
      ∑ B : ColorIndex 2,
        (adjointColorMatrix g B A : ℂ) •
          pairedTheta α B (fermionGaugeUnitaryHom g v) := by
  simpa only [pairedAlgebraData_theta, adjointColorMatrix] using
    pairedAlgebraData_fermion_adjoint g α A v

#print axioms adjointColorMatrix_row_orthogonal
#print axioms source_color_rows_contraction
#print axioms source_color_rows_contraction_complex
#print axioms pairedTheta_gauge_covariance_source

end
end FCP.BFSSSU2PhysicalDomainS3G
