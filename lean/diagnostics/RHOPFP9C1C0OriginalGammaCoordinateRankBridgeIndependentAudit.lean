import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C0OriginalGammaCoordinateRankBridge

/-! Independent exact original spinor coordinate rank bridge consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C1C0Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1C0

example : Function.Injective selectedIndex :=
  selectedIndex_injective

example : Module.finrank ℝ selectedCoordinatePlane = 4 :=
  selectedCoordinatePlane_finrank_four

example (hfixed : SelectedBasisFixed) :
    selectedCoordinatePlane ≤
      LinearMap.range (Matrix.toLin' relationalProjector) :=
  selectedCoordinatePlane_le_projector_range hfixed

example (hfixed : SelectedBasisFixed) :
    selectedCoordinatePlane =
      LinearMap.range (Matrix.toLin' relationalProjector) :=
  selectedCoordinatePlane_eq_projector_range_of_fixed hfixed

#print axioms FCP.RHOPFP9C1C0.selectedIndex_injective
#print axioms FCP.RHOPFP9C1C0.selectedCoordinatePlane_finrank_four
#print axioms FCP.RHOPFP9C1C0.selectedCoordinatePlane_le_projector_range
#print axioms FCP.RHOPFP9C1C0.selectedCoordinatePlane_eq_projector_range_of_fixed

end FCP.RHOPFP9C1C0Independent
