import Mathlib

/-!
# Spin(9) structural outline — explicit hypotheses, no original-source overclaim

A genuinely top-down theorem for a group acting isometrically on a real
spinor carrier and on a complex physical Hilbert carrier. The charge acts
on an explicit invariant COMMON domain, not on an assumed globally bounded
extension. Covariance, physical singlet fixedness and unit-sphere transitivity
remain named premises; none is silently obtained from a Clifford action.

This file is abstract: the finite spinor basis is indexed by the ORIGINAL
sixteen BFSS supercharge labels, but it DOES NOT establish a physical Spin(9)
representation, a nonzero singlet, gauge reduction, domain closure, Hardy
estimates, spectral conclusions or the original normalized charges.

Staged until cold Lean 4.34.1 / independently compiled consumer green.
-/

set_option autoImplicit false

namespace FCP.BFSSSpin9AbstractPhysicalOutline

noncomputable section

variable {G S H : Type*}
  [Group G]
  [NormedAddCommGroup S] [NormedSpace ℝ S]
  [NormedAddCommGroup H] [NormedSpace ℂ H]

/-- On an explicitly invariant core, exact spinor covariance plus
singlet fixedness forces charge-output norm preservation along a
group orbit. No boundedness of the unbounded physical charge is used. -/
theorem charge_norm_eq_of_spin_orbit
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (D : Set H)
    (hD : ∀ (g : G) (η : D), U g (η : H) ∈ D)
    (Q : S → D → H)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : H), hD g η⟩ = U g (Q v η))
    (ψ : D) (hSinglet : ∀ g : G, U g (ψ : H) = (ψ : H))
    (g : G) (v : S) :
    ‖Q (spin g v) ψ‖ = ‖Q v ψ‖ := by
  have hFixed : (⟨U g (ψ : H), hD g ψ⟩ : D) = ψ :=
    Subtype.ext (hSinglet g)
  have h := hCov g v ψ
  rw [hFixed] at h
  rw [h]
  exact (U g).norm_map _

/-- Transitivity on the actual sixteen basis vectors is enough to
identify all sixteen charge output norms for a fixed singlet. -/
theorem charge_basis_norm_eq
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (D : Set H)
    (hD : ∀ (g : G) (η : D), U g (η : H) ∈ D)
    (Q : S → D → H)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : H), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hTrans : ∀ i j : Fin 16, ∃ g : G, spin g (basis i) = basis j)
    (ψ : D) (hSinglet : ∀ g : G, U g (ψ : H) = (ψ : H))
    (i j : Fin 16) :
    ‖Q (basis i) ψ‖ = ‖Q (basis j) ψ‖ := by
  obtain ⟨g, hg⟩ := hTrans i j
  calc
    ‖Q (basis i) ψ‖ = ‖Q (spin g (basis i)) ψ‖ :=
      (charge_norm_eq_of_spin_orbit spin U D hD Q hCov ψ hSinglet g (basis i)).symm
    _ = ‖Q (basis j) ψ‖ := by rw [hg]

/-- The original sixteen charge norms have an equal squared-norm sum.
This is an algebraic consequence of the supplied physical symmetries,
not a definition of the original physical quadratic form. -/
theorem charge_basis_sum_sq_eq_sixteen
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (D : Set H)
    (hD : ∀ (g : G) (η : D), U g (η : H) ∈ D)
    (Q : S → D → H)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : H), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hTrans : ∀ i j : Fin 16, ∃ g : G, spin g (basis i) = basis j)
    (ψ : D) (hSinglet : ∀ g : G, U g (ψ : H) = (ψ : H))
    (i : Fin 16) :
    (∑ j : Fin 16, ‖Q (basis j) ψ‖ ^ 2) =
      (16 : ℝ) * ‖Q (basis i) ψ‖ ^ 2 := by
  classical
  calc
    (∑ j : Fin 16, ‖Q (basis j) ψ‖ ^ 2) =
        ∑ _j : Fin 16, ‖Q (basis i) ψ‖ ^ 2 := by
          apply Finset.sum_congr rfl
          intro j _
          rw [charge_basis_norm_eq spin U D hD Q hCov basis hTrans
            ψ hSinglet j i]
    _ = (16 : ℝ) * ‖Q (basis i) ψ‖ ^ 2 := by
          simp [Finset.sum_const, nsmul_eq_mul]

