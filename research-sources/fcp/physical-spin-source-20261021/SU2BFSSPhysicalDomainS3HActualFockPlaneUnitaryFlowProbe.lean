import SU2BFSSPhysicalDomainS3G3FullQuadraticGaugeCommutationProbe
import Mathlib.Analysis.Normed.Algebra.Exponential

/-!
# BFSS SU(2) S3H — actual Fock spin-plane unitary exponential flow

Instantiate pinned Mathlib's Banach algebra exponential and source
skew-adjointness, following the existing bounded-flow implementation
in openai/math OAI/RepresentationTheory/VertexAlgebra/BoundedFlows.
No new analytic axioms or proxy fermionic model.

This is a single-plane one-parameter *fermionic* unitary action,
not a fully integrated Spin(9) representation; actual bosonic rotations,
physical form covariance, angular sectors and positive point spectrum
remain separate obligations.
-/

namespace FCP.BFSSSU2PhysicalDomainS3H
noncomputable section

-- Instance search for the finite-dimensional but large 24-mode
-- Fock continuous-linear endomorphism algebra can exceed the
-- default heartbeat budget. The underlying instance is standard.
set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1600000

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3D
open FCP.BFSSSU2PhysicalDomainS3F

private abbrev FermionOp := Fermion 2 →L[ℂ] Fermion 2

local instance fockRationalNormedAlgebra : NormedAlgebra ℚ FermionOp :=
  .restrictScalars ℚ ℂ FermionOp

/-- Actual one-parameter fermionic plane rotation, obtained by the
norm-convergent exponential of the accepted source K_ij. -/
noncomputable def pairedFermionPlaneSpinFlow
    (i j : SpaceIndex) (t : ℝ) : FermionOp :=
  NormedSpace.exp (((t : ℝ) : ℂ) • pairedFermionPlaneSpinGenerator i j)

/-- Genuine unitarity for all real times, without assuming a global
Spin(9) group lift or Hamiltonian invariance. -/
theorem pairedFermionPlaneSpinFlow_unitary
    (i j : SpaceIndex) (t : ℝ) :
    pairedFermionPlaneSpinFlow i j t ∈ unitary FermionOp := by
  unfold pairedFermionPlaneSpinFlow
  apply NormedSpace.exp_mem_unitary_of_mem_skewAdjoint
  rw [skewAdjoint.mem_iff]
  change star (((t : ℝ) : ℂ) • pairedFermionPlaneSpinGenerator i j) =
    -(((t : ℝ) : ℂ) • pairedFermionPlaneSpinGenerator i j)
  have hstar : star ((t : ℝ) : ℂ) = ((t : ℝ) : ℂ) := by
    rw [RCLike.star_def]
    exact RCLike.conj_ofReal t
  rw [star_smul, hstar,
    pairedFermionPlaneSpinGenerator_star_eq_neg, smul_neg]

/-- The source-defined fermionic plane flow begins at identity. -/
theorem pairedFermionPlaneSpinFlow_zero (i j : SpaceIndex) :
    pairedFermionPlaneSpinFlow i j 0 = 1 := by
  change NormedSpace.exp ((0 : ℂ) •
    pairedFermionPlaneSpinGenerator i j) = 1
  have hzero :
      (0 : ℂ) • pairedFermionPlaneSpinGenerator i j = (0 : FermionOp) := by
    ext v
    simp
  rw [hzero, NormedSpace.exp_zero]

/-- The exact source one-parameter group law, using pinned exponential
commutation for two scalar multiples of the same accepted K_ij. -/
theorem pairedFermionPlaneSpinFlow_add
    (i j : SpaceIndex) (s t : ℝ) :
    pairedFermionPlaneSpinFlow i j (s + t) =
      pairedFermionPlaneSpinFlow i j s *
        pairedFermionPlaneSpinFlow i j t := by
  change NormedSpace.exp ((((s + t : ℝ) : ℂ) •
      pairedFermionPlaneSpinGenerator i j)) =
    NormedSpace.exp (((s : ℝ) : ℂ) •
      pairedFermionPlaneSpinGenerator i j) *
    NormedSpace.exp (((t : ℝ) : ℂ) •
      pairedFermionPlaneSpinGenerator i j)
  have hadd :
      (((s : ℝ) : ℂ) + ((t : ℝ) : ℂ)) •
          pairedFermionPlaneSpinGenerator i j =
        (((s : ℝ) : ℂ) • pairedFermionPlaneSpinGenerator i j) +
          (((t : ℝ) : ℂ) • pairedFermionPlaneSpinGenerator i j) := by
    apply ContinuousLinearMap.ext
    intro v
    simp only [ContinuousLinearMap.add_apply, ContinuousLinearMap.smul_apply]
    exact add_smul (s : ℂ) (t : ℂ)
      (pairedFermionPlaneSpinGenerator i j v)
  rw [Complex.ofReal_add, hadd]
  exact NormedSpace.exp_add_of_commute
    (((Commute.refl (pairedFermionPlaneSpinGenerator i j)).smul_left (s : ℂ)).smul_right (t : ℂ))

/-- Each source fermionic plane rotation preserves the literal Fock
Hilbert norm, not only a formal operator-star equation. -/
theorem pairedFermionPlaneSpinFlow_norm
    (i j : SpaceIndex) (t : ℝ) (v : Fermion 2) :
    ‖pairedFermionPlaneSpinFlow i j t v‖ = ‖v‖ := by
  exact ContinuousLinearMap.norm_map_of_mem_unitary
    (pairedFermionPlaneSpinFlow_unitary i j t) v

#print axioms pairedFermionPlaneSpinFlow_unitary
#print axioms pairedFermionPlaneSpinFlow_zero
#print axioms pairedFermionPlaneSpinFlow_add
#print axioms pairedFermionPlaneSpinFlow_norm

end
end FCP.BFSSSU2PhysicalDomainS3H
