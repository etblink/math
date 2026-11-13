import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0AOriginalRadialScalar

/-!
Independent use of the prospective R0A scalar-weight interface on the
literal original SU2 bosonic configuration and sixteen-charge output
carrier. Does NOT create a partial multiplication operator or auxiliary H.
-/
set_option autoImplicit false

namespace BFSSP3AuxR0AOriginalRadialScalarIndependentConsumer

open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar

example : OriginalChargeOutput =
    PiLp 2 (fun _ : SpinIndex => FullL2 2) := rfl

example {ε : ℝ} (hε : 0 < ε) (x : Boson 2) :
    ε ≤ originalRadialWeight ε x :=
  originalRadialWeight_ge hε x

example {ε : ℝ} (hε : 0 < ε) (x : Boson 2) :
    (originalRadialWeight ε x)⁻¹ ≤ ε⁻¹ :=
  originalRadialWeight_inv_le hε x

example {ε : ℝ} (hε : 0 < ε) (x : Boson 2) :
    (originalRadialWeight ε x : ℂ) *
      (originalRadialWeight ε x : ℂ)⁻¹ = 1 :=
  originalRadialWeight_complex_mul_inv hε x

#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_sq
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_pos
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_ge
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_inv_le
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_complex_mul_inv

end BFSSP3AuxR0AOriginalRadialScalarIndependentConsumer
