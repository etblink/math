import Mathlib.Analysis.Normed.Lp.PiLp
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2C0OriginalFockOperatorLpColumns
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe

/-!
P3-M3G0A — PROSPECTIVE / UNCOMPILED candidate.
Transport the actual original FullL2 SU(2) unitary diagonally through
the M2C0 continuous linear equivalence to true original bounded-operator
L² fields. This is an algebraic source-carrier gate, NOT the physical
a.e. operator action, norm isometry, basis independence, fixedness,
unbounded Gauss operator, closed Hamiltonian or spectral theorem.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open FCP.BFSSSU2PhysicalDomainL6G7Z
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- Every original Fock output column carries the exact original
L6G7Z source unitary, in the finite PiLp Hilbert column norm. -/
noncomputable def originalFockDiagonalGaugeUnitary (g : GaugeGroup 2) :
    PiLp 2 (fun _ : ι => FullL2 2) ≃ₗᵢ[ℂ]
      PiLp 2 (fun _ : ι => FullL2 2) :=
  LinearIsometryEquiv.piLpCongrRight 2
    (fun _ : ι => actualOriginalFullL2GaugeUnitaryHom g)

/-- Conjugation by a CHANGE-OF-CARRIER equivalence (not operator
conjugation at each spatial point). The original source operator norm
is retained; a continuous equivalence is not asserted isometric. -/
noncomputable def originalFockOperatorGaugeEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2)) (g : GaugeGroup 2) :
    OriginalFockOperatorLp ≃L[ℂ] OriginalFockOperatorLp :=
  ((originalFockOperatorLpColumnsEquiv b).trans
    (originalFockDiagonalGaugeUnitary (ι := ι) g).toContinuousLinearEquiv).trans
      (originalFockOperatorLpColumnsEquiv b).symm

/-- Exact algebraic intertwining on genuine original Fock L² columns. -/
theorem originalFockOperatorGaugeEquiv_columns
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f) =
        originalFockDiagonalGaugeUnitary (ι := ι) g
          (originalFockOperatorLpColumnsEquiv b f) := by
  change originalFockOperatorLpColumnsEquiv b
    ((originalFockOperatorLpColumnsEquiv b).symm
      (originalFockDiagonalGaugeUnitary (ι := ι) g
        (originalFockOperatorLpColumnsEquiv b f))) =
    originalFockDiagonalGaugeUnitary (ι := ι) g
      (originalFockOperatorLpColumnsEquiv b f)
  exact (originalFockOperatorLpColumnsEquiv b).apply_symm_apply _

/-- Componentwise action is the actual original FullL2 unitary. -/
theorem originalFockOperatorGaugeEquiv_column_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) (i : ι) :
    (originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f)) i =
        actualOriginalFullL2GaugeUnitaryHom g
          ((originalFockOperatorLpColumnsEquiv b f) i) := by
  rw [originalFockOperatorGaugeEquiv_columns]
  rfl

theorem originalFockDiagonalGaugeUnitary_one_apply
    (u : PiLp 2 (fun _ : ι => FullL2 2)) :
    originalFockDiagonalGaugeUnitary (ι := ι) (1 : GaugeGroup 2) u = u := by
  apply PiLp.ext
  intro i
  change actualOriginalFullL2GaugeUnitaryHom (1 : GaugeGroup 2) (u i) = u i
  simp

theorem originalFockDiagonalGaugeUnitary_mul_apply
    (g h : GaugeGroup 2)
    (u : PiLp 2 (fun _ : ι => FullL2 2)) :
    originalFockDiagonalGaugeUnitary (ι := ι) (g * h) u =
      originalFockDiagonalGaugeUnitary (ι := ι) g
        (originalFockDiagonalGaugeUnitary (ι := ι) h u) := by
  apply PiLp.ext
  intro i
  change actualOriginalFullL2GaugeUnitaryHom (g * h) (u i) =
    actualOriginalFullL2GaugeUnitaryHom g
      (actualOriginalFullL2GaugeUnitaryHom h (u i))
  rw [map_mul]
  rfl

theorem originalFockOperatorGaugeEquiv_one_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    originalFockOperatorGaugeEquiv b (1 : GaugeGroup 2) f = f := by
  apply (originalFockOperatorLpColumnsEquiv b).injective
  calc
    originalFockOperatorLpColumnsEquiv b
        (originalFockOperatorGaugeEquiv b (1 : GaugeGroup 2) f) =
        originalFockDiagonalGaugeUnitary (ι := ι) 1
          (originalFockOperatorLpColumnsEquiv b f) :=
            originalFockOperatorGaugeEquiv_columns b 1 f
    _ = originalFockOperatorLpColumnsEquiv b f :=
      originalFockDiagonalGaugeUnitary_one_apply _

theorem originalFockOperatorGaugeEquiv_mul_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g h : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    originalFockOperatorGaugeEquiv b (g * h) f =
      originalFockOperatorGaugeEquiv b g
        (originalFockOperatorGaugeEquiv b h f) := by
  apply (originalFockOperatorLpColumnsEquiv b).injective
  calc
    originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b (g * h) f) =
        originalFockDiagonalGaugeUnitary (ι := ι) (g * h)
          (originalFockOperatorLpColumnsEquiv b f) :=
            originalFockOperatorGaugeEquiv_columns b (g * h) f
    _ = originalFockDiagonalGaugeUnitary (ι := ι) g
          (originalFockDiagonalGaugeUnitary (ι := ι) h
            (originalFockOperatorLpColumnsEquiv b f)) :=
              originalFockDiagonalGaugeUnitary_mul_apply g h _
    _ = originalFockOperatorLpColumnsEquiv b
          (originalFockOperatorGaugeEquiv b g
            (originalFockOperatorGaugeEquiv b h f)) := by
      rw [originalFockOperatorGaugeEquiv_columns,
        originalFockOperatorGaugeEquiv_columns]

theorem originalFockOperatorGaugeEquiv_inv_cancel
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    originalFockOperatorGaugeEquiv b g⁻¹
      (originalFockOperatorGaugeEquiv b g f) = f := by
  calc
    originalFockOperatorGaugeEquiv b g⁻¹
      (originalFockOperatorGaugeEquiv b g f) =
        originalFockOperatorGaugeEquiv b (g⁻¹ * g) f :=
          (originalFockOperatorGaugeEquiv_mul_apply b g⁻¹ g f).symm
    _ = f := by
      simpa using originalFockOperatorGaugeEquiv_one_apply b f

#print axioms originalFockDiagonalGaugeUnitary
#print axioms originalFockOperatorGaugeEquiv
#print axioms originalFockOperatorGaugeEquiv_columns
#print axioms originalFockOperatorGaugeEquiv_column_apply
#print axioms originalFockDiagonalGaugeUnitary_one_apply
#print axioms originalFockDiagonalGaugeUnitary_mul_apply
#print axioms originalFockOperatorGaugeEquiv_one_apply
#print axioms originalFockOperatorGaugeEquiv_mul_apply
#print axioms originalFockOperatorGaugeEquiv_inv_cancel

end
end FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
