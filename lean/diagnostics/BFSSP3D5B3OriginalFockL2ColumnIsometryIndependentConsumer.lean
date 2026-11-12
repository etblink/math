import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B3OriginalFockL2ColumnIsometry

/-!
Independent B3 consumer: exact real original-Fock column evaluation,
complex inner preservation, norm preservation, injectivity and original
Boson 2 configuration-base specialization. No surjectivity or physical
spectrum is asserted.
-/

set_option autoImplicit false

namespace BFSSP3D5B3OriginalFockL2ColumnIsometryIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Original Fock column evaluation is not replaced. -/
example (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) (i : ι) :
    originalFockL2ColumnsIsometry μ f i =
      originalFockL2ColumnProjection μ i f :=
  originalFockL2ColumnsIsometry_apply μ f i

/-- Complex cross-Hilbert pairing is preserved by the new linear map. -/
example (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ⟪originalFockL2ColumnsIsometry μ f,
      originalFockL2ColumnsIsometry μ g⟫_ℂ = ⟪f, g⟫_ℂ :=
  (originalFockL2ColumnsIsometry μ).inner_map_map f g

/-- The finite Hilbert-column L² norm is preserved, exactly. -/
example (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ‖originalFockL2ColumnsIsometry μ f‖ = ‖f‖ :=
  (originalFockL2ColumnsIsometry μ).norm_map f

/-- Equality of all mapped columns implies equality of source fields. -/
example (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ)
    (h : originalFockL2ColumnsIsometry μ f =
      originalFockL2ColumnsIsometry μ g) :
    f = g :=
  (originalFockL2ColumnsIsometry μ).injective h

/-- Exact original relative SU2 bosonic base Boson 2. -/
example
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2
      (volume : Measure (Boson 2))) :
    ‖originalFockL2ColumnsIsometry (volume : Measure (Boson 2)) f‖ = ‖f‖ :=
  (originalFockL2ColumnsIsometry (volume : Measure (Boson 2))).norm_map f

#print axioms FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry.originalFockL2ColumnsLinear
#print axioms FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry.originalFockL2ColumnsLinear_apply
#print axioms FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry.originalFockL2ColumnsLinear_inner
#print axioms FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry.originalFockL2ColumnsIsometry
#print axioms FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry.originalFockL2ColumnsIsometry_apply

end
end BFSSP3D5B3OriginalFockL2ColumnIsometryIndependentConsumer
