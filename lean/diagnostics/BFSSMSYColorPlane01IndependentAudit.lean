import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYColorPlane01

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYColorPlane01Independent

open OAI.BFSSQuantum
open FCP.BFSSMSYColorPlane01 FCP.BFSSMSYMajorana
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG3A FCP.BFSSSU2GaugeG4B
open FCP.BFSSSU2PhysicalDomainL6G6X

/-- The first color basis vector maps to minus the second at positive
MSY quarter-turn time. This checks the direction as well as the scale. -/
theorem native_quarter_turn :
    adjointColorMatrix (sourcePlusIGaugeCurve (2 : Fin 3) (Real.pi / (2 * Real.sqrt 2))) 1 0 = -1 := by
  have h := congrArg (fun M : Matrix (Fin 3) (Fin 3) ℝ => M 1 0)
    (native_adjoint_plane01 (Real.pi / (2 * Real.sqrt 2)))
  have htime : Real.sqrt 2 * (Real.pi / (2 * Real.sqrt 2)) = Real.pi / 2 := by
    field_simp [ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2))]
  simpa [htime] using h

/-- Independent instantiation on the actual paired Fock fiber, with the
ordered contraction inlined and one intertwiner for every time. -/
theorem originalFockFinitePlaneAudit :
    ∃ J : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2, ∀ (t : ℝ) (v : Fermion 2),
      J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) •
        (∑ α : SpinIndex, pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3))) v) =
          fermionGaugeLinearEquiv (sourcePlusIGaugeCurve (2 : Fin 3) t) (J v) := by
  let theta (α : SpinIndex) (a : ColorIndex 2) : Module.End ℂ (Fermion 2) :=
    (pairedTheta α a).toLinearMap
  have hcar (α β : SpinIndex) (a b : ColorIndex 2) :
      theta α a * theta β b + theta β b * theta α a =
        (if α = β ∧ a = b then (1 : ℂ) else 0) • (1 : Module.End ℂ (Fermion 2)) := by
    have h := congrArg ContinuousLinearMap.toLinearMap (pairedTheta_CAR α β a b)
    simpa only [theta, ContinuousLinearMap.toLinearMap_add, ContinuousLinearMap.toLinearMap_mul,
      ContinuousLinearMap.toLinearMap_smul, ContinuousLinearMap.toLinearMap_one] using h
  obtain ⟨J, hJ⟩ := exists_original_fock_isometry theta
    (fun α a => (pairedTheta_selfAdjoint α a).isSymmetric) hcar pairedTheta_irreducible
  exact ⟨J, finite_plane01_intertwines pairedTheta J hJ⟩

#print axioms native_quarter_turn
#print axioms originalFockFinitePlaneAudit

end FCP.BFSSMSYColorPlane01Independent
