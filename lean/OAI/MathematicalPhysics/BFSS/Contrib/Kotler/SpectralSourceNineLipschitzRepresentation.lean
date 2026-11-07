import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation
import Mathlib.LinearAlgebra.Determinant

/-!
C0-A2 first source bridge: literal nine-vector Lipschitz representation
and exact restriction to the original F10BP Spin representation.
Recover vectors by the accepted source Clifford projection; range
preservation comes from the actual Mathlib Lipschitz subgroup theorem.
The determinant is packaged as a UNIT character, not proved equal to one.
No generator determinant, closure orientation, compactness or spectra.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineLipschitz
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford

/-- Real-linear recovery of actual Clifford conjugation on the original nine-vector carrier. -/
noncomputable def source9LipschitzVectorLinearMap
    (s : lipschitzGroup source9Quadratic) :
    (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ) where
  toFun z := source9CliffordVectorProjection
    (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
      CliffordAlgebra.ι source9Quadratic z)
  map_add' := by
    intro z w
    simp only [map_add, smul_add]
  map_smul' := by
    intro c z
    change source9CliffordVectorProjection
        (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
          CliffordAlgebra.ι source9Quadratic (c • z)) =
      c • source9CliffordVectorProjection
        (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
          CliffordAlgebra.ι source9Quadratic z)
    calc
      _ = source9CliffordVectorProjection
          (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
            (c • CliffordAlgebra.ι source9Quadratic z)) :=
        congrArg (fun a : CliffordAlgebra source9Quadratic =>
          source9CliffordVectorProjection
            (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) • a))
          ((CliffordAlgebra.ι source9Quadratic).map_smul c z)
      _ = source9CliffordVectorProjection
          (c • (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
            CliffordAlgebra.ι source9Quadratic z)) :=
        congrArg source9CliffordVectorProjection
          ((smul_comm c
            (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ))
            (CliffordAlgebra.ι source9Quadratic z)).symm)
      _ = _ := source9CliffordVectorProjection.map_smul c _

