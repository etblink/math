import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B2BOriginalSchurScalarCommutant
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C0OriginalFockScalarTraceSeparationR2
import Mathlib.Tactic

/-!
# W0C1 R2 — original Fock 48-Majorana commutator plus trace witness

Source-exact algebraic injectivity on original Fermion 2. W0B2B R1
gives scalar commutants of all original sourceNormalizedGamma generators;
W0C0 R2 gives nondegenerate scalar trace. First prove the zero kernel,
then prove full operator signature injectivity by subtracting witnesses.

No assertion of gauge/parity-admissible physical measurement, physical
Spin(9) covariance, Hamiltonian spectral properties or SCC operations.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C1OriginalCommutatorTraceWitnessR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4W0B2BOriginalSchurScalarCommutant
open FCP.BFSSP3M4W0C0OriginalFockScalarTraceSeparationR2

private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

/-- Original 48-gamma centralizer together with zero ordinary original
Fock trace has trivial kernel: the scalar Schur ambiguity vanishes. -/
theorem originalFockWitness_kernel_zero (D : Op)
    (hgamma : ∀ p : Source48Label, Commute D (sourceNormalizedGamma p))
    (htrace : originalFockTrace D = 0) : D = 0 := by
  obtain ⟨z, hz, _⟩ :=
    originalFockClifford_scalar_operator_unique D hgamma
  have hscalar : originalFockTrace (z • (1 : Op)) = 0 := by
    simpa [hz] using htrace
  have hz0 : z = 0 :=
    (originalFockTrace_scalar_one_eq_zero_iff z).mp hscalar
  calc
    D = z • (1 : Op) := hz
    _ = 0 := by
      rw [hz0]
      exact zero_smul ℂ (1 : Op)

/-- Algebraic signature using exactly the original finite Fock trace and
commutators with all original 48 normalized Majoranas. -/
noncomputable def originalFockWitnessSignature (T : Op) :
    ℂ × (Source48Label → Op) :=
  (originalFockTrace T,
    fun p => T * sourceNormalizedGamma p - sourceNormalizedGamma p * T)

/-- The original trace and all 48 original Majorana commutators uniquely
identify a bounded complex-linear Fock operator, as algebraic data. -/
theorem originalFockWitnessSignature_injective :
    Function.Injective originalFockWitnessSignature := by
  intro T S h
  have htrace_eq : originalFockTrace T = originalFockTrace S := by
    simpa only [originalFockWitnessSignature] using
      congrArg (fun x : ℂ × (Source48Label → Op) => x.1) h
  have htrace_sub : originalFockTrace (T - S) = 0 := by
    rw [map_sub]
    exact sub_eq_zero.mpr htrace_eq
  have hcomm_sub :
      ∀ p : Source48Label, Commute (T - S) (sourceNormalizedGamma p) := by
    intro p
    have hcomm_eq :
        T * sourceNormalizedGamma p - sourceNormalizedGamma p * T =
        S * sourceNormalizedGamma p - sourceNormalizedGamma p * S := by
      simpa only [originalFockWitnessSignature] using
        congrArg (fun x : ℂ × (Source48Label → Op) => x.2 p) h
    change (T - S) * sourceNormalizedGamma p =
      sourceNormalizedGamma p * (T - S)
    calc
      (T - S) * sourceNormalizedGamma p =
          T * sourceNormalizedGamma p - S * sourceNormalizedGamma p :=
        sub_mul T S (sourceNormalizedGamma p)
      _ = (T * sourceNormalizedGamma p - sourceNormalizedGamma p * T) -
          (S * sourceNormalizedGamma p - sourceNormalizedGamma p * S) +
          (sourceNormalizedGamma p * T - sourceNormalizedGamma p * S) := by
            abel
      _ = sourceNormalizedGamma p * T - sourceNormalizedGamma p * S := by
        rw [hcomm_eq]
        simp
      _ = sourceNormalizedGamma p * (T - S) :=
        (mul_sub (sourceNormalizedGamma p) T S).symm
  have hzero :=
    originalFockWitness_kernel_zero (T - S) hcomm_sub htrace_sub
  exact sub_eq_zero.mp hzero

#print axioms originalFockWitness_kernel_zero
#print axioms originalFockWitnessSignature_injective

end
end FCP.BFSSP3M4W0C1OriginalCommutatorTraceWitnessR2
