import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BWFinitePlaneWordDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
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

example {k : ℕ} (r s : SpaceIndex) (i : Fin k) :
    (Fin k → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9PlaneParameterVelocity r s i

example {k : ℕ} (r s : SpaceIndex) (i : Fin k) (v : Fin k → ℝ) :
    source9PlaneParameterVelocity r s i v =
      v i • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector r) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector s))) := rfl

example {k : ℕ} (r s : SpaceIndex) (hrs : r ≠ s) (i : Fin k) :
    HasFDerivAt
      (fun t : Fin k → ℝ =>
        ((source9PlaneSpinCurve r s hrs (t i)) : CliffordAlgebra source9Quadratic))
      (source9PlaneParameterVelocity r s i) 0 :=
  source9PlaneParameterCurve_hasFDerivAt_zero r s hrs i

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k)) :
    (Fin k → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic :=
  source9PlaneSpinWordVelocity r s l

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k)) (v : Fin k → ℝ) :
    source9PlaneSpinWordVelocity r s l v =
      (l.map (fun i => v i • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (r i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (s i)))))).sum :=
  source9PlaneSpinWordVelocity_apply r s l v

example {k : ℕ} (r s : Fin k → SpaceIndex) :
    source9PlaneSpinWordVelocity r s [] = 0 := rfl

-- A repeated list index contributes twice, as required for the full derivative.
example (r s : Fin 1 → SpaceIndex) (v : Fin 1 → ℝ) :
    source9PlaneSpinWordVelocity r s [0, 0] v =
      v 0 • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (r 0)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (s 0)))) +
      v 0 • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (r 0)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (s 0)))) := by
  rw [source9PlaneSpinWordVelocity_apply]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i) (l : List (Fin k)) :
    HasFDerivAt (fun t : Fin k → ℝ =>
      ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic))
      (source9PlaneSpinWordVelocity r s l) 0 :=
  source9PlaneSpinWord_coe_hasFDerivAt_zero r s hrs l

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i) (l : List (Fin k)) :
    fderiv ℝ (fun t : Fin k → ℝ =>
      ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0 =
      source9PlaneSpinWordVelocity r s l :=
  source9PlaneSpinWord_coe_fderiv_zero r s hrs l

-- Check the literal finite sum for every direction, not only the bundled derivative name.
example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) (v : Fin k → ℝ) :
    (fderiv ℝ (fun t : Fin k → ℝ =>
      ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0) v =
      (l.map (fun i => v i • ((1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (r i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (s i)))))).sum := by
  have hmap :
      fderiv ℝ (fun t : Fin k → ℝ =>
        ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) 0 =
        source9PlaneSpinWordVelocity r s l :=
    source9PlaneSpinWord_coe_fderiv_zero r s hrs l
  exact (congrArg (fun L : (Fin k → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic =>
    L v) hmap).trans (source9PlaneSpinWordVelocity_apply r s l v)

#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneParameterVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneParameterCurve_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWordVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWordVelocity_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_coe_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_coe_fderiv_zero

end
