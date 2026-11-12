import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D3OriginalFockColumns

/-!
Independent P3-D3 consumer. Verify inverse evaluation and an injectivity
consequence on actual original Fermion 2 operators, not a surrogate.
-/

set_option autoImplicit false

namespace BFSSP3D3OriginalFockColumnsIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D3OriginalFockColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Prescribed source-Fock columns recover the prescribed values. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (v : ι → Fermion 2) (i : ι) :
    ((originalFockColumns b).symm v) (b i) = v i := by
  have h : originalFockColumns b ((originalFockColumns b).symm v) = v :=
    (originalFockColumns b).apply_symm_apply v
  have hi := congrArg (fun f : ι → Fermion 2 => f i) h
  simpa only [originalFockColumns_apply] using hi

/-- Vanishing of all actual Fock columns forces vanishing of T. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : OriginalFockOp) (h : ∀ i : ι, T (b i) = 0) : T = 0 := by
  apply (originalFockColumns b).injective
  funext i
  simpa only [originalFockColumns_apply, ContinuousLinearMap.zero_apply] using h i

#print axioms FCP.BFSSP3D3OriginalFockColumns.originalFockColumns
#print axioms FCP.BFSSP3D3OriginalFockColumns.originalFockColumns_apply

end
end BFSSP3D3OriginalFockColumnsIndependentConsumer
