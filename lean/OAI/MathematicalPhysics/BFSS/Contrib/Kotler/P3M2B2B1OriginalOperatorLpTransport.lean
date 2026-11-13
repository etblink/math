import Mathlib.MeasureTheory.Function.LpSpace.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B0OriginalFockOperatorHSContinuousEquiv

/-!
# P3-M2B2B1 — source-original bounded operator-valued L² transport

The source carrier is Lp of actual original Fermion 2 bounded
operators with their OPERATOR norm, at the actual Boson 2 volume.
The separate HS-field Lp is a distinct normed carrier.
B0 supplies the source-typed continuous linear equivalence.
No isometry between the two L² norms, physical gauge fixed sector,
Hamiltonian domain, or spectrum is established here.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open MeasureTheory

/-- Genuine source bounded-operator-valued L² over the original
Boson 2 base, with the ORIGINAL operator norm on each value. -/
abbrev OriginalFockOperatorLp : Type _ :=
  Lp (Fermion 2 →L[ℂ] Fermion 2) 2 (volume : Measure (Boson 2))

/-- Separate Hilbert–Schmidt-column-valued L² over the SAME base. -/
abbrev OriginalFockHSFieldLp (ι : Type*) [Fintype ι] : Type _ :=
  Lp (OriginalFockHSFiber ι) 2 (volume : Measure (Boson 2))

variable {ι : Type*} [Fintype ι]

/-- Lift B0's original bounded-Fock-operator map to L² using the
pinned continuous-linear-map Lp composition interface. -/
noncomputable def originalFockOperatorLpToHSField
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockOperatorLp →L[ℂ] OriginalFockHSFieldLp ι :=
  (originalFockOperatorHSContinuousEquiv b).toContinuousLinearMap.compLpL
    2 (volume : Measure (Boson 2))

/-- Inverse direction preserves the actual original operator norm
as source value norm, not as an installed HS Hilbert norm. -/
noncomputable def originalFockHSFieldLpToOperator
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockHSFieldLp ι →L[ℂ] OriginalFockOperatorLp :=
  (originalFockOperatorHSContinuousEquiv b).symm.toContinuousLinearMap.compLpL
    2 (volume : Measure (Boson 2))

/-- Original operator-valued L² forward map agrees with B0
pointwise source map ALMOST EVERYWHERE on genuine Boson 2. -/
theorem originalFockOperatorLpToHSField_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    ((originalFockOperatorLpToHSField b f : OriginalFockHSFieldLp ι) :
      Boson 2 → OriginalFockHSFiber ι) =ᵐ[volume]
        (fun x : Boson 2 => originalFockOperatorHSContinuousEquiv b (f x)) := by
  exact (originalFockOperatorHSContinuousEquiv b).toContinuousLinearMap.coeFn_compLpL f

/-- Original operator recovered from its separate HS L² field agrees
with the bounded source inverse ALMOST EVERYWHERE. -/
theorem originalFockHSFieldLpToOperator_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFieldLp ι) :
    ((originalFockHSFieldLpToOperator b u : OriginalFockOperatorLp) :
      Boson 2 → (Fermion 2 →L[ℂ] Fermion 2)) =ᵐ[volume]
        (fun x : Boson 2 =>
          (originalFockOperatorHSContinuousEquiv b).symm (u x)) := by
  exact (originalFockOperatorHSContinuousEquiv b).symm.toContinuousLinearMap.coeFn_compLpL u

/-- An original operator-valued L² class is reconstructed exactly
from its HS-field class (equality of L² classes, not representatives). -/
theorem originalFockOperatorLp_recovered
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    originalFockHSFieldLpToOperator b
      (originalFockOperatorLpToHSField b f) = f := by
  apply Lp.ext
  filter_upwards
    [originalFockHSFieldLpToOperator_ae b (originalFockOperatorLpToHSField b f),
     originalFockOperatorLpToHSField_ae b f] with x hxback hxfwd
  calc
    (originalFockHSFieldLpToOperator b
        (originalFockOperatorLpToHSField b f)) x =
        (originalFockOperatorHSContinuousEquiv b).symm
          ((originalFockOperatorLpToHSField b f) x) := hxback
    _ = (originalFockOperatorHSContinuousEquiv b).symm
          (originalFockOperatorHSContinuousEquiv b (f x)) := by rw [hxfwd]
    _ = f x := (originalFockOperatorHSContinuousEquiv b).symm_apply_apply (f x)

/-- An HS-field L² class is recovered exactly after reconstructing
the original bounded-operator-valued class (not an isometry claim). -/
theorem originalFockHSFieldLp_recovered
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFieldLp ι) :
    originalFockOperatorLpToHSField b
      (originalFockHSFieldLpToOperator b u) = u := by
  apply Lp.ext
  filter_upwards
    [originalFockOperatorLpToHSField_ae b (originalFockHSFieldLpToOperator b u),
     originalFockHSFieldLpToOperator_ae b u] with x hxfwd hxback
  calc
    (originalFockOperatorLpToHSField b
        (originalFockHSFieldLpToOperator b u)) x =
        originalFockOperatorHSContinuousEquiv b
          ((originalFockHSFieldLpToOperator b u) x) := hxfwd
    _ = originalFockOperatorHSContinuousEquiv b
          ((originalFockOperatorHSContinuousEquiv b).symm (u x)) := by rw [hxback]
    _ = u x := (originalFockOperatorHSContinuousEquiv b).apply_symm_apply (u x)

#print axioms originalFockOperatorLpToHSField
#print axioms originalFockHSFieldLpToOperator
#print axioms originalFockOperatorLpToHSField_ae
#print axioms originalFockHSFieldLpToOperator_ae
#print axioms originalFockOperatorLp_recovered
#print axioms originalFockHSFieldLp_recovered

end
end FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
