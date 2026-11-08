import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisTargetPreimage
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSignedWord

/-!
Candidate algebraic projection of the ACTUAL original source ninth-axis
stabilizer onto the actual fixed-axis matrix SO(9) subgroup. Preserve both
literal predicates, original vector action, and distinct source central signs.
No topology registration, covering, Spin(8) identification or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisProjection
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineOrientation FCP.BFSSSourceNineSignedWord
open FCP.BFSSSourceNineAxisTargetPreimage

private abbrev V := SpaceIndex → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev axis : V := source9CoordinateVector 8

private theorem source_identity_action (z : V) : source9SpinVectorRepresentation (1 : G) z = z := by
  rw [map_one]
  rfl

/-- The subgroup with EXACTLY the previously qualified original source fixed-axis predicate. -/
noncomputable def source9Axis8SpinStabilizer : Subgroup G where
  carrier := {g | source9SpinVectorRepresentation g axis = axis}
  one_mem' := source_identity_action axis
  mul_mem' := by
    intro g h hg hh
    change source9SpinVectorRepresentation g axis = axis at hg
    change source9SpinVectorRepresentation h axis = axis at hh
    change source9SpinVectorRepresentation (g * h) axis = axis
    calc
      _ = source9SpinVectorRepresentation g (source9SpinVectorRepresentation h axis) :=
        congrArg (fun f : V →ₗ[ℝ] V => f axis) (map_mul source9SpinVectorRepresentation g h)
      _ = axis := by rw [hh, hg]
  inv_mem' := by
    intro g hg
    change source9SpinVectorRepresentation g axis = axis at hg
    change source9SpinVectorRepresentation (g⁻¹) axis = axis
    have hcancel : source9SpinVectorRepresentation (g⁻¹)
        (source9SpinVectorRepresentation g axis) = axis := by
      calc
        _ = source9SpinVectorRepresentation (g⁻¹ * g) axis :=
          (congrArg (fun f : V →ₗ[ℝ] V => f axis)
            (map_mul source9SpinVectorRepresentation (g⁻¹) g)).symm
        _ = axis := (congrArg (fun k : G => source9SpinVectorRepresentation k axis)
          (inv_mul_cancel g)).trans (source_identity_action axis)
    simpa only [hg] using hcancel

/-- The ACTUAL original matrix SO(9) subgroup fixing the same source coordinate axis. -/
noncomputable def source9Axis8MatrixStabilizer : Subgroup SO9 where
  carrier := {A | (A : M9).mulVec axis = axis}
  one_mem' := Matrix.one_mulVec axis
  mul_mem' := by
    intro A B hA hB
    change (A : M9).mulVec axis = axis at hA
    change (B : M9).mulVec axis = axis at hB
    change ((A : M9) * (B : M9)).mulVec axis = axis
    rw [← Matrix.mulVec_mulVec, hB, hA]
  inv_mem' := by
    intro A hA
    change (A : M9).mulVec axis = axis at hA
    change ((A⁻¹ : SO9) : M9).mulVec axis = axis
    have hcancel : ((A⁻¹ : SO9) : M9).mulVec ((A : M9).mulVec axis) = axis := by
      calc
        _ = ((A⁻¹ * A : SO9) : M9).mulVec axis := Matrix.mulVec_mulVec axis _ _
        _ = axis := (congrArg (fun B : SO9 => (B : M9).mulVec axis)
          (inv_mul_cancel A)).trans (Matrix.one_mulVec axis)
    simpa only [hA] using hcancel

/-- No new source membership notion is introduced. -/
theorem source9Axis8SpinStabilizer_mem_iff (g : G) :
    g ∈ source9Axis8SpinStabilizer ↔ source9SpinVectorRepresentation g axis = axis := Iff.rfl

/-- No abstract or permuted target fixed-axis predicate is substituted. -/
theorem source9Axis8MatrixStabilizer_mem_iff (A : SO9) :
    A ∈ source9Axis8MatrixStabilizer ↔ (A : M9).mulVec axis = axis := Iff.rfl

private abbrev K := source9Axis8SpinStabilizer
private abbrev H := source9Axis8MatrixStabilizer

/-- Restrict the EXISTING source SO(9) homomorphism to these exact source and target subgroups. -/
noncomputable def source9Axis8ProjectionHom : K →* H where
  toFun g := ⟨source9SpinVectorSpecialOrthogonalHom g.val,
    (source9SpinVectorSpecialOrthogonalHom_mulVec g.val axis).trans g.property⟩
  map_one' := Subtype.ext (map_one source9SpinVectorSpecialOrthogonalHom)
  map_mul' g h := Subtype.ext (map_mul source9SpinVectorSpecialOrthogonalHom g.val h.val)

/-- The projection value is literally the original SO(9) source homomorphism. -/
theorem source9Axis8ProjectionHom_coe (g : K) :
    ((source9Axis8ProjectionHom g : H) : SO9) = source9SpinVectorSpecialOrthogonalHom g.val := rfl

/-- Its original full nine-vector action is unchanged on every vector. -/
theorem source9Axis8ProjectionHom_mulVec (g : K) (z : V) :
    (((source9Axis8ProjectionHom g : H) : SO9) : M9).mulVec z =
      source9SpinVectorRepresentation g.val z :=
  source9SpinVectorSpecialOrthogonalHom_mulVec g.val z

