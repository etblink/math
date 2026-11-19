import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1AOriginalGammaRelationalProjection
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10AEOriginalGammaFourWordTraceZeroProbe

/-!
# RHOPF-P9C1B0 — source-original relational projector trace-four gate

The original source gamma relational projector has already been proved
idempotent and to support equal action of K1,K2,K3 (P9C1A strict GREEN).
Here we use the original trace-orthogonality proof F10AE and
noncommutative Clifford multiplication to show trace(P)=4 and P≠0.

This avoids all 16x16 entry expansions and all non-public gamma access.
Its trace=4 plus previously qualified idempotence mathematically implies
rank four over ℝ; no native Matrix.rank theorem or selected coordinate
equality is *claimed* in this gate. Those remain separate formal tasks.

No physical Fock operator, Hamiltonian, 3D index or Hopf particle claim.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C1B0
noncomputable section

open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Clifford
open FCP.RHOPFP9A0
open FCP.RHOPFP9C0
open FCP.RHOPFP9C1A
open OAI.BFSSQuantum

private abbrev K1 : GammaMatrix := gamma 1 * gamma 3
private abbrev K2 : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev K3 : GammaMatrix := -(gamma 4 * gamma 6)

/-- Each cross-pair original gamma word has zero real matrix trace. -/
theorem K13K25_trace_zero :
    Matrix.trace ((gamma 1 * gamma 3) * (-(gamma 2 * gamma 5))) = 0 := by
  rw [mul_neg, Matrix.trace_neg,
    source9OriginalGamma_pair_four_word_trace_zero 1 3 2 5
      (by decide) (by decide) (by decide)]
  simp

theorem K13K46_trace_zero :
    Matrix.trace ((gamma 1 * gamma 3) * (-(gamma 4 * gamma 6))) = 0 := by
  rw [mul_neg, Matrix.trace_neg,
    source9OriginalGamma_pair_four_word_trace_zero 1 3 4 6
      (by decide) (by decide) (by decide)]
  simp

theorem K25K46_trace_zero :
    Matrix.trace ((-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6))) = 0 := by
  simpa only [neg_mul, mul_neg, neg_neg] using
    (source9OriginalGamma_pair_four_word_trace_zero 2 5 4 6
      (by decide) (by decide) (by decide))

/-- Original relational projection is exactly a scalar plus THREE
source cross bivector products, with no direct entry calculations. -/
theorem relationalProjector_expanded :
    relationalProjector =
      (1 / 4 : ℝ) •
        ((1 : GammaMatrix) - K1 * K2 - K1 * K3 - K2 * K3) := by
  have hprod : (K1 * K2) * (K1 * K3) = -(K2 * K3) := by
    calc
      (K1 * K2) * (K1 * K3) = K1 * (K2 * K1) * K3 := by noncomm_ring
      _ = K1 * (K1 * K2) * K3 := by rw [← K13_K25_commute]
      _ = (K1 * K1) * (K2 * K3) := by noncomm_ring
      _ = -(K2 * K3) := by rw [K13_sq]; simp
  change
    (1 / 4 : ℝ) • ((1 - K1 * K2) * (1 - K1 * K3)) =
      (1 / 4 : ℝ) • (1 - K1 * K2 - K1 * K3 - K2 * K3)
  congr 1
  calc
    (1 - K1 * K2) * (1 - K1 * K3) =
      1 - K1 * K2 - K1 * K3 + (K1 * K2) * (K1 * K3) := by noncomm_ring
    _ = 1 - K1 * K2 - K1 * K3 - K2 * K3 := by
      rw [hprod]
      noncomm_ring

/-- Exact trace-four source relation from original 36-bivector
trace orthogonality, not an assumed rank or coordinate table. -/
theorem relationalProjector_trace_four :
    Matrix.trace relationalProjector = (4 : ℝ) := by
  rw [relationalProjector_expanded]
  simp only [Matrix.trace_smul, Matrix.trace_sub]
  rw [K13K25_trace_zero, K13K46_trace_zero, K25K46_trace_zero]
  norm_num [Matrix.trace_one]

/-- Source projector genuinely has nonzero image, before rank proof. -/
theorem relationalProjector_ne_zero :
    relationalProjector ≠ (0 : GammaMatrix) := by
  intro h
  have ht := relationalProjector_trace_four
  rw [h, Matrix.trace_zero] at ht
  norm_num at ht

#print axioms K13K25_trace_zero
#print axioms K13K46_trace_zero
#print axioms K25K46_trace_zero
#print axioms relationalProjector_expanded
#print axioms relationalProjector_trace_four
#print axioms relationalProjector_ne_zero

end
end FCP.RHOPFP9C1B0
