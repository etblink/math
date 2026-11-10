import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1aOriginalGaugeFockMajoranaAxisCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1c0OriginalS1JAxisGammaColorSum

/-!
# C48-1A1d0 — original G4E Fock gauge unitary intertwines true S1J source axis

Small Proof-DAG join of independently strict-qualified C48-1A1a
(original unitary + gamma axis color covariance, #42813706857) and
C48-1A1c0 (original S1J matrix column under gamma, #42887781946).
The only new bridge is the pinned real-to-complex scalar compatibility
of the original color coefficients, followed by Fock evaluation.

No new Fock implementation, surrogate representation, all-vector covariance,
gauge-fixed projection, operator-domain theorem, or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Forward intertwining of the GENUINE G4E original Fock unitary
with the literal S1J 48-real-label color action, evaluated on a single
G1A-indexed source Majorana axis. Preserve positive sqrt(2), output
color B / input color A, and unchanged real/imaginary bit s. -/
theorem originalGaugeUnitary_S1J_gamma_axis_forward
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) A)) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j,s) A)))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  calc
    _ = ∑ B : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
            ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) B))
              (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) :=
      FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance.originalGaugeUnitary_sourceGammaAxis_covariant
        q j s A ψ
    _ = ∑ B : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℝ) •
            ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) B))
              (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) := by
      simp only [Complex.coe_smul]
    _ = (sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
            (sourceBlockColorAxis (j,s) A)))
          (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
      rw [FCP.BFSSC48C1A1c0OriginalS1JAxisGammaColorSum.originalS1J_axis_gamma_color_sum]
      -- Evaluate the sum and scalar action in the original continuous-linear Fock operators.
      simp only [sum_apply, smul_apply]

#print axioms originalGaugeUnitary_S1J_gamma_axis_forward

end
end FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
