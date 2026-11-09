import SU2BFSSPhysicalDomainS3G2GaugeInvariantMajoranaPairsProbe

/-!
# BFSS SU(2) S3G3 — actual fermionic Spin(9) plane-generator gauge compatibility

Separate an elementary finite-linear-combination lemma from the very
large concrete source Fock operators. The genuine G4E SU(2) action
commutes with each source color-summed theta theta bilinear by S3G2.
Consequently it commutes with the exact S3D quadratic generator.

No global Spin(9), physical Hamiltonian symmetry or spectral theorem.
-/

namespace FCP.BFSSSU2PhysicalDomainS3G3
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3D
open FCP.BFSSSU2PhysicalDomainS3G2

-- The concrete source Fock terms can require larger elaborator recursion
-- during the final abstract theorem instantiation; no new axioms.
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000

private abbrev FermionOp := Fermion 2 →L[ℂ] Fermion 2

/-- Abstract finite weighted-sum commutation with the genuine source
unitary, requiring only commutation of its indicated summands. -/
private theorem finiteWeightedGaugeCommutes (g : GaugeGroup 2)
    (F : SpinIndex → SpinIndex → FermionOp)
    (w : SpinIndex → SpinIndex → ℂ)
    (hF : ∀ α β v,
      fermionGaugeUnitaryHom g (F α β v) =
        F α β (fermionGaugeUnitaryHom g v))
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      ((∑ α : SpinIndex, ∑ β : SpinIndex, w α β • F α β) v) =
      (∑ α : SpinIndex, ∑ β : SpinIndex, w α β • F α β)
        (fermionGaugeUnitaryHom g v) := by
  simp only [ContinuousLinearMap.sum_apply, ContinuousLinearMap.smul_apply]
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          w α β • fermionGaugeUnitaryHom g (F α β v) := by
        simp only [map_sum, map_smul]
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          w α β • F α β (fermionGaugeUnitaryHom g v) := by
        apply Finset.sum_congr rfl
        intro α _
        apply Finset.sum_congr rfl
        intro β _
        rw [hF α β v]

/-- Pure finite-sum rearrangement of the exact S3D source operators.
There is NO surrogate fermionic generator and no analytic assumption. -/
private theorem sourceQuadraticColorSum_reindex
    (J : Matrix SpinIndex SpinIndex ℝ) :
    (∑ A : ColorIndex 2, pairedFermionSpinQuadraticColor J A) =
      ∑ α : SpinIndex, ∑ β : SpinIndex,
        ((J α β : ℝ) : ℂ) •
          (∑ A : ColorIndex 2,
            pairedTheta α A * pairedTheta β A) := by
  unfold pairedFermionSpinQuadraticColor
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ∑ A : ColorIndex 2,
            ((J α β : ℝ) : ℂ) •
              (pairedTheta α A * pairedTheta β A) := by
        rw [Finset.sum_comm]
        apply Finset.sum_congr rfl
        intro α _
        rw [Finset.sum_comm]
    _ = _ := by
        apply Finset.sum_congr rfl
        intro α _
        apply Finset.sum_congr rfl
        intro β _
        rw [Finset.smul_sum]

/-- The full quadratic source-color sum is gauge invariant for ANY
real spin matrix J; the only color geometry is exact G3A/G4H. -/
theorem pairedFermionSpinQuadraticSum_gauge_commutes
    (g : GaugeGroup 2) (J : Matrix SpinIndex SpinIndex ℝ)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      ((∑ A : ColorIndex 2, pairedFermionSpinQuadraticColor J A) v) =
      (∑ A : ColorIndex 2, pairedFermionSpinQuadraticColor J A)
        (fermionGaugeUnitaryHom g v) := by
  rw [sourceQuadraticColorSum_reindex]
  apply finiteWeightedGaugeCommutes g
  intro α β w
  exact pairedTheta_colorPairSum_gauge_invariant g α β w

/-- The literal S3D 48-Majorana spin-plane rotation generator
commutes pointwise with the genuine G4E SU(2) gauge unitaries. -/
theorem pairedFermionPlaneSpinGenerator_gauge_commutes
    (g : GaugeGroup 2) (i j : SpaceIndex) (v : Fermion 2) :
    fermionGaugeUnitaryHom g
      (pairedFermionPlaneSpinGenerator i j v) =
      pairedFermionPlaneSpinGenerator i j
        (fermionGaugeUnitaryHom g v) := by
  unfold pairedFermionPlaneSpinGenerator
  simp only [ContinuousLinearMap.smul_apply]
  rw [map_smul]
  congr 1
  exact pairedFermionSpinQuadraticSum_gauge_commutes g
    (pairedPlaneSpinGenerator i j) v

#print axioms pairedFermionSpinQuadraticSum_gauge_commutes
#print axioms pairedFermionPlaneSpinGenerator_gauge_commutes

end
end FCP.BFSSSU2PhysicalDomainS3G3
