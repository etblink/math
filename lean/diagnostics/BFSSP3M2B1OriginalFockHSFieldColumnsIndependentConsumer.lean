import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B1OriginalFockHSFieldColumns

/-!
Independent P3-M2B1 source consumer: source HS fiber and its Fock-vector
columns, genuine Boson-2 base, actual canonical Fermion-2 basis,
representative-a.e. law, both inverse laws, and norm identity.
Nothing is claimed for the original operator-norm L² or physical H.
-/
set_option autoImplicit false
namespace BFSSP3M2B1OriginalFockHSFieldColumnsIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B1OriginalFockHSFieldColumns
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable {X : Type*} [MeasurableSpace X]
variable (μ : Measure X)

example (f : X → OriginalFockHSFiber ι) :
    MemLp f 2 μ ↔ ∀ i : ι, MemLp (fun x => f x i) 2 μ :=
  originalFockHSField_memLp_iff μ f

example : Lp (OriginalFockHSFiber ι) 2 μ ≃ₗᵢ[ℂ]
    PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ) :=
  originalFockHSFieldColumnsEquiv μ

example (f : Lp (OriginalFockHSFiber ι) 2 μ) (i : ι) :
    ((originalFockHSFieldColumnsEquiv μ f i :
      Lp (Fermion 2) 2 μ) : X → Fermion 2) =ᵐ[μ]
        (fun x => f x i) :=
  originalFockHSFieldColumnsEquiv_apply_ae μ f i

example (f : Lp (OriginalFockHSFiber ι) 2 μ) :
    (originalFockHSFieldColumnsEquiv μ).symm
      (originalFockHSFieldColumnsEquiv μ f) = f :=
  originalFockHSFieldColumnsEquiv_symm_apply_apply μ f

example (v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)) :
    originalFockHSFieldColumnsEquiv μ
      ((originalFockHSFieldColumnsEquiv μ).symm v) = v :=
  originalFockHSFieldColumnsEquiv_apply_symm_apply μ v

example (f : Lp (OriginalFockHSFiber ι) 2 μ) :
    ‖originalFockHSFieldColumnsEquiv μ f‖ = ‖f‖ :=
  originalFockHSFieldColumnsEquiv_norm μ f

/-- Explicit genuine source Fock occupation-space basis, not merely
an arbitrary hypothesized basis for an auxiliary model. -/
private abbrev OriginalFockBasisIndex :=
  Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockBasisIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockBasisIndex ℂ

/-- The already-qualified source HS-to-operator reconstruction really
evaluates at this literal original-Fock orthonormal basis. -/
example (u : OriginalFockHSFiber OriginalFockBasisIndex)
    (i : OriginalFockBasisIndex) :
    (originalFockHSFiberToOperator
      (EuclideanSpace.basisFun OriginalFockBasisIndex ℂ) u)
      ((EuclideanSpace.basisFun OriginalFockBasisIndex ℂ) i) = u i :=
  originalFockHSFiberToOperator_apply
    (EuclideanSpace.basisFun OriginalFockBasisIndex ℂ) u i

/-- Independent original Boson-2 volume and genuine Fermion-2 fibers. -/
example : Lp (OriginalFockHSFiber OriginalFockBasisIndex) 2
    (volume : Measure (Boson 2)) ≃ₗᵢ[ℂ]
    PiLp 2 (fun _ : OriginalFockBasisIndex =>
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :=
  originalFockHSFieldColumnsEquiv (volume : Measure (Boson 2))

example (f : Lp (OriginalFockHSFiber OriginalFockBasisIndex) 2
      (volume : Measure (Boson 2))) (i : OriginalFockBasisIndex) :
    ((originalFockHSFieldColumnsEquiv (volume : Measure (Boson 2))
      f i : Lp (Fermion 2) 2 (volume : Measure (Boson 2)))
      : Boson 2 → Fermion 2) =ᵐ[volume] (fun x => f x i) :=
  originalFockHSFieldColumnsEquiv_apply_ae
    (volume : Measure (Boson 2)) f i

#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSField_memLp_iff
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply_ae
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_symm_apply_apply
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply_symm_apply
#print axioms FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_norm

end
end BFSSP3M2B1OriginalFockHSFieldColumnsIndependentConsumer
