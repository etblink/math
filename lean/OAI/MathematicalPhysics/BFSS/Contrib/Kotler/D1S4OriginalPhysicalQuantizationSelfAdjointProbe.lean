import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S3OriginalFermionCoefficientSkewProbe

/-!
D1S4 — source-exact, finite original Fock self-adjointness of
the ORIGINAL quantizeFrequency on real skew coefficients.
D1S3 supplies the actual BFSS fermionCoefficient skewness.

Only finite bounded Fermion N →L[ℂ] Fermion N operators are discussed.
No gauge consumer, SmoothCore, full Hamiltonian or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S4
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- A real skew frequency matrix quantizes to a self-adjoint operator
on the exact original finite-dimensional BFSS Fock carrier. -/
theorem sourceQuantizeSkew_isSelfAdjoint {N : ℕ}
    (M : AlgebraData N) (K : FrequencyMatrix N)
    (hK : K.transpose = -K) :
    IsSelfAdjoint (M.quantizeFrequency K) := by
  classical
  let U : FrequencyIndex N → FrequencyIndex N →
      (Fermion N →L[ℂ] Fermion N) :=
    fun r s => (K r s : ℂ) •
      (M.theta r.1 r.2 * M.theta s.1 s.2)
  have hkentry (r s : FrequencyIndex N) :
      K r s = -K s r := by
    have h := congrArg (fun A : FrequencyMatrix N => A s r) hK
    simpa only [Matrix.transpose_apply, Matrix.neg_apply] using h
  have hpair (r s : FrequencyIndex N) :
      star (U r s) = -(U s r) := by
    dsimp [U]
    rw [star_smul, star_mul,
      (M.theta_selfAdjoint s.1 s.2).star_eq,
      (M.theta_selfAdjoint r.1 r.2).star_eq]
    have hreal : star (K r s : ℂ) = (K r s : ℂ) := by simp
    rw [hreal, hkentry r s, Complex.ofReal_neg, neg_smul]
  have hsum :
      star (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N, U r s) =
        -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N, U r s) := by
    calc
      star (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N, U r s) =
          ∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
            star (U r s) := by simp only [star_sum]
      _ = ∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
            -(U s r) := by
          apply Finset.sum_congr rfl
          intro r _
          apply Finset.sum_congr rfl
          intro s _
          exact hpair r s
      _ = -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
            U s r) := by simp only [Finset.sum_neg_distrib]
      _ = -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
            U r s) := by rw [Finset.sum_comm]
  change star ((Complex.I / 2) •
      (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N, U r s)) =
    (Complex.I / 2) •
      (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N, U r s)
  have hI : star (Complex.I / (2 : ℂ)) =
      -(Complex.I / (2 : ℂ)) := by simp
  rw [star_smul, hsum, hI, neg_smul, smul_neg, neg_neg]

/-- The physical ORIGINAL source coefficient has a self-adjoint finite
Fock quantization; this uses the accepted D1S3 skew source theorem. -/
theorem originalPhysicalQuantization_isSelfAdjoint {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    IsSelfAdjoint (M.quantizeFrequency (M.fermionCoefficient x)) :=
  sourceQuantizeSkew_isSelfAdjoint M (M.fermionCoefficient x)
    (FCP.BFSSHopfD1S3.originalFermionCoefficient_skew M x)

/-- Exact original SU(2) paired Fock-carrier specialization, no
alternative quadratic representation or substitute gauge model. -/
theorem pairedOriginalPhysicalQuantization_isSelfAdjoint
    (x : Boson 2) :
    IsSelfAdjoint (
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
        (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x)) :=
  originalPhysicalQuantization_isSelfAdjoint
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData x

#print axioms sourceQuantizeSkew_isSelfAdjoint
#print axioms originalPhysicalQuantization_isSelfAdjoint
#print axioms pairedOriginalPhysicalQuantization_isSelfAdjoint

end
end FCP.BFSSHopfD1S4
