import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM1AOriginalMasslessFockGaugeAETransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0b0OriginalMaximalDomainSubmodule

/-!
GM2A — SOURCE-EXACT maximal massless Fock multiplier domain gauge preservation.

GM1A supplies the a.e. identity for the ORIGINAL massless frequency
quantizer under U(g)=F(g) ∘ B(g⁻¹). This gate tests the analytic
integrability step against the ORIGINAL Hilbert L² carrier, not a
surrogate domain: turn a MemLp witness into an Lp vector, act by the
original source FullL2 group maps, and transfer MemLp along the
pinned a.e. representative laws.

Only group action preservation of membership in the maximal
massless multiplier domain is asserted. The closed multiplier graph
intertwining, physical fixed space, Gauss generator, mass gap,
Gamma9–Fock topological coupling and physical Hopfion remain separate.
-/
set_option autoImplicit false

namespace FCP.BFSSGM2A
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- Purely analytic source-GaugeData lemma: the genuine SU(2)
boson inverse pullback and complex-linear Fock fiber action
preserve square integrability of an arbitrary massless-output
representative. No original massless theorem is used here. -/
theorem sourceGaugeTransport_memLp
    {N : ℕ} {M : AlgebraData N} (G : M.GaugeData)
    (g : GaugeGroup N) {f : Boson N → Fermion N}
    (hf : MemLp f 2 (volume : Measure (Boson N))) :
    MemLp
      (fun x : Boson N => G.fermion g (f (G.boson g⁻¹ x)))
      2 (volume : Measure (Boson N)) := by
  let φ : FullL2 N := MemLp.toLp f hf
  have hc : (φ : Boson N → Fermion N) =ᵐ[volume] f := by
    exact MemLp.coeFn_toLp hf
  have hcc := hc.comp_tendsto
    (G.boson g⁻¹).measurePreserving.quasiMeasurePreserving.tendsto_ae
  have hF := ContinuousLinearMap.coeFn_compLp
    (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
    (G.bosonPullback g⁻¹ φ)
  change
    (G.fiberAction g (G.bosonPullback g⁻¹ φ) :
      Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N =>
      G.fermion g ((G.bosonPullback g⁻¹ φ : FullL2 N) x)) at hF
  have hB := Lp.coeFn_compMeasurePreserving φ
    (G.boson g⁻¹).measurePreserving
  change
    (G.bosonPullback g⁻¹ φ : Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N => (φ : FullL2 N) (G.boson g⁻¹ x)) at hB
  have heq :
      (G.fiberAction g (G.bosonPullback g⁻¹ φ) :
        Boson N → Fermion N) =ᵐ[volume]
      (fun x : Boson N => G.fermion g (f (G.boson g⁻¹ x))) := by
    filter_upwards [hF, hB, hcc] with x hxF hxB hxC
    calc
      (G.fiberAction g (G.bosonPullback g⁻¹ φ) :
        Boson N → Fermion N) x =
          G.fermion g ((G.bosonPullback g⁻¹ φ : FullL2 N) x) := hxF
      _ = G.fermion g ((φ : FullL2 N) (G.boson g⁻¹ x)) :=
        congrArg (G.fermion g) hxB
      _ = G.fermion g (f (G.boson g⁻¹ x)) :=
        congrArg (G.fermion g) hxC
  exact (memLp_congr_ae heq.symm).2
    (Lp.memLp (G.fiberAction g (G.bosonPullback g⁻¹ φ)))

/-- The ACTUAL original massless complex-Fock maximal multiplier
domain is invariant under each genuine source gauge unitary U(g).
Nothing about boundedness of the unbounded multiplier is implied. -/
theorem originalMasslessDomain_gauge_mem
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) {ψ : FullL2 N}
    (hψ : ψ ∈ FCP.BFSSMasslessD0b0.originalMasslessDomain M) :
    G.fiberAction g (G.bosonPullback g⁻¹ ψ) ∈
      FCP.BFSSMasslessD0b0.originalMasslessDomain M := by
  have houtput : MemLp
      (FCP.BFSSMasslessD0b0.originalMasslessAction M ψ)
      2 (volume : Measure (Boson N)) := hψ
  change MemLp
    (FCP.BFSSMasslessD0b0.originalMasslessAction M
      (G.fiberAction g (G.bosonPullback g⁻¹ ψ)))
    2 (volume : Measure (Boson N))
  exact (memLp_congr_ae
    (FCP.BFSSGM1A.originalMasslessAction_gauge_ae_transport M G g ψ)).2
    (sourceGaugeTransport_memLp G g houtput)

/-- Original paired SU(2), exactly 48 original Majorana
generators and the source (not proxy) FullL2 2 maximal domain. -/
theorem pairedOriginalMasslessDomain_gauge_mem
    (g : GaugeGroup 2) {ψ : FullL2 2}
    (hψ : ψ ∈ FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ) ∈
    FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :=
  originalMasslessDomain_gauge_mem
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData g hψ

#print axioms sourceGaugeTransport_memLp
#print axioms originalMasslessDomain_gauge_mem
#print axioms pairedOriginalMasslessDomain_gauge_mem

end
end FCP.BFSSGM2A
