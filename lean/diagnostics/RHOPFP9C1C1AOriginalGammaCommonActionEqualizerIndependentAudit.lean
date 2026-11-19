import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C1AOriginalGammaCommonActionEqualizer

/-! Separate original-source exact typed P9C1C1A common-action consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C1C1AIndependent
open scoped Matrix
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1C0
open FCP.RHOPFP9C1C1A

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

example (v : SpinIndex → ℝ)
    (hab : KA *ᵥ v = KB *ᵥ v)
    (hac : KA *ᵥ v = KC *ᵥ v) :
    relationalProjector *ᵥ v = v :=
  relationalProjector_fixed_of_common_action v hab hac

example (v : SpinIndex → ℝ) :
    v ∈ LinearMap.range (Matrix.toLin' relationalProjector) ↔
      KA *ᵥ v = KB *ᵥ v ∧ KA *ᵥ v = KC *ᵥ v :=
  relationalProjector_range_iff_common_action v

example (hcommon : ∀ i : Fin 4,
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KB *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) ∧
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KC *ᵥ (Pi.single (selectedIndex i) (1 : ℝ))) :
    SelectedBasisFixed :=
  selectedBasisFixed_of_common_action hcommon

example (hcommon : ∀ i : Fin 4,
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KB *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) ∧
      KA *ᵥ (Pi.single (selectedIndex i) (1 : ℝ)) =
        KC *ᵥ (Pi.single (selectedIndex i) (1 : ℝ))) :
    selectedCoordinatePlane =
      LinearMap.range (Matrix.toLin' relationalProjector) :=
  selectedCoordinatePlane_eq_projector_range_of_common_action hcommon

#print axioms FCP.RHOPFP9C1C1A.relationalProjector_fixed_of_common_action
#print axioms FCP.RHOPFP9C1C1A.relationalProjector_range_iff_common_action
#print axioms FCP.RHOPFP9C1C1A.selectedBasisFixed_of_common_action
#print axioms FCP.RHOPFP9C1C1A.selectedCoordinatePlane_eq_projector_range_of_common_action

end FCP.RHOPFP9C1C1AIndependent
