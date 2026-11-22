import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0b0OriginalMaximalDomainSubmodule

/-!
MASSLESS-D0b1: actual source massless complex-linear partial multiplication
operator on the qualified natural original FullL2 domain, with its
almost-everywhere pointwise action and algebraic graph.
NO closure, self-adjointness, gauge-domain or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0b1
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSMasslessD0b0

/-- The actual original massless Fock multiplication operator on its
qualified complex-linear natural L² domain, NOT a bounded operator
defined on all of original FullL2. -/
def originalMasslessMultiplier {N : ℕ} (M : AlgebraData N) :
    (originalMasslessDomain M) →ₗ[ℂ] FullL2 N where
  toFun ψ :=
    (show MemLp (originalMasslessAction M ψ.val) 2
      (volume : Measure (Boson N)) from ψ.property).toLp
        (originalMasslessAction M ψ.val)
  map_add' ψ φ := by
    change ((ψ + φ).property).toLp
        (originalMasslessAction M (ψ + φ).val) =
      (ψ.property).toLp (originalMasslessAction M ψ.val) +
      (φ.property).toLp (originalMasslessAction M φ.val)
    have h := originalMasslessAction_add_ae M ψ.val φ.val
    exact (MemLp.toLp_congr (ψ + φ).property
      (ψ.property.add φ.property) (by simpa using h)).trans
      (MemLp.toLp_add ψ.property φ.property)
  map_smul' c ψ := by
    change ((c • ψ).property).toLp
        (originalMasslessAction M (c • ψ).val) =
      c • (ψ.property).toLp (originalMasslessAction M ψ.val)
    have h := originalMasslessAction_smul_ae M c ψ.val
    exact (MemLp.toLp_congr (c • ψ).property
      (ψ.property.const_smul c) (by simpa using h)).trans
      (MemLp.toLp_const_smul c ψ.property)

/-- The original complex-linear partial operator acts a.e. by the
literal M1a massless source Fock quantizer, on every domain input. -/
theorem originalMasslessMultiplier_ae {N : ℕ}
    (M : AlgebraData N) (ψ : originalMasslessDomain M) :
    (originalMasslessMultiplier M ψ : Boson N → Fermion N) =ᵐ[volume]
      originalMasslessAction M ψ.val := by
  exact MemLp.coeFn_toLp ψ.property

/-- The algebraic graph of the TRUE partial complex-linear source
multiplication operator inside the original FullL2 × FullL2 product.
No closedness assertion. -/
def originalMasslessGraph {N : ℕ} (M : AlgebraData N) :
    Submodule ℂ (FullL2 N × FullL2 N) :=
  LinearMap.range
    ((originalMasslessDomain M).subtype.prod (originalMasslessMultiplier M))

/-- Every admissible original L² input has its specified output
in the exact algebraic graph of the partial multiplier. -/
theorem originalMasslessGraph_mem {N : ℕ}
    (M : AlgebraData N) (ψ : originalMasslessDomain M) :
    ((ψ.val : FullL2 N), originalMasslessMultiplier M ψ) ∈
      originalMasslessGraph M := by
  exact ⟨ψ, rfl⟩

/-- Independent literal paired SU(2) 48-Majorana original-source
consumer for the global complex partial multiplier a.e. action. -/
theorem pairedOriginalMasslessMultiplier_ae
    (ψ : originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    (originalMasslessMultiplier
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency
            FCP.BFSSSU2GaugeG1A.pairedAlgebraData x) (ψ.val x)) := by
  simpa only [originalMasslessAction] using
    (originalMasslessMultiplier_ae
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ)

#print axioms originalMasslessMultiplier
#print axioms originalMasslessMultiplier_ae
#print axioms originalMasslessGraph
#print axioms originalMasslessGraph_mem
#print axioms pairedOriginalMasslessMultiplier_ae

end
end FCP.BFSSMasslessD0b1
