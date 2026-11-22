import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0aOriginalSmoothCoreLpAction

/-!
MASSLESS-D0b0: exact original complex massless quantizer
natural maximal membership domain as a complex submodule of the
true original bosonic FullL2. Pointwise original Fock, a.e. classes,
no full multiplier graph/closedness or new physical spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0b0
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- Apply the qualified original complex-linear massless quantizer
pointwise to an arbitrary original FullL2 section's representative.
No integrability assertion is made at definition time. -/
def originalMasslessAction {N : ℕ} (M : AlgebraData N)
    (ψ : FullL2 N) : Boson N → Fermion N :=
  fun x => M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (ψ x)

/-- The action depends only on the original almost-everywhere
equivalence class, never on a chosen pointwise representative. -/
theorem originalMasslessAction_ae_congr {N : ℕ}
    (M : AlgebraData N) {ψ φ : FullL2 N}
    (h : (ψ : Boson N → Fermion N) =ᵐ[volume]
      (φ : Boson N → Fermion N)) :
    originalMasslessAction M ψ =ᵐ[volume]
      originalMasslessAction M φ := by
  filter_upwards [h] with x hx
  exact congrArg
    (fun z : Fermion N =>
      M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) z) hx

/-- Original complex-linear massless Fock action sends the zero
FullL2 section to zero a.e. -/
theorem originalMasslessAction_zero_ae {N : ℕ}
    (M : AlgebraData N) :
    originalMasslessAction M (0 : FullL2 N) =ᵐ[volume]
      (0 : Boson N → Fermion N) := by
  filter_upwards
    [Lp.coeFn_zero (E := Fermion N) (p := 2)
      (μ := (volume : Measure (Boson N)))] with x hx
  change M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x)
    ((0 : FullL2 N) x) = 0
  rw [hx]
  simp

/-- Original complex-linear massless Fock action respects FullL2
addition a.e., using pinned Mathlib's Lp representative identity. -/
theorem originalMasslessAction_add_ae {N : ℕ}
    (M : AlgebraData N) (ψ φ : FullL2 N) :
    originalMasslessAction M (ψ + φ) =ᵐ[volume]
      originalMasslessAction M ψ + originalMasslessAction M φ := by
  filter_upwards [Lp.coeFn_add ψ φ] with x hx
  change M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) ((ψ + φ) x) =
      M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (ψ x) +
      M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (φ x)
  rw [hx]
  simp only [Pi.add_apply, map_add]

/-- Complex linearity matters here: the source deformedFermionField
is displayed as real-linear, but the qualified quantizer is complex-linear. -/
theorem originalMasslessAction_smul_ae {N : ℕ}
    (M : AlgebraData N) (c : ℂ) (ψ : FullL2 N) :
    originalMasslessAction M (c • ψ) =ᵐ[volume]
      c • originalMasslessAction M ψ := by
  filter_upwards [Lp.coeFn_smul c ψ] with x hx
  change M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) ((c • ψ) x) =
      c • M.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (ψ x)
  rw [hx]
  simp only [Pi.smul_apply, map_smul]

/-- Exact maximal membership criterion inside the original complex
bosonic FullL2: all and only square-integrable quantized outputs.
An operator on this domain and its graph are NEXT separate gates. -/
def originalMasslessDomain {N : ℕ} (M : AlgebraData N) :
    Submodule ℂ (FullL2 N) where
  carrier := {ψ | MemLp (originalMasslessAction M ψ) 2
    (volume : Measure (Boson N))}
  zero_mem' := by
    change MemLp (originalMasslessAction M (0 : FullL2 N)) 2
      (volume : Measure (Boson N))
    exact (memLp_congr_ae (originalMasslessAction_zero_ae M)).2 MemLp.zero
  add_mem' := by
    intro ψ φ hψ hφ
    change MemLp (originalMasslessAction M (ψ + φ)) 2
      (volume : Measure (Boson N))
    exact (memLp_congr_ae (originalMasslessAction_add_ae M ψ φ)).2
      (hψ.add hφ)
  smul_mem' := by
    intro c ψ hψ
    change MemLp (originalMasslessAction M (c • ψ)) 2
      (volume : Measure (Boson N))
    exact (memLp_congr_ae (originalMasslessAction_smul_ae M c ψ)).2
      (hψ.const_smul c)

/-- Every original smooth compact core wavefunction lies in
the natural source maximal domain, using independently accepted D0a. -/
theorem originalCore_mem_originalMasslessDomain {N : ℕ}
    (M : AlgebraData N) (f : SmoothCore N) :
    coreToL2 f ∈ originalMasslessDomain M := by
  change MemLp (originalMasslessAction M (coreToL2 f)) 2
    (volume : Measure (Boson N))
  have heq :
      originalMasslessAction M (coreToL2 f) =ᵐ[volume]
        (fun x : Boson N =>
          M.quantizeFrequency
            (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x)) := by
    filter_upwards [coreToL2_ae f] with x hx
    exact congrArg
      (fun z : Fermion N =>
        M.quantizeFrequency
          (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) z) hx
  exact (memLp_congr_ae heq).2
    (FCP.BFSSMasslessD0a.originalMasslessQuantizer_core_memLp M f)

/-- Exact literal paired SU(2) 48-Majorana Fock consumer, not a
surrogate L2 model. -/
theorem pairedOriginalCore_memMasslessDomain (f : SmoothCore 2) :
    coreToL2 f ∈
      originalMasslessDomain FCP.BFSSSU2GaugeG1A.pairedAlgebraData :=
  originalCore_mem_originalMasslessDomain
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData f

#print axioms originalMasslessAction_ae_congr
#print axioms originalMasslessAction_zero_ae
#print axioms originalMasslessAction_add_ae
#print axioms originalMasslessAction_smul_ae
#print axioms originalMasslessDomain
#print axioms originalCore_mem_originalMasslessDomain
#print axioms pairedOriginalCore_memMasslessDomain

end
end FCP.BFSSMasslessD0b0
