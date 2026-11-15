import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1SourceColumnsTriple

/-!
# IBI-G0B1 native original gauge-adjoint determinant +1

Bind the signed source Pauli column determinant (qualified FIN-DET3)
to actual paired AlgebraData 2 gauge-conjugated color unit vectors
(qualified original G3A / source-columns/triple) and evaluate orientation
at the identity. This does NOT prove SU(2)→SO(3) surjectivity, orbit
classification, Fock covariance, a mass gap or incidence ontology.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0B1NativeDetOne
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1BOriginalSignedCross
open FCP.BFSSIBIG0B1FinDet3
open FCP.BFSSIBIG0B1SourceColumnsTriple

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- Column A of a real 3x3 output-row/input-column matrix, interpreted
as the ORIGINAL BFSS SU(2) three-dimensional real color carrier. -/
noncomputable def matrixColorColumn
    (R : Matrix (Fin 3) (Fin 3) ℝ) (A : Fin 3) : ColorVector 2 :=
  WithLp.toLp 2 (fun B : Fin 3 => R B A)

@[simp] theorem matrixColorColumn_apply
    (R : Matrix (Fin 3) (Fin 3) ℝ) (A B : Fin 3) :
    matrixColorColumn R A B = R B A := rfl

/-- The actual source G3A adjoint column is EXACTLY its paired
color-conjugated original unit vector; not a stand-in SO(3) action. -/
theorem matrixColorColumn_adjoint (g : GaugeGroup 2) (A : Fin 3) :
    matrixColorColumn (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) A =
      M.colorConjugate (g : ColorMatrix 2)
        (FCP.BFSSSU2GaugeG3A.colorUnit A) := by
  ext B
  exact (sourceColumn_apply g A B).symm

/-- The identity matrix has precisely the original source unit columns. -/
theorem matrixColorColumn_one (A : Fin 3) :
    matrixColorColumn (1 : Matrix (Fin 3) (Fin 3) ℝ) A =
      FCP.BFSSSU2GaugeG3A.colorUnit A := by
  ext B
  simp only [matrixColorColumn_apply,
    FCP.BFSSSU2GaugeG3A.colorUnit_apply, Matrix.one_apply]

/-- Connect the original source ColorVector inner product to the
already-qualified FIN-DET3 signed Pauli colorCross polynomial. -/
theorem originalColumnTriple_eq_sourceInner
    (R : Matrix (Fin 3) (Fin 3) ℝ) :
    originalColumnTriple R =
      inner ℝ (sourceCross (matrixColorColumn R 0)
        (matrixColorColumn R 1)) (matrixColorColumn R 2) := by
  simp [originalColumnTriple, sourceCross, matrixColorColumn,
    PiLp.inner_apply, RCLike.inner_apply]

/-- The ordered ORIGINAL color basis has positive, not absolute,
orientation +1. The FIN-DET3 signed control fixes this sign. -/
theorem sourceColorUnitTriple_eq_one :
    inner ℝ (sourceCross
      (FCP.BFSSSU2GaugeG3A.colorUnit (0 : Fin 3))
      (FCP.BFSSSU2GaugeG3A.colorUnit (1 : Fin 3)))
      (FCP.BFSSSU2GaugeG3A.colorUnit (2 : Fin 3)) = 1 := by
  calc
    _ = originalColumnTriple (1 : Matrix (Fin 3) (Fin 3) ℝ) := by
      rw [originalColumnTriple_eq_sourceInner]
      simp only [matrixColorColumn_one]
    _ = (1 : Matrix (Fin 3) (Fin 3) ℝ).det :=
      originalColumnTriple_eq_det _
    _ = 1 := by simp

/-- G0B1's desired *native* theorem: the actual paired SU(2) adjoint
color matrix preserves orientation, so its determinant equals +1. -/
theorem originalAdjointColorMatrix_det_one (g : GaugeGroup 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det = 1 := by
  calc
    _ = originalColumnTriple
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) :=
        (originalColumnTriple_eq_det _).symm
    _ = inner ℝ
      (sourceCross
        (matrixColorColumn (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) 0)
        (matrixColorColumn (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) 1))
        (matrixColorColumn (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) 2) :=
          originalColumnTriple_eq_sourceInner _
    _ = inner ℝ
      (sourceCross
        (M.colorConjugate (g : ColorMatrix 2)
          (FCP.BFSSSU2GaugeG3A.colorUnit 0))
        (M.colorConjugate (g : ColorMatrix 2)
          (FCP.BFSSSU2GaugeG3A.colorUnit 1)))
        (M.colorConjugate (g : ColorMatrix 2)
          (FCP.BFSSSU2GaugeG3A.colorUnit 2)) := by
            rw [matrixColorColumn_adjoint g 0,
              matrixColorColumn_adjoint g 1,
              matrixColorColumn_adjoint g 2]
    _ = inner ℝ
      (sourceCross
        (FCP.BFSSSU2GaugeG3A.colorUnit 0)
        (FCP.BFSSSU2GaugeG3A.colorUnit 1))
        (FCP.BFSSSU2GaugeG3A.colorUnit 2) :=
          sourceCrossTriple_conjugate g _ _ _
    _ = 1 := sourceColorUnitTriple_eq_one

#print axioms matrixColorColumn
#print axioms matrixColorColumn_apply
#print axioms matrixColorColumn_adjoint
#print axioms matrixColorColumn_one
#print axioms originalColumnTriple_eq_sourceInner
#print axioms sourceColorUnitTriple_eq_one
#print axioms originalAdjointColorMatrix_det_one

end
end FCP.BFSSIBIG0B1NativeDetOne
