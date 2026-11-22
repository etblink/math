import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4B1OriginalPhysicalMasslessDomainDense
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0e1dPairedOriginalClosedDenseGraphConsumer

/-!
GM4B2 — genuine original massless fermionic multiplier CLOSED GRAPH,
now restricted to original source SU(2) gauge-fixed physical Hilbert.

The source full massless Fock multiplier's actual maximal graph was
independently proved closed in D0e1c/D0e1d. GM4A constructs a partial
linear map whose domain is exactly the source maximal massless domain
intersected with the literal source GaugeData.physicalSpace, and whose
output lies in that same physicalSpace. GM4B1 proves density there.

This gate establishes that the ALGEBRAIC graph of that very GM4A
partial operator is the inverse image of the full original graph
under the continuous source physical-subspace product inclusion.
This is not a new graph definition standing in for the operator.
No self-adjointness, charge/Hamiltonian identification, mass gap,
ground-state or physical Hopfion follows.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B2
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Set

/-- The actual algebraic graph of GM4A's genuine original
massless Fock multiplier restricted to the source physical
SU(2)-fixed Hilbert subspace. -/
noncomputable def originalPhysicalMasslessGraph
    (M : AlgebraData 2) (G : M.GaugeData) :
    Submodule ℂ (G.physicalSpace × G.physicalSpace) :=
  LinearMap.range
    ((FCP.BFSSGM4A.originalPhysicalMasslessDomain M G).subtype.prod
      (FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G))

/-- Exact graph identification: the ALGEBRAIC graph of GM4A's
source-physical partial map is precisely the inverse image of
D0c0's actual original FullL2×FullL2 graph under the original
physical-space product inclusion. No graph is replaced. -/
theorem originalPhysicalMasslessGraph_eq_preimage
    (M : AlgebraData 2) (G : M.GaugeData) :
    (originalPhysicalMasslessGraph M G :
      Set (G.physicalSpace × G.physicalSpace)) =
    (fun z : G.physicalSpace × G.physicalSpace =>
      ((z.1 : FullL2 2), (z.2 : FullL2 2))) ⁻¹'
      (FCP.BFSSMasslessD0c0.originalMasslessGraph M :
        Set (FullL2 2 × FullL2 2)) := by
  ext z
  constructor
  · intro hz
    change z ∈ LinearMap.range
      ((FCP.BFSSGM4A.originalPhysicalMasslessDomain M G).subtype.prod
        (FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G)) at hz
    rcases hz with ⟨ψ, hψ⟩
    change
      (ψ.val, FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G ψ) = z
        at hψ
    have hraw :
        (((ψ.val : G.physicalSpace) : FullL2 2),
          ((FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G ψ :
            G.physicalSpace) : FullL2 2)) ∈
          FCP.BFSSMasslessD0c0.originalMasslessGraph M := by
      exact FCP.BFSSMasslessD0c0.originalMasslessGraph_mem M
        (FCP.BFSSGM4A.originalPhysicalMasslessDomainLift M G ψ)
    have heq :
        (((ψ.val : G.physicalSpace) : FullL2 2),
          ((FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G ψ :
            G.physicalSpace) : FullL2 2)) =
        ((z.1 : FullL2 2), (z.2 : FullL2 2)) :=
      congrArg
        (fun p : G.physicalSpace × G.physicalSpace =>
          ((p.1 : FullL2 2), (p.2 : FullL2 2))) hψ
    exact heq ▸ hraw
  · intro hz
    change ((z.1 : FullL2 2), (z.2 : FullL2 2)) ∈
      LinearMap.range
        ((FCP.BFSSMasslessD0b0.originalMasslessDomain M).subtype.prod
          (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M)) at hz
    rcases hz with ⟨χ, hχ⟩
    change
      ((χ.val : FullL2 2),
       FCP.BFSSMasslessD0c0.originalMasslessMultiplier M χ) =
      ((z.1 : FullL2 2), (z.2 : FullL2 2)) at hχ
    have hin : (χ.val : FullL2 2) = (z.1 : FullL2 2) :=
      congrArg Prod.fst hχ
    have hout :
        FCP.BFSSMasslessD0c0.originalMasslessMultiplier M χ =
        (z.2 : FullL2 2) := congrArg Prod.snd hχ
    have hdom : (z.1 : FullL2 2) ∈
        FCP.BFSSMasslessD0b0.originalMasslessDomain M := by
      rw [← hin]
      exact χ.property
    let ψ : FCP.BFSSGM4A.originalPhysicalMasslessDomain M G :=
      ⟨z.1, hdom⟩
    have hsub :
        FCP.BFSSGM4A.originalPhysicalMasslessDomainLift M G ψ = χ := by
      apply Subtype.ext
      exact hin.symm
    have hout' :
        ((FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G ψ :
          G.physicalSpace) : FullL2 2) = (z.2 : FullL2 2) := by
      change FCP.BFSSMasslessD0c0.originalMasslessMultiplier M
        (FCP.BFSSGM4A.originalPhysicalMasslessDomainLift M G ψ) = _
      rw [hsub]
      exact hout
    change z ∈ LinearMap.range
      ((FCP.BFSSGM4A.originalPhysicalMasslessDomain M G).subtype.prod
        (FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G))
    refine ⟨ψ, ?_⟩
    change
      (ψ.val, FCP.BFSSGM4A.originalPhysicalMasslessMultiplier M G ψ) = z
    apply Prod.ext
    · rfl
    · exact Subtype.ext hout'

