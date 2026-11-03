import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BYActualWordVectorActionDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

-- Reconstruct the accepted PBW norm from the actual source basis and finite-coordinate adapter.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditPBWCoordinates

example : source9PBWCoordinates = auditPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup =
    NormedAddCommGroup.induced
      (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
      auditPBWCoordinates.toAddMonoidHom auditPBWCoordinates.injective := rfl

-- Derive the actual ring's additive topology from the accepted theorem at the reconstructed PBW norm.
local instance auditPBWIsTopologicalAddGroup :
    IsTopologicalAddGroup (CliffordAlgebra source9Quadratic) := by
  let : IsTopologicalRing (CliffordAlgebra source9Quadratic) :=
    source9Clifford_isTopologicalRing_pbw
  exact IsTopologicalRing.isTopologicalAddGroup

example (r s : SpaceIndex) (hrs : r ≠ s) :
    CliffordAlgebra.reverse
      ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) =
      -((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) :=
  source9CoordinateHalfBivector_reverse r s hrs

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (v : Fin k → ℝ) :
    CliffordAlgebra.reverse (source9PlaneSpinWordVelocity r s l v) =
      -source9PlaneSpinWordVelocity r s l v :=
  source9PlaneSpinWordVelocity_reverse r s hrs l v

-- Ground capability check under the reconstructed PBW structures and derived additive topology.
example : Sub (CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic) :=
  inferInstance

-- Independently evaluate the bundled Clifford derivative as the actual commutator.
example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k))
    (v : Fin k → ℝ) (z : SpaceIndex → ℝ) :
    let R : CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
      source9CliffordMulCLM.flip (CliffordAlgebra.ι source9Quadratic z)
    let L : CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
      source9CliffordMulCLM (CliffordAlgebra.ι source9Quadratic z)
    (((R - L) :
        CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic).comp
        (source9PlaneSpinWordVelocity r s l)) v =
      source9PlaneSpinWordVelocity r s l v * CliffordAlgebra.ι source9Quadratic z -
        CliffordAlgebra.ι source9Quadratic z * source9PlaneSpinWordVelocity r s l v := rfl

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (z : SpaceIndex → ℝ) :
    let R : CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
      source9CliffordMulCLM.flip (CliffordAlgebra.ι source9Quadratic z)
    let L : CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic :=
      source9CliffordMulCLM (CliffordAlgebra.ι source9Quadratic z)
    HasFDerivAt
      (fun t : Fin k → ℝ =>
        ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic) *
          CliffordAlgebra.ι source9Quadratic z *
          (((source9PlaneSpinWord r s hrs t l)⁻¹ : spinGroup source9Quadratic) :
            CliffordAlgebra source9Quadratic))
      (((R - L) :
          CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic).comp
          (source9PlaneSpinWordVelocity r s l)) 0 :=
  source9PlaneSpinWord_conjugation_hasFDerivAt_zero r s hrs l z

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (z : SpaceIndex → ℝ) :
    HasFDerivAt
      (fun t : Fin k → ℝ => source9SpinVectorConjugation (source9PlaneSpinWord r s hrs t l) z)
      (source9PlaneWordVectorVelocity r s z l) 0 :=
  source9PlaneSpinWord_vectorAction_hasFDerivAt_zero r s hrs l z

-- Control the actual inverse-coercion formula without the vector-conjugation wrapper.
example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (z : SpaceIndex → ℝ) :
    HasFDerivAt
      (fun t : Fin k → ℝ =>
        source9CliffordVectorProjection
          (((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic) *
            CliffordAlgebra.ι source9Quadratic z *
            (((source9PlaneSpinWord r s hrs t l)⁻¹ : spinGroup source9Quadratic) :
              CliffordAlgebra source9Quadratic)))
      (source9PlaneWordVectorVelocity r s z l) 0 :=
  source9PlaneSpinWord_vectorAction_hasFDerivAt_zero r s hrs l z

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (z : SpaceIndex → ℝ) :
    fderiv ℝ
      (fun t : Fin k → ℝ => source9SpinVectorConjugation (source9PlaneSpinWord r s hrs t l) z) 0 =
      source9PlaneWordVectorVelocity r s z l :=
  source9PlaneSpinWord_vectorAction_fderiv_zero r s hrs l z

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (z : SpaceIndex → ℝ) (v : Fin k → ℝ) :
    (fderiv ℝ
      (fun t : Fin k → ℝ => source9SpinVectorConjugation (source9PlaneSpinWord r s hrs t l) z) 0) v =
      (l.map (fun i => v i • ((coordinatePlane9 (r i) (s i)).mulVec z))).sum :=
  source9PlaneSpinWord_vectorAction_fderiv_zero_apply r s hrs l z v

example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

#print axioms FCP.BFSSPairedSpin9Clifford.source9CoordinateHalfBivector_reverse
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWordVelocity_reverse
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_conjugation_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorAction_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorAction_fderiv_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorAction_fderiv_zero_apply

end
