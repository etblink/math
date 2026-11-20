import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G0AOriginalGammaRelationalRangeNontrivial

/-! Independent exact original Gamma9 relational projector nontrivial-range audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G0AIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G0A

example :
    Nontrivial (LinearMap.range (Matrix.toLin' relationalProjector)) :=
  relationalProjector_range_nontrivial

#print axioms FCP.RHOPFP9C3D2G0A.relationalProjector_range_nontrivial

end FCP.RHOPFP9C3D2G0AIndependent
