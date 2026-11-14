import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B0OriginalReciprocalFullL2AEMultiplication

/-! Original Fock FullL2 weighted compact-core range witness.
Not physical-domain density, maximal weighted multiplication, or spectral physics. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open MeasureTheory

noncomputable def originalWeightedCoreField (ε : ℝ) (g : SmoothCore 2) :
    Boson 2 → Fermion 2 :=
  fun x => (originalRadialWeight ε x : ℂ) • g x

theorem originalWeightedCoreField_continuous (ε : ℝ) (g : SmoothCore 2) :
    Continuous (originalWeightedCoreField ε g) := by
  change Continuous
    (fun x : Boson 2 => (originalRadialWeight ε x : ℂ) • g x)
  have hw : Continuous
      (fun x : Boson 2 => (originalRadialWeight ε x : ℂ)) :=
    Complex.continuous_ofReal.comp (originalRadialWeight_continuous ε)
  exact hw.smul g.continuous

theorem originalWeightedCoreField_hasCompactSupport
    (ε : ℝ) (g : SmoothCore 2) :
    HasCompactSupport (originalWeightedCoreField ε g) := by
  change HasCompactSupport
    (fun x : Boson 2 => (originalRadialWeight ε x : ℂ) • g x)
  exact HasCompactSupport.smul_left
    (f := fun x : Boson 2 => (originalRadialWeight ε x : ℂ))
    g.hasCompactSupport

noncomputable def originalWeightedCoreFieldL2 (ε : ℝ) (g : SmoothCore 2) :
    FullL2 2 :=
  ((originalWeightedCoreField_continuous ε g).memLp_of_hasCompactSupport
    (originalWeightedCoreField_hasCompactSupport ε g)).toLp
      (originalWeightedCoreField ε g)

theorem originalReciprocalFullL2CLM_core_witness
    {ε : ℝ} (hε : 0 < ε) (g : SmoothCore 2) :
    originalReciprocalFullL2CLM hε (originalWeightedCoreFieldL2 ε g) =
      coreToL2 g := by
  apply Lp.ext_iff.mpr
  have hb := originalReciprocalFullL2CLM_ae_originalField
    hε (originalWeightedCoreFieldL2 ε g)
  have hw :
      (originalWeightedCoreFieldL2 ε g : Boson 2 → Fermion 2) =ᵐ[volume]
        originalWeightedCoreField ε g :=
    MemLp.coeFn_toLp
      ((originalWeightedCoreField_continuous ε g).memLp_of_hasCompactSupport
        (originalWeightedCoreField_hasCompactSupport ε g))
  have hg := coreToL2_ae g
  filter_upwards [hb, hw, hg] with x hbx hwx hgx
  calc
    (originalReciprocalFullL2CLM hε (originalWeightedCoreFieldL2 ε g) :
      Boson 2 → Fermion 2) x =
        originalReciprocalField ε x •
          (originalWeightedCoreFieldL2 ε g : Boson 2 → Fermion 2) x := hbx
    _ = originalReciprocalField ε x • originalWeightedCoreField ε g x := by
      rw [hwx]
    _ = g x := by
      change (originalRadialWeight ε x : ℂ)⁻¹ •
        ((originalRadialWeight ε x : ℂ) • g x) = g x
      rw [smul_smul,
        mul_comm (originalRadialWeight ε x : ℂ)⁻¹
          (originalRadialWeight ε x : ℂ),
        originalRadialWeight_complex_mul_inv hε x, one_smul]
    _ = (coreToL2 g : Boson 2 → Fermion 2) x := hgx.symm

theorem originalCoreToL2_mem_reciprocalRange
    {ε : ℝ} (hε : 0 < ε) (g : SmoothCore 2) :
    coreToL2 g ∈
      LinearMap.range (originalReciprocalFullL2CLM hε).toLinearMap := by
  exact ⟨originalWeightedCoreFieldL2 ε g,
    originalReciprocalFullL2CLM_core_witness hε g⟩

#print axioms originalWeightedCoreField_continuous
#print axioms originalWeightedCoreField_hasCompactSupport
#print axioms originalWeightedCoreFieldL2
#print axioms originalReciprocalFullL2CLM_core_witness
#print axioms originalCoreToL2_mem_reciprocalRange

end
end FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness
