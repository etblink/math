import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralCoreLinearMomentCompactness

/-! Independent exact-type consumers for the smooth-core analysis bridge.
Gradient, L2 and first-moment bounds are hypotheses, not BFSS energy theorems. -/

set_option autoImplicit false

noncomputable section
open MeasureTheory Set OAI.BFSSSliceSobolev
open scoped NNReal

variable {ι F J : Type*} [Fintype ι] [NormedAddCommGroup F]
  [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
local notation "X" => EuclideanSpace ℝ ι
local notation "μ" => (volume : Measure X)
local notation "e" => (EuclideanSpace.basisFun ι ℝ)

-- Local total boundedness is derived, without any moment hypothesis.
example (f : J → Core (E := X) (F := F)) (A B : ℝ≥0)
    (hA : ∀ j, ‖gradient μ e (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 μ (f j)‖ ≤ B) (R : ℝ) (hR : 0 < R) :
    TotallyBounded (range (fun j => OAI.BFSSRellich.localLp
      (K := Metric.closedBall (0 : X) R) (f j) (f j).continuous)) :=
  core_gradient_l2_local_totallyBounded f A B hA hB R hR

-- Arbitrary indexed families: a first moment suffices globally.
example (f : J → Core (E := X) (F := F)) (A B C : ℝ≥0)
    (hA : ∀ j, ‖gradient μ e (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 μ (f j)‖ ≤ B)
    (hC : ∀ j, (∫ x : X, ‖x‖ * ‖f j x‖^2) ≤ (C : ℝ)) :
    TotallyBounded (range (fun j => toL2 μ (f j))) :=
  core_linear_moment_totallyBounded f A B C hA hB hC

-- The sequence interface for later closure approximation.
example (f : ℕ → Core (E := X) (F := F)) (A B C : ℝ≥0)
    (hA : ∀ n, ‖gradient μ e (f n)‖ ≤ A)
    (hB : ∀ n, ‖toL2 μ (f n)‖ ≤ B)
    (hC : ∀ n, (∫ x : X, ‖x‖ * ‖f n x‖^2) ≤ (C : ℝ)) :
    TotallyBounded (range (fun n => toL2 μ (f n))) :=
  core_linear_moment_totallyBounded f A B C hA hB hC

-- An enlarged moment bound is consumed linearly, not squared.
example (f : J → Core (E := X) (F := F)) (A B C D : ℝ≥0) (hCD : C ≤ D)
    (hA : ∀ j, ‖gradient μ e (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 μ (f j)‖ ≤ B)
    (hC : ∀ j, (∫ x : X, ‖x‖ * ‖f j x‖^2) ≤ (C : ℝ)) :
    TotallyBounded (range (fun j => toL2 μ (f j))) := by
  apply core_linear_moment_totallyBounded f A B D hA hB
  intro j
  exact (hC j).trans (by exact_mod_cast hCD)

open OAI.BFSSQuantum

-- Original SU(2) smooth core: local compactness from its actual real gradient.
example (f : J → SmoothCore 2) (A B : ℝ≥0)
    (hA : ∀ j, ‖gradient (volume : Measure (Boson 2))
      (EuclideanSpace.basisFun (SpaceIndex × ColorIndex 2) ℝ) (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 (volume : Measure (Boson 2)) (f j)‖ ≤ B)
    (R : ℝ) (hR : 0 < R) :
    TotallyBounded (range (fun j => OAI.BFSSRellich.localLp
      (K := Metric.closedBall (0 : Boson 2) R) (f j) (f j).continuous)) :=
  core_gradient_l2_local_totallyBounded f A B hA hB R hR

-- The global result lands in the literal original FullL2 2 space.
example (f : J → SmoothCore 2) (A B C : ℝ≥0)
    (hA : ∀ j, ‖gradient (volume : Measure (Boson 2))
      (EuclideanSpace.basisFun (SpaceIndex × ColorIndex 2) ℝ) (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 (volume : Measure (Boson 2)) (f j)‖ ≤ B)
    (hC : ∀ j, (∫ x : Boson 2, ‖x‖ * ‖f j x‖^2) ≤ (C : ℝ)) :
    TotallyBounded (range (fun j =>
      (toL2 (volume : Measure (Boson 2)) (f j) : FullL2 2))) :=
  core_linear_moment_totallyBounded f A B C hA hB hC

#print axioms OAI.BFSSSliceSobolev.core_gradient_l2_local_totallyBounded
#print axioms OAI.BFSSSliceSobolev.core_linear_moment_totallyBounded
#eval IO.println "SPECTRAL_CORE_LINEAR_MOMENT_AUDIT_OK"
