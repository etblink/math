import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import Mathlib.LinearAlgebra.StdBasis

/-!
# TD-C1A — true original gauge unitary / all 48 real Majorana labels

Prospective source-exact bridge: extend the accepted C48C1A1d0 basis-axis
intertwiner to every real vector in the literal Source48Vector.
Only real linearity is used; no substitute Clifford or Fock action.
No Spin-group gauge fixedness, physical Hilbert operator, or spectrum.
-/
set_option autoImplicit false
namespace FCP.BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- The TRUE original SU(2) Fock unitary intertwines the literal
S1J orthogonal color transformation of ALL original 48 Majorana labels.
This is a full-vector source identity, not just 48 preferred axes. -/
theorem originalGaugeUnitary_S1J_gamma_allVector_forward
    (q : GaugeGroup 2) (v : Source48Vector) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  let L : Source48Vector →ₗ[ℝ] Fermion 2 :=
    { toFun := fun v =>
        FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
          ((sourceGammaRealLinear v) ψ)
      map_add' := by
        intro v w
        simp [map_add]
      map_smul' := by
        intro c v
        simpa only [map_smul, Complex.coe_smul] using
          (map_smul (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q)
            (c : ℂ) ((sourceGammaRealLinear v) ψ)) }
  let R : Source48Vector →ₗ[ℝ] Fermion 2 :=
    { toFun := fun v =>
        (sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
          (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)
      map_add' := by
        intro v w
        simp [Matrix.mulVec_add, map_add]
      map_smul' := by
        intro c v
        simp [Matrix.mulVec_smul, map_smul] }
  change L v = R v
  have hLR : L = R := by
    apply (Pi.basisFun ℝ Source48Label).ext
    intro p
    let z : RealSpinBlock × ColorLabel := sourceBlockColorEquiv.symm p
    have hz : sourceBlockColorLabel z.1 z.2 = p := by
      change sourceBlockColorEquiv z = p
      exact sourceBlockColorEquiv.apply_symm_apply p
    have haxis :
        sourceBlockColorAxis z.1 z.2 =
          (Pi.single p (1 : ℝ) : Source48Vector) := by
      change
        (Pi.single (sourceBlockColorLabel z.1 z.2) (1 : ℝ) :
          Source48Vector) =
          (Pi.single p (1 : ℝ) : Source48Vector)
      rw [hz]
    change L (Pi.single p (1 : ℝ)) = R (Pi.single p (1 : ℝ))
    rw [← haxis]
    exact
      FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward
        q z.1.1 z.1.2 z.2 ψ
  exact congrArg (fun f : Source48Vector →ₗ[ℝ] Fermion 2 => f v) hLR

#print axioms originalGaugeUnitary_S1J_gamma_allVector_forward

end
end FCP.BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovariance
