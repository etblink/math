import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4AOriginalMasslessPhysicalFixedSpaceRestriction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4K3NonzeroSmoothInvariantCoreProbe

/-!
GM4B0 — original source physical massless Fock partial multiplier:
explicit nontrivial natural domain, on the *actual* paired SU(2)
gauge-fixed physical Hilbert space.

GM4A established that the source massless multiplier restricts to
the original gauge fixed physical space, on the exact source maximal
L²-domain intersection. This microgate uses the pre-existing, literal
48-Majorana source radial vacuum bump and its exact SmoothCore
preimage to witness NONZERO membership in that physical domain.

No statement of density, graph closedness, massless Hamiltonian
identification, self-adjointness, ground state, gap or Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B0
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Every original paired smooth invariant core vector belongs to
the genuine original maximal massless interaction domain,
interpreted inside the literal physical SU(2) Hilbert submodule. -/
theorem pairedInvariantSmoothCore_mem_physicalMasslessDomain
    (f : FCP.BFSSSU2GaugeG4J.pairedGaugeData.invariantCore) :
    (⟨coreToL2 f.val, f.property⟩ :
      FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) ∈
    FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain := by
  change coreToL2 f.val ∈
    FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
  exact FCP.BFSSMasslessD0b0.pairedOriginalCore_memMasslessDomain f.val

/-- A completely explicit TRUE original physical SU(2) L²
wavefunction lies in the maximal physical massless multiplier
domain and is NONZERO. It is not asserted to be an eigenvector. -/
theorem pairedOriginalPhysicalMasslessDomain_has_nonzero :
    ∃ v : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace,
      v ∈ FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ∧
      v ≠ 0 := by
  let v : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace :=
    ⟨FCP.BFSSSU2GaugeG4K2B.radialBumpL2,
     FCP.BFSSSU2GaugeG4K2B.radialBumpL2_mem_physicalSpace⟩
  refine ⟨v, ?_, ?_⟩
  · change FCP.BFSSSU2GaugeG4K2B.radialBumpL2 ∈
      FCP.BFSSMasslessD0b0.originalMasslessDomain
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    rw [← FCP.BFSSSU2GaugeG4K3.radialBumpSmoothCore_toL2]
    exact FCP.BFSSMasslessD0b0.pairedOriginalCore_memMasslessDomain
      FCP.BFSSSU2GaugeG4K3.radialBumpSmoothCore
  · intro hz
    apply FCP.BFSSSU2GaugeG4K2B.radialBumpL2_ne_zero
    have hval := congrArg
      (fun w : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace =>
        (w : FullL2 2)) hz
    simpa only [v, Submodule.coe_zero] using hval

/-- The physical massless domain is an honestly NONZERO complex
submodule of the actual original Gauss-fixed physical Hilbert space. -/
theorem pairedOriginalPhysicalMasslessDomain_ne_bot :
    FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ≠ ⊥ := by
  obtain ⟨v, hv, hne⟩ :=
    pairedOriginalPhysicalMasslessDomain_has_nonzero
  intro hz
  rw [hz] at hv
  exact hne (by simpa using hv)

#print axioms pairedInvariantSmoothCore_mem_physicalMasslessDomain
#print axioms pairedOriginalPhysicalMasslessDomain_has_nonzero
#print axioms pairedOriginalPhysicalMasslessDomain_ne_bot

end
end FCP.BFSSGM4B0
