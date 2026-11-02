import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

example : Function.Injective (CliffordAlgebra.ι source9Quadratic :
    (SpaceIndex → ℝ) → CliffordAlgebra source9Quadratic) :=
  source9CliffordVectorEmbedding_injective

-- Check the full real-linear carrier and exact conjugation evaluation.
example (g : spinGroup source9Quadratic) :
    (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ) :=
  source9SpinVectorLinearMap g

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorLinearMap g z = source9SpinVectorConjugation g z := rfl

example (z : SpaceIndex → ℝ) :
    source9SpinVectorConjugation (1 : spinGroup source9Quadratic) z = z :=
  source9SpinVectorConjugation_one z

example (g h : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorConjugation (g * h) z =
      source9SpinVectorConjugation g (source9SpinVectorConjugation h z) :=
  source9SpinVectorConjugation_mul g h z

-- Expose Representation as the actual monoid homomorphism into nine-vector endomorphisms.
example : spinGroup source9Quadratic →* Module.End ℝ (SpaceIndex → ℝ) :=
  source9SpinVectorRepresentation

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorRepresentation g z = source9SpinVectorConjugation g z := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic (source9SpinVectorRepresentation g z) =
      (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) :=
  source9SpinVectorConjugation_ι g z

-- Verify both inverse identities through the existing generic group-representation infrastructure.
example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorRepresentation g⁻¹ (source9SpinVectorRepresentation g z) = z :=
  Representation.inv_self_apply source9SpinVectorRepresentation g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorRepresentation g (source9SpinVectorRepresentation g⁻¹ z) = z :=
  Representation.self_inv_apply source9SpinVectorRepresentation g z

-- The accepted actual nine-vector derivative transfers to the bundle by exact evaluation.
example (r s : SpaceIndex) (hrs : r ≠ s) (z : SpaceIndex → ℝ) :
    HasDerivAt (fun t : ℝ => source9SpinVectorRepresentation
      (source9PlaneSpinCurve r s hrs t) z) ((coordinatePlane9 r s).mulVec z) 0 :=
  source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero r s hrs z

#print axioms FCP.BFSSPairedSpin9Clifford.source9CliffordVectorEmbedding_injective
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorLinearMap
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorConjugation_one
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorConjugation_mul
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorRepresentation

end
