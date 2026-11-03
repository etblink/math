import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BRSourceVectorOrthogonalHom
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

example (g : spinGroup source9Quadratic) (z w : SpaceIndex → ℝ) :
    dotProduct (source9SpinVectorRepresentation g z) (source9SpinVectorRepresentation g w) =
      dotProduct z w :=
  source9SpinVectorRepresentation_preserves_dotProduct g z w

example : spinGroup source9Quadratic →* Matrix SpaceIndex SpaceIndex ℝ :=
  source9SpinVectorMatrixHom

-- Literal column ordering and unit normalization, independent of any alternate basis.
example (g : spinGroup source9Quadratic) (i j : SpaceIndex) :
    source9SpinVectorMatrixHom g i j =
      source9SpinVectorRepresentation g (Pi.single j 1) i := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    (source9SpinVectorMatrixHom g).mulVec z = source9SpinVectorRepresentation g z :=
  source9SpinVectorMatrixHom_mulVec g z

example (g : spinGroup source9Quadratic) :
    source9SpinVectorMatrixHom g ∈ Matrix.orthogonalGroup SpaceIndex ℝ :=
  source9SpinVectorMatrixHom_mem_orthogonalGroup g

example : spinGroup source9Quadratic →* Matrix.orthogonalGroup SpaceIndex ℝ :=
  source9SpinVectorOrthogonalHom

example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      source9SpinVectorMatrixHom g := rfl

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z =
      source9SpinVectorRepresentation g z :=
  source9SpinVectorOrthogonalHom_mulVec g z

-- Verify the concrete transpose orthogonality criterion in the exact original-nine target.
example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).transpose *
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  (Matrix.mem_orthogonalGroup_iff' SpaceIndex ℝ
    (A := ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ))).mp
      (source9SpinVectorOrthogonalHom g).property

example :
    ((source9SpinVectorOrthogonalHom (1 : spinGroup source9Quadratic)) :
      Matrix SpaceIndex SpaceIndex ℝ) = 1 :=
  congrArg (fun M : Matrix.orthogonalGroup SpaceIndex ℝ =>
    (M : Matrix SpaceIndex SpaceIndex ℝ)) (map_one source9SpinVectorOrthogonalHom)

example (g h : spinGroup source9Quadratic) :
    ((source9SpinVectorOrthogonalHom (g * h)) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) *
        ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) :=
  congrArg (fun M : Matrix.orthogonalGroup SpaceIndex ℝ =>
    (M : Matrix SpaceIndex SpaceIndex ℝ)) (map_mul source9SpinVectorOrthogonalHom g h)

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic
        (((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z) =
      (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) := by
  rw [source9SpinVectorOrthogonalHom_mulVec]
  exact source9SpinVectorConjugation_ι g z

-- Recheck the accepted derivative on every vector through the orthogonal homomorphism.
example (r s : SpaceIndex) (hrs : r ≠ s) (z : SpaceIndex → ℝ) :
    HasDerivAt (fun t : ℝ =>
      ((source9SpinVectorOrthogonalHom (source9PlaneSpinCurve r s hrs t)) :
        Matrix SpaceIndex SpaceIndex ℝ).mulVec z) ((coordinatePlane9 r s).mulVec z) 0 := by
  have heq :
      (fun t : ℝ =>
        ((source9SpinVectorOrthogonalHom (source9PlaneSpinCurve r s hrs t)) :
          Matrix SpaceIndex SpaceIndex ℝ).mulVec z) =
      (fun t : ℝ => source9SpinVectorRepresentation (source9PlaneSpinCurve r s hrs t) z) := by
    funext t
    exact source9SpinVectorOrthogonalHom_mulVec (source9PlaneSpinCurve r s hrs t) z
  rw [heq]
  exact source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero r s hrs z

#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorRepresentation_preserves_dotProduct
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorMatrixHom
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorMatrixHom_mulVec
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorMatrixHom_mem_orthogonalGroup
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorOrthogonalHom
#print axioms FCP.BFSSPairedSpin9Clifford.source9SpinVectorOrthogonalHom_mulVec

end