/-- The recovered vector embeds to the original Clifford conjugation, with no assumed action. -/
theorem source9LipschitzVectorLinearMap_ι
    (s : lipschitzGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    CliffordAlgebra.ι source9Quadratic (source9LipschitzVectorLinearMap s z) =
      ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
        CliffordAlgebra.ι source9Quadratic z := by
  obtain ⟨w, hw⟩ := lipschitzGroup.conjAct_smul_ι_mem_range_ι s.property z
  change CliffordAlgebra.ι source9Quadratic
    (source9CliffordVectorProjection
      (ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
        CliffordAlgebra.ι source9Quadratic z)) = _
  calc
    _ = CliffordAlgebra.ι source9Quadratic
        (source9CliffordVectorProjection (CliffordAlgebra.ι source9Quadratic w)) := by
      rw [hw]
    _ = CliffordAlgebra.ι source9Quadratic w := by
      rw [source9CliffordVectorProjection_ι]
    _ = _ := hw

/-- A genuine global representation of the ACTUAL source Lipschitz group, in the source order. -/
noncomputable def source9LipschitzVectorRepresentation :
    Representation ℝ (lipschitzGroup source9Quadratic) (SpaceIndex → ℝ) where
  toFun := source9LipschitzVectorLinearMap
  map_one' := by
    apply LinearMap.ext
    intro z
    apply source9CliffordVectorEmbedding_injective
    change CliffordAlgebra.ι source9Quadratic
      (source9LipschitzVectorLinearMap (1 : lipschitzGroup source9Quadratic) z) =
        CliffordAlgebra.ι source9Quadratic z
    rw [source9LipschitzVectorLinearMap_ι]
    simp
  map_mul' := by
    intro s t
    apply LinearMap.ext
    intro z
    apply source9CliffordVectorEmbedding_injective
    change CliffordAlgebra.ι source9Quadratic
      (source9LipschitzVectorLinearMap (s * t) z) =
        CliffordAlgebra.ι source9Quadratic
          (source9LipschitzVectorLinearMap s (source9LipschitzVectorLinearMap t z))
    rw [source9LipschitzVectorLinearMap_ι, source9LipschitzVectorLinearMap_ι,
      source9LipschitzVectorLinearMap_ι]
    change ConjAct.toConjAct
        ((s : (CliffordAlgebra source9Quadratic)ˣ) *
          (t : (CliffordAlgebra source9Quadratic)ˣ)) •
        CliffordAlgebra.ι source9Quadratic z =
      ConjAct.toConjAct (s : (CliffordAlgebra source9Quadratic)ˣ) •
        (ConjAct.toConjAct (t : (CliffordAlgebra source9Quadratic)ˣ) •
          CliffordAlgebra.ι source9Quadratic z)
    rw [map_mul, mul_smul]

/-- Invertible real-linear action; the inverse is the same representation at the inverse unit. -/
noncomputable def source9LipschitzVectorLinearEquiv
    (s : lipschitzGroup source9Quadratic) :
    (SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ) :=
  { source9LipschitzVectorRepresentation s with
    toFun := source9LipschitzVectorRepresentation s
    invFun := source9LipschitzVectorRepresentation s⁻¹
    left_inv := Representation.inv_self_apply source9LipschitzVectorRepresentation s
    right_inv := Representation.self_inv_apply source9LipschitzVectorRepresentation s }

/-- The real-linear equivalences form a group homomorphism on the literal source subgroup. -/
noncomputable def source9LipschitzVectorLinearRepresentation :
    lipschitzGroup source9Quadratic →*
      ((SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ)) where
  toFun := source9LipschitzVectorLinearEquiv
  map_one' := by
    apply LinearEquiv.ext
    intro z
    change source9LipschitzVectorRepresentation
      (1 : lipschitzGroup source9Quadratic) z = z
    exact congrArg (fun A : Module.End ℝ (SpaceIndex → ℝ) => A z)
      (map_one source9LipschitzVectorRepresentation)
  map_mul' := by
    intro s t
    apply LinearEquiv.ext
    intro z
    change source9LipschitzVectorRepresentation (s * t) z =
      source9LipschitzVectorRepresentation s (source9LipschitzVectorRepresentation t z)
    exact congrArg (fun A : Module.End ℝ (SpaceIndex → ℝ) => A z)
      (map_mul source9LipschitzVectorRepresentation s t)

/-- Actual determinant UNIT character; no orientation value is assumed or proved. -/
noncomputable def source9LipschitzDeterminantCharacter :
    lipschitzGroup source9Quadratic →* ℝˣ :=
  (LinearEquiv.det :
    ((SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ)) →* ℝˣ).comp
      source9LipschitzVectorLinearRepresentation

/-- The actual Spin-to-units map lands in the actual source Lipschitz subgroup. -/
noncomputable def source9SpinToLipschitz :
    spinGroup source9Quadratic →* lipschitzGroup source9Quadratic where
  toFun g := ⟨spinGroup.toUnits g, by
    have hs : ((spinGroup.toUnits g : (CliffordAlgebra source9Quadratic)ˣ) :
        CliffordAlgebra source9Quadratic) ∈ spinGroup source9Quadratic := by
      change (g : CliffordAlgebra source9Quadratic) ∈ spinGroup source9Quadratic
      exact g.property
    exact spinGroup.units_mem_lipschitzGroup hs⟩
  map_one' := by
    apply Subtype.ext
    change spinGroup.toUnits (1 : spinGroup source9Quadratic) = 1
    exact map_one spinGroup.toUnits
  map_mul' := by
    intro g h
    apply Subtype.ext
    change spinGroup.toUnits (g * h) = spinGroup.toUnits g * spinGroup.toUnits h
    exact map_mul spinGroup.toUnits g h

/-- Source inclusion uses exactly the existing Mathlib Spin unit, with no substitute. -/
theorem source9SpinToLipschitz_toUnits (g : spinGroup source9Quadratic) :
    ((source9SpinToLipschitz g) : (CliffordAlgebra source9Quadratic)ˣ) =
      spinGroup.toUnits g := rfl

/-- Exact restriction to the existing original nine-vector Spin representation, pointwise. -/
theorem source9LipschitzVectorRepresentation_restrict_spin
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9LipschitzVectorRepresentation (source9SpinToLipschitz g) z =
      source9SpinVectorRepresentation g z := by
  apply source9CliffordVectorEmbedding_injective
  change CliffordAlgebra.ι source9Quadratic
      (source9LipschitzVectorLinearMap (source9SpinToLipschitz g) z) =
    CliffordAlgebra.ι source9Quadratic (source9SpinVectorConjugation g z)
  calc
    _ = ConjAct.toConjAct
        ((source9SpinToLipschitz g) : (CliffordAlgebra source9Quadratic)ˣ) •
          CliffordAlgebra.ι source9Quadratic z := source9LipschitzVectorLinearMap_ι _ z
    _ = ((spinGroup.toUnits g : (CliffordAlgebra source9Quadratic)ˣ) :
          CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        (((spinGroup.toUnits g)⁻¹ : (CliffordAlgebra source9Quadratic)ˣ) :
          CliffordAlgebra source9Quadratic) := by
      rw [source9SpinToLipschitz_toUnits, ConjAct.units_smul_def,
        ConjAct.ofConjAct_toConjAct]
    _ = (g : CliffordAlgebra source9Quadratic) * CliffordAlgebra.ι source9Quadratic z *
        ((g⁻¹ : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) := rfl
    _ = _ := (source9SpinVectorConjugation_ι g z).symm

/-- Equality of the entire restricted representation and the original F10BP representation. -/
theorem source9LipschitzVectorRepresentation_restrict_spin_hom :
    source9LipschitzVectorRepresentation.comp source9SpinToLipschitz =
      source9SpinVectorRepresentation := by
  apply MonoidHom.ext
  intro g
  apply LinearMap.ext
  intro z
  exact source9LipschitzVectorRepresentation_restrict_spin g z

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
#eval IO.println "SPECTRAL_SOURCE_NINE_LIPSCHITZ_REPRESENTATION_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineLipschitz
