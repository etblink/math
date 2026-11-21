import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1F: source-exact original BFSS massless fermion coefficient and Fock quantization.
No replacement Hamiltonian, physical-space claim, or extra mass deformation.
This candidate is UNQUALIFIED until a strict source+consumer Lean gate succeeds.
-/

set_option autoImplicit false

namespace FCP.BFSSHopfD1F
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Finset

variable {N : ℕ} (M : AlgebraData N)

/-- Exactly the massless, coordinate-dependent part of the source frequency. -/
def masslessFrequency (x : Boson N) : FrequencyMatrix N :=
  fun r s => -(∑ j : SpaceIndex, ∑ C : ColorIndex N,
    M.structureConstant s.2 r.2 C * x (j,C) * M.gamma j r.1 s.1)

/-- The massless interaction is literally F(X) - F(0), no new parameters. -/
theorem masslessFrequency_eq_source_difference (x : Boson N) :
    masslessFrequency M x = M.fermionCoefficient x - M.fermionCoefficient 0 := by
  ext r s
  simp [masslessFrequency, AlgebraData.fermionCoefficient]

/-- CAR quantization of the original massless coefficient on the original Fock. -/
theorem quantize_masslessFrequency (x : Boson N) :
    M.quantizeFrequency (masslessFrequency M x) =
      ((-Complex.I) / 2) •
        (∑ j : SpaceIndex, ∑ A : ColorIndex N, M.cubicFermionComponent x A j) := by
  have hsum :
      (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
        (masslessFrequency M x r s : ℂ) •
          (M.theta r.1 r.2 * M.theta s.1 s.2)) =
      -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
        (((∑ j : SpaceIndex, ∑ C : ColorIndex N,
          M.structureConstant s.2 r.2 C * x (j,C) *
            M.gamma j r.1 s.1) : ℝ) : ℂ) •
          (M.theta r.1 r.2 * M.theta s.1 s.2)) := by
    simp only [masslessFrequency, Complex.ofReal_neg,
      neg_smul, Finset.sum_neg_distrib]
  change (Complex.I / 2) •
    (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      (masslessFrequency M x r s : ℂ) •
        (M.theta r.1 r.2 * M.theta s.1 s.2)) = _
  rw [hsum, M.frequency_bracket_contraction x]
  rw [smul_neg, ← neg_smul]
  congr 1
  ring

/-- Preserve the real-linear source field and complex-linear Fock operator types. -/
theorem deformedFermionField_massless_quantized (x : Boson N) :
    M.deformedFermionField 1 0 x =
      (M.quantizeFrequency (masslessFrequency M x)).restrictScalars ℝ := by
  rw [M.deformedFermionField_bracket, quantize_masslessFrequency M x]

#print axioms masslessFrequency_eq_source_difference
#print axioms quantize_masslessFrequency
#print axioms deformedFermionField_massless_quantized

end
end FCP.BFSSHopfD1F
