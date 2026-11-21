import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D45OriginalGammaSourceQOrthonormalRepr

/-!
# RHOPF-P9C3D2G1D46 — source-original Gamma9 Q-unit / Euclidean-unit boundary

D45 has established a source-Q-preserving complex-linear isometric
equivalence to EuclideanSpace ℂ (Fin 2). This gate checks the
UNIT-SPHERE membership boundary Q_Gamma9(x) = 1 iff
the Euclidean norm of the exact D45 representation equals 1.

No quotient, Chern class, topological charge, physical Fock
realization or BFSS soliton is inferred.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D46
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D45

/-- The ORIGINAL Gamma9 Q-unit condition is precisely standard
Euclidean unit norm under the strictly verified D45 isometry. -/
theorem relationalSourceQUnit_iff_euclideanUnit
    (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf x.coordinates = 1 ↔
      ‖relationalSourceComplexFourSourceQIsometricRepr x‖ = 1 := by
  constructor
  · intro hq
    have hsq :
        ‖relationalSourceComplexFourSourceQIsometricRepr x‖ ^ 2 =
          (1 : ℝ) := by
      rw [relationalSourceComplexFourSourceQIsometricRepr_norm_sq, hq]
    have hn : 0 ≤ ‖relationalSourceComplexFourSourceQIsometricRepr x‖ :=
      norm_nonneg _
    nlinarith
  · intro hn
    calc
      relationalRangeCoordinateDotSelf x.coordinates =
          ‖relationalSourceComplexFourSourceQIsometricRepr x‖ ^ 2 :=
        (relationalSourceComplexFourSourceQIsometricRepr_norm_sq x).symm
      _ = 1 := by rw [hn]; norm_num

/-- The D45 source-original representation RESTRICTS to a function
from source Q-unit vectors to standard Euclidean unit vectors.
Injectivity, inverse and sphere-topological equivalence are kept
for the next independent gate. -/
noncomputable def relationalSourceQUnitToEuclideanUnit
    (x : {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  ⟨relationalSourceComplexFourSourceQIsometricRepr x.val,
    (relationalSourceQUnit_iff_euclideanUnit x.val).mp x.property⟩

#print axioms relationalSourceQUnit_iff_euclideanUnit
#print axioms relationalSourceQUnitToEuclideanUnit

end
end FCP.RHOPFP9C3D2G1D46
