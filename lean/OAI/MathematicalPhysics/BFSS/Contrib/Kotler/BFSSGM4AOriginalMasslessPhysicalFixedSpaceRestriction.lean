import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3AOriginalMasslessMultiplierGaugeIntertwining
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B8AFixedPointSpaceProbe

/-!
GM4A — original massless BFSS Fock multiplier on genuine Gauss physical L².

The original physical submodule is the source GaugeData.physicalSpace,
not an invented fixed-vector model. The actual natural maximal-domain
operator Q is D0c0.originalMasslessMultiplier, not any of the sixteen
differential supercharges. Its source exact output is physical because:
  * original physical vectors are fixed by the full SU(2) U_g;
  * GM3A: Q(U_g ψ)=U_g(Q ψ) for ψ in the original maximal domain.
The actual physical restricted domain is the comap of the source
maximal massless domain through the genuine physicalSpace inclusion.

No new operator extension, full-Hamiltonian identity, ground-state
claim, essential self-adjointness, spectrum or Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4A
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The exact source original massless maximal operator domain,
intersected with original source-defined physicalSpace and typed
as a genuine complex submodule of the physical Hilbert space. -/
noncomputable def originalPhysicalMasslessDomain
    (M : AlgebraData 2) (G : M.GaugeData) :
    Submodule ℂ G.physicalSpace :=
  (FCP.BFSSMasslessD0b0.originalMasslessDomain M).comap
    G.physicalSpace.subtype

/-- Original physical-domain vectors viewed in the ORIGINAL massless
maximal domain; no new Fock carrier or domain assumption. -/
noncomputable def originalPhysicalMasslessDomainLift
    (M : AlgebraData 2) (G : M.GaugeData) :
    originalPhysicalMasslessDomain M G →ₗ[ℂ]
      FCP.BFSSMasslessD0b0.originalMasslessDomain M where
  toFun ψ := ⟨((ψ.val : G.physicalSpace).val), ψ.property⟩
  map_add' ψ φ := by
    apply Subtype.ext
    rfl
  map_smul' c ψ := by
    apply Subtype.ext
    rfl

/-- The ORIGINAL (unbounded) massless finite-Fock multiplier
sends a physical input in its actual natural domain into the
original source Gauss-fixed physical Hilbert space. -/
theorem originalMasslessMultiplier_output_mem_physical
    (M : AlgebraData 2) (G : M.GaugeData)
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain M)
    (hψ : ψ.val ∈ G.physicalSpace) :
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ ∈
      G.physicalSpace := by
  apply (FCP.BFSSSU2PhysicalDomainD2B8A.sourceFullGaugePairCLM_fixed_iff_physical
    M G _).mp
  intro g
  have hfix :=
    (FCP.BFSSSU2PhysicalDomainD2B8A.sourceFullGaugePairCLM_fixed_iff_physical
      M G ψ.val).mpr hψ g
  change G.fiberAction g (G.bosonPullback g⁻¹ ψ.val) = ψ.val at hfix
  have hsub :
      (⟨G.fiberAction g (G.bosonPullback g⁻¹ ψ.val),
        FCP.BFSSGM2A.originalMasslessDomain_gauge_mem M G g ψ.property⟩ :
        FCP.BFSSMasslessD0b0.originalMasslessDomain M) = ψ :=
    Subtype.ext hfix
  have hcomm :=
    FCP.BFSSGM3A.originalMasslessMultiplier_gauge_intertwines M G g ψ
  rw [hsub] at hcomm
  change G.fiberAction g
    (G.bosonPullback g⁻¹
      (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ)) =
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ
  exact hcomm.symm

/-- GENUINE source partial operator restricted to its actual
physical maximal domain and landing in original physicalSpace.
A linear map on a domain submodule, not a bounded CLM on all L². -/
noncomputable def originalPhysicalMasslessMultiplier
    (M : AlgebraData 2) (G : M.GaugeData) :
    originalPhysicalMasslessDomain M G →ₗ[ℂ] G.physicalSpace :=
  ((FCP.BFSSMasslessD0c0.originalMasslessMultiplier M).comp
    (originalPhysicalMasslessDomainLift M G)).codRestrict
      G.physicalSpace
      (fun ψ => originalMasslessMultiplier_output_mem_physical M G
        (originalPhysicalMasslessDomainLift M G ψ) ψ.val.property)

/-- Literal paired original SU(2) 48-Majorana Fock physical
massless maximal natural operator domain, without changing source. -/
noncomputable def pairedOriginalPhysicalMasslessDomain :
    Submodule ℂ FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace :=
  originalPhysicalMasslessDomain
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData

/-- Literal paired original massless multiplier restricted to the
exact source-defined SU(2) gauge-fixed physical Hilbert space. -/
noncomputable def pairedOriginalPhysicalMasslessMultiplier :
    pairedOriginalPhysicalMasslessDomain →ₗ[ℂ]
      FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace :=
  originalPhysicalMasslessMultiplier
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData

#print axioms originalPhysicalMasslessDomain
#print axioms originalPhysicalMasslessDomainLift
#print axioms originalMasslessMultiplier_output_mem_physical
#print axioms originalPhysicalMasslessMultiplier
#print axioms pairedOriginalPhysicalMasslessDomain
#print axioms pairedOriginalPhysicalMasslessMultiplier

end
end FCP.BFSSGM4A
