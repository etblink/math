import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4OperatorBasisExtensionInterface
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-!
# TD-C1A R4 P1: native operator interface feasibility probe

Research diagnostic, not TD-C1A acceptance. Original G4E unitary,
S1J matrix, 48-label gamma and Fock-vector carrier remain literal.
Do not import the failed TD-C1A theorem or prospective F18 sources.
-/
set_option autoImplicit false

namespace FCP.BFSSTDC1AR4NativeOperatorInterfaceProbe
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSTDC1AR4OperatorBasisExtensionInterface

/-- Literal original S1J multiplication, packaged over its label space only. -/
def originalColorLinear (q : GaugeGroup 2) :
    Source48Vector →ₗ[ℝ] Source48Vector where
  toFun := (FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
  map_add' := by
    intro v w
    exact Matrix.mulVec_add _ v w
  map_smul' := by
    intro c v
    simp only [Matrix.mulVec_smul]

/-- The accepted original axis equality, lifted once to Fock operators. -/
theorem original_axis_operator
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2) (a : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q).toContinuousLinearMap *
        sourceGammaRealLinear (sourceBlockColorAxis (j,s) a) =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j,s) a)) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q).toContinuousLinearMap := by
  apply ContinuousLinearMap.ext
  intro ψ
  simp only [mul_apply_eq_comp]
  exact
    FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward
      q j s a ψ

/-- Original all-label covariance, still at the Fock-operator level. -/
theorem original_allVector_operator (q : GaugeGroup 2) (v : Source48Vector) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q).toContinuousLinearMap *
        sourceGammaRealLinear v =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q).toContinuousLinearMap := by
  classical
  let U : Fermion 2 →L[ℂ] Fermion 2 :=
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q).toContinuousLinearMap
  have hb : ∀ p : Source48Label,
      U * sourceGammaRealLinear (Pi.single p 1) =
        sourceGammaRealLinear (originalColorLinear q (Pi.single p 1)) * U := by
    intro p
    let z : RealSpinBlock × ColorLabel := sourceBlockColorEquiv.symm p
    have hlabel : sourceBlockColorLabel z.1 z.2 = p := by
      change sourceBlockColorEquiv z = p
      exact sourceBlockColorEquiv.apply_symm_apply p
    have haxis :
        sourceBlockColorAxis z.1 z.2 =
          (Pi.single p (1 : ℝ) : Source48Vector) := by
      simp only [sourceBlockColorAxis, hlabel]
    rw [← haxis]
    exact original_axis_operator q z.1.1 z.1.2 z.2
  exact operator_covariance_of_basis
    sourceGammaRealLinear (originalColorLinear q) U hb v

/-- Evaluate the operator identity only after the full label extension. -/
theorem original_allVector_pointwise
    (q : GaugeGroup 2) (v : Source48Vector) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  have h := congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ)
    (original_allVector_operator q v)
  simpa only [mul_apply_eq_comp] using h

#print axioms original_axis_operator
#print axioms original_allVector_operator
#print axioms original_allVector_pointwise

end
end FCP.BFSSTDC1AR4NativeOperatorInterfaceProbe

