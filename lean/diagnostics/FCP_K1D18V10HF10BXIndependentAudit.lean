import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BXWordDerivativeNativeVectorAction
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

-- Literal full native plane, with no inserted half factor or replacement carrier.
example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

example {k : ℕ} (r s : SpaceIndex) (z : SpaceIndex → ℝ) (i : Fin k) :
    (Fin k → ℝ) →L[ℝ] (SpaceIndex → ℝ) :=
  source9PlaneParameterVectorVelocity r s z i

example {k : ℕ} (r s : SpaceIndex) (z : SpaceIndex → ℝ) (i : Fin k) (v : Fin k → ℝ) :
    source9PlaneParameterVectorVelocity r s z i v =
      v i • ((coordinatePlane9 r s).mulVec z) := rfl

example {k : ℕ} (r s : Fin k → SpaceIndex) (z : SpaceIndex → ℝ) (l : List (Fin k)) :
    (Fin k → ℝ) →L[ℝ] (SpaceIndex → ℝ) :=
  source9PlaneWordVectorVelocity r s z l

example {k : ℕ} (r s : Fin k → SpaceIndex) (z : SpaceIndex → ℝ)
    (l : List (Fin k)) (v : Fin k → ℝ) :
    source9PlaneWordVectorVelocity r s z l v =
      (l.map (fun i => v i • ((coordinatePlane9 (r i) (s i)).mulVec z))).sum :=
  source9PlaneWordVectorVelocity_apply r s z l v

example {k : ℕ} (r s : Fin k → SpaceIndex) (z : SpaceIndex → ℝ) :
    source9PlaneWordVectorVelocity r s z [] = 0 := rfl

-- Repeated labels retain both full native-plane contributions.
example (r s : Fin 1 → SpaceIndex) (z : SpaceIndex → ℝ) (v : Fin 1 → ℝ) :
    source9PlaneWordVectorVelocity r s z [0, 0] v =
      v 0 • ((coordinatePlane9 (r 0) (s 0)).mulVec z) +
        v 0 • ((coordinatePlane9 (r 0) (s 0)).mulVec z) := by
  rw [source9PlaneWordVectorVelocity_apply]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k))
    (v : Fin k → ℝ) (z : SpaceIndex → ℝ) :
    source9PlaneSpinWordVelocity r s l v * CliffordAlgebra.ι source9Quadratic z -
      CliffordAlgebra.ι source9Quadratic z * source9PlaneSpinWordVelocity r s l v =
        CliffordAlgebra.ι source9Quadratic (source9PlaneWordVectorVelocity r s z l v) :=
  source9PlaneSpinWordVelocity_commutator_vector r s l v z

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k))
    (v : Fin k → ℝ) (z : SpaceIndex → ℝ) :
    source9CliffordVectorProjection
      (source9PlaneSpinWordVelocity r s l v * CliffordAlgebra.ι source9Quadratic z -
        CliffordAlgebra.ι source9Quadratic z * source9PlaneSpinWordVelocity r s l v) =
      source9PlaneWordVectorVelocity r s z l v :=
  source9PlaneSpinWordVelocity_projected_commutator r s l v z

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (v : Fin k → ℝ) (z : SpaceIndex → ℝ) :
    source9CliffordVectorProjection
      (((fderiv ℝ (fun t : Fin k → ℝ =>
          ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0) v) *
            CliffordAlgebra.ι source9Quadratic z -
        CliffordAlgebra.ι source9Quadratic z *
          ((fderiv ℝ (fun t : Fin k → ℝ =>
            ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0) v)) =
      source9PlaneWordVectorVelocity r s z l v :=
  source9PlaneSpinWord_fderiv_projected_commutator r s hrs l v z

-- The exact actual-word derivative commutator gives the literal full native-plane finite sum.
example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (v : Fin k → ℝ) (z : SpaceIndex → ℝ) :
    source9CliffordVectorProjection
      (((fderiv ℝ (fun t : Fin k → ℝ =>
          ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0) v) *
            CliffordAlgebra.ι source9Quadratic z -
        CliffordAlgebra.ι source9Quadratic z *
          ((fderiv ℝ (fun t : Fin k → ℝ =>
            ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0) v)) =
      (l.map (fun i => v i • ((coordinatePlane9 (r i) (s i)).mulVec z))).sum :=
  (source9PlaneSpinWord_fderiv_projected_commutator r s hrs l v z).trans
    (source9PlaneWordVectorVelocity_apply r s z l v)

#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneParameterVectorVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneWordVectorVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneWordVectorVelocity_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWordVelocity_commutator_vector
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWordVelocity_projected_commutator
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_fderiv_projected_commutator

end
