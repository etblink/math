import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BDOriginalPhysicalChargeAdjointSquareSelfAdjointProbe

/-!
P3-AUX-RAD-C4A R1: natural adjoint square of the accepted original SU2
physical weighted sixteen-charge Sε, for ε > 0.
PROSPECTIVE / UNQUALIFIED until exact strict source, independent original
paired SU2 consumer and root audits pass.
Reuses generic BC/BD graph arguments, not their unweighted-T specializations.
No 1/16 normalization or weak-form transfer (C4B), no maximal weighted
domain, smooth graph-core, zero-regulator conclusion or spectral gap.
-/
set_option autoImplicit false

namespace FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BD
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
open RCLike LinearPMap

variable (M : AlgebraData 2) (G : M.GaugeData) {ε : ℝ} (hε : 0 < ε)

/-- Natural Sε†Sε on the actual original physical Hilbert subtype.
The second charge-domain condition is retained by naturalComp. -/
noncomputable def originalWeightedPhysicalAdjointSquare :
    G.physicalSpace →ₗ.[ℂ] G.physicalSpace := by
  letI : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact naturalComp (originalWeightedPhysicalChargeColumn M G hε).adjoint
    (originalWeightedPhysicalChargeColumn M G hε)

/-- Exact two-layer natural domain, with no assumed domain invariance. -/
theorem originalWeightedPhysicalAdjointSquare_domain (u : G.physicalSpace) :
    letI : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
    u ∈ (originalWeightedPhysicalAdjointSquare M G hε).domain ↔
      ∃ hu : u ∈ (originalWeightedPhysicalChargeColumn M G hε).domain,
        originalWeightedPhysicalChargeColumn M G hε ⟨u, hu⟩ ∈
          (originalWeightedPhysicalChargeColumn M G hε).adjoint.domain := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact naturalComp_mem_domain

/-- Closed+dense Sε supplies the generic von Neumann graph argument
on the literal original input and sixteen-output Hilbert spaces. -/
theorem originalWeightedPhysicalAdjointSquare_selfAdjoint :
    letI : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
    IsSelfAdjoint (originalWeightedPhysicalAdjointSquare M G hε) := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  apply selfAdjoint_of_formalSymmetry_and_shift_surjectivity
  · exact naturalFormalProduct_symmetric _ _
      (LinearPMap.adjoint_isFormalAdjoint
        (originalWeightedPhysicalChargeColumn_domain_dense_unconditional M G hε))
  · exact naturalAdjointSquare_shift_graph_surjective
      (originalWeightedPhysicalChargeColumn M G hε)
      (originalWeightedPhysicalChargeColumn_isClosed M G hε)
      (originalWeightedPhysicalChargeColumn_domain_dense_unconditional M G hε)

theorem originalWeightedPhysicalAdjointSquare_closed :
    (originalWeightedPhysicalAdjointSquare M G hε).IsClosed := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact (originalWeightedPhysicalAdjointSquare_selfAdjoint M G hε).isClosed

theorem originalWeightedPhysicalAdjointSquare_domain_dense :
    Dense ((originalWeightedPhysicalAdjointSquare M G hε).domain :
      Set G.physicalSpace) := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact (originalWeightedPhysicalAdjointSquare_selfAdjoint M G hε).dense_domain

/-- The unnormalized natural adjoint square has exactly the original
weighted sixteen-charge energy on its true natural domain. -/
theorem originalWeightedPhysicalAdjointSquare_energy
    (u : (originalWeightedPhysicalAdjointSquare M G hε).domain) :
    letI : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
    Complex.re (inner ℂ (originalWeightedPhysicalAdjointSquare M G hε u)
      (u : G.physicalSpace)) =
      ‖originalWeightedPhysicalChargeColumn M G hε
        ⟨u, naturalComp_domain_le u.property⟩‖ ^ 2 := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  have hinner :
      inner ℂ (originalWeightedPhysicalAdjointSquare M G hε u)
        (u : G.physicalSpace) =
      inner ℂ
        (originalWeightedPhysicalChargeColumn M G hε
          ⟨u, naturalComp_domain_le u.property⟩)
        (originalWeightedPhysicalChargeColumn M G hε
          ⟨u, naturalComp_domain_le u.property⟩) :=
    naturalFormalProduct_inner _ _
      (LinearPMap.adjoint_isFormalAdjoint
        (originalWeightedPhysicalChargeColumn_domain_dense_unconditional M G hε)) u
  exact (congrArg Complex.re hinner).trans
    (inner_self_eq_norm_sq (𝕜 := ℂ)
      (originalWeightedPhysicalChargeColumn M G hε
        ⟨u, naturalComp_domain_le u.property⟩))

theorem originalWeightedPhysicalAdjointSquare_nonneg
    (u : (originalWeightedPhysicalAdjointSquare M G hε).domain) :
    0 ≤ Complex.re (inner ℂ
      (originalWeightedPhysicalAdjointSquare M G hε u)
      (u : G.physicalSpace)) := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  rw [originalWeightedPhysicalAdjointSquare_energy M G hε u]
  exact sq_nonneg _

#print axioms originalWeightedPhysicalAdjointSquare_domain
#print axioms originalWeightedPhysicalAdjointSquare_selfAdjoint
#print axioms originalWeightedPhysicalAdjointSquare_closed
#print axioms originalWeightedPhysicalAdjointSquare_domain_dense
#print axioms originalWeightedPhysicalAdjointSquare_energy
#print axioms originalWeightedPhysicalAdjointSquare_nonneg

end
end FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
