import Mathlib.Analysis.Normed.Operator.LinearIsometry
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B2OriginalOperatorLpContinuousEquiv
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B1OriginalFockHSFieldColumns

/-!
# P3-M2C0 — original bounded operator L² to genuine Fock L² columns

The source remains the actual original `Boson 2` L² of
`Fermion 2 →L[ℂ] Fermion 2` with its ORIGINAL operator norm.
The codomain is a finite PiLp2 family of actual `Fermion 2` L²
vector columns. This is a CONTINUOUS linear equivalence, not an isometry
from the operator-norm carrier. No gauge, Spin9, closed H or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
open FCP.BFSSP3M2B1OriginalFockHSFieldColumns
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- Actual original bounded-operator-valued L² is continuously
complex-linearly equivalent to genuine original-Fock vector L²
output columns, using already-qualified B2 and M2B1 sources. -/
noncomputable def originalFockOperatorLpColumnsEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockOperatorLp ≃L[ℂ]
      PiLp 2 (fun _ : ι =>
        Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :=
  (originalFockOperatorLpHSContinuousEquiv b).trans
    ((originalFockHSFieldColumnsEquiv (ι := ι)
      (volume : Measure (Boson 2))).toContinuousLinearEquiv)

/-- Every genuine original-Fock L² output column evaluates the actual
original bounded operator on the original ONB almost everywhere. -/
theorem originalFockOperatorLpColumnsEquiv_apply_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) (i : ι) :
    ((originalFockOperatorLpColumnsEquiv b f i :
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => (f x) (b i)) := by
  have hcol := originalFockHSFieldColumnsEquiv_apply_ae
    (volume : Measure (Boson 2))
    (originalFockOperatorLpHSContinuousEquiv b f) i
  have hfield := originalFockOperatorLpHSContinuousEquiv_apply_ae b f
  change
    (((originalFockHSFieldColumnsEquiv
        (volume : Measure (Boson 2))
        (originalFockOperatorLpHSContinuousEquiv b f)) i :
          Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :
            Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => (f x) (b i))
  filter_upwards [hcol, hfield] with x hxcol hxfield
  calc
    ((originalFockHSFieldColumnsEquiv
        (volume : Measure (Boson 2))
        (originalFockOperatorLpHSContinuousEquiv b f)) i) x =
        (originalFockOperatorLpHSContinuousEquiv b f) x i := hxcol
    _ = (originalFockOperatorHSContinuousEquiv b (f x)) i := by
          exact congrArg (fun u : OriginalFockHSFiber ι => u i) hxfield
    _ = (f x) (b i) :=
          originalFockOperatorHSContinuousEquiv_apply_basis b (f x) i

/-- Inverting all original-Fock output columns reconstructs the original
bounded-operator-valued L² class, with its original operator norm. -/
theorem originalFockOperatorLpColumnsEquiv_symm_apply_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    (originalFockOperatorLpColumnsEquiv b).symm
      (originalFockOperatorLpColumnsEquiv b f) = f :=
  (originalFockOperatorLpColumnsEquiv b).symm_apply_apply f

#print axioms originalFockOperatorLpColumnsEquiv
#print axioms originalFockOperatorLpColumnsEquiv_apply_ae
#print axioms originalFockOperatorLpColumnsEquiv_symm_apply_apply

end
end FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
