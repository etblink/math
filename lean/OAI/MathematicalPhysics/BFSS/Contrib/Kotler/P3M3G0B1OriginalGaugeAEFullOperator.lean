import Mathlib.Order.Filter.Finite
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3G0B0OriginalGaugeAEBasisColumn
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B0OriginalFockOperatorHSContinuousEquiv

/-!
# P3-M3G0B1 — exact original SU(2) gauge action on the entire source operator a.e.

PROSPECTIVE / UNCOMPILED until exact strict independent consumer is GREEN.
The target is the ORIGINAL operator-norm valued L² field over Boson 2,
with genuine Fermion 2 fiber. The older source HS-column equivalence
is used only for INJECTIVITY, never as a source operator-norm isometry.
This gate does not assert basis independence, original operator-norm
isometry, physical fixedness or spectral results.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSS1V0
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
open FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- Finite original Fock ONB turns one a.e. event PER index into a
single a.e. event where every genuine Fock column identity holds.
This event is for each FIXED g, b, f, not uniform over all SU(2). -/
theorem originalFockOperatorGaugeEquiv_source_all_basis_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    ∀ᵐ x : Boson 2 ∂(volume : Measure (Boson 2)),
      ∀ i : ι,
        ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)
          (b i) =
        pairedGaugeData.fermion g
          ((f (pairedGaugeData.boson g⁻¹ x)) (b i)) := by
  rw [Filter.eventually_all]
  intro i
  exact originalFockOperatorGaugeEquiv_source_basis_ae b g f i

/-- Original bounded Fock operators agreeing on each vector of the
genuine original ONB are equal. M2B2B0's HS-column equivalence is
used ONLY as an injective linear equivalence; no HS norm equality. -/
theorem originalFockOperator_eq_of_basis
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T S : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ i : ι, T (b i) = S (b i)) : T = S := by
  apply (originalFockOperatorHSContinuousEquiv b).injective
  apply PiLp.ext
  intro i
  rw [originalFockOperatorHSContinuousEquiv_apply_basis b T i,
      originalFockOperatorHSContinuousEquiv_apply_basis b S i]
  exact h i

/-- The actual ORIGINAL bounded-operator-valued Lp representation,
a.e., is left composition by the genuine fermionic SU(2) action
AFTER inverse source bosonic pullback. NOT operator conjugation.
The RHS is identified with the pre-existing Lp representative:
no separate unproved measurability or MemLp source is asserted. -/
theorem originalFockOperatorGaugeEquiv_source_operator_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)) =ᵐ[volume]
      (fun x : Boson 2 =>
        ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp
          (f (pairedGaugeData.boson g⁻¹ x))) := by
  filter_upwards [originalFockOperatorGaugeEquiv_source_all_basis_ae b g f] with x hx
  apply originalFockOperator_eq_of_basis b
  intro i
  simpa only [ContinuousLinearMap.comp_apply] using hx i

#print axioms originalFockOperatorGaugeEquiv_source_all_basis_ae
#print axioms originalFockOperator_eq_of_basis
#print axioms originalFockOperatorGaugeEquiv_source_operator_ae

end
end FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator
