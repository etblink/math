import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineLipschitzRepresentation

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineLipschitz

example (s : lipschitzGroup source9Quadratic) :
    (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ) :=
  source9LipschitzVectorLinearMap s

example (s : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic (source9LipschitzVectorLinearMap s z) =
      ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
        CliffordAlgebra.ι source9Quadratic z :=
  source9LipschitzVectorLinearMap_ι s z

example : lipschitzGroup source9Quadratic →* Module.End ℝ (SpaceIndex → ℝ) :=
  source9LipschitzVectorRepresentation

example (s t : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9LipschitzVectorRepresentation (s * t) z =
      source9LipschitzVectorRepresentation s (source9LipschitzVectorRepresentation t z) :=
  congrArg (fun A : Module.End ℝ (SpaceIndex → ℝ) => A z)
    (map_mul source9LipschitzVectorRepresentation s t)

example (s : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9LipschitzVectorRepresentation s⁻¹ (source9LipschitzVectorRepresentation s z) = z :=
  Representation.inv_self_apply source9LipschitzVectorRepresentation s z

example (s : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9LipschitzVectorRepresentation s (source9LipschitzVectorRepresentation s⁻¹ z) = z :=
  Representation.self_inv_apply source9LipschitzVectorRepresentation s z

example (s : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    (source9LipschitzVectorLinearEquiv s).symm z =
      source9LipschitzVectorRepresentation s⁻¹ z := rfl

example : lipschitzGroup source9Quadratic →* ℝˣ :=
  source9LipschitzDeterminantCharacter

example (s t : lipschitzGroup source9Quadratic) :
    source9LipschitzDeterminantCharacter (s * t) =
      source9LipschitzDeterminantCharacter s * source9LipschitzDeterminantCharacter t :=
  map_mul source9LipschitzDeterminantCharacter s t

example (g : spinGroup source9Quadratic) :
    ((source9SpinToLipschitz g) : (CliffordAlgebra source9Quadratic)ˣ) =
      spinGroup.toUnits g := source9SpinToLipschitz_toUnits g

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9LipschitzVectorRepresentation (source9SpinToLipschitz g) z =
      source9SpinVectorRepresentation g z :=
  source9LipschitzVectorRepresentation_restrict_spin g z

example : source9LipschitzVectorRepresentation.comp source9SpinToLipschitz =
    source9SpinVectorRepresentation := source9LipschitzVectorRepresentation_restrict_spin_hom

#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearMap
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearMap_ι
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearEquiv
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearRepresentation
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzDeterminantCharacter
#print axioms FCP.BFSSSourceNineLipschitz.source9SpinToLipschitz
#print axioms FCP.BFSSSourceNineLipschitz.source9SpinToLipschitz_toUnits
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation_restrict_spin
#print axioms FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation_restrict_spin_hom
#eval IO.println "SPECTRAL_SOURCE_NINE_LIPSCHITZ_REPRESENTATION_CONSUMER_COMPLETE"

end
