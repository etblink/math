import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC4AOriginalWeightedNaturalAdjointSquare
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe

/-!
P3-AUX-RAD-C4B R1: exact 1/16 normalization and full-domain weak
representation of the accepted original physical weighted adjoint square.
PROSPECTIVE / UNQUALIFIED until strict source and original paired consumer pass.
This defines the normalized weighted operator, not a replacement for original H.
No kernel equality, maximal multiplier domain, smooth graph core, regulator
limit, physical Hardy estimate, eigenstate or spectral gap is asserted.
-/
set_option autoImplicit false

namespace FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
open FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare

variable (M : AlgebraData 2) (G : M.GaugeData) {ε : ℝ} (hε : 0 < ε)

/-- Exact normalized weighted natural adjoint square on original E. -/
noncomputable def originalWeightedPhysicalNormalizedAdjointSquare :
    G.physicalSpace →ₗ.[ℂ] G.physicalSpace :=
  (1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare M G hε

theorem originalWeightedPhysicalNormalizedAdjointSquare_eq :
    originalWeightedPhysicalNormalizedAdjointSquare M G hε =
      (1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare M G hε := by
  rfl

/-- Normalization retains exactly the two-layer natural operator domain. -/
theorem originalWeightedPhysicalNormalizedAdjointSquare_domain :
    (originalWeightedPhysicalNormalizedAdjointSquare M G hε).domain =
      (originalWeightedPhysicalAdjointSquare M G hε).domain := by
  rfl

theorem originalWeightedPhysicalNormalizedAdjointSquare_apply
    (u : (originalWeightedPhysicalAdjointSquare M G hε).domain) :
    originalWeightedPhysicalNormalizedAdjointSquare M G hε
      ⟨u, by
        rw [originalWeightedPhysicalNormalizedAdjointSquare_domain M G hε]
        exact u.property⟩ =
      (1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare M G hε u := by
  rfl

theorem originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint :
    letI : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
    IsSelfAdjoint (originalWeightedPhysicalNormalizedAdjointSquare M G hε) := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  apply selfAdjoint_smul_real (originalWeightedPhysicalAdjointSquare M G hε)
    (originalWeightedPhysicalAdjointSquare_selfAdjoint M G hε)
    (by norm_num)
  simp only [map_div₀, map_one, map_ofNat]

theorem originalWeightedPhysicalNormalizedAdjointSquare_closed :
    (originalWeightedPhysicalNormalizedAdjointSquare M G hε).IsClosed := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact (originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint M G hε).isClosed

theorem originalWeightedPhysicalNormalizedAdjointSquare_domain_dense :
    Dense ((originalWeightedPhysicalNormalizedAdjointSquare M G hε).domain :
      Set G.physicalSpace) := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact (originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint M G hε).dense_domain

/-- The normalized representing-vector equation tests every vector of
the actual weighted charge domain, not only a smooth core. -/
theorem originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff
    (u : (originalWeightedPhysicalChargeColumn M G hε).domain)
    (w : G.physicalSpace) :
    (∀ v : (originalWeightedPhysicalChargeColumn M G hε).domain,
      inner ℂ w (v : G.physicalSpace) =
        (1 / 16 : ℂ) *
          inner ℂ (originalWeightedPhysicalChargeColumn M G hε u)
            (originalWeightedPhysicalChargeColumn M G hε v)) ↔
      ∃ h : (u : G.physicalSpace) ∈
          (originalWeightedPhysicalNormalizedAdjointSquare M G hε).domain,
        w = originalWeightedPhysicalNormalizedAdjointSquare M G hε ⟨u, h⟩ := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  exact normalizedWeakRepresentative_iff_naturalAdjointSquare
    (originalWeightedPhysicalChargeColumn M G hε)
    (originalWeightedPhysicalChargeColumn_domain_dense_unconditional M G hε) u w

#print axioms originalWeightedPhysicalNormalizedAdjointSquare_eq
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_domain
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_apply
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_closed
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_domain_dense
#print axioms originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff

end
end FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare
