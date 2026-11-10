import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3AOriginalCliffordFockGeneratorAxisCrosswalk
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4HExactThetaCovarianceProbe

/-!
# C48-1A1a — original 48-source axis Fock gauge-unitary covariance

G4H proves the actual original SU(2) Fermion 2 unitary transforms
each of the pinned G1A paired theta operators with the EXACT input
color A/output color B coefficient ordering.

OP3A independently identifies the source positive-sqrt-two gamma
axis with the genuine normalized G1A theta on the same original
Fin 8 × Fin 2 × ColorIndex 2 axis. This module transports G4H's
actual unitary covariance through that source-verified label equality.

This is one source-coordinate-axis gate. The 48-real vector
sourceRealMajoranaMatrix mulVec theorem, the full original Fock
operator automorphism commutator, the phase/character elimination,
the gauge-fixed projection, and BFSS spectral physics are not claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk

private abbrev OriginalFockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Exact, original positive-√2 source gamma axis equals the
upstream G1A normalized theta, whose actual SU(2) covariance
was established independently in G4H. -/
theorem sourceGammaAxis_eq_originalGaugeTheta
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    sourceGammaRealLinear (sourceBlockColorAxis (j,s) A) =
      (↑(Real.sqrt 2) : ℂ) •
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta
          (FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j,s)) A := by
  rw [sourceGammaRealLinear_axis]
  rw [← donor_normalized_eq_active_source_axis j s A]
  rfl

/-- The genuine G4E SU(2) unitary intertwines the original 48-axis
normalized gamma with the G3A source color output-basis sum.
The two real/imaginary Majorana components are not interchanged. -/
theorem originalGaugeUnitary_sourceGammaAxis_covariant
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
      ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) A)) ψ) =
      ∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
          ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) B))
            (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) := by
  let α : SpinIndex :=
    FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j,s)
  let c : ℂ := ↑(Real.sqrt 2)
  have hsource (B : ColorIndex 2) :
      sourceGammaRealLinear (sourceBlockColorAxis (j,s) B) =
        c • FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta α B :=
    sourceGammaAxis_eq_originalGaugeTheta j s B
  have htheta :
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta α A ψ) =
      ∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta α B
            (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
    simpa only [FCP.BFSSSU2GaugeG3A.adjointColorMatrix] using
      (FCP.BFSSSU2GaugeG4H.pairedAlgebraData_fermion_adjoint
        q α A ψ)
  calc
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) A)) ψ) =
      c • FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta α A ψ) := by
          rw [hsource A, ContinuousLinearMap.smul_apply]
          exact map_smul _ c _
    _ = c • ∑ B : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
            FCP.BFSSSU2GaugeG1A.pairedAlgebraData.theta α B
              (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
          rw [htheta]
    _ = ∑ B : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
            ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) B))
              (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) := by
          rw [Finset.smul_sum]
          apply Finset.sum_congr rfl
          intro B _
          rw [hsource B, ContinuousLinearMap.smul_apply]
          simp only [smul_smul]
          rw [mul_comm c
            (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ)]

#print axioms sourceGammaAxis_eq_originalGaugeTheta
#print axioms originalGaugeUnitary_sourceGammaAxis_covariant

end
end FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance
