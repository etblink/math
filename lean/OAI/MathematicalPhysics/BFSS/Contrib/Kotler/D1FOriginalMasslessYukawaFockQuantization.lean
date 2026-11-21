import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1F source-donor subtraction architecture after two native REDs.
Original source fermionCoefficient, quantizeFrequency and Fock carriers only.
No replacement Hamiltonian, additional mass, axiom, or 3D Dirac operator.
This candidate requires an exact native and independent consumer strict GREEN.
-/

set_option autoImplicit false

namespace FCP.BFSSHopfD1F
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Finset

variable {N : ℕ} (M : AlgebraData N)

/-- The original h=1,m=0 fermionic coefficient, not a modified frequency. -/
def masslessFrequency (x : Boson N) : FrequencyMatrix N :=
  fun r s => -(∑ j : SpaceIndex, ∑ C : ColorIndex N,
    M.structureConstant s.2 r.2 C * x (j,C) * M.gamma j r.1 s.1)

theorem masslessFrequency_eq_source_difference (x : Boson N) :
    masslessFrequency M x = M.fermionCoefficient x - M.fermionCoefficient 0 := by
  ext r s
  simp [masslessFrequency, AlgebraData.fermionCoefficient]

/-- Quantization is additive in the real frequency matrix.
Use the same finite-sum subtraction rules as the compiled upstream donor. -/
private theorem quantizeFrequency_sub (K L : FrequencyMatrix N) :
    M.quantizeFrequency (K - L) =
      M.quantizeFrequency K - M.quantizeFrequency L := by
  simp only [AlgebraData.quantizeFrequency, Matrix.sub_apply,
    Complex.ofReal_sub, sub_smul, Finset.sum_sub_distrib, smul_sub]
  module

/-- The original massless bracket has zero coefficient at X=0. -/
private theorem masslessField_zero :
    M.deformedFermionField 1 0 (0 : Boson N) = 0 := by
  rw [M.deformedFermionField_bracket]
  simp [AlgebraData.cubicFermionComponent]

/-- The original deformation mass term does not depend on bosonic X. -/
private theorem massField_constant (x : Boson N) :
    M.deformedFermionField 0 1 x =
      M.deformedFermionField 0 1 (0 : Boson N) := by
  rw [M.deformedFermionField_mass x, M.deformedFermionField_mass (0 : Boson N)]

/-- Subtract the existing h=m=1 source field at X and the origin. -/
private theorem masslessField_as_difference (x : Boson N) :
    M.deformedFermionField 1 0 x =
      M.deformedFermionField 1 1 x -
        M.deformedFermionField 1 1 (0 : Boson N) := by
  calc
    M.deformedFermionField 1 0 x =
        (M.deformedFermionField 1 0 x + M.deformedFermionField 0 1 x) -
        (M.deformedFermionField 1 0 (0 : Boson N) +
          M.deformedFermionField 0 1 (0 : Boson N)) := by
            rw [M.masslessField_zero, M.massField_constant x]
            abel
    _ = M.deformedFermionField 1 1 x -
        M.deformedFermionField 1 1 (0 : Boson N) := by
          rw [M.deformedFermionField_linear_parameters 1 1 x,
            M.deformedFermionField_linear_parameters 1 1 (0 : Boson N)]
          simp only [one_smul]

/-- The missing original-carrier statement follows by subtracting the *compiled*
upstream h=m=1 Fock theorem; no direct double-Majorana-sum normalization. -/
theorem deformedFermionField_massless_quantized (x : Boson N) :
    M.deformedFermionField 1 0 x =
      (M.quantizeFrequency (masslessFrequency M x)).restrictScalars ℝ := by
  calc
    M.deformedFermionField 1 0 x =
        M.deformedFermionField 1 1 x -
          M.deformedFermionField 1 1 (0 : Boson N) :=
            M.masslessField_as_difference x
    _ = (M.quantizeFrequency (M.fermionCoefficient x)).restrictScalars ℝ -
        (M.quantizeFrequency (M.fermionCoefficient (0 : Boson N))).restrictScalars ℝ := by
          rw [M.deformedFermionField_quantized x,
            M.deformedFermionField_quantized (0 : Boson N)]
    _ = (M.quantizeFrequency
          (M.fermionCoefficient x - M.fermionCoefficient 0)).restrictScalars ℝ := by
          rw [M.quantizeFrequency_sub]
          rfl
    _ = (M.quantizeFrequency (masslessFrequency M x)).restrictScalars ℝ := by
          rw [M.masslessFrequency_eq_source_difference]

/-- Complex-linear original Fock identity, recovered from faithful restriction
of complex-linear maps to the real-linear underlying operator carrier. -/
theorem quantize_masslessFrequency (x : Boson N) :
    M.quantizeFrequency (masslessFrequency M x) =
      ((-Complex.I) / 2) •
        (∑ j : SpaceIndex, ∑ A : ColorIndex N, M.cubicFermionComponent x A j) := by
  have h := M.deformedFermionField_massless_quantized x
  rw [M.deformedFermionField_bracket] at h
  apply ContinuousLinearMap.ext
  intro v
  have hv := congrArg
    (fun T : Fermion N →L[ℝ] Fermion N => T v) h
  simpa only [ContinuousLinearMap.coe_restrictScalars'] using hv.symm

#print axioms masslessFrequency_eq_source_difference
#print axioms quantize_masslessFrequency
#print axioms deformedFermionField_massless_quantized

end
end FCP.BFSSHopfD1F