/-- The requested top-down physical *outline*: on a genuine Spin(9)
singlet in a common invariant domain, each charge norm square equals
the sixteen-charge average, provided exact covariance and basis
transitivity hold. NO native BFSS covariance is asserted by this file. -/
theorem charge_basis_sq_eq_average
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (D : Set H)
    (hD : ∀ (g : G) (η : D), U g (η : H) ∈ D)
    (Q : S → D → H)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : H), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hTrans : ∀ i j : Fin 16, ∃ g : G, spin g (basis i) = basis j)
    (ψ : D) (hSinglet : ∀ g : G, U g (ψ : H) = (ψ : H))
    (i : Fin 16) :
    ‖Q (basis i) ψ‖ ^ 2 =
      (1 / 16 : ℝ) * ∑ j : Fin 16, ‖Q (basis j) ψ‖ ^ 2 := by
  rw [charge_basis_sum_sq_eq_sixteen spin U D hD Q hCov basis
    hTrans ψ hSinglet i]
  ring

/-- Explicitly distinguish transitivity on the spinor unit sphere
from the supplied physical unitary/domain/covariance interfaces. -/
theorem charge_basis_sq_eq_average_of_sphere_transitive
    (spin : G →* (S ≃ₗᵢ[ℝ] S))
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (D : Set H)
    (hD : ∀ (g : G) (η : D), U g (η : H) ∈ D)
    (Q : S → D → H)
    (hCov : ∀ (g : G) (v : S) (η : D),
      Q (spin g v) ⟨U g (η : H), hD g η⟩ = U g (Q v η))
    (basis : Fin 16 → S)
    (hUnit : ∀ i : Fin 16, ‖basis i‖ = 1)
    (hSphere : ∀ v w : S, ‖v‖ = 1 → ‖w‖ = 1 →
      ∃ g : G, spin g v = w)
    (ψ : D) (hSinglet : ∀ g : G, U g (ψ : H) = (ψ : H))
    (i : Fin 16) :
    ‖Q (basis i) ψ‖ ^ 2 =
      (1 / 16 : ℝ) * ∑ j : Fin 16, ‖Q (basis j) ψ‖ ^ 2 := by
  apply charge_basis_sq_eq_average spin U D hD Q hCov basis
  · intro j k
    exact hSphere (basis j) (basis k) (hUnit j) (hUnit k)
  · exact ψ
  · exact hSinglet
  · exact i

/-- Independent top-level consequence: if a real physical group action
commutes with the true gauge unitary action on ALL physical vectors,
the gauge-fixed subspace is preserved. Commutation on 48 source labels
is not substituted for this stronger premise. -/
theorem spin_preserves_gauge_fixed
    {K : Type*} [Group K]
    (U : G →* (H ≃ₗᵢ[ℂ] H))
    (C : K →* (H ≃ₗᵢ[ℂ] H))
    (hCommute : ∀ (g : G) (k : K) (η : H),
      C k (U g η) = U g (C k η))
    (η : H) (hGauge : ∀ k : K, C k η = η)
    (g : G) (k : K) :
    C k (U g η) = U g η := by
  rw [hCommute g k η, hGauge k]

#print axioms charge_norm_eq_of_spin_orbit
#print axioms charge_basis_norm_eq
#print axioms charge_basis_sum_sq_eq_sixteen
#print axioms charge_basis_sq_eq_average
#print axioms charge_basis_sq_eq_average_of_sphere_transitive
#print axioms spin_preserves_gauge_fixed

end
end FCP.BFSSSpin9AbstractPhysicalOutline
