import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4B0OriginalPhysicalMasslessNonzeroDomainWitness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe

/-!
GM4B1 — density of original massless Fock multiplier natural domain
INSIDE the genuine original paired SU(2) Gauss-invariant Hilbert space.

Source domain is GM4A's literal original maximal massless
Fock multiplication domain comap along GaugeData.physicalSpace.
The source Haar/core density theorem is D2B10C, not an added
density assumption. GM4B0 independently established a nonzero
original physical smooth-core witness.

Proof architecture mirrors the existing original
L6H5E8AZ physical-charge density reduction, with exact source
Subtype.dense_iff and smooth-invariant-core inclusion. The
generic reduction is CONDITIONAL on precisely the source
coreNormClosure equality; its paired specialization discharges
that premise with the actual D2B10C theorem.

No new Hilbert space, no operator closure assertion, no claim
about full BFSS supercharges, self-adjointness, spectral gap,
ground-state or Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B1
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Set

/-- Abstract exact-source density transfer: if the closure of
source gauge-invariant SmoothCore images is precisely the
source physical space, then the source natural maximal
massless multiplier domain is dense in that physical space.
This theorem makes the density premise explicit. -/
theorem originalPhysicalMasslessDomain_dense_of_coreNormClosure_eq
    (M : AlgebraData 2) (G : M.GaugeData)
    (hd : G.coreNormClosure = G.physicalSpace) :
    Dense (FCP.BFSSGM4A.originalPhysicalMasslessDomain M G :
      Set G.physicalSpace) := by
  rw [Subtype.dense_iff]
  have hs :
      (LinearMap.range (coreToL2.comp G.invariantCore.subtype) :
        Set (FullL2 2)) ⊆
      ((↑) '' (FCP.BFSSGM4A.originalPhysicalMasslessDomain M G :
        Set G.physicalSpace) : Set (FullL2 2)) := by
    rintro ψ ⟨f, rfl⟩
    let u : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
    refine ⟨u, ?_, rfl⟩
    change coreToL2 f.val ∈
      FCP.BFSSMasslessD0b0.originalMasslessDomain M
    exact FCP.BFSSMasslessD0b0.originalCore_mem_originalMasslessDomain
      M f.val
  calc
    (G.physicalSpace : Set (FullL2 2)) =
        (G.coreNormClosure : Set (FullL2 2)) :=
      congrArg (fun S : Submodule ℂ (FullL2 2) =>
        (S : Set (FullL2 2))) hd.symm
    _ = closure (LinearMap.range
        (coreToL2.comp G.invariantCore.subtype) :
          Set (FullL2 2)) := rfl
    _ ⊆ closure ((↑) '' (FCP.BFSSGM4A.originalPhysicalMasslessDomain
        M G : Set G.physicalSpace) : Set (FullL2 2)) :=
      closure_mono hs

/-- Unconditional for LITERAL paired source SU(2), using the
existing original Haar/core compatibility theorem rather
than a new physical-density assumption. -/
theorem pairedOriginalPhysicalMasslessDomain_dense :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) :=
  originalPhysicalMasslessDomain_dense_of_coreNormClosure_eq
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData
    (FCP.BFSSSU2PhysicalDomainD2B10C.sourceCoreNormClosure_eq_physical_unconditional
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
      FCP.BFSSSU2GaugeG4J.pairedGaugeData)

/-- Combine only separately warranted properties: the
actual physical massless multiplier's domain is dense,
and the source radial Fock witness proves it nonzero.
No physical eigenstate or energy bound is asserted. -/
theorem pairedOriginalPhysicalMasslessDomain_dense_and_nonzero :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) ∧
    (∃ v : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace,
      v ∈ FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ∧
      v ≠ 0) :=
  ⟨pairedOriginalPhysicalMasslessDomain_dense,
   FCP.BFSSGM4B0.pairedOriginalPhysicalMasslessDomain_has_nonzero⟩

#print axioms originalPhysicalMasslessDomain_dense_of_coreNormClosure_eq
#print axioms pairedOriginalPhysicalMasslessDomain_dense
#print axioms pairedOriginalPhysicalMasslessDomain_dense_and_nonzero

end
end FCP.BFSSGM4B1
