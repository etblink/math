import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineGammaCovariance

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineGammaCovariance

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    gammaNineRealLinear (source9SpinVectorRepresentation g z) =
      source9GammaCliffordAlgHom (g : CliffordAlgebra source9Quadratic) *
        gammaNineRealLinear z *
        source9GammaCliffordAlgHom
          ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) :=
  source9GammaCliffordAlgHom_vector_conjugation g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaMatrixUnitsHom g) : GammaMatrix) * gammaNineRealLinear z *
        ((source9SpinGammaMatrixUnitsHom g⁻¹) : GammaMatrix) =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) :=
  source9GammaUnits_global_covariance g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z *
        ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) :=
  source9GammaSpecialOrthogonal_global_covariance g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) *
        ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) :=
  source9GammaSpecialOrthogonal_intertwines g z

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) *
        gammaNineRealLinear (source9SpinVectorRepresentation g z) *
        ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) =
      gammaNineRealLinear z :=
  source9GammaSpecialOrthogonal_inverse_covariance g z

example (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    (gammaNineRealLinear u * gammaNineRealLinear v) * gammaNineRealLinear z =
      gammaNineRealLinear
          (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) *
        (gammaNineRealLinear u * gammaNineRealLinear v) :=
  source9GammaUnitPair_intertwines u v z hu hv

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z *
        ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) =
      gammaNineRealLinear (source9SpinVectorConjugation g z) :=
  source9GammaSpecialOrthogonal_global_covariance g z

example (g : spinGroup source9Quadratic) :
    (fun z : SpaceIndex → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z) =
    (fun z : SpaceIndex → ℝ => gammaNineRealLinear (source9SpinVectorRepresentation g z) *
      ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix)) := by
  funext z
  exact source9GammaSpecialOrthogonal_intertwines g z

#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaCliffordAlgHom_vector_conjugation
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaUnits_global_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_global_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_intertwines
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_inverse_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaUnitPair_intertwines
#eval IO.println "SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_CONSUMER_COMPLETE"

end
