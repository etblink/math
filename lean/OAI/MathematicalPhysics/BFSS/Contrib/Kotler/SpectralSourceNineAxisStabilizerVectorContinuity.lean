import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerQuotient
import Mathlib.Topology.Instances.Matrix

/-!
Candidate continuity of the EXISTING original SO(9) vector projection on the
literal original ninth-axis stabilizer. Reuse the original ambient smooth
extension to prove the parameter composite continuous, then descend through
the qualified exact quotient map. No new vector action or topology is defined.
No SO(8) covering, Spin(8) classification or physical spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerVectorContinuity
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineOrientation
open FCP.BFSSSourceNineAxisStabilizerConnectedness FCP.BFSSSourceNineAxisStabilizerQuotient

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev V := SpaceIndex → ℝ
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev P := Fin 8 → {u : V // source9Quadratic u = 1 ∧ u 8 = 0}
private abbrev G := spinGroup source9Quadratic
private abbrev K := {g : G //
  source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8}

/-- Original matrix entries are the actual action on the original coordinate basis. -/
theorem source9SpinVectorMatrixHom_entry_source (g : G) (i j : SpaceIndex) :
    source9SpinVectorMatrixHom g i j =
      (source9SpinVectorRepresentation g (source9CoordinateVector j)) i := rfl

/-- The unchanged perpendicular eight-word Clifford value is PBW-continuous. -/
theorem source9Axis8EightWord_clifford_continuous_pbw :
    Continuous (fun w : P => (source9Axis8EightUnitSpinWord w : C)) :=
  continuous_subtype_val.comp source9Axis8EightUnitSpinWord_continuous_pbw

/-- Parameter continuity of the actual vector action follows from the existing ambient extension. -/
theorem source9Axis8EightWord_vector_continuous_pbw (z : V) :
    Continuous (fun w : P => source9SpinVectorRepresentation (source9Axis8EightUnitSpinWord w) z) := by
  -- Compose the existing PBW-continuous operations directly.  The generic
  -- ContDiff-to-Continuous coercion above exhausted Lean's whnf budget; these
  -- explicit intermediate carriers retain the exact same ambient formula.
  have hc : Continuous (fun w : P => (source9Axis8EightUnitSpinWord w : C)) :=
    source9Axis8EightWord_clifford_continuous_pbw
  have hz : Continuous (fun _ : P => (CliffordAlgebra.ι source9Quadratic z : C)) :=
    continuous_const
  have hleft : Continuous (fun w : P =>
      (source9Axis8EightUnitSpinWord w : C) * CliffordAlgebra.ι source9Quadratic z) :=
    source9Clifford_mul_continuous_pbw.comp (hc.prodMk hz)
  have hreverse : Continuous (fun w : P =>
      CliffordAlgebra.reverse (source9Axis8EightUnitSpinWord w : C)) :=
    source9Clifford_reverse_continuous_pbw.comp hc
  have hproduct : Continuous (fun w : P =>
      ((source9Axis8EightUnitSpinWord w : C) * CliffordAlgebra.ι source9Quadratic z) *
        CliffordAlgebra.reverse (source9Axis8EightUnitSpinWord w : C)) :=
    source9Clifford_mul_continuous_pbw.comp (hleft.prodMk hreverse)
  have h : Continuous (fun w : P =>
      source9AmbientVectorConjugation (source9Axis8EightUnitSpinWord w : C) z) := by
    change Continuous (fun w : P =>
      source9CliffordVectorProjection
        (((source9Axis8EightUnitSpinWord w : C) * CliffordAlgebra.ι source9Quadratic z) *
          CliffordAlgebra.reverse (source9Axis8EightUnitSpinWord w : C)))
    exact source9CliffordVectorProjection_continuous_pbw.comp hproduct
  have heq : (fun w : P =>
      source9AmbientVectorConjugation (source9Axis8EightUnitSpinWord w : C) z) =
      (fun w : P => source9SpinVectorRepresentation (source9Axis8EightUnitSpinWord w) z) := by
    funext w
    exact source9AmbientVectorConjugation_eq_spin _ _
  rw [heq] at h
  exact h

/-- All entries of the original matrix projection on the original word parameters are continuous. -/
theorem source9Axis8EightWord_vectorMatrix_continuous_pbw :
    Continuous (fun w : P => source9SpinVectorMatrixHom (source9Axis8EightUnitSpinWord w)) := by
  apply continuous_matrix
  intro i j
  simp only [source9SpinVectorMatrixHom_entry_source]
  exact (continuous_apply i).comp
    (source9Axis8EightWord_vector_continuous_pbw (source9CoordinateVector j))

/-- The parameter composite uses the EXISTING original SO(9)-valued homomorphism. -/
theorem source9Axis8EightWord_vectorSO9_continuous_pbw :
    Continuous (fun w : P =>
      source9SpinVectorSpecialOrthogonalHom (source9Axis8EightUnitSpinWord w)) :=
  source9Axis8EightWord_vectorMatrix_continuous_pbw.subtype_mk
    (fun w => (source9SpinVectorSpecialOrthogonalHom (source9Axis8EightUnitSpinWord w)).property)

/-- Main result: descend continuity of the original SO(9) projection to the actual stabilizer. -/
theorem source9Axis8Stabilizer_vectorSO9_continuous_pbw :
    Continuous (fun g : K => source9SpinVectorSpecialOrthogonalHom g.val) := by
  apply (source9Axis8Stabilizer_continuous_iff_pbw
    (fun g : K => source9SpinVectorSpecialOrthogonalHom g.val)).mpr
  exact source9Axis8EightWord_vectorSO9_continuous_pbw

/-- The restricted underlying original matrix, with its standard source-labelled topology. -/
theorem source9Axis8Stabilizer_vectorMatrix_continuous_pbw :
    Continuous (fun g : K => source9SpinVectorMatrixHom g.val) :=
  continuous_subtype_val.comp source9Axis8Stabilizer_vectorSO9_continuous_pbw

/-- Independent consumer: joint continuity of the actual restricted action on original vectors. -/
theorem source9Axis8Stabilizer_vectorAction_continuous_pbw :
    Continuous (fun gz : K × V => source9SpinVectorRepresentation gz.1.val gz.2) := by
  have h : Continuous (fun gz : K × V => (source9SpinVectorMatrixHom gz.1.val).mulVec gz.2) :=
    (source9Axis8Stabilizer_vectorMatrix_continuous_pbw.comp
      continuous_fst).matrix_mulVec (continuous_snd : Continuous (fun gz : K × V => gz.2))
  have heq : (fun gz : K × V => (source9SpinVectorMatrixHom gz.1.val).mulVec gz.2) =
      (fun gz : K × V => source9SpinVectorRepresentation gz.1.val gz.2) := by
    funext gz
    exact source9SpinVectorMatrixHom_mulVec _ _
  rw [heq] at h
  exact h

#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9SpinVectorMatrixHom_entry_source
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_clifford_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vector_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vectorMatrix_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8EightWord_vectorSO9_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorSO9_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorMatrix_continuous_pbw
#print axioms FCP.BFSSSourceNineAxisStabilizerVectorContinuity.source9Axis8Stabilizer_vectorAction_continuous_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_VECTOR_CONTINUITY_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerVectorContinuity
