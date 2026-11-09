import SU2BFSSPhysicalDomainS3DActualFermionSpinQuadraticGeneratorProbe

/-!
# BFSS SU(2) S3E — actual 48-Majorana infinitesimal spinor covariance

On the literal accepted 24-mode Fock Hilbert space, the delta-one
Majorana CAR fixes the coefficient in the quadratic spin generator.
Prove the exact rotation commutator for every real skew 16x16 matrix
and specialize it to the accepted source gamma-plane matrix J_ij.

No global Spin(9) action, SU(2) gauge invariance, Hamiltonian
reduction, oscillator selection, compact resolvent, or point eigenvalue
is claimed by these finite-dimensional operator identities.
-/

namespace FCP.BFSSSU2PhysicalDomainS3E
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3C
open FCP.BFSSSU2PhysicalDomainS3D

/-- The exact unnormalized same-color commutator, retaining both
delta contractions before imposing skewness of the real spin matrix. -/
theorem pairedSpinQuadraticColor_comm_raw
    (J : Matrix SpinIndex SpinIndex ℝ) (C : ColorIndex 2)
    (γ : SpinIndex) :
    pairedFermionSpinQuadraticColor J C * pairedTheta γ C -
        pairedTheta γ C * pairedFermionSpinQuadraticColor J C =
      (∑ α : SpinIndex, ((J α γ : ℝ) : ℂ) • pairedTheta α C) -
        (∑ β : SpinIndex, ((J γ β : ℝ) : ℂ) • pairedTheta β C) := by
  have hz (z : ℂ) :
      z • (0 : Fermion 2 →L[ℂ] Fermion 2) = 0 := by
    ext v
    simp
  have hfirst :
      (∑ α : SpinIndex, ∑ β : SpinIndex,
         ((J α β : ℝ) : ℂ) •
           (if β = γ then pairedTheta α C else 0)) =
        ∑ α : SpinIndex, ((J α γ : ℝ) : ℂ) • pairedTheta α C := by
    apply Finset.sum_congr rfl
    intro α _
    simp only [smul_ite, hz, Finset.sum_ite_eq',
      Finset.mem_univ, ite_true]
  have hsecond :
      (∑ α : SpinIndex, ∑ β : SpinIndex,
         ((J α β : ℝ) : ℂ) •
           (if α = γ then pairedTheta β C else 0)) =
        ∑ β : SpinIndex, ((J γ β : ℝ) : ℂ) • pairedTheta β C := by
    calc
      _ = ∑ α : SpinIndex,
          if α = γ then
            (∑ β : SpinIndex, ((J α β : ℝ) : ℂ) • pairedTheta β C)
          else 0 := by
            apply Finset.sum_congr rfl
            intro α _
            by_cases h : α = γ
            · simp only [if_pos h]
            · simp only [if_neg h, hz, Finset.sum_const_zero]
      _ = _ := by
        simp only [Finset.sum_ite_eq', Finset.mem_univ, ite_true]
  unfold pairedFermionSpinQuadraticColor
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) •
            ((pairedTheta α C * pairedTheta β C) * pairedTheta γ C -
              pairedTheta γ C * (pairedTheta α C * pairedTheta β C)) := by
        simp only [Finset.sum_mul, Finset.mul_sum,
          smul_mul_assoc, mul_smul_comm, smul_sub,
          Finset.sum_sub_distrib]
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) •
            ((if β = γ then pairedTheta α C else 0) -
              (if α = γ then pairedTheta β C else 0)) := by
        apply Finset.sum_congr rfl
        intro α _
        apply Finset.sum_congr rfl
        intro β _
        rw [pairedTheta_quadratic_commutator_same_color α β γ C]
    _ = (∑ α : SpinIndex, ∑ β : SpinIndex,
         ((J α β : ℝ) : ℂ) •
           (if β = γ then pairedTheta α C else 0)) -
        (∑ α : SpinIndex, ∑ β : SpinIndex,
         ((J α β : ℝ) : ℂ) •
           (if α = γ then pairedTheta β C else 0)) := by
        simp only [smul_sub, Finset.sum_sub_distrib]
    _ = _ := by rw [hfirst, hsecond]

