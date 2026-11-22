import OAI.MathematicalPhysics.BFSS.GaugeOrbits
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG2ABosonGaugeProbe

/-!
GM0A — source-exact BFSS color-Lie triple scalar SU(2) invariance.

This verifies the color-geometric trilinear contraction against the actual
upstream AlgebraData.colorConjugate and paired SU(2) bosonic representation.

NOT the full h=1,m=0 Fock-operator covariance, natural massless FullL2
domain invariance, self-adjointness, Hamiltonian covariance, or Hopfion.
The 48-Majorana quantizer still needs a distinct tensor/fiber-intertwiner gate.
-/
set_option autoImplicit false

namespace FCP.BFSSGM0A
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Real color Lie triple scalar is invariant under the *actual* original
special-unitary matrix conjugation, on the existing ColorVector N carrier. -/
theorem originalColorLieTriple_gauge_invariant
    {N : ℕ} (M : AlgebraData N) (g : GaugeGroup N)
    (a b c : ColorVector N) :
    inner ℝ
      (M.colorLie
        (M.colorConjugate (g : ColorMatrix N) a)
        (M.colorConjugate (g : ColorMatrix N) b))
      (M.colorConjugate (g : ColorMatrix N) c) =
      inner ℝ (M.colorLie a b) c := by
  rw [M.colorConjugate_lie (g : ColorMatrix N) g.prop.1 a b]
  exact M.colorConjugate_inner (g : ColorMatrix N) g.prop.1
    (M.colorLie a b) c

/-- Literal paired SU(2) original-boson specialization for any three
spatial color vectors. The genuine source G2A gauge action is used, not
a separately supplied SO(3) rotation or surrogate color representation. -/
theorem pairedOriginalSpatialColorLieTriple_gauge_invariant
    (g : GaugeGroup 2) (x : Boson 2) (i j k : SpaceIndex) :
    inner ℝ
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.colorLie
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) i)
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) j))
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) k) =
    inner ℝ
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.colorLie
        (spatialColor x i) (spatialColor x j))
      (spatialColor x k) := by
  simpa only [FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv_apply,
    AlgebraData.spatialColor_gaugeConjugate] using
    (originalColorLieTriple_gauge_invariant
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData g
      (spatialColor x i) (spatialColor x j) (spatialColor x k))

#print axioms originalColorLieTriple_gauge_invariant
#print axioms pairedOriginalSpatialColorLieTriple_gauge_invariant

end
end FCP.BFSSGM0A
