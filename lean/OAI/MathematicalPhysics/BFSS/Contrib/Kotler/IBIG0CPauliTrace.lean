import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3AAdjointColorRepresentationProbe

/-!
# IBI-G0C-PAULI-TRACE — source-exact original SU(2) adjoint Pauli coefficients

Identify the actual BFSS G3A output-row/input-column color matrix with the
unnormalized Pauli-conjugation trace formula. Reuse the paired AlgebraData 2
color basis and its normalized source Pauli scale. No external spin-cover
import, surjectivity, kernel classification, bosonic orbit reconstruction,
physical-state identification, or spectral conclusion is asserted.
-/ 

set_option autoImplicit false

namespace FCP.BFSSIBIG0CPauliTrace
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- The native source adjoint coefficient is precisely the trace pairing
with the existing normalized color Pauli basis. Output B, input A. -/
theorem originalAdjointColorMatrix_normalizedPauliTrace
    (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.normalizedPauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.normalizedPauli A *
          (g : ColorMatrix 2).conjTranspose))).re := by
  change (Matrix.trace (M.color B *
    ((g : ColorMatrix 2) * M.color A *
      (g : ColorMatrix 2).conjTranspose))).re = _
  rw [pairedAlgebraData_color B, pairedAlgebraData_color A,
    FCP.BFSSSU2Full.concreteAlgebraData_color B,
    FCP.BFSSSU2Full.concreteAlgebraData_color A]

/-- Exact original BFSS SU(2) gauge-adjoint coefficients agree with the
standard unnormalized Pauli conjugation trace, with the source's precise
output-row/input-column convention and the factor one half. -/
theorem originalAdjointColorMatrix_pauliTrace
    (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2).conjTranspose))).re / 2 := by
  rw [originalAdjointColorMatrix_normalizedPauliTrace]
  simp only [FCP.BFSSSU2.normalizedPauli]
  have hscale : ((FCP.BFSSSU2.pauliScale : ℂ) ^ 2) = (1 / 2 : ℂ) := by
    simpa using congrArg (fun t : ℝ => (t : ℂ))
      FCP.BFSSSU2.pauliScale_sq
  have hmatrix :
      ((FCP.BFSSSU2.pauliScale : ℂ) • FCP.BFSSSU2.pauli B) *
        ((g : ColorMatrix 2) *
          ((FCP.BFSSSU2.pauliScale : ℂ) • FCP.BFSSSU2.pauli A) *
          (g : ColorMatrix 2).conjTranspose) =
      ((FCP.BFSSSU2.pauliScale : ℂ) ^ 2) •
        (FCP.BFSSSU2.pauli B *
          ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
            (g : ColorMatrix 2).conjTranspose)) := by
    simp only [Matrix.smul_mul, Matrix.mul_smul, smul_smul, pow_two]
  rw [hmatrix, hscale, Matrix.trace_smul]
  norm_num [smul_eq_mul, Complex.mul_re] <;> ring

#print axioms originalAdjointColorMatrix_normalizedPauliTrace
#print axioms originalAdjointColorMatrix_pauliTrace

end
end FCP.BFSSIBIG0CPauliTrace
