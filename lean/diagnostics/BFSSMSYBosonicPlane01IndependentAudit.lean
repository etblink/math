import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYBosonicPlane01

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYBosonicPlane01Independent

open FCP.BFSSMSYBosonicPlane01
open FCP.BFSSSU2GaugeG3A FCP.BFSSSU2PhysicalDomainL6G6X

/-- The first color basis vector maps to minus the second at positive
MSY quarter-turn time. This checks the direction as well as the scale. -/
theorem native_quarter_turn :
    adjointColorMatrix (sourcePlusIGaugeCurve (2 : Fin 3) (Real.pi / (2 * Real.sqrt 2)))
      (1 : Fin 3) (0 : Fin 3) = -1 := by
  have h := congrArg (fun M : Matrix (Fin 3) (Fin 3) ℝ => M 1 0)
    (native_adjoint_plane01 (Real.pi / (2 * Real.sqrt 2)))
  have htime : Real.sqrt 2 * (Real.pi / (2 * Real.sqrt 2)) = Real.pi / 2 := by
    field_simp [ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2))]
  simpa [htime] using h

#print axioms native_quarter_turn

end FCP.BFSSMSYBosonicPlane01Independent
