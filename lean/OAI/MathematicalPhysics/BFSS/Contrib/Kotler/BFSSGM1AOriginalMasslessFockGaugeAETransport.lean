import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM0BOriginalMasslessFockPointwiseGaugeCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0b0OriginalMaximalDomainSubmodule

/-!
GM1A — a.e. gauge transport of the ORIGINAL massless Fock action.

Compose qualified GM0B pointwise exact original finite-Fock quantizer covariance
with the ORIGINAL GaugeData.bosonPullback and GaugeData.fiberAction
representatives on FullL2 N. The bosonic inverse convention is essential.

This proves the representative AE transport identity, NOT that the transformed
massless output belongs to L² (maximal-domain invariance is GM2), NOT
closed-operator intertwining, physical Gauss invariance, or a Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM1A
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- For a genuine source GaugeData, exact bosonic inverse pullback plus
true finite-Fock fiber action carries the massless multiplier field
into the same transformed field *almost everywhere* on original FullL2. -/
theorem originalMasslessAction_gauge_ae_transport
    {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (g : GaugeGroup N) (ψ : FullL2 N) :
    FCP.BFSSMasslessD0b0.originalMasslessAction M
      (G.fiberAction g (G.bosonPullback g⁻¹ ψ)) =ᵐ[volume]
    (fun x : Boson N =>
      G.fermion g
        (FCP.BFSSMasslessD0b0.originalMasslessAction M ψ
          (G.boson g⁻¹ x))) := by
  have hf := ContinuousLinearMap.coeFn_compLp
    (G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
    (G.bosonPullback g⁻¹ ψ)
  -- Align the two Mathlib a.e. representative identities with the exact
  -- source GaugeData LinearMap wrappers before rewriting under Q(x).
  -- Without this typed change, rw cannot see compLp inside G.fiberAction.
  change
    (G.fiberAction g (G.bosonPullback g⁻¹ ψ) :
      Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N =>
      G.fermion g ((G.bosonPullback g⁻¹ ψ : FullL2 N) x)) at hf
  have hb := Lp.coeFn_compMeasurePreserving ψ
    (G.boson g⁻¹).measurePreserving
  change
    (G.bosonPullback g⁻¹ ψ : Boson N → Fermion N) =ᵐ[volume]
    (fun x : Boson N => (ψ : FullL2 N) (G.boson g⁻¹ x)) at hb
  filter_upwards [hf, hb] with x hfx hbx
  change M.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency M x)
      ((G.fiberAction g (G.bosonPullback g⁻¹ ψ) : FullL2 N) x) =
    G.fermion g
      (M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M
          (G.boson g⁻¹ x))
        ((ψ : FullL2 N) (G.boson g⁻¹ x)))
  rw [hfx, hbx]
  have hinv : G.boson g (G.boson g⁻¹ x) = x := by
    -- Use the genuine source group-homomorphism law directly. This
    -- avoids conflating group inversion with the equiv's .symm field.
    calc
      _ = G.boson (g * g⁻¹) x := by
        rw [map_mul]
        rfl
      _ = x := by simp
  have hcov :=
    FCP.BFSSGM0B.originalMasslessQuantizer_gauge_covariant M G g
      (G.boson g⁻¹ x) ((ψ : FullL2 N) (G.boson g⁻¹ x))
  rw [hinv] at hcov
  exact hcov.symm

/-- Literal 48-Majorana SU(2) paired AlgebraData and original FullL2 2. -/
theorem pairedOriginalMasslessAction_gauge_ae_transport
    (g : GaugeGroup 2) (ψ : FullL2 2) :
    FCP.BFSSMasslessD0b0.originalMasslessAction
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ)) =ᵐ[volume]
    (fun x : Boson 2 =>
      FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g
        (FCP.BFSSMasslessD0b0.originalMasslessAction
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ
            (FCP.BFSSSU2GaugeG4J.pairedGaugeData.boson g⁻¹ x))) :=
  originalMasslessAction_gauge_ae_transport
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData g ψ

#print axioms originalMasslessAction_gauge_ae_transport
#print axioms pairedOriginalMasslessAction_gauge_ae_transport

end
end FCP.BFSSGM1A
