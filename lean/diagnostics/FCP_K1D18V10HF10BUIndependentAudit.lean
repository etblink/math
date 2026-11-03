import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BUAmbientVectorActionSmoothness
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open scoped ContDiff
noncomputable section

-- Reconstruct the accepted PBW norm from the actual source basis and finite-coordinate adapter.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPBWCoordinates

example : source9PBWCoordinates = auditPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective := rfl

example :
    CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9CliffordReverseCLM
example : (SpaceIndex → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9VectorEmbeddingCLM
example : CliffordAlgebra source9Quadratic →L[ℝ] (SpaceIndex → ℝ) :=
  source9VectorProjectionCLM

-- Each bundled map must be the exact original linear map under the reconstructed PBW norm.
example (a : CliffordAlgebra source9Quadratic) :
    source9CliffordReverseCLM a = CliffordAlgebra.reverse a := rfl
example (z : SpaceIndex → ℝ) :
    source9VectorEmbeddingCLM z = CliffordAlgebra.ι source9Quadratic z := rfl
example (a : CliffordAlgebra source9Quadratic) :
    source9VectorProjectionCLM a = source9CliffordVectorProjection a := rfl

example (a : CliffordAlgebra source9Quadratic) (z : SpaceIndex → ℝ) :
    source9AmbientVectorConjugation a z =
      source9CliffordVectorProjection
        (a * CliffordAlgebra.ι source9Quadratic z * CliffordAlgebra.reverse a) := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9AmbientVectorConjugation (g : CliffordAlgebra source9Quadratic) z =
      source9SpinVectorConjugation g z :=
  source9AmbientVectorConjugation_eq_spin g z

-- Control against the literal inverse-coercion formula of the actual source group.
example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9AmbientVectorConjugation (g : CliffordAlgebra source9Quadratic) z =
      source9CliffordVectorProjection
        ((g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
          ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)) :=
  source9AmbientVectorConjugation_eq_spin g z

example (n : ℕ∞ω) :
    ContDiff ℝ n
      (fun az : CliffordAlgebra source9Quadratic × (SpaceIndex → ℝ) =>
        source9AmbientVectorConjugation az.1 az.2) :=
  source9AmbientVectorConjugation_contDiff_pbw n

-- Restate joint smoothness with the actual algebraic formula, without the ambient wrapper.
example (n : ℕ∞ω) :
    ContDiff ℝ n
      (fun az : CliffordAlgebra source9Quadratic × (SpaceIndex → ℝ) =>
        source9CliffordVectorProjection
          (az.1 * CliffordAlgebra.ι source9Quadratic az.2 *
            CliffordAlgebra.reverse az.1)) :=
  source9AmbientVectorConjugation_contDiff_pbw n

#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordReverseCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9VectorEmbeddingCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9VectorProjectionCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9AmbientVectorConjugation
#print axioms FCP.BFSSPairedSpin9Clifford.source9AmbientVectorConjugation_eq_spin
#print axioms FCP.BFSSPairedSpin9Clifford.source9AmbientVectorConjugation_contDiff_pbw

end
