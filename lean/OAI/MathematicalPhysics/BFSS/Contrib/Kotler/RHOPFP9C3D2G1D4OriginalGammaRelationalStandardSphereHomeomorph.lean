import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D3OriginalGammaRangeUnitCoordinateHomeomorph

/-!
# RHOPF-P9C3D2G1D4 — source-original relational unit spinors homeomorphic to standard S³

Compose ONLY the already strict-qualified three Homeomorphs:
G1B: original Gamma9 relational unit spinor ↔ original projector-range unit sphere;
G1D3: original projector-range unit sphere ↔ transported Q-unit coordinates;
G1D2: transported Q-unit coordinates ↔ standard real-four Euclidean dot-one sphere.

The resulting Homeomorph has an inverse and is continuous in both directions.
No metric isometry, equivariance with the standard scalar Hopf action, Hopf
quotient, topological charge, Fock implementer, or physical soliton is claimed.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D4
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1B
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D2
open FCP.RHOPFP9C3D2G1D3

/-- Original Gamma9 unit-spinor sphere ↔ standard Euclidean unit sphere
in four real coordinates, by composition of three qualified maps. -/
noncomputable def relationalUnitSpinorHomeomorphStandardUnit :
    RelationalUnitSpinor ≃ₜ StandardUnitCoordinates :=
  (relationalUnitSpinorHomeomorphRange.trans
    relationalRangeUnitHomeomorphQUnit).trans
      relationalQUnitHomeomorphStandardUnit

/-- The bundled forward map is exactly the composed original-source map. -/
theorem relationalUnitSpinorHomeomorphStandardUnit_apply
    (v : RelationalUnitSpinor) :
    relationalUnitSpinorHomeomorphStandardUnit v =
      relationalQUnitHomeomorphStandardUnit
        (relationalRangeUnitHomeomorphQUnit
          (relationalUnitSpinorHomeomorphRange v)) := by
  rfl

/-- The inverse is exactly the reverse composition of accepted maps. -/
theorem relationalUnitSpinorHomeomorphStandardUnit_symm_apply
    (v : StandardUnitCoordinates) :
    relationalUnitSpinorHomeomorphStandardUnit.symm v =
      relationalUnitSpinorHomeomorphRange.symm
        (relationalRangeUnitHomeomorphQUnit.symm
          (relationalQUnitHomeomorphStandardUnit.symm v)) := by
  rfl

#print axioms relationalUnitSpinorHomeomorphStandardUnit
#print axioms relationalUnitSpinorHomeomorphStandardUnit_apply
#print axioms relationalUnitSpinorHomeomorphStandardUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D4
