import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B4AOriginalFockL2ColumnSurjectivity

/-!
Independent B4A consumer. Use the exact accepted D5B3 isometry and
D5B0 projections, specialize to actual original Boson 2,
without constructing or assuming B4B equivalence.
-/

set_option autoImplicit false

namespace BFSSP3D5B4AOriginalFockL2ColumnSurjectivityIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry
open FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Exact Fock-valued L² column assembly, any measurable base. -/
example (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    ∃ f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ,
      ∀ i : ι, originalFockL2ColumnProjection μ i f = v i :=
  originalFockL2ColumnProjections_jointly_surjective μ v

/-- The accepted D5B3 original Fock isometry is onto. -/
example :
    Function.Surjective
      (originalFockL2ColumnsIsometry μ :
        Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ →ₗᵢ[ℂ]
          PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :=
  originalFockL2ColumnsIsometry_surjective μ

/-- Source-exact relative SU2 original bosonic base, not surrogate. -/
example :
    Function.Surjective
      (originalFockL2ColumnsIsometry (volume : Measure (Boson 2)) :
        Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2
            (volume : Measure (Boson 2)) →ₗᵢ[ℂ]
          PiLp 2 (fun _ : ι =>
            Lp (Fermion 2) 2 (volume : Measure (Boson 2)))) :=
  originalFockL2ColumnsIsometry_surjective (volume : Measure (Boson 2))

#print axioms FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity.originalFockL2ColumnProjections_jointly_surjective
#print axioms FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity.originalFockL2ColumnsIsometry_surjective

end
end BFSSP3D5B4AOriginalFockL2ColumnSurjectivityIndependentConsumer
