import Mathlib.MeasureTheory.SpecificCodomains.WithLp
import Mathlib.MeasureTheory.Function.L2Space
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5AOriginalFockHilbertColumns

/-!
# P3-D5B0 — genuine original-Fock Hilbert columns in L²

First finite-L² gate: exact source Fermion 2 Hilbert-column fields
have MemLp iff each column does; coordinate L² evaluation is a
continuous linear map with correct almost-everywhere meaning.

This module deliberately does NOT identify original operator-valued L²,
carry the original gauge-physical fixed space, assert a closed Hamiltonian
domain/graph identity, or prove any spectral existence statement.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5B0OriginalFockL2Columns
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

/-- Generic finite Hilbert-family integrability, elaborated before
specialization to the original large physical Fock carrier. -/
private theorem generic_finite_piLp_two_memLp_iff
    {E : Type*} [NormedAddCommGroup E]
    (f : X → PiLp 2 (fun _ : ι => E)) :
    MemLp f 2 μ ↔ ∀ i : ι, MemLp (fun x => f x i) 2 μ := by
  exact memLp_piLp_iff

/-- Source-exact original Fock Hilbert-column field lies in L²
if and only if every actual Fock-valued column does. -/
theorem originalFockHilbertColumnField_memLp_iff
    (f : X → PiLp 2 (fun _ : ι => Fermion 2)) :
    MemLp f 2 μ ↔ ∀ i : ι, MemLp (fun x => f x i) 2 μ :=
  generic_finite_piLp_two_memLp_iff μ f

/-- Each original-Fock Hilbert column is extracted from L² as a
continuous complex-linear map, using genuine finite PiLp evaluation. -/
noncomputable def originalFockL2ColumnProjection (i : ι) :
    Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ →L[ℂ]
      Lp (Fermion 2) 2 μ :=
  (PiLp.proj (p := 2) (β := fun _ : ι => Fermion 2)
    (𝕜 := ℂ) i).compLpL 2 μ

/-- The projected L² field equals original-Fock column evaluation
almost everywhere; no choice of a pointwise L² representative is used. -/
theorem originalFockL2ColumnProjection_apply_ae
    (i : ι)
    (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) :
    (originalFockL2ColumnProjection μ i f : X → Fermion 2) =ᵐ[μ]
      (fun x => f x i) := by
  exact (PiLp.proj (p := 2) (β := fun _ : ι => Fermion 2)
    (𝕜 := ℂ) i).coeFn_compLpL f

#print axioms originalFockHilbertColumnField_memLp_iff
#print axioms originalFockL2ColumnProjection
#print axioms originalFockL2ColumnProjection_apply_ae

end
end FCP.BFSSP3D5B0OriginalFockL2Columns
