import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYFinitePlane01
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYBosonicPlane01

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYFinitePlane01Independent

open OAI.BFSSQuantum
open FCP.BFSSMSYFinitePlane01 FCP.BFSSMSYMajorana FCP.BFSSMSYBosonicPlane01
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG3A FCP.BFSSSU2GaugeG4B
open FCP.BFSSSU2PhysicalDomainL6G6X

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

-- Expose the bilinear while the Majorana family is a parameter.
private theorem expose_plane_sum
    (theta : SpinIndex → ColorIndex 2 → Fermion 2 →L[ℂ] Fermion 2)
    (J : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (gauge : ℝ → Fermion 2 ≃ₗ[ℂ] Fermion 2)
    (h : ∀ (t : ℝ) (v : Fermion 2),
      J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) v) =
        gauge t (J v)) (t : ℝ) (v : Fermion 2) :
    J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) •
      (∑ α : SpinIndex, theta α (0 : Fin 3) * theta α (1 : Fin 3))) v) =
      gauge t (J v) := by
  simpa only [planeBilinear] using h t v

/-- Independent instantiation on the actual paired Fock fiber, with the
ordered contraction inlined and one intertwiner for every time. -/
theorem originalFockFinitePlaneAudit :
    ∃ J : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2, ∀ (t : ℝ) (v : Fermion 2),
      J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) •
        (∑ α : SpinIndex, pairedTheta α (0 : Fin 3) * pairedTheta α (1 : Fin 3))) v) =
          fermionGaugeLinearEquiv (sourcePlusIGaugeCurve (2 : Fin 3) t) (J v) := by
  have hcar (α β : SpinIndex) (a b : ColorIndex 2) :
      (pairedTheta α a).toLinearMap * (pairedTheta β b).toLinearMap +
        (pairedTheta β b).toLinearMap * (pairedTheta α a).toLinearMap =
        (if α = β ∧ a = b then (1 : ℂ) else 0) • (1 : Module.End ℂ (Fermion 2)) := by
    have h := congrArg ContinuousLinearMap.toLinearMap (pairedTheta_CAR α β a b)
    simpa only [ContinuousLinearMap.toLinearMap_add, ContinuousLinearMap.toLinearMap_mul,
      ContinuousLinearMap.toLinearMap_smul, ContinuousLinearMap.toLinearMap_one] using h
  obtain ⟨J, hJ⟩ := exists_original_fock_isometry (fun α a => (pairedTheta α a).toLinearMap)
    (fun α a => (pairedTheta_selfAdjoint α a).isSymmetric) hcar pairedTheta_irreducible
  have hfinite := finite_plane01_intertwines pairedTheta J hJ
  refine ⟨J, ?_⟩
  exact expose_plane_sum pairedTheta J
    (fun t => fermionGaugeLinearEquiv (sourcePlusIGaugeCurve (2 : Fin 3) t)) hfinite

#print axioms native_quarter_turn
#print axioms originalFockFinitePlaneAudit

end FCP.BFSSMSYFinitePlane01Independent
