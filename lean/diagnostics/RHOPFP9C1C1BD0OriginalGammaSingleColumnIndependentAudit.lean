import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C1BD0OriginalGammaSingleColumnDiagnostic

/-! Independent imported source-exact type and axiom diagnostic. -/
set_option autoImplicit false
namespace FCP.RHOPFP9C1C1BD0Independent
open scoped Matrix
open OAI.BFSSQuantum
open FCP.BFSSGamma9

example :
    gamma (3 : SpaceIndex) *ᵥ
        (Pi.single (0 : SpinIndex) (1 : ℝ)) =
      Pi.single (10 : SpinIndex) (1 : ℝ) :=
  FCP.RHOPFP9C1C1BD0.originalGamma3_on_basis0

#print axioms FCP.RHOPFP9C1C1BD0.originalGamma3_on_basis0

end FCP.RHOPFP9C1C1BD0Independent
