import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG2AOriginalBosonColorMatrixAdapter

/-!
Independent source-specific G2A-to-G3A consumer.
Check arbitrary native boson coordinates, the full color vector, and
an arbitrary proper rotation transferred via the accepted source SO3
surjection. No abstract substitute SU2 or physical Fock representation.
-/
set_option autoImplicit false

namespace BFSSIBIG2AOriginalBosonColorMatrixAdapterIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG2AOriginalBosonColorMatrixAdapter
open FCP.BFSSIBIG0CSO3Hom

example (g : GaugeGroup 2) (x : Boson 2)
    (i : SpaceIndex) (B : ColorIndex 2) :
    (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i) B =
      ∑ A : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A *
          (spatialColor x i) A :=
  originalSpatialColor_gauge_matrix g x i B

example (g : GaugeGroup 2) (x : Boson 2) (i : SpaceIndex) :
    spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i =
      WithLp.toLp 2 (fun B : ColorIndex 2 =>
        ∑ A : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A *
            (spatialColor x i) A) :=
  originalSpatialColor_gauge_matrix_vector g x i

/-- Original BFSS can implement any proper color rotation of ALL nine
original bosonic coordinate vectors, with one and the same gauge element. -/
example (R : Matrix.specialOrthogonalGroup (Fin 3) ℝ) (x : Boson 2) :
    ∃ g : GaugeGroup 2,
      ∀ (i : SpaceIndex) (B : ColorIndex 2),
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i) B =
          ∑ A : ColorIndex 2,
            (R : Matrix (Fin 3) (Fin 3) ℝ) B A *
              (spatialColor x i) A := by
  obtain ⟨g, hg⟩ := originalAdjointSO3Hom_surjective R
  refine ⟨g, ?_⟩
  intro i B
  have hmatrix : FCP.BFSSSU2GaugeG3A.adjointColorMatrix g =
      (R : Matrix (Fin 3) (Fin 3) ℝ) := by
    have hc := congrArg
      (fun S : Matrix.specialOrthogonalGroup (Fin 3) ℝ =>
        (S : Matrix (Fin 3) (Fin 3) ℝ)) hg
    simpa only [originalAdjointSO3Hom_coe] using hc
  simpa only [hmatrix] using originalSpatialColor_gauge_matrix g x i B

end
end BFSSIBIG2AOriginalBosonColorMatrixAdapterIndependentConsumer
