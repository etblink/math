import Mathlib.Topology.Homeomorph.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1AOriginalGammaRelationalRangeUnitSphereEquiv

/-!
# RHOPF-P9C3D2G1B — basis-independent source-exact sphere homeomorphism

The accepted underlying equivalence of the original Gamma9 relational
unit sphere with the unit sphere in the exact rank-four projector range
is identity on the real 16-spinor vector. Each type carries its inherited
subtype topology. Show both maps continuous by the canonical subtype
inclusion, without selecting a coordinate basis.

This is NOT an S³ identification, an isometry proof, Hopf quotient,
Fock representation, Hamiltonian covariance or physical hopfion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1B
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1A

/-- The canonical source-exact identity-on-ambient-space equivalence
between the two presentations of the relational unit sphere is a
homeomorphism for their induced topologies. -/
noncomputable def relationalUnitSpinorHomeomorphRange :
    RelationalUnitSpinor ≃ₜ RelationalRangeUnitSphere where
  toEquiv := relationalUnitSpinorEquivRange
  continuous_toFun := by
    have hVal : Continuous (fun v : RelationalUnitSpinor =>
        (v.1 : SpinIndex → ℝ)) :=
      continuous_subtype_val
    have hRange : Continuous (fun v : RelationalUnitSpinor =>
        (⟨v.1, ⟨v.1, v.2.1⟩⟩ :
          LinearMap.range (Matrix.toLin' relationalProjector))) :=
      hVal.subtype_mk (fun v => ⟨v.1, v.2.1⟩)
    have hSphere : Continuous (fun v : RelationalUnitSpinor =>
        (⟨⟨v.1, ⟨v.1, v.2.1⟩⟩, v.2.2⟩ :
          RelationalRangeUnitSphere)) :=
      hRange.subtype_mk (fun v => v.2.2)
    exact hSphere
  continuous_invFun := by
    have hVal : Continuous (fun w : RelationalRangeUnitSphere =>
        (w.1.1 : SpinIndex → ℝ)) :=
      continuous_subtype_val.comp continuous_subtype_val
    exact hVal.subtype_mk
      (fun w => (relationalUnitSpinorEquivRange.symm w).2)

#print axioms relationalUnitSpinorHomeomorphRange

end
end FCP.RHOPFP9C3D2G1B
