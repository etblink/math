import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYMajoranaTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYMajoranaIndependent

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSMSYMajorana

private abbrev V := Fermion 2

private noncomputable def generator (α : SpinIndex) (C : ColorIndex 2) : Module.End ℂ V :=
  (pairedTheta α C).toLinearMap

/-- Test the actual original Fock fiber with the literal Appendix A basis
columns and both generator and contracted color-operator transport. -/
theorem originalFockTransportAudit :
    ∃ J : V ≃ₗᵢ[ℂ] V,
      (∀ (α : SpinIndex) (C : ColorIndex 2) (v : V),
        J (∑ β : SpinIndex, ((spinBasis β α : ℝ) : ℂ) • pairedTheta β C v) =
          pairedTheta α C (J v)) ∧
      (∀ (C D : ColorIndex 2) (v : V),
        J (∑ β : SpinIndex, pairedTheta β C (pairedTheta β D v)) =
          ∑ α : SpinIndex, pairedTheta α C (pairedTheta α D (J v))) := by
  have hcar (α β : SpinIndex) (C D : ColorIndex 2) :
      generator α C * generator β D + generator β D * generator α C =
        (if α = β ∧ C = D then (1 : ℂ) else 0) • (1 : Module.End ℂ V) := by
    have h := congrArg ContinuousLinearMap.toLinearMap (pairedTheta_CAR α β C D)
    simpa only [generator, ContinuousLinearMap.toLinearMap_add, ContinuousLinearMap.toLinearMap_mul,
      ContinuousLinearMap.toLinearMap_smul, ContinuousLinearMap.toLinearMap_one] using h
  obtain ⟨J, hJ⟩ := exists_original_fock_isometry generator
    (fun α C => (pairedTheta_selfAdjoint α C).isSymmetric) hcar pairedTheta_irreducible
  refine ⟨J, ?_, ?_⟩
  · intro α C v
    simpa only [pullMajorana_apply, generator, ContinuousLinearMap.coe_coe] using hJ α C v
  · intro C D v
    have hv := congrArg (fun T : Module.End ℂ V => T v) (color_bilinear_eq generator C D)
    simp only [LinearMap.sum_apply, Module.End.mul_apply] at hv
    change J (∑ β : SpinIndex, generator β C (generator β D v)) = _
    rw [← hv, map_sum]
    apply Finset.sum_congr rfl
    intro α _
    rw [hJ α C, hJ α D]

#print axioms originalFockTransportAudit

end FCP.BFSSMSYMajoranaIndependent
