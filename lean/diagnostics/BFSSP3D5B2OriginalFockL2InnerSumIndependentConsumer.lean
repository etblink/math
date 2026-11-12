import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B2OriginalFockL2InnerSum

/-!
P3-D5B2 independent consumer: cross pairing, diagonal pairing and
original Boson 2 configuration-space specialization, all using the
exact source Fermion 2 and accepted B0 continuous projections.
-/

set_option autoImplicit false

namespace BFSSP3D5B2OriginalFockL2InnerSumIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B2OriginalFockL2InnerSum
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Exact complex cross-pairing from all original-Fock columns. -/
example (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ⟪f, g⟫_ℂ = ∑ i : ι,
      ⟪originalFockL2ColumnProjection μ i f,
        originalFockL2ColumnProjection μ i g⟫_ℂ :=
  originalFockL2_inner_eq_sum_columns μ f g

/-- The diagonal original-Fock L² pairing splits as a finite sum. -/
example (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ⟪f, f⟫_ℂ = ∑ i : ι,
      ⟪originalFockL2ColumnProjection μ i f,
        originalFockL2ColumnProjection μ i f⟫_ℂ :=
  originalFockL2_inner_eq_sum_columns μ f f

/-- Actual original bosonic configuration base, not a substitute. -/
example
    (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2
      (volume : Measure (Boson 2))) :
    ⟪f, g⟫_ℂ = ∑ i : ι,
      ⟪originalFockL2ColumnProjection (volume : Measure (Boson 2)) i f,
        originalFockL2ColumnProjection (volume : Measure (Boson 2)) i g⟫_ℂ :=
  originalFockL2_inner_eq_sum_columns (volume : Measure (Boson 2)) f g

#print axioms FCP.BFSSP3D5B2OriginalFockL2InnerSum.originalFockL2_inner_eq_sum_columns

end
end BFSSP3D5B2OriginalFockL2InnerSumIndependentConsumer
