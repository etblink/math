import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation

/-!
P1-gamma candidate: global ALGEBRAIC covariance of the actual gamma16
evaluation under the actual source nine-vector Spin representation.
Use the accepted Clifford conjugation identity and original AlgHom;
do not infer this global statement from a derivative or plane generator.
No Fock-vector action, covering, compactness, source determinant-one
theorem, closed-domain covariance or spectral conclusion is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineGammaCovariance
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford

/-- Apply the original gamma AlgHom to the literal source vector-conjugation identity. -/
theorem source9GammaCliffordAlgHom_vector_conjugation
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    gammaNineRealLinear (source9SpinVectorRepresentation g z) =
      source9GammaCliffordAlgHom (g : CliffordAlgebra source9Quadratic) *
        gammaNineRealLinear z *
        source9GammaCliffordAlgHom
          ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) := by
  have h := congrArg source9GammaCliffordAlgHom (source9SpinVectorConjugation_ι g z)
  change gammaNineRealLinear (source9SpinVectorConjugation g z) = _
  simpa only [map_mul, source9GammaCliffordAlgHom_generator] using h

/-- Conjugation by the genuine global original gamma matrix-units homomorphism. -/
theorem source9GammaUnits_global_covariance
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaMatrixUnitsHom g) : GammaMatrix) * gammaNineRealLinear z *
        ((source9SpinGammaMatrixUnitsHom g⁻¹) : GammaMatrix) =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) := by
  rw [source9SpinGammaMatrixUnitsHom_apply, source9SpinGammaMatrixUnitsHom_apply]
  exact (source9GammaCliffordAlgHom_vector_conjugation g z).symm

/-- The same exact global covariance at the existing SO(16)-valued source homomorphism. -/
theorem source9GammaSpecialOrthogonal_global_covariance
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z *
        ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) := by
  rw [source9SpinGammaSpecialOrthogonalHom_apply,
    source9SpinGammaSpecialOrthogonalHom_apply]
  exact (source9GammaCliffordAlgHom_vector_conjugation g z).symm

/-- Multiplication orientation: G(g) gamma(z) = gamma(R9(g) z) G(g). -/
theorem source9GammaSpecialOrthogonal_intertwines
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear z =
      gammaNineRealLinear (source9SpinVectorRepresentation g z) *
        ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) := by
  have hcancel :
      ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) *
        ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) = 1 := by
    calc
      _ = ((source9SpinGammaSpecialOrthogonalHom (g⁻¹ * g)) : GammaMatrix) := by
        rw [map_mul]
        rfl
      _ = 1 := by
        rw [inv_mul_cancel, map_one]
        rfl
  have h := congrArg
    (fun A : GammaMatrix => A * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix))
    (source9GammaSpecialOrthogonal_global_covariance g z)
  simpa only [mul_assoc, hcancel, mul_one] using h

/-- Inverse orientation recovers the original gamma evaluation on every original nine-vector. -/
theorem source9GammaSpecialOrthogonal_inverse_covariance
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) *
        gammaNineRealLinear (source9SpinVectorRepresentation g z) *
        ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) =
      gammaNineRealLinear z := by
  have h := source9GammaSpecialOrthogonal_global_covariance
    g⁻¹ (source9SpinVectorRepresentation g z)
  rw [inv_inv, Representation.inv_self_apply source9SpinVectorRepresentation g z] at h
  exact h

/-- Source normalized pairs specialize the same global identity to the ORIGINAL gamma product. -/
theorem source9GammaUnitPair_intertwines
    (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    (gammaNineRealLinear u * gammaNineRealLinear v) * gammaNineRealLinear z =
      gammaNineRealLinear
          (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) *
        (gammaNineRealLinear u * gammaNineRealLinear v) := by
  have h := source9GammaSpecialOrthogonal_intertwines (source9UnitVectorPairSpin u v hu hv) z
  simpa only [source9UnitVectorPairSpin_gamma] using h

#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaCliffordAlgHom_vector_conjugation
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaUnits_global_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_global_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_intertwines
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaSpecialOrthogonal_inverse_covariance
#print axioms FCP.BFSSSourceNineGammaCovariance.source9GammaUnitPair_intertwines
#eval IO.println "SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineGammaCovariance
