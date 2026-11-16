import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSSpin9AbstractPhysicalOutline
import OAI.MathematicalPhysics.BFSS.Core

/-!
# Independent consumer of the abstract Spin(9) structural outline

The physical carrier is the literal OAI.BFSSQuantum.FullL2 2.
Both the Spin(9) unitary and the exact charges are INPUTS, not defined
from the unproved physical representation. No nonzero singlet is assumed
to exist: these are conditional mathematical tests.
-/

set_option autoImplicit false
namespace FCP.BFSSSpin9AbstractPhysicalOutlineIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSpin9AbstractPhysicalOutline

variable {G S : Type*} [Group G]
  [NormedAddCommGroup S] [NormedSpace ℝ S]

/-- Typed on the ORIGINAL BFSS full Hilbert carrier: the sixteen
conditional squared charge norms equal their source-shaped average. -/
theorem sourceFullL2_singlet_charge_average
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2))
    (D : Set (FullL2 2))
    (hD : ∀ (g : G) (η : D), U g (η : FullL2 2) ∈ D)
    (Q : S → D → FullL2 2)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : FullL2 2), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hUnit : ∀ i : Fin 16, ‖basis i‖ = 1)
    (hSphere : ∀ v w : S, ‖v‖ = 1 → ‖w‖ = 1 →
      ∃ g : G, spin g v = w)
    (ψ : D) (hSinglet : ∀ g : G,
      U g (ψ : FullL2 2) = (ψ : FullL2 2))
    (α : Fin 16) :
    ‖Q (basis α) ψ‖ ^ 2 =
      (1 / 16 : ℝ) * ∑ β : Fin 16, ‖Q (basis β) ψ‖ ^ 2 := by
  exact charge_basis_sq_eq_average_of_sphere_transitive
    spin U D hD Q hCov basis hUnit hSphere ψ hSinglet α

/-- Independently consume the same physical theorem as the equality
of the squared norm of any pair of original supercharge labels. -/
theorem sourceFullL2_any_two_charge_norms
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2))
    (D : Set (FullL2 2))
    (hD : ∀ (g : G) (η : D), U g (η : FullL2 2) ∈ D)
    (Q : S → D → FullL2 2)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : FullL2 2), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hTrans : ∀ i j : Fin 16, ∃ g : G, spin g (basis i) = basis j)
    (ψ : D) (hSinglet : ∀ g : G,
      U g (ψ : FullL2 2) = (ψ : FullL2 2))
    (i j : Fin 16) :
    ‖Q (basis i) ψ‖ ^ 2 = ‖Q (basis j) ψ‖ ^ 2 := by
  rw [charge_basis_norm_eq spin U D hD Q hCov basis hTrans ψ hSinglet i j]

/-- Spin symmetry preserves the EXACT gauge-fixed condition when the
true full Hilbert unitaries commute, a stronger demand than a proven
48-label source matrix equality. -/
theorem sourceFullL2_gaugeFixed_spinStable
    {K : Type*} [Group K]
    (U : G →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2))
    (C : K →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2))
    (hCommute : ∀ (g : G) (k : K) (η : FullL2 2),
      C k (U g η) = U g (C k η))
    (η : FullL2 2)
    (hGauge : ∀ k : K, C k η = η)
    (g : G) (k : K) :
    C k (U g η) = U g η :=
  spin_preserves_gauge_fixed U C hCommute η hGauge g k

#print axioms sourceFullL2_singlet_charge_average
#print axioms sourceFullL2_any_two_charge_norms
#print axioms sourceFullL2_gaugeFixed_spinStable

end
end FCP.BFSSSpin9AbstractPhysicalOutlineIndependentConsumer
