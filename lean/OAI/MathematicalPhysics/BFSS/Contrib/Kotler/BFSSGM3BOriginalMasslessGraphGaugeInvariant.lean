import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3AOriginalMasslessMultiplierGaugeIntertwining
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0c0OriginalGenericPartialMultiplierGraph

/-!
GM3B — original source-exact massless Fock multiplier graph invariance.

GM3A has qualified Q(U_g ψ) = U_g (Q ψ) on the true maximal
massless Fock domain, and GM2A proves transformed inputs remain
in that domain. This gate lifts those two qualified facts to
invariance of the ORIGINAL algebraic graph in FullL2 × FullL2.

Original D0e1d separately establishes that the paired original
massless graph is topologically closed. This gate does NOT reprove
closedness, imply self-adjointness, prove Gauss fixedness, or
make any physical Hopfion/spectral/topological assertion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3B
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The actual algebraic graph of the original massless Fock
partial multiplier is preserved by the diagonal source GaugeData
FullL2 action (U_g × U_g). The graph is not replaced by a proxy. -/
theorem originalMasslessGraph_gauge_mem
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (z : FullL2 N × FullL2 N)
    (hz : z ∈ FCP.BFSSMasslessD0c0.originalMasslessGraph M) :
    (G.fiberAction g (G.bosonPullback g⁻¹ z.1),
     G.fiberAction g (G.bosonPullback g⁻¹ z.2)) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph M := by
  change z ∈ LinearMap.range
    ((FCP.BFSSMasslessD0b0.originalMasslessDomain M).subtype.prod
      (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M)) at hz
  rcases hz with ⟨χ, hχ⟩
  change (χ.val, FCP.BFSSMasslessD0c0.originalMasslessMultiplier M χ) = z at hχ
  subst z
  let χg : FCP.BFSSMasslessD0b0.originalMasslessDomain M :=
    ⟨G.fiberAction g (G.bosonPullback g⁻¹ χ.val),
     FCP.BFSSGM2A.originalMasslessDomain_gauge_mem M G g χ.property⟩
  have hintertwines :=
    FCP.BFSSGM3A.originalMasslessMultiplier_gauge_intertwines M G g χ
  change
    (χg.val,
     G.fiberAction g
       (G.bosonPullback g⁻¹
         (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M χ))) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph M
  rw [← hintertwines]
  exact FCP.BFSSMasslessD0c0.originalMasslessGraph_mem M χg

/-- No change of carrier: literal paired SU(2), original 48-Majorana
fermion Fock FullL2 and true original maximal graph. -/
theorem pairedOriginalMasslessGraph_gauge_mem
    (g : GaugeGroup 2) (z : FullL2 2 × FullL2 2)
    (hz : z ∈ FCP.BFSSMasslessD0c0.originalMasslessGraph
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.1),
     FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.2)) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :=
  originalMasslessGraph_gauge_mem
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData g z hz

#print axioms originalMasslessGraph_gauge_mem
#print axioms pairedOriginalMasslessGraph_gauge_mem

end
end FCP.BFSSGM3B
