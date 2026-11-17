import Mathlib.Algebra.Algebra.Subalgebra.Lattice
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H1AOriginalGeneratorCentralizerComapR2

/-!
# W0H1B — original Clifford algebra generation and all-element centralizer

Mathematics: pull back the singleton centralizer using the genuine original
M3I Clifford–Fock equivalence, then close the accepted W0H1A generator
membership under the pinned Mathlib algebra-generation theorem.

Does NOT import or retry the stopped W0B1 original induction source.
Does NOT assert Schur scalar commutant, trace completeness or BFSS physics.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordCommutant
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerComapR2
open scoped TensorProduct

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Under commutation with all original normalized source Majoranas,
the original M3I singleton Fock centralizer pulls back to all of the
original complex Clifford algebra. No new Clifford induction. -/
theorem originalSourceCentralizerPullback_eq_top
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    originalSourceCentralizerPullback T = (⊤ : Subalgebra ℂ A) := by
  have hgen :
      Algebra.adjoin ℂ
          (Set.range (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ))) ≤
        originalSourceCentralizerPullback T := by
    apply Algebra.adjoin_le
    rintro x ⟨w, rfl⟩
    exact originalGenerator_mem_sourceCentralizerPullback T h w
  rw [CliffordAlgebra.adjoin_range_ι] at hgen
  exact top_unique hgen

/-- Conditional commutation with every element of the original complex
Clifford algebra, using the genuine M3I Fock equivalence, not a
surrogate model or a source-level Clifford induction. -/
theorem originalComplexEquiv_fullClifford_commutes
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) :
    Commute T (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) := by
  have hmem : a ∈ originalSourceCentralizerPullback T := by
    simp [originalSourceCentralizerPullback_eq_top T h]
  change FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a ∈
    Subalgebra.centralizer ℂ ({T} : Set Op) at hmem
  have heq := (Subalgebra.mem_centralizer_iff.mp hmem) T (Set.mem_singleton T)
  exact ⟨heq⟩

#print axioms originalSourceCentralizerPullback_eq_top
#print axioms originalComplexEquiv_fullClifford_commutes

end
end FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordCommutant
