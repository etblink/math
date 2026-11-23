import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4AOriginalMasslessPhysicalFixedSpaceRestriction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralMasslessCoreFormIdentity
import OAI.MathematicalPhysics.BFSS.MassiveMoments

/-! Identify the expectation of the actual physical massless multiplier in
the original sixteen-charge energy on the invariant smooth core. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5A
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open scoped InnerProductSpace
open FCP.BFSSGM4A

/-- An original invariant smooth vector in the actual physical
massless multiplier domain. -/
def physicalMasslessCoreInput (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) : originalPhysicalMasslessDomain M G :=
  ⟨⟨coreToL2 f.val, f.property⟩,
    FCP.BFSSMasslessD0b0.originalCore_mem_originalMasslessDomain M f.val⟩

private theorem physicalMasslessCoreField_ae (M : AlgebraData 2)
    (G : M.GaugeData) (f : G.invariantCore) :
    (((originalPhysicalMasslessMultiplier M G
        (physicalMasslessCoreInput M G f) : G.physicalSpace) : FullL2 2) :
      Boson 2 → Fermion 2) =ᵐ[volume]
        fun x => M.deformedFermionField 1 0 x (f.val x) := by
  let ψ := originalPhysicalMasslessDomainLift M G
    (physicalMasslessCoreInput M G f)
  change (FCP.BFSSMasslessD0c0.originalMasslessMultiplier M ψ :
    Boson 2 → Fermion 2) =ᵐ[volume] _
  refine (FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae M ψ).trans ?_
  filter_upwards [coreToL2_ae f.val] with x hx
  change M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) ((coreToL2 f.val) x) =
      M.deformedFermionField 1 0 x (f.val x)
  rw [hx]
  have hfield := congrArg
    (fun B : Fermion 2 →L[ℝ] Fermion 2 => B (f.val x))
    (FCP.BFSSMasslessM1b.originalMasslessFermionField_eq_quantized M x)
  simpa only [ContinuousLinearMap.coe_restrictScalars'] using hfield.symm

/-- The real expectation of the named physical multiplier equals the
source fermionic integrand on the exact original invariant core. -/
theorem physicalMasslessCorePairing (M : AlgebraData 2)
    (G : M.GaugeData) (f : G.invariantCore) :
    (inner ℂ (physicalMasslessCoreInput M G f).val
      (originalPhysicalMasslessMultiplier M G
        (physicalMasslessCoreInput M G f))).re =
      ∫ x : Boson 2, inner ℝ (f.val x) (M.deformedFermionField 1 0 x (f.val x)) := by
  let a : FullL2 2 := coreToL2 f.val
  let b : FullL2 2 := (originalPhysicalMasslessMultiplier M G
    (physicalMasslessCoreInput M G f) : G.physicalSpace)
  change (inner ℂ a b).re = _
  rw [L2.inner_def]
  change RCLike.re (∫ x : Boson 2, inner ℂ (a x) (b x)) = _
  rw [← integral_re (L2.integrable_inner (𝕜 := ℂ) a b)]
  apply integral_congr_ae
  filter_upwards [coreToL2_ae f.val, physicalMasslessCoreField_ae M G f]
    with x ha hb
  change RCLike.re (inner ℂ ((coreToL2 f.val) x)
    (((originalPhysicalMasslessMultiplier M G
      (physicalMasslessCoreInput M G f) : G.physicalSpace) : FullL2 2) x)) = _
  rw [ha, hb]
  simp only [PiLp.inner_apply, map_sum, RCLike.re_to_complex, real_inner_eq_re_inner ℂ]

/-- The original sixteen-charge smooth-core form with its exact kinetic
coefficient and physical massless multiplier expectation. -/
theorem physicalMasslessCoreEnergy (M : AlgebraData 2)
    (G : M.GaugeData) (f : G.invariantCore) :
    M.coreForm f.val =
      (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f.val)‖ ^ 2 +
      (∫ x : Boson 2, M.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) +
      (inner ℂ (physicalMasslessCoreInput M G f).val
        (originalPhysicalMasslessMultiplier M G
          (physicalMasslessCoreInput M G f))).re := by
  rw [physicalMasslessCorePairing M G f, M.massless_coreForm_energy f.val,
    integral_add (M.bosonic_core_integrable 1 0 f.val)
      (M.fermion_core_integrable 1 0 f.val), add_assoc]

#print axioms physicalMasslessCoreInput
#print axioms physicalMasslessCorePairing
#print axioms physicalMasslessCoreEnergy

end
end FCP.BFSSGM5A
