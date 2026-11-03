import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BQSourceVectorQuadraticIsometry
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

-- Check faithfulness of scalars in the actual source algebra, rather than in a gamma image.
example : Function.Injective (algebraMap ℝ (CliffordAlgebra source9Quadratic)) :=
  FaithfulSMul.algebraMap_injective ℝ (CliffordAlgebra source9Quadratic)

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9Quadratic (source9SpinVectorRepresentation g z) = source9Quadratic z :=
  source9SpinVectorRepresentation_preserves_quadratic g z

-- Recheck that this is the accepted original sum-of-squares/dot-product form.
example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    dotProduct (source9SpinVectorRepresentation g z) (source9SpinVectorRepresentation g z) =
      dotProduct z z := by
  simpa only [source9Quadratic_eq_dot] using
    source9SpinVectorRepresentation_preserves_quadratic g z

example (g : spinGroup source9Quadratic) :
    source9Quadratic.IsometryEquiv source9Quadratic :=
  source9SpinVectorQuadraticIsometryEquiv g

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinVectorQuadraticIsometryEquiv g z = source9SpinVectorRepresentation g z := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    (source9SpinVectorQuadraticIsometryEquiv g).symm z =
      source9SpinVectorRepresentation g⁻¹ z := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic (source9SpinVectorQuadraticIsometryEquiv g z) =
      (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) :=
  source9SpinVectorConjugation_ι g z

-- Check the existing isometry API's identity and trans composition convention explicitly.
example : source9SpinVectorQuadraticIsometryEquiv (1 : spinGroup source9Quadratic) =
    QuadraticMap.IsometryEquiv.refl source9Quadratic := by
  apply DFunLike.ext
  intro z
  change source9SpinVectorConjugation (1 : spinGroup source9Quadratic) z = z
  exact source9SpinVectorConjugation_one z

example (g h : spinGroup source9Quadratic) :
    (source9SpinVectorQuadraticIsometryEquiv h).trans
        (source9SpinVectorQuadraticIsometryEquiv g) =
      source9SpinVectorQuadraticIsometryEquiv (g * h) := by
  apply DFunLike.ext
  intro z
  change source9SpinVectorConjugation g (source9SpinVectorConjugation h z) =
    source9SpinVectorConjugation (g * h) z
  exact (source9SpinVectorConjugation_mul g h z).symm

-- The qualified distinct-plane derivative transfers by exact evaluation.
example (r s : SpaceIndex) (hrs : r ≠ s) (z : SpaceIndex → ℝ) :
    HasDerivAt (fun t : ℝ => source9SpinVectorQuadraticIsometryEquiv
      (source9PlaneSpinCurve r s hrs t) z) ((coordinatePlane9 r s).mulVec z) 0 :=
  source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero r s hrs z

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorRepresentation_preserves_quadratic
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorQuadraticIsometryEquiv

end
