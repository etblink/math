import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D18OriginalGammaRangeQUnitCircleEquivariance

/-! Independent imported exact-source E equivariance consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D18Independent
noncomputable section

open FCP.RHOPFP9C3D2G1A
open FCP.RHOPFP9C3D2G1D3
open FCP.RHOPFP9C3D2G1D14
open FCP.RHOPFP9C3D2G1D18

example (z : Circle) (v : RelationalRangeUnitSphere) :
    RelationalRangeUnitSphere :=
  relationalRangeUnitCircleAction z v

example (z : Circle) (v : RelationalRangeUnitSphere) :
    relationalRangeUnitHomeomorphQUnit
      (relationalRangeUnitCircleAction z v) =
      relationalCircleQUnitAction z
        (relationalRangeUnitHomeomorphQUnit v) :=
  relationalRangeUnitHomeomorphQUnit_circle_equivariant z v

#print axioms FCP.RHOPFP9C3D2G1D18.relationalRangeUnitCircleAction
#print axioms FCP.RHOPFP9C3D2G1D18.relationalRangeUnitHomeomorphQUnit_circle_equivariant

end
end FCP.RHOPFP9C3D2G1D18Independent
