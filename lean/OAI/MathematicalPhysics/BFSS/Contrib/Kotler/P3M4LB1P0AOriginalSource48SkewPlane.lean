import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L2AbstractOriginalFockCovarianceLeibniz

/-!
# BFSS M4-LB1P0A — exact original Source48 sparse skew planes

This is ONLY the first narrow source-label matrix geometry gate.
No full Fock K(E) normalization, Lie bracket or global Spin9 action
is claimed. The original Source48Label, actual gamma and original
Fermion 2 Fock donors are imported unchanged through qualified LB1L2.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma

/-- Skew elementary plane on the actual original 48 Majorana labels. -/
def originalSource48SkewPlane
    (i j : Source48Label) :
    Matrix Source48Label Source48Label ℝ :=
  fun p q =>
    (if p = i ∧ q = j then (1 : ℝ) else 0) -
      (if p = j ∧ q = i then (1 : ℝ) else 0)

/-- Entrywise skewness for arbitrary original 48-label indices,
including coincident labels; no implicit ordering assumption. -/
theorem originalSource48SkewPlane_entries_skew
    (i j p q : Source48Label) :
    originalSource48SkewPlane i j p q =
      -(originalSource48SkewPlane i j q p) := by
  classical
  have h₁ :
      (if q = i ∧ p = j then (1 : ℝ) else 0) =
        (if p = j ∧ q = i then (1 : ℝ) else 0) := by
    by_cases h : q = i ∧ p = j
    · have h' : p = j ∧ q = i := ⟨h.2, h.1⟩
      simp [h]
    · have h' : ¬(p = j ∧ q = i) := by
        intro hb
        exact h ⟨hb.2, hb.1⟩
      simp [h, h']
  have h₂ :
      (if q = j ∧ p = i then (1 : ℝ) else 0) =
        (if p = i ∧ q = j then (1 : ℝ) else 0) := by
    by_cases h : q = j ∧ p = i
    · have h' : p = i ∧ q = j := ⟨h.2, h.1⟩
      simp [h]
    · have h' : ¬(p = i ∧ q = j) := by
        intro hb
        exact h ⟨hb.2, hb.1⟩
      simp [h, h']
  simp only [originalSource48SkewPlane]
  rw [h₁, h₂]
  ring

/-- The standard native real-matrix transpose condition, not a
surrogate Clifford or Lie carrier. -/
theorem originalSource48SkewPlane_transpose
    (i j : Source48Label) :
    (originalSource48SkewPlane i j).transpose =
      -originalSource48SkewPlane i j := by
  ext p q
  change originalSource48SkewPlane i j q p =
    -(originalSource48SkewPlane i j p q)
  exact originalSource48SkewPlane_entries_skew i j q p

#print axioms originalSource48SkewPlane_entries_skew
#print axioms originalSource48SkewPlane_transpose

end
end FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane
