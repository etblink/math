import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCoordinateExtension
import Mathlib.Topology.Algebra.ContinuousMonoidHom

/-!
Candidate topological group equivalence for the SAME actual original target H.
Use exactly the qualified restriction R and explicit extension E; prove inverse
continuity entrywise before packaging. No source Spin(8) classification, new
source covering, root datum, Fock action or physical spectral statement.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateEquivalence
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisCoordinateRestriction FCP.BFSSSourceNineAxisCoordinateExtension
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev SO8 := Matrix.specialOrthogonalGroup (Fin 8) ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev H := source9Axis8MatrixStabilizer

/-- Every raw extension entry is an original B entry or a fixed scalar. -/
theorem source9Axis8CoordinateExtensionMatrix_continuous :
    Continuous (source9Axis8CoordinateExtensionMatrix : M8 → M9) := by
  apply continuous_pi
  intro i
  apply continuous_pi
  intro j
  rcases Fin.eq_castSucc_or_eq_last i with ⟨i, rfl⟩ | rfl
  · rcases Fin.eq_castSucc_or_eq_last j with ⟨j, rfl⟩ | rfl
    · have h : Continuous (fun B : M8 => B i j) :=
        (continuous_apply j).comp (continuous_apply i)
      simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_castSucc] using h
    · simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_last] using
        (continuous_const : Continuous (fun _ : M8 => (0 : ℝ)))
  · rcases Fin.eq_castSucc_or_eq_last j with ⟨j, rfl⟩ | rfl
    · simpa only [source9Axis8CoordinateExtensionMatrix_last_castSucc] using
        (continuous_const : Continuous (fun _ : M8 => (0 : ℝ)))
    · simpa only [source9Axis8CoordinateExtensionMatrix_last_last] using
        (continuous_const : Continuous (fun _ : M8 => (1 : ℝ)))

/-- Continuity into the unchanged SO(9) and H subtypes, with their original topologies. -/
theorem source9Axis8CoordinateExtension_continuous :
    Continuous (source9Axis8CoordinateExtension : SO8 → H) := by
  have hraw : Continuous (fun B : SO8 => source9Axis8CoordinateExtensionMatrix (B : M8)) :=
    source9Axis8CoordinateExtensionMatrix_continuous.comp continuous_subtype_val
  have hm : Continuous (fun B : SO8 => (((source9Axis8CoordinateExtension B : H) : SO9) : M9)) := by
    simpa only [source9Axis8CoordinateExtension_coe] using hraw
  have hSO9 : Continuous (fun B : SO8 => (source9Axis8CoordinateExtension B : SO9)) :=
    hm.subtype_mk (fun B => (source9Axis8CoordinateExtension B : SO9).property)
  exact hSO9.subtype_mk (fun B => (source9Axis8CoordinateExtension B).property)

/-- The exact original coordinate restriction and explicit extension, as a topological group equivalence. -/
noncomputable def source9Axis8CoordinateContinuousMulEquiv :
    source9Axis8MatrixStabilizer ≃ₜ* Matrix.specialOrthogonalGroup (Fin 8) ℝ :=
  ContinuousMulEquiv.mk
    { toFun := source9Axis8CoordinateRestrictionHom
      invFun := source9Axis8CoordinateExtension
      left_inv := source9Axis8CoordinateExtension_restriction
      right_inv := source9Axis8CoordinateRestriction_extension
      map_mul' := fun A B => map_mul source9Axis8CoordinateRestrictionHom A B }
    source9Axis8CoordinateRestrictionHom_continuous
    source9Axis8CoordinateExtension_continuous

/-- The forward function is literally the qualified original coordinate restriction. -/
theorem source9Axis8CoordinateContinuousMulEquiv_apply (A : H) :
    source9Axis8CoordinateContinuousMulEquiv A = source9Axis8CoordinateRestrictionHom A := rfl

/-- The inverse function is literally the qualified original positive-axis extension. -/
theorem source9Axis8CoordinateContinuousMulEquiv_symm_apply (B : SO8) :
    source9Axis8CoordinateContinuousMulEquiv.symm B = source9Axis8CoordinateExtension B := rfl

/-- Exact original ordered entries, with no equivalent replacement representation. -/
theorem source9Axis8CoordinateContinuousMulEquiv_entry (A : H) (i j : Fin 8) :
    (source9Axis8CoordinateContinuousMulEquiv A : M8) i j =
      (((A : SO9) : M9) i.castSucc j.castSucc) :=
  source9Axis8CoordinateRestrictionHom_entry A i j

/-- Both inverse carrier coercions give the SAME qualified raw diag(B,+1). -/
theorem source9Axis8CoordinateContinuousMulEquiv_symm_coe (B : SO8) :
    (((source9Axis8CoordinateContinuousMulEquiv.symm B : H) : SO9) : M9) =
      source9Axis8CoordinateExtensionMatrix (B : M8) :=
  source9Axis8CoordinateExtension_coe B

/-- Forward action binds every original nine-vector's first eight coordinates. -/
theorem source9Axis8CoordinateContinuousMulEquiv_mulVec (A : H) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateContinuousMulEquiv A : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i =
      ((((A : SO9) : M9)).mulVec z) i.castSucc :=
  source9Axis8CoordinateRestrictionHom_mulVec A z i

#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateExtensionMatrix_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateExtension_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_apply
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_symm_apply
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_entry
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_symm_coe
#print axioms FCP.BFSSSourceNineAxisCoordinateEquivalence.source9Axis8CoordinateContinuousMulEquiv_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EQUIVALENCE_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateEquivalence
