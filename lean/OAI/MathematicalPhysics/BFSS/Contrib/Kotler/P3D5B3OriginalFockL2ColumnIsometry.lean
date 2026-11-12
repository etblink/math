import Mathlib.Analysis.InnerProductSpace.LinearMap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B2OriginalFockL2InnerSum

/-!
# P3-D5B3 — original Fock finite-column L² isometric embedding

Construct the actual complex linear map from L² of original
Fermion 2 finite Hilbert columns to finite PiLp 2 of the original
Fock-valued L² columns. The accepted B2 inner-product equality
promotes it to an honest linear isometry.

The map is not yet shown surjective (therefore not a LinearIsometryEquiv).
No norm on the original operator-norm carrier is altered.
No physical gauge action, closed Hamiltonian graph or eigenpair claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry
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

/-- Assemble the actual source-Fock L² continuous column projections
into a linear map valued in the correctly normed finite PiLp 2 carrier. -/
noncomputable def originalFockL2ColumnsLinear :
    Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ →ₗ[ℂ]
      PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  (WithLp.linearEquiv 2 ℂ (ι → Lp (Fermion 2) 2 μ)).symm.toLinearMap.comp
    (LinearMap.pi
      (fun i : ι => (originalFockL2ColumnProjection μ i).toLinearMap))

/-- The i-th image column is exactly the source-accepted D5B0
continuous projection; no new representative choices occur. -/
theorem originalFockL2ColumnsLinear_apply
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) (i : ι) :
    originalFockL2ColumnsLinear μ f i =
      originalFockL2ColumnProjection μ i f := by
  rfl

/-- The full complex L² pairing equals the ordinary PiLp 2 Hilbert
pairing of the assembled genuine Fock columns. -/
theorem originalFockL2ColumnsLinear_inner
    (f g : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    ⟪originalFockL2ColumnsLinear μ f,
      originalFockL2ColumnsLinear μ g⟫_ℂ = ⟪f, g⟫_ℂ := by
  simpa only [PiLp.inner_apply, originalFockL2ColumnsLinear_apply] using
    (originalFockL2_inner_eq_sum_columns μ f g).symm

/-- Genuine source-exact original-Fock linear isometry from L² of finite
Hilbert-column fields into finite PiLp 2 of the individual Fock L² fields. -/
noncomputable def originalFockL2ColumnsIsometry :
    Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ →ₗᵢ[ℂ]
      PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  (originalFockL2ColumnsLinear μ).isometryOfInner
    (originalFockL2ColumnsLinear_inner μ)

/-- The isometric embedding still evaluates to exactly the accepted
source D5B0 column L² projections. -/
theorem originalFockL2ColumnsIsometry_apply
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) (i : ι) :
    originalFockL2ColumnsIsometry μ f i =
      originalFockL2ColumnProjection μ i f := by
  rfl

#print axioms originalFockL2ColumnsLinear
#print axioms originalFockL2ColumnsLinear_apply
#print axioms originalFockL2ColumnsLinear_inner
#print axioms originalFockL2ColumnsIsometry
#print axioms originalFockL2ColumnsIsometry_apply

end
end FCP.BFSSP3D5B3OriginalFockL2ColumnIsometry
