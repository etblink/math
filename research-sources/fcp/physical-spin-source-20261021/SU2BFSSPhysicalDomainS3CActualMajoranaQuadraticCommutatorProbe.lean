import SU2BFSSPhysicalDomainS3BFullPlaneSpinVectorCovarianceProbe

/-!
# BFSS SU(2) S3C — exact 48-Majorana quadratic spin commutator

For the actual paired, normalized 48-Majorana Fermion 2 operators, use
the delta-one CAR to derive [theta_p theta_q, theta_r].
This explicitly fixes the coefficient needed to construct an
infinitesimal Spin(9) fermionic lift and verifies that quadratic
Majorana operators preserve color.

The result is genuine source-algebra, not a constructed Spin(9) group
action, rotation-invariant Hamiltonian, angular-sector theorem or
point-spectrum theorem.
-/

namespace FCP.BFSSSU2PhysicalDomainS3C
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A

/-- In the exact source normalization {theta_p,theta_q}=delta_pq,
the quadratic Clifford commutator has coefficient ONE rather than TWO. -/
theorem pairedTheta_quadratic_commutator
    (α β γ : SpinIndex) (A B C : ColorIndex 2) :
    (pairedTheta α A * pairedTheta β B) * pairedTheta γ C -
        pairedTheta γ C * (pairedTheta α A * pairedTheta β B) =
      (if β = γ ∧ B = C then pairedTheta α A else 0) -
        (if α = γ ∧ A = C then pairedTheta β B else 0) := by
  have hbc := pairedTheta_CAR β γ B C
  have hac := pairedTheta_CAR α γ A C
  have hz (δ : SpinIndex) (D : ColorIndex 2) :
      (0 : ℂ) • pairedTheta δ D = 0 :=
    zero_smul ℂ (pairedTheta δ D)
  calc
    _ = pairedTheta α A *
          (pairedTheta β B * pairedTheta γ C + pairedTheta γ C * pairedTheta β B) -
        (pairedTheta α A * pairedTheta γ C + pairedTheta γ C * pairedTheta α A) *
          pairedTheta β B := by noncomm_ring
    _ = _ := by
      rw [hbc, hac]
      by_cases hbc' : β = γ ∧ B = C <;>
        by_cases hac' : α = γ ∧ A = C <;>
        simp [hbc', hac', hz]

/-- A color-diagonal quadratic spinor generator commutes with every
Majorana of a different gauge color, on the actual 48-label CAR. -/
theorem pairedTheta_quadratic_commutator_other_color
    (α β γ : SpinIndex) (A C : ColorIndex 2) (hAC : A ≠ C) :
    (pairedTheta α A * pairedTheta β A) * pairedTheta γ C =
      pairedTheta γ C * (pairedTheta α A * pairedTheta β A) := by
  have h := pairedTheta_quadratic_commutator α β γ A A C
  have hnot : ¬ (α = γ ∧ A = C) := fun z => hAC z.2
  have hnot' : ¬ (β = γ ∧ A = C) := fun z => hAC z.2
  simp only [if_neg hnot, if_neg hnot', sub_zero] at h
  exact sub_eq_zero.mp h

/-- On one fixed actual SU(2) color, the Clifford quadratic
commutator reduces to the indexed source spinor delta law. -/
theorem pairedTheta_quadratic_commutator_same_color
    (α β γ : SpinIndex) (A : ColorIndex 2) :
    (pairedTheta α A * pairedTheta β A) * pairedTheta γ A -
        pairedTheta γ A * (pairedTheta α A * pairedTheta β A) =
      (if β = γ then pairedTheta α A else 0) -
        (if α = γ then pairedTheta β A else 0) := by
  simpa using (pairedTheta_quadratic_commutator α β γ A A A)

#print axioms pairedTheta_quadratic_commutator
#print axioms pairedTheta_quadratic_commutator_other_color
#print axioms pairedTheta_quadratic_commutator_same_color

end
end FCP.BFSSSU2PhysicalDomainS3C
