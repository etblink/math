import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B1OriginalFockL2ColumnSeparation

/-!
Independent D5B1 consumer. Verifies exact physical-Fock columns distinguish
all genuine L² fields, including the original SU(2) bosonic configuration
base. Does not assert a surjective or isometric direct-sum equivalence.
-/

set_option autoImplicit false

namespace BFSSP3D5B1OriginalFockL2ColumnSeparationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B1OriginalFockL2ColumnSeparation
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Arbitrary original-Fock L² fields are separated by all columns. -/
example (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ)
    (h : ∀ i : ι,
      originalFockL2ColumnProjection μ i f =
        originalFockL2ColumnProjection μ i g) :
    f = g :=
  originalFockL2ColumnProjections_jointly_injective μ f g h

/-- No nonzero original-Fock Hilbert-column field has every column zero. -/
example (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ)
    (h : ∀ i : ι, originalFockL2ColumnProjection μ i f = 0) :
    f = 0 := by
  apply originalFockL2ColumnProjections_jointly_injective μ f 0
  intro i
  simpa using h i

/-- Equality is detected by the finite Fock L² coordinate family. -/
example (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    f = g ↔ ∀ i : ι,
      originalFockL2ColumnProjection μ i f =
        originalFockL2ColumnProjection μ i g := by
  constructor
  · intro h i
    rw [h]
  · exact originalFockL2ColumnProjections_jointly_injective μ f g

/-- Exact physical bosonic base, without an artificial configuration type. -/
example
    (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2
      (volume : Measure (Boson 2)))
    (h : ∀ i : ι,
      originalFockL2ColumnProjection (volume : Measure (Boson 2)) i f =
        originalFockL2ColumnProjection (volume : Measure (Boson 2)) i g) :
    f = g :=
  originalFockL2ColumnProjections_jointly_injective
    (volume : Measure (Boson 2)) f g h

#print axioms FCP.BFSSP3D5B1OriginalFockL2ColumnSeparation.originalFockL2ColumnProjections_jointly_injective

end
end BFSSP3D5B1OriginalFockL2ColumnSeparationIndependentConsumer
