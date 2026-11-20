import Mathlib.Analysis.Real.Sqrt
import Mathlib.LinearAlgebra.Matrix.DotProduct
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector

/-!
# RHOPF-P9C3D2G0C — original Gamma9 relational unit sphere nonempty

The original Gamma9 relational projector has a strictly qualified
nonzero fixed real spinor v. The finite-real dot self is strictly positive
for v ≠ 0, so rescale by the inverse square root of its dot self.
The fixed subspace is closed under real scaling.

This proves existence of an element of the exact source-defined norm-one
relational projector image, not an S³ homeomorphism, a Hopf quotient,
a physical Fock implementer, or a topological soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G0C
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G0B

/-- The norm-one subtype of the exact original rank-four
Gamma9 relational projector image has a genuine inhabitant. -/
theorem relationalUnitSpinor_nonempty : Nonempty RelationalUnitSpinor := by
  obtain ⟨v, hfixed, hv⟩ := relationalProjector_exists_nonzero_fixed
  have hnonneg : 0 ≤ v ⬝ᵥ v := by
    change 0 ≤ ∑ i, v i * v i
    exact Finset.sum_nonneg (fun i _ => mul_self_nonneg (v i))
  have hnonzero : v ⬝ᵥ v ≠ 0 := by
    intro hz
    exact hv (dotProduct_self_eq_zero.mp hz)
  have hpos : 0 < v ⬝ᵥ v :=
    lt_of_le_of_ne hnonneg (Ne.symm hnonzero)
  let q : ℝ := v ⬝ᵥ v
  have hqpos : 0 < q := hpos
  let r : ℝ := Real.sqrt q
  have hrpos : 0 < r := Real.sqrt_pos.mpr hqpos
  have hrne : r ≠ 0 := ne_of_gt hrpos
  have hsq : r * r = q := Real.mul_self_sqrt hqpos.le
  let u : SpinIndex → ℝ := r⁻¹ • v
  -- R2: keep the linear-map application opaque while proving the
  -- scalar transport; avoid rewriting against its unfolded mulVec form.
  have hu_fixed : (Matrix.toLin' relationalProjector) u = u := by
    calc
      (Matrix.toLin' relationalProjector) u =
          r⁻¹ • (Matrix.toLin' relationalProjector) v := by
        exact map_smul (Matrix.toLin' relationalProjector) r⁻¹ v
      _ = u := by
        rw [hfixed]
  have hid : r⁻¹ * (r⁻¹ * q) = 1 := by
    rw [← hsq]
    field_simp
  have hu_unit : u ⬝ᵥ u = 1 := by
    calc
      u ⬝ᵥ u = r⁻¹ * (r⁻¹ * q) := by
        simp only [u, smul_dotProduct, dotProduct_smul, smul_eq_mul]
        rfl
      _ = 1 := hid
  refine ⟨⟨u, ⟨?_, hu_unit⟩⟩⟩
  exact hu_fixed

#print axioms relationalUnitSpinor_nonempty

end
end FCP.RHOPFP9C3D2G0C