/-- The original GM4A physical-domain partial operator is
CLOSED: its actual graph is closed inside the genuine physical
Hilbert product. Uses source D0e1c graph closedness and a
continuous physical-space product inclusion, not a new axiom. -/
theorem originalPhysicalMasslessGraph_isClosed
    (M : AlgebraData 2) (G : M.GaugeData) :
    IsClosed (originalPhysicalMasslessGraph M G :
      Set (G.physicalSpace × G.physicalSpace)) := by
  rw [originalPhysicalMasslessGraph_eq_preimage M G]
  have hc : Continuous (fun z : G.physicalSpace × G.physicalSpace =>
      ((z.1 : FullL2 2), (z.2 : FullL2 2))) :=
    (continuous_subtype_val.comp continuous_fst).prodMk
      (continuous_subtype_val.comp continuous_snd)
  exact (FCP.BFSSMasslessD0e1c.originalMasslessGraph_isClosed M).preimage hc

/-- Literal 48-Majorana source SU(2) physical massless graph. -/
noncomputable def pairedOriginalPhysicalMasslessGraph :
    Submodule ℂ
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace ×
       FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) :=
  originalPhysicalMasslessGraph
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData

/-- TRUE paired SU(2) original physical massless operator
has a closed graph in the genuine source physical Hilbert product. -/
theorem pairedOriginalPhysicalMasslessGraph_isClosed :
    IsClosed (pairedOriginalPhysicalMasslessGraph :
      Set (FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace ×
           FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace)) :=
  originalPhysicalMasslessGraph_isClosed
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData

/-- Only the two rigorously separate operator facts:
the actual physical massless operator is densely defined
and has a closed original physical Hilbert graph. -/
theorem pairedOriginalPhysicalMasslessDomain_dense_graph_closed :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) ∧
    IsClosed (pairedOriginalPhysicalMasslessGraph :
      Set (FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace ×
           FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace)) :=
  ⟨FCP.BFSSGM4B1.pairedOriginalPhysicalMasslessDomain_dense,
   pairedOriginalPhysicalMasslessGraph_isClosed⟩

#print axioms originalPhysicalMasslessGraph
#print axioms originalPhysicalMasslessGraph_eq_preimage
#print axioms originalPhysicalMasslessGraph_isClosed
#print axioms pairedOriginalPhysicalMasslessGraph
#print axioms pairedOriginalPhysicalMasslessGraph_isClosed
#print axioms pairedOriginalPhysicalMasslessDomain_dense_graph_closed

end
end FCP.BFSSGM4B2
