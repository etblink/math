import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYMajoranaTransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYFermionGeneratorPlane01
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G7KOriginalSourceFlowExactGaugeImplementationProbe

/-! Finite fermionic action in the MSY plane with zero-based colors 0 and 1. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYFinitePlane01

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4B
open FCP.BFSSSU2PhysicalDomainL6G6X FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSSU2PhysicalDomainL6G6Z FCP.BFSSSU2PhysicalDomainL6G7K
open FCP.BFSSMSYFermionGeneratorPlane01 FCP.BFSSMSYMajorana

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- The ordered Majorana contraction in MSY Eq. (4), for colors zero and one. -/
noncomputable def planeBilinear
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) : E →L[ℂ] E :=
  ∑ α, theta α (0 : Fin 3) * theta α (1 : Fin 3)

private theorem planeBilinear_conj
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) (J : E ≃ₗᵢ[ℂ] Fermion 2)
    (hJ : ∀ α a v,
      J (pullMajorana (fun β b => (theta β b).toLinearMap) α a v) =
        pairedTheta α a (J v)) :
    J.toContinuousLinearEquiv.conjContinuousAlgEquiv (planeBilinear theta) =
      planeBilinear pairedTheta := by
  let T : SpinIndex → ColorIndex 2 → Module.End ℂ E := fun α a => (theta α a).toLinearMap
  have hB (v : E) : planeBilinear theta v =
      ∑ α, pullMajorana T α (0 : Fin 3) (pullMajorana T α (1 : Fin 3) v) := by
    have h := congrArg (fun A : Module.End ℂ E => A v) (color_bilinear_eq T (0 : Fin 3) (1 : Fin 3)).symm
    simp only [LinearMap.sum_apply, Module.End.mul_apply] at h
    simpa only [planeBilinear, _root_.sum_apply, mul_apply_eq_comp, T,
      ContinuousLinearMap.coe_coe]
      using h
  apply ContinuousLinearMap.ext
  intro v
  simp only [ContinuousLinearEquiv.conjContinuousAlgEquiv_apply_apply]
  change J (planeBilinear theta (J.symm v)) = _
  rw [hB, map_sum]
  simp only [planeBilinear, _root_.sum_apply, mul_apply_eq_comp]
  apply Finset.sum_congr rfl
  intro α _
  change J (pullMajorana T α (0 : Fin 3) (pullMajorana T α (1 : Fin 3) (J.symm v))) = _
  rw [hJ α (0 : Fin 3), hJ α (1 : Fin 3), J.apply_symm_apply]

noncomputable local instance planeRationalNormedAlgebra
    {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] :
    NormedAlgebra ℚ (V →L[ℂ] V) :=
  .restrictScalars ℚ ℂ _

-- Keep the target operators abstract while reconciling the real time
-- action with complex scalar multiplication.
private theorem scaled_conjugate_generator
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E)
    (phi : SpinIndex → ColorIndex 2 → Fermion 2 →L[ℂ] Fermion 2)
    (J : E ≃ₗᵢ[ℂ] Fermion 2)
    (hB : J.toContinuousLinearEquiv.conjContinuousAlgEquiv (planeBilinear theta) =
      planeBilinear phi)
    (G : Fermion 2 →L[ℂ] Fermion 2)
    (hG : G = (Real.sqrt 2 : ℂ) •
      (∑ α : SpinIndex, phi α (0 : Fin 3) * phi α (1 : Fin 3)))
    (t : ℝ) :
    J.toContinuousLinearEquiv.conjContinuousAlgEquiv
      (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) = t • G := by
  have htime : t • G = (t : ℂ) • G := by
    apply ContinuousLinearMap.ext
    intro w
    change t • G w = (t : ℂ) • G w
    exact RCLike.real_smul_eq_coe_smul (K := ℂ) t (G w)
  rw [htime, hG, smul_smul, map_smul]
  change ((Real.sqrt 2 * t : ℝ) : ℂ) •
    J.toContinuousLinearEquiv.conjContinuousAlgEquiv (planeBilinear theta) =
      ((t : ℂ) * (Real.sqrt 2 : ℂ)) • planeBilinear phi
  rw [hB, Complex.ofReal_mul, mul_comm (Real.sqrt 2 : ℂ)]

/-- The MSY (0,1) plane exponential at angle `√2 * t` intertwines
the actual original fermionic gauge action, under the qualified Majorana
intertwining hypothesis. -/
theorem finite_plane01_intertwines [CompleteSpace E]
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E) (J : E ≃ₗᵢ[ℂ] Fermion 2)
    (hJ : ∀ α a v,
      J (pullMajorana (fun β b => (theta β b).toLinearMap) α a v) =
        pairedTheta α a (J v))
    (t : ℝ) (v : E) :
    J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) v) =
      fermionGaugeLinearEquiv (sourcePlusIGaugeCurve (2 : Fin 3) t) (J v) := by
  let e := J.toContinuousLinearEquiv
  let C := e.conjContinuousAlgEquiv
  have hC : Continuous C := (e.arrowCongr e).continuous
  have hm : C (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) =
      t • sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3) :=
    scaled_conjugate_generator theta pairedTheta J (planeBilinear_conj theta J hJ)
      (sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3))
      native_fermion_generator_plane01 t
  have he := NormedSpace.map_exp C hC (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta)
  rw [hm] at he
  have hp := congrArg (fun A : Fermion 2 →L[ℂ] Fermion 2 => A (J v)) he
  change J (NormedSpace.exp (((Real.sqrt 2 * t : ℝ) : ℂ) • planeBilinear theta) (J.symm (J v))) =
      sourceFermionColorFlow (2 : Fin 3) t (J v) at hp
  rw [J.symm_apply_apply, sourceFermionColorFlow_eq_actualGauge_apply] at hp
  exact hp

#print axioms finite_plane01_intertwines

end FCP.BFSSMSYFinitePlane01
