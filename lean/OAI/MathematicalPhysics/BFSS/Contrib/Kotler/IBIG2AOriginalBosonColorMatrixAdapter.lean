import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Hom
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0AOriginalBosonGram

/-!
# IBI-G2A — exact original BFSS boson gauge / color-matrix coordinate adapter

Bind the genuine G2A action on original Boson 2 to the accepted original
G3A output-row / input-column real color coefficient matrix. This is the
source-to-finite-geometry interface required by a future orbit classifier.

No abstract stand-in SO3 action, kernel/Pauli center, Fock action,
physical Gauss/domain, or orbit-classification converse is asserted.

STAGED until the source, independent consumer and strict axiom gate pass.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG2AOriginalBosonColorMatrixAdapter
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- Exact original G2A boson action acts by the original G3A
three-by-three output-row / input-column color matrix at every spatial
index. No substitute SU2 representation is inserted. -/
theorem originalSpatialColor_gauge_matrix
    (g : GaugeGroup 2) (x : Boson 2)
    (i : SpaceIndex) (B : ColorIndex 2) :
    (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i) B =
      ∑ A : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A *
          (spatialColor x i) A := by
  change
    (spatialColor (M.gaugeConjugate (g : ColorMatrix 2) x) i) B = _
  rw [M.spatialColor_gaugeConjugate]
  simpa only [FCP.BFSSSU2GaugeG3A.adjointColorMatrix] using
    (M.colorConjugate_coefficient (g : ColorMatrix 2)
      (spatialColor x i) B)

/-- Coordinate-free color-vector version of the same exact original
boson action, with the matrix coefficient sum explicitly fixed. -/
theorem originalSpatialColor_gauge_matrix_vector
    (g : GaugeGroup 2) (x : Boson 2) (i : SpaceIndex) :
    spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i =
      WithLp.toLp 2 (fun B : ColorIndex 2 =>
        ∑ A : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A *
            (spatialColor x i) A) := by
  ext B
  exact originalSpatialColor_gauge_matrix g x i B

#print axioms originalSpatialColor_gauge_matrix
#print axioms originalSpatialColor_gauge_matrix_vector

end
end FCP.BFSSIBIG2AOriginalBosonColorMatrixAdapter
