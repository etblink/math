import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E0OriginalGammaRelationalPhaseLinearIndependence

/-! Independent original-source coefficient uniqueness audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E0Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2E0

example (c d : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (h : c • v + d • relationalPhaseJ.mulVec v = 0) :
    c = 0 ∧ d = 0 :=
  relationalPhaseJ_linear_coefficients_unique c d v hv hne h

#print axioms FCP.RHOPFP9C3D2E0.relationalPhaseJ_linear_coefficients_unique

end FCP.RHOPFP9C3D2E0Independent
