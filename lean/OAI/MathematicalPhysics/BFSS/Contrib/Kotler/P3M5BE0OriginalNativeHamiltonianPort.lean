import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-!
# P3-M5BE0 — current imported BE normalized native Hamiltonian, paired SU(2) source

PROSPECTIVE, UNQUALIFIED until exact strict source / independent
original physical Hilbert consumer / allowed-axiom audit succeeds.

Specialize the existing historical BE native self-adjoint Hamiltonian
H=(1/16)T†T to the literal paired AlgebraData 2 / GaugeData and
retain its source-defined natural adjoint-square operator domain.

No new Hamiltonian is defined here. No substitute Hilbert space,
unbounded-operator domain extension, positive eigenpair or BFSS mass gap.
This does not requalify BF/BG/BH exact Hamiltonian graph equality.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open LinearPMap

/-- The exact original source-normalized Hamiltonian is the native
physical sixteen-charge adjoint square, with scalar 1/16. -/
theorem originalPairedNormalizedH_eq_charge_square :
    originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData =
        (1 / 16 : ℂ) •
          originalMinimalPhysicalHilbertChargeAdjointSquare
            pairedAlgebraData pairedGaugeData := by
  rfl

/-- Original physical native Hamiltonian domain is EXACTLY
Dom(T†T) for the original paired data, not a core/proxy extension. -/
theorem originalPairedNormalizedH_naturalDomain :
    (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).domain =
        (originalMinimalPhysicalHilbertChargeAdjointSquare
          pairedAlgebraData pairedGaugeData).domain :=
  originalMinimalPhysicalNormalizedHamiltonian_domain
    pairedAlgebraData pairedGaugeData

/-- Exact original (1/16)T†T action on the natural domain. -/
theorem originalPairedNormalizedH_apply
    (u : (originalMinimalPhysicalHilbertChargeAdjointSquare
      pairedAlgebraData pairedGaugeData).domain) :
    originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData
        ⟨u, by rw [originalPairedNormalizedH_naturalDomain]; exact u.property⟩ =
      (1 / 16 : ℂ) •
        originalMinimalPhysicalHilbertChargeAdjointSquare
          pairedAlgebraData pairedGaugeData u :=
  originalMinimalPhysicalNormalizedHamiltonian_apply
    pairedAlgebraData pairedGaugeData u

/-- Self-adjointness of the current imported original BE source H
on the LITERAL pairedGaugeData physical Hilbert subtype. -/
theorem originalPairedNormalizedH_selfAdjoint :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    IsSelfAdjoint (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData) :=
  originalMinimalPhysicalNormalizedHamiltonian_selfAdjoint
    pairedAlgebraData pairedGaugeData

/-- Closedness is inherited from the source-normalized genuine H. -/
theorem originalPairedNormalizedH_closed :
    (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).IsClosed :=
  originalMinimalPhysicalNormalizedHamiltonian_closed
    pairedAlgebraData pairedGaugeData

/-- Dense NATURAL Hamiltonian domain, not any particular
radial witness's membership or nonzero eigenstate. -/
theorem originalPairedNormalizedH_domain_dense :
    Dense ((originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).domain :
        Set pairedGaugeData.physicalSpace) :=
  originalMinimalPhysicalNormalizedHamiltonian_domain_dense
    pairedAlgebraData pairedGaugeData

/-- This is the original closed charge-form weak representation iff,
not formal equality on only invariant smooth test functions. -/
theorem originalPairedNormalizedH_weakForm_iff
    (u : (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain)
    (w : pairedGaugeData.physicalSpace) :
    (∀ v : (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain,
      inner ℂ w (v : pairedGaugeData.physicalSpace) =
        (1 / 16 : ℂ) *
          inner ℂ
            (originalMinimalPhysicalHilbertChargeColumn
              pairedAlgebraData pairedGaugeData u)
            (originalMinimalPhysicalHilbertChargeColumn
              pairedAlgebraData pairedGaugeData v)) ↔
      ∃ h : (u : pairedGaugeData.physicalSpace) ∈
          (originalMinimalPhysicalNormalizedHamiltonian
            pairedAlgebraData pairedGaugeData).domain,
        w = originalMinimalPhysicalNormalizedHamiltonian
          pairedAlgebraData pairedGaugeData ⟨u, h⟩ :=
  originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff
    pairedAlgebraData pairedGaugeData u w

#print axioms originalPairedNormalizedH_eq_charge_square
#print axioms originalPairedNormalizedH_naturalDomain
#print axioms originalPairedNormalizedH_apply
#print axioms originalPairedNormalizedH_selfAdjoint
#print axioms originalPairedNormalizedH_closed
#print axioms originalPairedNormalizedH_domain_dense
#print axioms originalPairedNormalizedH_weakForm_iff

end
end FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort
