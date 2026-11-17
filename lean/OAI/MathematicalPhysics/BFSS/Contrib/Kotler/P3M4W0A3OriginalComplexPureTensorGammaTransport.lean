import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A2OriginalRealCliffordGammaTransport

/-!
# BFSS × QIT × SCC W0A3 — pure complex tensor source generator

A single exact pure-tensor scalar bridge on the real 48-source
complex Clifford algebra and original 24-mode Fermion 2 Fock space.
No assertion about arbitrary sums of complex tensors, full
Clifford generation, commutant, trace or physical BFSS.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A3OriginalComplexPureTensorGammaTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48RealLinearGamma
open scoped TensorProduct

/-- The actual original complex Clifford/Fock equivalence maps
each pure complexified source vector z tensor v to z times the
active original real-vector Fock Majorana. -/
theorem originalComplexEquiv_pureTensorGenerator_eq_activeGamma
    (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v := by
  have htmul : (z ⊗ₜ[ℝ] v : ℂ ⊗[ℝ] Source48Vector) =
      z • (1 ⊗ₜ[ℝ] v) := by
    simp only [TensorProduct.smul_tmul', smul_eq_mul, mul_one]
  calc
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (z ⊗ₜ[ℝ] v)) =
        FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (z • (1 ⊗ₜ[ℝ] v))) := by
      rw [htmul]
    _ = z •
        FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v)) := by
      rw [map_smul, map_smul]
    _ = z • sourceGammaRealLinear v := by
      rw [FCP.BFSSP3M4W0A2OriginalRealCliffordGammaTransport.originalComplexEquiv_realGenerator_eq_activeGamma]

#print axioms originalComplexEquiv_pureTensorGenerator_eq_activeGamma

end
end FCP.BFSSP3M4W0A3OriginalComplexPureTensorGammaTransport