/-- Surjectivity onto ALL original fixed-axis targets, using the qualified noncircular source lift. -/
theorem source9Axis8ProjectionHom_surjective : Function.Surjective source9Axis8ProjectionHom := by
  intro A
  obtain ⟨g, hgfix, haction⟩ := source9Axis8Target_hasOriginalSourcePreimage A.val A.property
  refine ⟨⟨g, hgfix⟩, ?_⟩
  apply Subtype.ext
  apply Subtype.ext
  apply Matrix.mulVec_injective
  funext z
  exact (source9SpinVectorSpecialOrthogonalHom_mulVec g z).trans (haction z)

/-- The ACTUAL negative central source element, with its existing original stabilizer membership. -/
noncomputable def source9Axis8NegativeCentral : K :=
  ⟨source9NegativeCentral, by
    have haction : ∀ z : V, source9SpinVectorRepresentation source9NegativeCentral z =
        source9SpinVectorRepresentation (1 : G) z :=
      (source9Action_eq_iff_two_sign_fiber source9NegativeCentral 1).mpr
        (Or.inr (mul_one source9NegativeCentral).symm)
    exact (haction axis).trans (source_identity_action axis)⟩

/-- The negative kernel sign is exactly the original source element. -/
theorem source9Axis8NegativeCentral_coe :
    (source9Axis8NegativeCentral : G) = source9NegativeCentral := rfl

/-- Its inequality from the source identity is preserved inside the literal stabilizer. -/
theorem source9Axis8NegativeCentral_ne_one : source9Axis8NegativeCentral ≠ (1 : K) := by
  intro h
  exact source9NegativeCentral_ne_one (congrArg (fun k : K => (k : G)) h)

/-- Its vector projection is identity; no assertion about its distinct fermionic action is made. -/
theorem source9Axis8NegativeCentral_image : source9Axis8ProjectionHom source9Axis8NegativeCentral = 1 := by
  apply Subtype.ext
  apply Subtype.ext
  change source9SpinVectorMatrixHom source9NegativeCentral = (1 : M9)
  exact source9NegativeCentral_naturalMatrix_one

/-- Exact fibers inside the original stabilizer have precisely the two actual source signs. -/
theorem source9Axis8ProjectionHom_eq_iff_two_sign_fiber (g h : K) :
    source9Axis8ProjectionHom g = source9Axis8ProjectionHom h ↔
      g = h ∨ g = source9Axis8NegativeCentral * h := by
  constructor
  · intro hp
    have haction : ∀ z : V, source9SpinVectorRepresentation g.val z =
        source9SpinVectorRepresentation h.val z := by
      intro z
      calc
        _ = (((source9Axis8ProjectionHom g : H) : SO9) : M9).mulVec z :=
          (source9Axis8ProjectionHom_mulVec g z).symm
        _ = (((source9Axis8ProjectionHom h : H) : SO9) : M9).mulVec z :=
          congrArg (fun A : H => ((A : SO9) : M9).mulVec z) hp
        _ = _ := source9Axis8ProjectionHom_mulVec h z
    rcases (source9Action_eq_iff_two_sign_fiber g.val h.val).mp haction with hsame | hneg
    · exact Or.inl (Subtype.ext hsame)
    · exact Or.inr (Subtype.ext hneg)
  · rintro (rfl | rfl)
    · rfl
    · rw [map_mul, source9Axis8NegativeCentral_image, one_mul]

/-- Exact original kernel membership, with neither missing nor collapsed source signs. -/
theorem source9Axis8ProjectionHom_mem_ker_iff (g : K) :
    g ∈ source9Axis8ProjectionHom.ker ↔ g = 1 ∨ g = source9Axis8NegativeCentral := by
  change source9Axis8ProjectionHom g = 1 ↔ g = 1 ∨ g = source9Axis8NegativeCentral
  have h := source9Axis8ProjectionHom_eq_iff_two_sign_fiber g 1
  rw [map_one, mul_one] at h
  exact h

/-- The kernel carrier is exactly the pair of distinct original signs. -/
theorem source9Axis8ProjectionHom_ker_eq :
    (source9Axis8ProjectionHom.ker : Set K) = {1, source9Axis8NegativeCentral} := by
  ext g
  simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using source9Axis8ProjectionHom_mem_ker_iff g

/-- The two sign-related preimages remain distinct for EVERY original stabilizer element. -/
theorem source9Axis8ProjectionHom_fiber_signs_distinct (g : K) :
    g ≠ source9Axis8NegativeCentral * g := by
  intro h
  exact source9NaturalMatrix_fiber_signs_distinct g.val (congrArg (fun k : K => (k : G)) h)

/-- Every original fixed-axis target has a nonempty fiber consisting of exactly two distinct signs. -/
theorem source9Axis8ProjectionHom_fiber_exact_pair (A : H) :
    ∃ g : K, source9Axis8ProjectionHom g = A ∧
      (∀ h : K, source9Axis8ProjectionHom h = A ↔
        h = g ∨ h = source9Axis8NegativeCentral * g) ∧
      g ≠ source9Axis8NegativeCentral * g := by
  obtain ⟨g, hg⟩ := source9Axis8ProjectionHom_surjective A
  refine ⟨g, hg, ?_, source9Axis8ProjectionHom_fiber_signs_distinct g⟩
  intro h
  rw [← hg]
  exact source9Axis8ProjectionHom_eq_iff_two_sign_fiber h g

#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer_mem_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer_mem_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_coe
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mulVec
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_surjective
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_coe
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_ne_one
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_image
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_eq_iff_two_sign_fiber
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mem_ker_iff
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_ker_eq
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_signs_distinct
#print axioms FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_exact_pair
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisProjection
