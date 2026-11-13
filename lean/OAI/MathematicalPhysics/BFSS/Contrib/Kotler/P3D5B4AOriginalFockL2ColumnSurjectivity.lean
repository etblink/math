import Mathlib.MeasureTheory.SpecificCodomains.WithLp
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B3OriginalFockL2ColumnIsometry

/-!
# P3-D5B4A — original source-Fock finite L² column surjectivity

Given finitely many genuine Fock-valued L² columns, construct their
pointwise PiLp 2 field, prove MemLp by accepted finite-coordinate
integrability, and recover every L² column via accepted D5B0
a.e. coordinate projection. Source-exact specialization uses Fermion 2;
independent consumer includes actual Boson 2.

Only SURJECTIVITY is proved here. Do not construct a full
LinearIsometryEquiv until separately qualified B4B. No operator norm/HS,
physical SU2 fixed space, closed Hamiltonian form/graph, or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Abstract-first finite-coordinate L² assembly. Work at a generic
normed carrier before instantiating the enormous source Fock fiber.
No pointwise choice beyond the canonical Lp representatives is made. -/
private theorem generic_finite_piLp_L2_assembly
    {E : Type*} [NormedAddCommGroup E]
    (v : PiLp 2 (fun _ : ι => Lp E 2 μ)) :
    ∃ f : Lp (PiLp 2 (fun _ : ι => E)) 2 μ,
      ∀ i : ι, (fun x => f x i) =ᵐ[μ] (v i : X → E) := by
  let g : X → PiLp 2 (fun _ : ι => E) :=
    fun x => WithLp.toLp 2 (fun i : ι => (v i : X → E) x)
  have hg : MemLp g 2 μ := by
    apply MemLp.of_eval_piLp
    intro i
    change MemLp (fun x => (v i : X → E) x) 2 μ
    exact Lp.memLp (v i)
  refine ⟨hg.toLp g, ?_⟩
  intro i
  filter_upwards [hg.coeFn_toLp] with x hx
  calc
    (hg.toLp g : X → PiLp 2 (fun _ : ι => E)) x i = g x i :=
      congrArg (fun z : PiLp 2 (fun _ : ι => E) => z i) hx
    _ = (v i : X → E) x := rfl

/-- Every finite family of *original* Fermion 2 L² columns
is represented by the accepted source D5B0 projections of an L²
field whose target is genuine PiLp 2 of the same Fock fiber. -/
theorem originalFockL2ColumnProjections_jointly_surjective
    (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    ∃ f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ,
      ∀ i : ι, originalFockL2ColumnProjection μ i f = v i := by
  obtain ⟨f, h⟩ := generic_finite_piLp_L2_assembly μ v
  refine ⟨f, ?_⟩
  intro i
  apply Lp.ext
  exact (originalFockL2ColumnProjection_apply_ae μ i f).trans (h i)

/-- True surjectivity of the qualified D5B3 source-Fock
complex-linear isometric column embedding. An isometric *equivalence*
will be constructed in a separate, later B4B gate. -/
theorem originalFockL2ColumnsIsometry_surjective :
    Function.Surjective
      (originalFockL2ColumnsIsometry μ :
        Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ →ₗᵢ[ℂ]
          PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) := by
  intro v
  obtain ⟨f, h⟩ := originalFockL2ColumnProjections_jointly_surjective μ v
  refine ⟨f, PiLp.ext (fun i => ?_)⟩
  simpa only [originalFockL2ColumnsIsometry_apply] using h i

#print axioms originalFockL2ColumnProjections_jointly_surjective
#print axioms originalFockL2ColumnsIsometry_surjective

end
end FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity
