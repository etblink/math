import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM2AOriginalMasslessMaximalDomainGaugePreservation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0c0OriginalGenericPartialMultiplierGraph

/-!
GM3A — original source-exact massless PARTIAL OPERATOR gauge intertwining.

GM0B: original 48-Majorana pointwise Fock quantizer covariance.
GM1A: original FullL2 representative a.e. transport.
GM2A: maximal natural massless operator domain gauge preservation.

GM3A now identifies the TRUE output L2 class after gauge transport:
Q(U_g ψ) = U_g(Q ψ), with ψ on its original maximal domain.
It uses original D0c0 partial multiplier and original GaugeData source
fiberAction and inverse bosonPullback. The graph as a Submodule
will be addressed separately, not silently inferred or assumed.

No self-adjointness, physical fixedness, spectrum, or Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3A
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- Strict original-source gauge intertwining of the genuinely
unbounded massless Fock partial operator on its maximal L2 domain.
The returned output is an honest original FullL2 equivalence class. -/
theorem originalMasslessMultiplier_gauge_intertwines
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N)
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain M) :
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier M
      ⟨G.fiberAction g (G.bosonPullback g⁻¹ ψ.val),
       FCP.BFSSGM2A.originalMasslessDomain_gauge_mem M G g ψ.property⟩ =
    G.fiberAction g
      (G.bosonPullback g⁻¹
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ)) := by
  let ψg : FCP.BFSSMasslessD0b0.originalMasslessDomain M :=
    ⟨G.fiberAction g (G.bosonPullback g⁻¹ ψ.val),
     FCP.BFSSGM2A.originalMasslessDomain_gauge_mem M G g ψ.property⟩
  change FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψg =
    G.fiberAction g
      (G.bosonPullback g⁻¹
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ))
  apply Lp.ext_iff.mpr
  have hLeft := FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae M ψg
  have hTransport :=
    FCP.BFSSGM1A.originalMasslessAction_gauge_ae_transport M G g ψ.val
  have hOrig :=
    (FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae M ψ).comp_tendsto
      (G.boson g⁻¹).measurePreserving.quasiMeasurePreserving.tendsto_ae
  have hB := Lp.coeFn_compMeasurePreserving
    (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ)
    (G.boson g⁻¹).measurePreserving
  change
    (G.bosonPullback g⁻¹
      (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ) :
       Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N =>
      (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ : FullL2 N)
        (G.boson g⁻¹ x)) at hB
  have hF := ContinuousLinearMap.coeFn_compLp
    (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
    (G.bosonPullback g⁻¹
      (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ))
  change
    (G.fiberAction g
      (G.bosonPullback g⁻¹
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ)) :
       Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N =>
      G.fermion g
        ((G.bosonPullback g⁻¹
          (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ) :
          FullL2 N) x)) at hF
  filter_upwards [hLeft, hTransport, hOrig, hB, hF]
    with x hl ht ho hb hf
  calc
    (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψg :
      Boson N → Fermion N) x =
        FCP.BFSSMasslessD0b0.originalMasslessAction M ψg.val x := hl
    _ = G.fermion g
          (FCP.BFSSMasslessD0b0.originalMasslessAction M ψ.val
            (G.boson g⁻¹ x)) := ht
    _ = G.fermion g
          ((FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ : FullL2 N)
            (G.boson g⁻¹ x)) := congrArg (G.fermion g) ho.symm
    _ = G.fermion g
          ((G.bosonPullback g⁻¹
            (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ) :
              FullL2 N) x) := congrArg (G.fermion g) hb.symm
    _ = (G.fiberAction g
          (G.bosonPullback g⁻¹
            (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ)) :
              Boson N → Fermion N) x := hf.symm

/-- Literally paired original SU(2) Fock partial multiplier;
no abstract or proxy choice of fermionic representation. -/
theorem pairedOriginalMasslessMultiplier_gauge_intertwines
    (g : GaugeGroup 2)
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
        ⟨FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
           (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ.val),
         FCP.BFSSGM2A.pairedOriginalMasslessDomain_gauge_mem g ψ.property⟩ =
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ)) :=
  originalMasslessMultiplier_gauge_intertwines
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData g ψ

#print axioms originalMasslessMultiplier_gauge_intertwines
#print axioms pairedOriginalMasslessMultiplier_gauge_intertwines

end
end FCP.BFSSGM3A
