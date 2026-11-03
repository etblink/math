import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BVFinitePlaneWordSmoothness
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open scoped ContDiff
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

example (n : ℕ∞ω) (r s : SpaceIndex) (hrs : r ≠ s) :
    ContDiff ℝ n (fun t : ℝ =>
      ((source9PlaneSpinCurve r s hrs t) : CliffordAlgebra source9Quadratic)) :=
  source9PlaneSpinCurve_coe_contDiff_pbw n r s hrs

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (t : Fin k → ℝ) (l : List (Fin k)) : spinGroup source9Quadratic :=
  source9PlaneSpinWord r s hrs t l

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (t : Fin k → ℝ) (l : List (Fin k)) :
    source9PlaneSpinWord r s hrs t l =
      (l.map (fun i => source9PlaneSpinCurve (r i) (s i) (hrs i) (t i))).prod :=
  source9PlaneSpinWord_eq_listProd r s hrs t l

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (t : Fin k → ℝ) : source9PlaneSpinWord r s hrs t [] = 1 := rfl

-- Two-factor order control in the actual group; the identity tail is removed explicitly.
example (r s : Fin 2 → SpaceIndex) (hrs : ∀ i, r i ≠ s i) (t : Fin 2 → ℝ) :
    source9PlaneSpinWord r s hrs t [0, 1] =
      source9PlaneSpinCurve (r 0) (s 0) (hrs 0) (t 0) *
        source9PlaneSpinCurve (r 1) (s 1) (hrs 1) (t 1) := by
  simp only [source9PlaneSpinWord, mul_one]

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) : source9PlaneSpinWord r s hrs 0 l = 1 :=
  source9PlaneSpinWord_zero r s hrs l

example {k : ℕ} (n : ℕ∞ω) (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) :
    ContDiff ℝ n (fun t : Fin k → ℝ =>
      ((source9PlaneSpinWord r s hrs t l) : CliffordAlgebra source9Quadratic)) :=
  source9PlaneSpinWord_coe_contDiff_pbw n r s hrs l

example {k : ℕ} (n : ℕ∞ω) (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) :
    ContDiff ℝ n (fun tz : (Fin k → ℝ) × (SpaceIndex → ℝ) =>
      source9SpinVectorConjugation (source9PlaneSpinWord r s hrs tz.1 l) tz.2) :=
  source9PlaneSpinWord_vectorAction_contDiff_pbw n r s hrs l

-- Actual inverse-coercion action formula, not only an equality with an ambient wrapper.
example {k : ℕ} (n : ℕ∞ω) (r s : Fin k → SpaceIndex) (hrs : ∀ i, r i ≠ s i)
    (l : List (Fin k)) :
    ContDiff ℝ n (fun tz : (Fin k → ℝ) × (SpaceIndex → ℝ) =>
      source9CliffordVectorProjection
        (((source9PlaneSpinWord r s hrs tz.1 l) : CliffordAlgebra source9Quadratic) *
          CliffordAlgebra.ι source9Quadratic tz.2 *
          (((source9PlaneSpinWord r s hrs tz.1 l)⁻¹ : spinGroup source9Quadratic) :
            CliffordAlgebra source9Quadratic))) :=
  source9PlaneSpinWord_vectorAction_contDiff_pbw n r s hrs l

#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinCurve_coe_contDiff_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_eq_listProd
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_coe_contDiff_pbw
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorAction_contDiff_pbw

end
