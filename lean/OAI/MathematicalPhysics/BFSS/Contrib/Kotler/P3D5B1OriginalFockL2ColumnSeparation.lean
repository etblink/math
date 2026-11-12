import Mathlib.Order.Filter.Finite
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B0OriginalFockL2Columns

/-!
# P3-D5B1 — original-Fock finite L² columns jointly separate the field

No L² field information is lost by taking all finite Hilbert columns.
First prove the abstract finite a.e. separation lemma, then reuse the
source-exact D5B0 column projections on actual Fermion 2. The result
provides injectivity, not yet the isometric finite-direct-sum equivalence.

No new gauge representation, physical invariant subspace,
unbounded Hamiltonian graph/domain, or spectral statement.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B1OriginalFockL2ColumnSeparation
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Generic finite-coordinate a.e. equality suffices for L² equality.
This prevents reduction of the original 48-Majorana source carrier. -/
private theorem generic_finite_l2_eq_of_coordinates_eq
    {E : Type*} [NormedAddCommGroup E]
    (f g : Lp (PiLp 2 (fun _ : ι => E)) 2 μ)
    (h : ∀ i : ι, (fun x => f x i) =ᵐ[μ] fun x => g x i) :
    f = g := by
  apply Lp.ext
  have hall : ∀ᵐ x ∂μ, ∀ i : ι, f x i = g x i :=
    Filter.eventually_all.mpr h
  filter_upwards [hall] with x hx
  exact PiLp.ext (fun i => hx i)

/-- A genuine original-Fock Hilbert-column L² field is determined
uniquely by all of its D5B0 continuous L² coordinate projections. -/
theorem originalFockL2ColumnProjections_jointly_injective
    (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ)
    (h : ∀ i : ι,
      originalFockL2ColumnProjection μ i f =
        originalFockL2ColumnProjection μ i g) :
    f = g := by
  apply generic_finite_l2_eq_of_coordinates_eq μ f g
  intro i
  have hf := originalFockL2ColumnProjection_apply_ae μ i f
  have hg := originalFockL2ColumnProjection_apply_ae μ i g
  filter_upwards [hf, hg] with x hfx hgx
  calc
    f x i = (originalFockL2ColumnProjection μ i f : X → Fermion 2) x := hfx.symm
    _ = (originalFockL2ColumnProjection μ i g : X → Fermion 2) x := by rw [h i]
    _ = g x i := hgx

#print axioms originalFockL2ColumnProjections_jointly_injective

end
end FCP.BFSSP3D5B1OriginalFockL2ColumnSeparation
