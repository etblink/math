import Mathlib.Analysis.Normed.Operator.LinearIsometry
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B4AOriginalFockL2ColumnSurjectivity

/-!
# P3-D5B4B — original Fock finite-column L² linear isometric equivalence

This is strictly the finite PiLp2 original Fermion 2 Hilbert-field
equivalence obtained from the independently qualified B3 linear isometry
and B4A surjectivity. No operator-norm/HS replacement, gauge fixed-space
intertwiner, closed Hamiltonian graph/domain, or spectral claim.

Abstract-first constructor avoids elaborating the original huge Fermion 2
fiber during the generic equivalence implementation.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv
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

/-- Abstract-first promotion of an onto complex linear isometry to
a linear isometric equivalence. -/
private noncomputable def generic_isometry_equiv_of_surjective
    {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F]
    (L : E →ₗᵢ[ℂ] F) (h : Function.Surjective L) :
    E ≃ₗᵢ[ℂ] F :=
  LinearIsometryEquiv.ofSurjective L h

/-- The genuine source Fermion 2 L² field is linearly isometrically
equivalent to the finite PiLp2 family of its individual original-Fock
L² columns. This is not the original operator-norm carrier. -/
noncomputable def originalFockL2ColumnsEquiv :
    Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ ≃ₗᵢ[ℂ]
      PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  generic_isometry_equiv_of_surjective
    (originalFockL2ColumnsIsometry μ)
    (originalFockL2ColumnsIsometry_surjective μ)

/-- The equivalence forward map remains the exact D5B0 source projection. -/
theorem originalFockL2ColumnsEquiv_apply
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) (i : ι) :
    originalFockL2ColumnsEquiv μ f i =
      originalFockL2ColumnProjection μ i f := by
  simpa only [originalFockL2ColumnsEquiv,
    generic_isometry_equiv_of_surjective,
    LinearIsometryEquiv.coe_ofSurjective] using
    (originalFockL2ColumnsIsometry_apply μ f i)

/-- The inverse after the forward map is the identity on source fields. -/
theorem originalFockL2ColumnsEquiv_symm_apply_apply
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    (originalFockL2ColumnsEquiv μ).symm (originalFockL2ColumnsEquiv μ f) = f :=
  (originalFockL2ColumnsEquiv μ).symm_apply_apply f

/-- The forward map after inverse is the identity on finite Fock columns. -/
theorem originalFockL2ColumnsEquiv_apply_symm_apply
    (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    originalFockL2ColumnsEquiv μ ((originalFockL2ColumnsEquiv μ).symm v) = v :=
  (originalFockL2ColumnsEquiv μ).apply_symm_apply v

#print axioms originalFockL2ColumnsEquiv
#print axioms originalFockL2ColumnsEquiv_apply
#print axioms originalFockL2ColumnsEquiv_symm_apply_apply
#print axioms originalFockL2ColumnsEquiv_apply_symm_apply

end
end FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv
