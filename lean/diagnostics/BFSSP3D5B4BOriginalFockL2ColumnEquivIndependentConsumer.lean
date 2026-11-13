import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5B4BOriginalFockL2ColumnEquiv

/-!
Independent B4B consumer: the accepted original source-Fock Hilbert-field
carrier and original Boson 2 base, with forward and two inverse laws.
No gauge, HS operator fiber, H_phys closed domain or spectrum.
-/

set_option autoImplicit false

namespace BFSSP3D5B4BOriginalFockL2ColumnEquivIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5B0OriginalFockL2Columns
open FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

example : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ ≃ₗᵢ[ℂ]
    PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  originalFockL2ColumnsEquiv μ

example (f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ) (i : ι) :
    originalFockL2ColumnsEquiv μ f i =
      originalFockL2ColumnProjection μ i f :=
  originalFockL2ColumnsEquiv_apply μ f i

example (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    originalFockL2ColumnsEquiv μ ((originalFockL2ColumnsEquiv μ).symm v) = v :=
  originalFockL2ColumnsEquiv_apply_symm_apply μ v

example : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2
      (volume : Measure (Boson 2)) ≃ₗᵢ[ℂ]
    PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :=
  originalFockL2ColumnsEquiv (volume : Measure (Boson 2))

#print axioms FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv.originalFockL2ColumnsEquiv
#print axioms FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv.originalFockL2ColumnsEquiv_apply
#print axioms FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv.originalFockL2ColumnsEquiv_symm_apply_apply
#print axioms FCP.BFSSP3D5B4BOriginalFockL2ColumnEquiv.originalFockL2ColumnsEquiv_apply_symm_apply

end
end BFSSP3D5B4BOriginalFockL2ColumnEquivIndependentConsumer
