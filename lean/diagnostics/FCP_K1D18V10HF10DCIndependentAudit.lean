import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DCDerivativeRangeLiePackaging
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Algebra.Lie.OfAssociative

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
attribute [local instance 100] LieRing.ofAssociativeRing

private abbrev C := CliffordAlgebra source9Quadratic
private abbrev N := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev S := source9IdentityChartDerivativeLieSubalgebra
private abbrev e := source9NativeSkewDerivativeRangeLieEquiv

-- The LieSubalgebra carries exactly the pre-existing derivative-range submodule.
example : (source9IdentityChartDerivativeLieSubalgebra : Submodule ℝ C) =
    source9IdentityChartDerivativeRange := rfl

-- The bracket closure is the actual F10DB ambient commutator closure.
example (x y : C) (hx : x ∈ source9IdentityChartDerivativeRange)
    (hy : y ∈ source9IdentityChartDerivativeRange) :
    ⁅x, y⁆ ∈ source9IdentityChartDerivativeLieSubalgebra := by
  change x * y - y * x ∈ source9IdentityChartDerivativeRange
  exact source9IdentityChartDerivativeRange_commutator_mem ⟨x, hx⟩ ⟨y, hy⟩

-- The subtype bracket is the restriction of the unchanged ambient Clifford commutator.
example (x y : S) :
    ((⁅x, y⁆ : S) : C) = (x : C) * (y : C) - (y : C) * (x : C) := rfl

-- The packaged map has exactly the original linear values.
example : (e : N ≃ₗ[ℝ] S) = source9NativeSkewDerivativeRangeEquiv := by
  ext A
  rfl

example (A : N) :
    (e A : C) = (source9NativeSkewDerivativeRangeEquiv A : C) := rfl

-- The inverse is the original linear inverse, with only the explicit subtype bridge.
example (x : S) :
    e.symm x =
      source9NativeSkewDerivativeRangeEquiv.symm
        ⟨(x : C), by
          exact x.property⟩ := rfl

-- Check the full LieHom law and both inverse laws independently at the consumer boundary.
example (A B : N) : e ⁅A, B⁆ = ⁅e A, e B⁆ :=
  LieEquiv.map_lie e A B

example (A : N) : e.symm (e A) = A := e.left_inv A
example (x : S) : e (e.symm x) = x := e.right_inv x
example (x y : S) : e.symm ⁅x, y⁆ = ⁅e.symm x, e.symm y⁆ :=
  LieEquiv.map_lie e.symm x y

-- Check the actual LieSubalgebra interface on arbitrary subtype inputs.
example (x y : S) : ((⁅x, y⁆ : S) : C) ∈ S := by
  exact LieSubalgebra.lie_mem S x.property y.property

#print axioms source9IdentityChartDerivativeLieSubalgebra
#print axioms source9NativeSkewDerivativeRangeLieEquiv

end
end FCP.BFSSPairedSpin9Clifford
