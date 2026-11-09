import SU2BFSSPhysicalDomainS3CActualMajoranaQuadraticCommutatorProbe

/-!
# BFSS SU(2) S3D — source-defined quadratic spin generator on Fermion 2

Build a genuine finite 48-Majorana even-Clifford fermionic generator
from the accepted real 16x16 spinor plane matrix, retaining all three
original gauge colors. Establish the color-locality of each quadratic
block from the delta-one source CAR, for arbitrary coefficients.

This is a prospective unqualified source probe until its independent
pinned Lean gate passes. The needed same-color infinitesimal rotation
law and anti-self-adjointness remain distinct obligations.
-/

namespace FCP.BFSSSU2PhysicalDomainS3D
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3A
open FCP.BFSSSU2PhysicalDomainS3C

/-- Actual source color block of a quadratic Clifford spinor form,
with no change to the CAR or to the 24-mode Fock representation. -/
noncomputable def pairedFermionSpinQuadraticColor
    (J : Matrix SpinIndex SpinIndex ℝ) (A : ColorIndex 2) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  ∑ α : SpinIndex, ∑ β : SpinIndex,
    ((J α β : ℝ) : ℂ) • (pairedTheta α A * pairedTheta β A)

/-- The source-defined full three-color spin-plane infinitesimal
generator, with the half factor demanded by delta-one Majorana CAR. -/
noncomputable def pairedFermionPlaneSpinGenerator
    (i j : SpaceIndex) : Fermion 2 →L[ℂ] Fermion 2 :=
  (1 / 2 : ℂ) • ∑ A : ColorIndex 2,
    pairedFermionSpinQuadraticColor (pairedPlaneSpinGenerator i j) A

/-- Color-diagonal source Clifford bilinears commute with all the
Majoranas of another source SU(2) adjoint color. -/
theorem pairedFermionSpinQuadraticColor_comm_other_color
    (J : Matrix SpinIndex SpinIndex ℝ) (A C : ColorIndex 2)
    (hAC : A ≠ C) (γ : SpinIndex) :
    pairedFermionSpinQuadraticColor J A * pairedTheta γ C =
      pairedTheta γ C * pairedFermionSpinQuadraticColor J A := by
  unfold pairedFermionSpinQuadraticColor
  calc
    (∑ α : SpinIndex, ∑ β : SpinIndex,
      ((J α β : ℝ) : ℂ) • (pairedTheta α A * pairedTheta β A)) *
        pairedTheta γ C =
      ∑ α : SpinIndex, ∑ β : SpinIndex,
        ((J α β : ℝ) : ℂ) •
          ((pairedTheta α A * pairedTheta β A) * pairedTheta γ C) := by
            simp only [Finset.sum_mul, smul_mul_assoc]
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
        ((J α β : ℝ) : ℂ) •
          (pairedTheta γ C * (pairedTheta α A * pairedTheta β A)) := by
            apply Finset.sum_congr rfl
            intro α _
            apply Finset.sum_congr rfl
            intro β _
            rw [pairedTheta_quadratic_commutator_other_color α β γ A C hAC]
    _ = pairedTheta γ C *
        (∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) •
            (pairedTheta α A * pairedTheta β A)) := by
          simp only [Finset.mul_sum, mul_smul_comm]

#print axioms pairedFermionSpinQuadraticColor_comm_other_color

end
end FCP.BFSSSU2PhysicalDomainS3D
