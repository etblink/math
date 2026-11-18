import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-!
# W0C2B0N R1 — original Source48 real/complex coefficient column adapter

Genuine original Fermion 2 bounded complex-linear Fock operator carrier, exact
Source48Label := Fin 24 × Fin 2, exact qualified original real-scalar bridge.
No original K(A) bracket, all-48 gamma centrality, spin group or physics claims.
Real source matrix multiplication is transferred through the bona fide
Complex.ofRealHom RingHom.mapMatrix, never a guessed scalar tower instance.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev MatR := Matrix Source48Label Source48Label ℝ
private abbrev MatC := Matrix Source48Label Source48Label ℂ

/-- Exact entrywise real-to-complex ring homomorphism on original 48×48
Source48 matrices. Its multiplication and subtraction laws are inherited
from the pinned mathlib RingHom.mapMatrix implementation. -/
noncomputable def originalSource48_complexify : MatR →+* MatC :=
  RingHom.mapMatrix Complex.ofRealHom

/-- On original Fermion 2 Fock operators, each original real coefficient
acts exactly as its complex image, without rewriting a full real sum. -/
theorem originalSource48Fock_real_column_to_complex
    (A : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, (A p k : ℝ) • x p) =
    ∑ p : Source48Label, (originalSource48_complexify A) p k • x p := by
  classical
  apply Finset.sum_congr rfl
  intro p hp
  change (A p k : ℝ) • x p = ((A p k : ℝ) : ℂ) • x p
  exact FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
    (A p k) (x p)

/-- Genuine original Source48 real matrix commutators complexify under an
actual ring hom, preserving matrix multiplication and subtraction. -/
theorem originalSource48_complexify_commutator
    (A B : MatR) :
    originalSource48_complexify (A * B - B * A) =
      originalSource48_complexify A * originalSource48_complexify B -
      originalSource48_complexify B * originalSource48_complexify A := by
  simp only [map_sub, map_mul]

/-- The real Source48 matrix-commutator column acting on genuine original
Fock operators is exactly its complexified matrix-commutator column.
No CAR, skewness, gamma or noncommutative Fock product is used. -/
theorem originalSource48Fock_real_commutator_column_to_complex
    (A B : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, ((A * B - B * A) p k : ℝ) • x p) =
    ∑ p : Source48Label,
      ((originalSource48_complexify A * originalSource48_complexify B -
        originalSource48_complexify B * originalSource48_complexify A) p k) • x p := by
  calc
    _ = ∑ p : Source48Label,
          (originalSource48_complexify (A * B - B * A)) p k • x p :=
      originalSource48Fock_real_column_to_complex (A * B - B * A) x k
    _ = ∑ p : Source48Label,
          ((originalSource48_complexify A * originalSource48_complexify B -
            originalSource48_complexify B * originalSource48_complexify A) p k) • x p := by
      rw [originalSource48_complexify_commutator A B]

#print axioms originalSource48Fock_real_column_to_complex
#print axioms originalSource48_complexify_commutator
#print axioms originalSource48Fock_real_commutator_column_to_complex

end
end FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
