import SU2BFSSPhysicalDomainS2DTransverseSliceWedgeProbe
import OAI.MathematicalPhysics.BFSS.GammaWords

/-!
# BFSS SU(2) S3A — actual Cl(9) infinitesimal spatial-plane spin action

Reuses the pinned BFSSGamma.gamma_sq, gamma_anti, gammaTwo_alt
lemmas on the literal paired AlgebraData's real 16x16 gamma matrices.
For i ≠ j, J_ij := 1/2 gamma_i gamma_j is skew and has
[J_ij, gamma_i] = -gamma_j and [J_ij,gamma_j] = gamma_i.

These are the genuine source spinor infinitesimal spatial rotations.
Neither the 2^24-dimensional fermionic lift nor the global Spin(9)
group, physical form covariance, branching or spectrum is claimed.
-/

namespace FCP.BFSSSU2PhysicalDomainS3A
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

/-- Source-normalized real spin generator for a spatial coordinate plane. -/
noncomputable def pairedPlaneSpinGenerator (i j : SpaceIndex) : GammaMatrix :=
  (1 / 2 : ℝ) • pairedAlgebraData.gammaTwo i j

/-- Antisymmetry is a consequence of source gamma symmetry and the
literal gammaTwo definition. No independent skewness axiom. -/
theorem pairedGammaTwo_skew (i j : SpaceIndex) :
    (pairedAlgebraData.gammaTwo i j).transpose =
      -(pairedAlgebraData.gammaTwo i j) := by
  let M : AlgebraData 2 := pairedAlgebraData
  have hs (k : SpaceIndex) : (M.gamma k).transpose = M.gamma k :=
    M.gamma_symmetric k
  change ((1 / 2 : ℝ) • (M.gamma i * M.gamma j -
    M.gamma j * M.gamma i)).transpose =
    -((1 / 2 : ℝ) • (M.gamma i * M.gamma j -
      M.gamma j * M.gamma i))
  simp only [Matrix.transpose_smul, Matrix.transpose_sub,
    Matrix.transpose_mul, hs]
  module

theorem pairedPlaneSpinGenerator_skew (i j : SpaceIndex) :
    (pairedPlaneSpinGenerator i j).transpose = -(pairedPlaneSpinGenerator i j) := by
  simp only [pairedPlaneSpinGenerator, Matrix.transpose_smul,
    pairedGammaTwo_skew, smul_neg]

/-- Off-diagonal source gammaTwo equals the literal ordered product. -/
theorem pairedGammaTwo_eq_mul (i j : SpaceIndex) (hij : i ≠ j) :
    pairedAlgebraData.gammaTwo i j =
      pairedAlgebraData.gamma i * pairedAlgebraData.gamma j := by
  let M : AlgebraData 2 := pairedAlgebraData
  change (1 / 2 : ℝ) • (M.gamma i * M.gamma j -
      M.gamma j * M.gamma i) = M.gamma i * M.gamma j
  have hanti := OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford
    (Ne.symm hij)
  rw [hanti]
  module

/-- Literal gamma-product spin rotation sends the i-direction to -j. -/
theorem pairedPlaneGenerator_comm_gamma_i (i j : SpaceIndex) (hij : i ≠ j) :
    pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma i -
        pairedAlgebraData.gamma i * pairedPlaneSpinGenerator i j =
      -(pairedAlgebraData.gamma j) := by
  let M : AlgebraData 2 := pairedAlgebraData
  have hi2 := OAI.BFSSGamma.gamma_sq M.gamma M.gamma_clifford i
  have hijanti := OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford hij
  have hleft : (M.gamma i * M.gamma j) * M.gamma i = -(M.gamma j) := by
    calc
      _ = -(M.gamma j * M.gamma i) * M.gamma i := by rw [hijanti]
      _ = -(M.gamma j * (M.gamma i * M.gamma i)) := by
        simp only [neg_mul, Matrix.mul_assoc]
      _ = -(M.gamma j) := by rw [hi2, mul_one]
  have hright : M.gamma i * (M.gamma i * M.gamma j) = M.gamma j := by
    rw [← Matrix.mul_assoc, hi2, one_mul]
  rw [pairedPlaneSpinGenerator, pairedGammaTwo_eq_mul i j hij]
  rw [smul_mul_assoc, mul_smul_comm, hleft, hright]
  module

/-- Literal gamma-product spin rotation sends the j-direction to +i. -/
theorem pairedPlaneGenerator_comm_gamma_j (i j : SpaceIndex) (hij : i ≠ j) :
    pairedPlaneSpinGenerator i j * pairedAlgebraData.gamma j -
        pairedAlgebraData.gamma j * pairedPlaneSpinGenerator i j =
      pairedAlgebraData.gamma i := by
  let M : AlgebraData 2 := pairedAlgebraData
  have hj2 := OAI.BFSSGamma.gamma_sq M.gamma M.gamma_clifford j
  have hjianti := OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford
    (Ne.symm hij)
  have hleft : (M.gamma i * M.gamma j) * M.gamma j = M.gamma i := by
    rw [Matrix.mul_assoc, hj2, mul_one]
  have hright : M.gamma j * (M.gamma i * M.gamma j) = -(M.gamma i) := by
    calc
      _ = (M.gamma j * M.gamma i) * M.gamma j := by rw [Matrix.mul_assoc]
      _ = -(M.gamma i * M.gamma j) * M.gamma j := by rw [hjianti]
      _ = -(M.gamma i) := by rw [neg_mul, Matrix.mul_assoc, hj2, mul_one]
  rw [pairedPlaneSpinGenerator, pairedGammaTwo_eq_mul i j hij]
  rw [smul_mul_assoc, mul_smul_comm, hleft, hright]
  module

#print axioms pairedGammaTwo_skew
#print axioms pairedPlaneSpinGenerator_skew
#print axioms pairedGammaTwo_eq_mul
#print axioms pairedPlaneGenerator_comm_gamma_i
#print axioms pairedPlaneGenerator_comm_gamma_j

end
end FCP.BFSSSU2PhysicalDomainS3A
