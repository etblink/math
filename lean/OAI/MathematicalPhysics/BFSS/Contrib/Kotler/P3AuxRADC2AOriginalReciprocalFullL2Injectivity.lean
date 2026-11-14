import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B0OriginalReciprocalFullL2AEMultiplication

/-! P3-AUX-RAD-C2A R1. The genuine original FullL2 bounded reciprocal is injective.
Not a globally bounded inverse, a PiLp lift, or a spectral theorem. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open MeasureTheory

theorem originalReciprocalFullL2CLM_injective {ε : ℝ} (hε : 0 < ε) :
    Function.Injective (originalReciprocalFullL2CLM hε) := by
  intro f g hfg
  apply Lp.ext
  have hbEq :
      (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) =ᵐ[volume]
        (originalReciprocalFullL2CLM hε g : Boson 2 → Fermion 2) :=
    Lp.ext_iff.mp hfg
  have hbf := originalReciprocalFullL2CLM_ae_originalField hε f
  have hbg := originalReciprocalFullL2CLM_ae_originalField hε g
  filter_upwards [hbf, hbEq, hbg] with x hxF hxB hxG
  have hpoint :
      originalReciprocalField ε x • (f : Boson 2 → Fermion 2) x =
        originalReciprocalField ε x • (g : Boson 2 → Fermion 2) x :=
    hxF.symm.trans (hxB.trans hxG)
  have hcancel (v : Fermion 2) :
      (originalRadialWeight ε x : ℂ) •
          (originalReciprocalField ε x • v) = v := by
    change (originalRadialWeight ε x : ℂ) •
      ((originalRadialWeight ε x : ℂ)⁻¹ • v) = v
    rw [smul_smul, originalRadialWeight_complex_mul_inv hε x, one_smul]
  calc
    (f : Boson 2 → Fermion 2) x =
        (originalRadialWeight ε x : ℂ) •
          (originalReciprocalField ε x • (f : Boson 2 → Fermion 2) x) :=
      (hcancel _).symm
    _ = (originalRadialWeight ε x : ℂ) •
          (originalReciprocalField ε x • (g : Boson 2 → Fermion 2) x) :=
      congrArg (fun v : Fermion 2 => (originalRadialWeight ε x : ℂ) • v) hpoint
    _ = (g : Boson 2 → Fermion 2) x := hcancel _

#print axioms originalReciprocalFullL2CLM_injective

end
end FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity
