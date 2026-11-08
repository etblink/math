import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerVectorContinuity

/-! Independent source-labelled matrix, action, quotient-composite and central-sign consumers. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerVectorContinuityIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineAxisStabilizerConnectedness FCP.BFSSSourceNineAxisStabilizerQuotient
open FCP.BFSSSourceNineAxisStabilizerVectorContinuity FCP.BFSSSourceNineGammaFaithfulness

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev P := Fin 8 → {u : V // source9Quadratic u = 1 ∧ u 8 = 0}
private abbrev G := spinGroup source9Quadratic
private abbrev K := {g : G //
  source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}

private theorem identity_fixes (z : V) : source9SpinVectorRepresentation (1 : G) z = z := by
  rw [map_one]
  rfl

private theorem negative_center_fixes (z : V) :
    source9SpinVectorRepresentation source9NegativeCentral z = z := by
  apply (source9SpinGamma_fixes_iff_commutes _ _).mpr
  rw [source9NegativeCentral_gamma]
  simp only [neg_mul, mul_neg, one_mul, mul_one]

private theorem negative_center_vectorSO9 :
    source9SpinVectorSpecialOrthogonalHom source9NegativeCentral = 1 := by
  apply Subtype.ext
  change source9SpinVectorMatrixHom source9NegativeCentral = (1 : Matrix SpaceIndex SpaceIndex ℝ)
  calc
    _ = source9SpinVectorMatrixHom (1 : G) := by
      apply Matrix.ext
      intro i j
      calc
        _ = (source9SpinVectorRepresentation source9NegativeCentral
            (source9CoordinateVector j)) i := source9SpinVectorMatrixHom_entry_source _ _ _
        _ = (source9CoordinateVector j) i := congrFun (negative_center_fixes _) i
        _ = (source9SpinVectorRepresentation (1 : G)
            (source9CoordinateVector j)) i := (congrFun (identity_fixes _) i).symm
        _ = source9SpinVectorMatrixHom (1 : G) i j :=
          (source9SpinVectorMatrixHom_entry_source _ _ _).symm
    _ = 1 := map_one source9SpinVectorMatrixHom

example (g : G) (i j : SpaceIndex) : source9SpinVectorMatrixHom g i j =
    (source9SpinVectorRepresentation g (source9CoordinateVector j)) i :=
  source9SpinVectorMatrixHom_entry_source g i j

example : Continuous (fun w : P =>
    (source9Axis8EightUnitSpinWord w : CliffordAlgebra source9Quadratic)) :=
  source9Axis8EightWord_clifford_continuous_pbw

example (z : V) : Continuous (fun w : P =>
    source9SpinVectorRepresentation (source9Axis8EightUnitSpinWord w) z) :=
  source9Axis8EightWord_vector_continuous_pbw z

example : Continuous (fun w : P => source9SpinVectorMatrixHom (source9Axis8EightUnitSpinWord w)) :=
  source9Axis8EightWord_vectorMatrix_continuous_pbw

example : Continuous (fun w : P =>
    source9SpinVectorSpecialOrthogonalHom (source9Axis8EightUnitSpinWord w)) :=
  source9Axis8EightWord_vectorSO9_continuous_pbw

example : Continuous (fun g : {g : spinGroup source9Quadratic //
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8} =>
      source9SpinVectorSpecialOrthogonalHom g.val) :=
  source9Axis8Stabilizer_vectorSO9_continuous_pbw

example : Continuous (fun g : K => source9SpinVectorMatrixHom g.val) :=
  source9Axis8Stabilizer_vectorMatrix_continuous_pbw

example : Continuous (fun gz : K × V => source9SpinVectorRepresentation gz.1.val gz.2) :=
  source9Axis8Stabilizer_vectorAction_continuous_pbw

example (g : K) (z : V) :
    ((source9SpinVectorSpecialOrthogonalHom g.val) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z =
      source9SpinVectorRepresentation g.val z :=
  source9SpinVectorSpecialOrthogonalHom_mulVec _ _

example (g : K) :
    ((source9SpinVectorSpecialOrthogonalHom g.val) : Matrix SpaceIndex SpaceIndex ℝ).mulVec
      (source9CoordinateVector 8) = source9CoordinateVector 8 :=
  (source9SpinVectorSpecialOrthogonalHom_mulVec _ _).trans g.property

example : source9SpinVectorSpecialOrthogonalHom (1 : G) = 1 :=
  map_one source9SpinVectorSpecialOrthogonalHom

example : source9NegativeCentral ≠ 1 ∧
    source9SpinVectorSpecialOrthogonalHom source9NegativeCentral = 1 :=
  ⟨source9NegativeCentral_ne_one, negative_center_vectorSO9⟩

example : Continuous ((fun g : K => source9SpinVectorSpecialOrthogonalHom g.val) ∘
    source9Axis8EightUnitSpinWordToStabilizer) :=
  source9Axis8Stabilizer_vectorSO9_continuous_pbw.comp
    source9Axis8EightUnitSpinWordToStabilizer_continuous_pbw

example (i j : SpaceIndex) : Continuous (fun g : K => source9SpinVectorMatrixHom g.val i j) :=
  source9Axis8Stabilizer_vectorMatrix_continuous_pbw.matrix_elem i j

example (z : V) : Continuous (fun g : K => source9SpinVectorRepresentation g.val z) :=
  source9Axis8Stabilizer_vectorAction_continuous_pbw.comp (continuous_id.prodMk continuous_const)

example {X : Type*} [TopologicalSpace X]
    (f : Matrix.specialOrthogonalGroup SpaceIndex ℝ → X) (hf : Continuous f) :
    Continuous (fun g : K => f (source9SpinVectorSpecialOrthogonalHom g.val)) :=
  hf.comp source9Axis8Stabilizer_vectorSO9_continuous_pbw

#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9SpinVectorMatrixHom_entry_source
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_clifford_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vector_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vectorMatrix_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vectorSO9_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorSO9_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorMatrix_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorAction_continuous_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_VECTOR_CONTINUITY_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerVectorContinuityIndependentAudit
