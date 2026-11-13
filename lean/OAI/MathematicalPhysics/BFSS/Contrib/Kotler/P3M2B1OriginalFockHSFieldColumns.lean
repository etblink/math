import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2AOriginalFockHSFiber
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B4BOriginalFockL2ColumnEquiv

/-!
# P3-M2B1 — original-Fock Hilbert–Schmidt finite-column L² field bridge

The source Hilbert–Schmidt fiber is the already qualified transparent
`OriginalFockHSFiber` alias, definitionally equal to finite genuine
`Fermion 2` Hilbert columns. Therefore the accepted B4B L² isometry
equivalence and source coordinate/representative laws are reusable without
replacing the original `Fermion 2 →L[ℂ] Fermion 2` operator norm.

No L² equivalence for the original operator-*norm* space; no measurable
source-operator reconstruction, physical SU(2) fixed space, Spin(9)
continuity, closed Hamiltonian/domain or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2B1OriginalFockHSFieldColumns
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Genuine original HS-column fields have L² membership exactly
when each literal original-Fock column does. -/
theorem originalFockHSField_memLp_iff
    (f : X → OriginalFockHSFiber ι) :
    MemLp f 2 μ ↔ ∀ i : ι, MemLp (fun x => f x i) 2 μ :=
  originalFockHilbertColumnField_memLp_iff μ f

/-- Source-exact HS-fiber L² fields are complex-linearly isometrically
equivalent to the finite family of original Fermion-2 L² columns.
This reuses the qualified B4B isometry, not an operator-norm isometry. -/
noncomputable def originalFockHSFieldColumnsEquiv :
    Lp (OriginalFockHSFiber ι) 2 μ ≃ₗᵢ[ℂ]
      PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  originalFockL2ColumnsEquiv μ

/-- The forward component is exactly the accepted source L² column
projection; no invented pointwise representative is involved. -/
theorem originalFockHSFieldColumnsEquiv_apply
    (f : Lp (OriginalFockHSFiber ι) 2 μ) (i : ι) :
    originalFockHSFieldColumnsEquiv μ f i =
      originalFockL2ColumnProjection μ i f := by
  change originalFockL2ColumnsEquiv μ f i =
    originalFockL2ColumnProjection μ i f
  exact originalFockL2ColumnsEquiv_apply μ f i

/-- The actual L² output column equals original HS-column field
evaluation almost everywhere on the original measurable base. -/
theorem originalFockHSFieldColumnsEquiv_apply_ae
    (f : Lp (OriginalFockHSFiber ι) 2 μ) (i : ι) :
    ((originalFockHSFieldColumnsEquiv μ f i :
      Lp (Fermion 2) 2 μ) : X → Fermion 2) =ᵐ[μ]
        (fun x => f x i) := by
  rw [originalFockHSFieldColumnsEquiv_apply]
  exact originalFockL2ColumnProjection_apply_ae μ i f

/-- Field reconstructed from its full original-Fock columns is
identically the original HS field as an L² class. -/
theorem originalFockHSFieldColumnsEquiv_symm_apply_apply
    (f : Lp (OriginalFockHSFiber ι) 2 μ) :
    (originalFockHSFieldColumnsEquiv μ).symm
      (originalFockHSFieldColumnsEquiv μ f) = f :=
  (originalFockHSFieldColumnsEquiv μ).symm_apply_apply f

/-- Any finite family of genuine original-Fock L² columns can be
reconstructed into an HS field and retrieved exactly. -/
theorem originalFockHSFieldColumnsEquiv_apply_symm_apply
    (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    originalFockHSFieldColumnsEquiv μ
      ((originalFockHSFieldColumnsEquiv μ).symm v) = v :=
  (originalFockHSFieldColumnsEquiv μ).apply_symm_apply v

/-- Isometry uses the separate HS-column Hilbert norm, never the
original continuous-linear-operator norm. -/
theorem originalFockHSFieldColumnsEquiv_norm
    (f : Lp (OriginalFockHSFiber ι) 2 μ) :
    ‖originalFockHSFieldColumnsEquiv μ f‖ = ‖f‖ :=
  (originalFockHSFieldColumnsEquiv μ).norm_map f

#print axioms originalFockHSField_memLp_iff
#print axioms originalFockHSFieldColumnsEquiv
#print axioms originalFockHSFieldColumnsEquiv_apply
#print axioms originalFockHSFieldColumnsEquiv_apply_ae
#print axioms originalFockHSFieldColumnsEquiv_symm_apply_apply
#print axioms originalFockHSFieldColumnsEquiv_apply_symm_apply
#print axioms originalFockHSFieldColumnsEquiv_norm

end
end FCP.BFSSP3M2B1OriginalFockHSFieldColumns
