import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineOrientation

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineLipschitz
open FCP.BFSSSourceNineOrientation Matrix

example (a z : SpaceIndex → ℝ) :
    QuadraticMap.polar source9Quadratic a z = 2 * (a ⬝ᵥ z) :=
  source9Quadratic_polar_dot a z

example (a z : SpaceIndex → ℝ) [Invertible (source9Quadratic a)] :
    source9NormalizedPolarRow a ⬝ᵥ z =
      ⅟(source9Quadratic a) * QuadraticMap.polar source9Quadratic a z :=
  source9NormalizedPolarRow_dot a z

example (a : SpaceIndex → ℝ) [Invertible (source9Quadratic a)] :
    source9NormalizedPolarRow a ⬝ᵥ a = (2 : ℝ) :=
  source9NormalizedPolarRow_dot_self a

example (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    lipschitzGroup source9Quadratic := source9GeneratorLipschitzUnit a

example (a ell z : SpaceIndex → ℝ) :
    source9RankOneConjugationMatrix a ell *ᵥ z = (ell ⬝ᵥ z) • a - z :=
  source9RankOneConjugationMatrix_mulVec a ell z

example (a ell : SpaceIndex → ℝ) (h : ell ⬝ᵥ a = (2 : ℝ)) :
    (source9RankOneConjugationMatrix a ell).det = (1 : ℝ) :=
  source9RankOneConjugationMatrix_det_one a ell h

example (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    (source9LipschitzVectorLinearEquiv (source9GeneratorLipschitzUnit a) :
        (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ)) =
      (letI : Invertible (source9Quadratic a) :=
        CliffordAlgebra.invertibleOfInvertibleι source9Quadratic a
       Matrix.toLin' (source9RankOneConjugationMatrix a (source9NormalizedPolarRow a))) :=
  source9GeneratorLinearMap_eq_rankOne a

example (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    source9LipschitzDeterminantCharacter (source9GeneratorLipschitzUnit a) = (1 : ℝˣ) :=
  source9GeneratorDeterminantCharacter_one a

example (s : lipschitzGroup source9Quadratic) :
    source9LipschitzDeterminantCharacter s = (1 : ℝˣ) :=
  source9LipschitzDeterminantCharacter_eq_one s

example (s : lipschitzGroup source9Quadratic) :
    source9LipschitzDeterminantCharacter s⁻¹ = (1 : ℝˣ) :=
  source9LipschitzDeterminantCharacter_eq_one s⁻¹

example (g : spinGroup source9Quadratic) :
    source9LipschitzDeterminantCharacter (source9SpinToLipschitz g) = (1 : ℝˣ) :=
  source9LipschitzDeterminantCharacter_eq_one (source9SpinToLipschitz g)

example (g : spinGroup source9Quadratic) :
    LinearMap.det (source9SpinVectorRepresentation g) = (1 : ℝ) :=
  source9SpinVectorRepresentation_det_one g

example (g : spinGroup source9Quadratic) :
    (source9SpinVectorMatrixHom g).det = (1 : ℝ) :=
  source9SpinVectorMatrixHom_det_one g

example : spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup SpaceIndex ℝ :=
  source9SpinVectorSpecialOrthogonalHom

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinVectorSpecialOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z =
      source9SpinVectorRepresentation g z :=
  source9SpinVectorSpecialOrthogonalHom_mulVec g z

example (g : spinGroup source9Quadratic) :
    ((source9SpinVectorSpecialOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) := rfl

#print axioms FCP.BFSSSourceNineOrientation.source9Quadratic_polar_dot
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot_self
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_mulVec
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorUnit_mem_lipschitz
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorLipschitzUnit
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorLinearMap_eq_rankOne
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorDeterminantCharacter_one
#print axioms FCP.BFSSSourceNineOrientation.source9LipschitzDeterminantCharacter_eq_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorRepresentation_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorMatrixHom_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_ORIENTATION_CONSUMER_COMPLETE"

end
