import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralWeightedClosureCompactness

/-! Exact-type consumers of the original weighted-closure compactness bridge.
Closure membership and bounds are explicit assumptions, not physical identification. -/

set_option autoImplicit false

noncomputable section
open MeasureTheory Set OAI.BFSSSliceSobolev
open scoped NNReal

variable {ι F : Type*} [Fintype ι] [NormedAddCommGroup F]
  [InnerProductSpace ℝ F] [CompleteSpace F] [FiniteDimensional ℝ F]
local notation "X" => EuclideanSpace ℝ ι
local notation "μ" => (volume : Measure X)
local notation "e" => (EuclideanSpace.basisFun ι ℝ)

-- Exact general weight interface: the radial domination has power one.
example (w : X → ℝ) (hw : Continuous w) (c : ℝ) (hc : 0 < c)
    (hcw : ∀ x : X, c * ‖x‖ ≤ w x ^ 2)
    (u : ℕ → Lp F 2 μ) (v : ℕ → Gradient (F := F) μ (ι := ι)) (m : ℕ → Lp F 2 μ)
    (A B C : ℝ≥0) (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure μ e w hw)
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) :=
  weightedClosure_linear_totallyBounded w hw c hc hcw u v m A B C hd hA hB hC

-- The literal square-root radial weight requires no auxiliary domination premise.
example (u : ℕ → Lp F 2 μ) (v : ℕ → Gradient (F := F) μ (ι := ι)) (m : ℕ → Lp F 2 μ)
    (A B C : ℝ≥0) (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure μ e
      (fun x : X => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm))
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) :=
  weightedClosure_sqrt_radial_totallyBounded u v m A B C hd hA hB hC

-- Original core triples lie in this same weighted closure.
example (f : ℕ → Core (E := X) (F := F)) (A B C : ℝ≥0)
    (hA : ∀ n, ‖gradient μ e (f n)‖ ≤ A)
    (hB : ∀ n, ‖toL2 μ (f n)‖ ≤ B)
    (hC : ∀ n, ‖weightedToL2 μ (fun x : X => Real.sqrt ‖x‖)
      (Real.continuous_sqrt.comp continuous_norm) (f n)‖ ≤ C) :
    TotallyBounded (range (fun n => toL2 μ (f n))) := by
  apply weightedClosure_sqrt_radial_totallyBounded (fun n => toL2 μ (f n))
    (fun n => gradient μ e (f n))
    (fun n => weightedToL2 μ (fun x : X => Real.sqrt ‖x‖)
      (Real.continuous_sqrt.comp continuous_norm) (f n)) A B C _ hA hB hC
  intro n
  exact subset_closure ⟨f n, rfl⟩

-- Enlarging the weighted L2 bound keeps the original closure membership.
example (w : X → ℝ) (hw : Continuous w) (c : ℝ) (hc : 0 < c)
    (hcw : ∀ x : X, c * ‖x‖ ≤ w x ^ 2)
    (u : ℕ → Lp F 2 μ) (v : ℕ → Gradient (F := F) μ (ι := ι)) (m : ℕ → Lp F 2 μ)
    (A B C D : ℝ≥0) (hCD : C ≤ D)
    (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure μ e w hw)
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) := by
  apply weightedClosure_linear_totallyBounded w hw c hc hcw u v m A B D hd hA hB
  intro n
  exact (hC n).trans (by exact_mod_cast hCD)

open OAI.BFSSQuantum

-- General weights on the literal original SU(2) Hilbert and gradient carriers.
example (w : Boson 2 → ℝ) (hw : Continuous w) (c : ℝ) (hc : 0 < c)
    (hcw : ∀ x : Boson 2, c * ‖x‖ ≤ w x ^ 2)
    (u : ℕ → FullL2 2)
    (v : ℕ → Gradient (F := Fermion 2) (volume : Measure (Boson 2))
      (ι := SpaceIndex × ColorIndex 2)) (m : ℕ → FullL2 2) (A B C : ℝ≥0)
    (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure (volume : Measure (Boson 2))
      (EuclideanSpace.basisFun (SpaceIndex × ColorIndex 2) ℝ) w hw)
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) :=
  weightedClosure_linear_totallyBounded w hw c hc hcw u v m A B C hd hA hB hC

-- The intended radial weight on the same original SU(2) weighted closure.
example (u : ℕ → FullL2 2)
    (v : ℕ → Gradient (F := Fermion 2) (volume : Measure (Boson 2))
      (ι := SpaceIndex × ColorIndex 2)) (m : ℕ → FullL2 2) (A B C : ℝ≥0)
    (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure (volume : Measure (Boson 2))
      (EuclideanSpace.basisFun (SpaceIndex × ColorIndex 2) ℝ)
      (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm))
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) :=
  weightedClosure_sqrt_radial_totallyBounded u v m A B C hd hA hB hC

#print axioms OAI.BFSSSliceSobolev.weightedClosure_linear_totallyBounded
#print axioms OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded
#eval IO.println "SPECTRAL_WEIGHTED_CLOSURE_AUDIT_OK"