/-- Every skew real spinor matrix acts on the actual color block as
twice its spinor matrix column. The doubling comes from antisymmetry
and the delta-one Majorana CAR. -/
theorem pairedSpinQuadraticColor_comm_skew
    (J : Matrix SpinIndex SpinIndex ℝ)
    (hJ : J.transpose = -J) (C : ColorIndex 2)
    (γ : SpinIndex) :
    pairedFermionSpinQuadraticColor J C * pairedTheta γ C -
        pairedTheta γ C * pairedFermionSpinQuadraticColor J C =
      (2 : ℂ) • ∑ α : SpinIndex,
        ((J α γ : ℝ) : ℂ) • pairedTheta α C := by
  have hsk (α : SpinIndex) : J γ α = -J α γ := by
    have h := congrArg
      (fun M : Matrix SpinIndex SpinIndex ℝ => M α γ) hJ
    simpa only [Matrix.transpose_apply, Matrix.neg_apply] using h
  have hneg (z : ℂ) (T : Fermion 2 →L[ℂ] Fermion 2) :
      (-z) • T = -(z • T) := neg_smul z T
  have hsum :
      (∑ α : SpinIndex, ((J γ α : ℝ) : ℂ) • pairedTheta α C) =
        -(∑ α : SpinIndex, ((J α γ : ℝ) : ℂ) • pairedTheta α C) := by
    rw [← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro α _
    rw [hsk α]
    simp only [Complex.ofReal_neg, hneg]
  rw [pairedSpinQuadraticColor_comm_raw, hsum]
  module

/-- The concrete S3D three-color quadratic generator induces exactly
the gamma-plane infinitesimal spin transformation of the source
48 Majoranas, with NO unproved group action or gauge assumption. -/
theorem pairedFermionPlaneSpinGenerator_comm_theta
    (i j : SpaceIndex) (γ : SpinIndex) (C : ColorIndex 2) :
    pairedFermionPlaneSpinGenerator i j * pairedTheta γ C -
        pairedTheta γ C * pairedFermionPlaneSpinGenerator i j =
      ∑ α : SpinIndex,
        ((pairedPlaneSpinGenerator i j α γ : ℝ) : ℂ) • pairedTheta α C := by
  let J := pairedPlaneSpinGenerator i j
  have hJ : J.transpose = -J := pairedPlaneSpinGenerator_skew i j
  have hsingle :
      (∑ A : ColorIndex 2,
         (pairedFermionSpinQuadraticColor J A * pairedTheta γ C -
           pairedTheta γ C * pairedFermionSpinQuadraticColor J A)) =
        pairedFermionSpinQuadraticColor J C * pairedTheta γ C -
          pairedTheta γ C * pairedFermionSpinQuadraticColor J C := by
    apply Finset.sum_eq_single C
    · intro A _ hAC
      exact sub_eq_zero.mpr
        (pairedFermionSpinQuadraticColor_comm_other_color J A C hAC γ)
    · intro hC
      exact False.elim (hC (Finset.mem_univ C))
  change
    ((1 / 2 : ℂ) • ∑ A : ColorIndex 2,
        pairedFermionSpinQuadraticColor J A) * pairedTheta γ C -
      pairedTheta γ C * ((1 / 2 : ℂ) • ∑ A : ColorIndex 2,
        pairedFermionSpinQuadraticColor J A) =
      ∑ α : SpinIndex, ((J α γ : ℝ) : ℂ) • pairedTheta α C
  calc
    _ = (1 / 2 : ℂ) •
          (∑ A : ColorIndex 2,
            (pairedFermionSpinQuadraticColor J A * pairedTheta γ C -
              pairedTheta γ C * pairedFermionSpinQuadraticColor J A)) := by
          simp only [smul_mul_assoc, mul_smul_comm, Finset.sum_mul,
            Finset.mul_sum, smul_sub, Finset.sum_sub_distrib]
    _ = (1 / 2 : ℂ) •
          (pairedFermionSpinQuadraticColor J C * pairedTheta γ C -
            pairedTheta γ C * pairedFermionSpinQuadraticColor J C) := by
          rw [hsingle]
    _ = (1 / 2 : ℂ) • ((2 : ℂ) •
          ∑ α : SpinIndex, ((J α γ : ℝ) : ℂ) • pairedTheta α C) := by
          rw [pairedSpinQuadraticColor_comm_skew J hJ C γ]
    _ = _ := by
          simp only [smul_smul]
          norm_num

#print axioms pairedSpinQuadraticColor_comm_raw
#print axioms pairedSpinQuadraticColor_comm_skew
#print axioms pairedFermionPlaneSpinGenerator_comm_theta

end
end FCP.BFSSSU2PhysicalDomainS3E
