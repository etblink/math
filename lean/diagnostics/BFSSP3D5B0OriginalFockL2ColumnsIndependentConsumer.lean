import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B0OriginalFockL2Columns

/-!
Independent D5B0 consumer. Tests iff direction separately and a.e. column
projection on the ACTUAL Fermion 2 carrier and original Boson 2 base.
-/

set_option autoImplicit false

namespace BFSSP3D5B0OriginalFockL2ColumnsIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Genuine Fock-column L² integrability yields all column integrability. -/
example (f : X → PiLp 2 (fun _ : ι => Fermion 2))
    (h : MemLp f 2 μ) (i : ι) :
    MemLp (fun x => f x i) 2 μ :=
  (originalFockHilbertColumnField_memLp_iff μ f).mp h i

/-- Independently reconstruct finite-column L² membership. -/
example (f : X → PiLp 2 (fun _ : ι => Fermion 2))
    (h : ∀ i : ι, MemLp (fun x => f x i) 2 μ) :
    MemLp f 2 μ :=
  (originalFockHilbertColumnField_memLp_iff μ f).mpr h

/-- Original Fermion2 column projections agree almost everywhere. -/
example (i : ι) (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    (originalFockL2ColumnProjection μ i f : X → Fermion 2) =ᵐ[μ]
      (fun x => f x i) :=
  originalFockL2ColumnProjection_apply_ae μ i f

/-- Explicit original SU2 bosonic configuration base. -/
example (f : Boson 2 → PiLp 2 (fun _ : ι => Fermion 2)) :
    MemLp f 2 (volume : Measure (Boson 2)) ↔
      ∀ i : ι, MemLp (fun x => f x i) 2
        (volume : Measure (Boson 2)) :=
  originalFockHilbertColumnField_memLp_iff
    (volume : Measure (Boson 2)) f

#print axioms FCP.BFSSP3D5B0OriginalFockL2Columns.originalFockHilbertColumnField_memLp_iff
#print axioms FCP.BFSSP3D5B0OriginalFockL2Columns.originalFockL2ColumnProjection
#print axioms FCP.BFSSP3D5B0OriginalFockL2Columns.originalFockL2ColumnProjection_apply_ae

end
end BFSSP3D5B0OriginalFockL2ColumnsIndependentConsumer
