import SU2BFSSPhysicalDomainS3AActualGammaPlaneRotationProbe

/-!
# BFSS SU(2) S3B — all-nine-component actual Cl(9) plane generator covariance

S3A proved source-defined infinitesimal spin covariance on the two
axes i,j. Use the same pinned Clifford anticommutation identities
to show that the generator commutes with every transverse gamma_k,
then assemble the exact full nine-dimensional vector representation
commutator. This is a real Lie-algebra covariance input, not a
constructed global Spin(9) action on Fermion 2 or a spectral theorem.
-/

namespace FCP.BFSSSU2PhysicalDomainS3B
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3A

theorem pairedPlaneGenerator_comm_gamma_remaining
    (i j k : SpaceIndex) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma k -
        pairedAlgebraData.gamma k * pairedPlaneSpinGenerator i j = 0 := by
  let M : AlgebraData 2 := pairedAlgebraData
  have hikanti := OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford hik
  have hjkanti := OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford hjk
  have hcomm : (M.gamma i * M.gamma j) * M.gamma k =
      M.gamma k * (M.gamma i * M.gamma j) := by
    calc
      _ = M.gamma i * (M.gamma j * M.gamma k) := by rw [Matrix.mul_assoc]
      _ = M.gamma i * (-(M.gamma k * M.gamma j)) := by rw [hjkanti]
      _ = -(M.gamma i * M.gamma k) * M.gamma j := by
        simp only [mul_neg, neg_mul, Matrix.mul_assoc]
      _ = -(-(M.gamma k * M.gamma i)) * M.gamma j := by rw [hikanti]
      _ = M.gamma k * (M.gamma i * M.gamma j) := by
        simp only [neg_neg, Matrix.mul_assoc]
  rw [pairedPlaneSpinGenerator, pairedGammaTwo_eq_mul i j hij]
  rw [smul_mul_assoc, mul_smul_comm, hcomm, sub_self]

/-- The literal real 16-spin gamma family transforms as a spatial
nine-vector under every infinitesimal coordinate-plane generator. -/
theorem pairedPlaneGenerator_comm_gamma_all
    (i j k : SpaceIndex) (hij : i ≠ j) :
    pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma k -
        pairedAlgebraData.gamma k * pairedPlaneSpinGenerator i j =
      if k = j then pairedAlgebraData.gamma i
      else if k = i then -(pairedAlgebraData.gamma j)
      else 0 := by
  by_cases hkj : k = j
  · subst k
    simpa [hij.symm] using pairedPlaneGenerator_comm_gamma_j i j hij
  by_cases hki : k = i
  · subst k
    simpa [hij] using pairedPlaneGenerator_comm_gamma_i i j hij
  · simpa [hkj, hki] using
      pairedPlaneGenerator_comm_gamma_remaining i j k hij (Ne.symm hki) (Ne.symm hkj)

#print axioms pairedPlaneGenerator_comm_gamma_remaining
#print axioms pairedPlaneGenerator_comm_gamma_all

end
end FCP.BFSSSU2PhysicalDomainS3B
