import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C0OriginalSpinGaugeMajoranaCommutation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1JActual48RealMajoranaColorActionProbe

/-!
# BFSS C48-0B — identify the source 48-Majorana gauge matrix with actual S1J

C48-0 constructed the G3A color adjoint action on the original
Source48Label through the SAME G1A pairedColorSpinEquiv as F10F Spin(9).
S1J independently constructs the ACTUAL original SU(2) Fock-Majorana
48-real action as G3B.oneParticleMatrix ⊗ I₂.

The two constructions are proven equal on the literal original
Fin 24 × Fin 2 labels. The proof binds the two precise G1A
color-mode/spin-pair index equivalences and uses the C48-0
G3B-mode coefficient identity, not a surrogate tensor type.

No new Spin(9) action or Fock-vector implementer is introduced.
Operator-level commutation, scalar gauge-character triviality,
fermionic gauge projection invariance, continuity, physical
Hamiltonian domains and spectral assertions remain separate gates.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation

/-- The original source color-major intermediate index transports
back to exactly G1A's original Fock paired (24-mode × real/imag)
label. Both underlying equivalences are the actual source formulas,
not arbitrary `Fintype.equivFin` index orders. -/
theorem pairedColorSpinEquiv_sourceMode
    (j : Fin 8) (A : ColorIndex 2) (r : Fin 2) :
    FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv
      (A, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, r)) =
      (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A), r) := by
  calc
    FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv
        (A, FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, r)) =
      (FCP.BFSSPairedThetaLabelCrosswalk.colorModeEquiv (j, A), r) := by
        simp [FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv,
          FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv]
    _ = (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A), r) := rfl

/-- The C48-0 action equals the independently source-defined S1J
real gauge matrix at each of the ORIGINAL 48 Majorana labels.
In particular this transports the qualified Spin(9)-gauge
commutator to S1J with no inferred implementer equality. -/
theorem sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix
    (q : GaugeGroup 2) :
    sourceGaugeOriginalPaired48 q =
      FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q := by
  ext ⟨m, r⟩ ⟨n, s⟩
  obtain ⟨⟨j, A⟩, rfl⟩ :=
    FCP.BFSSSU2GaugeG1A.colorModeEquiv.surjective m
  obtain ⟨⟨k, B⟩, rfl⟩ :=
    FCP.BFSSSU2GaugeG1A.colorModeEquiv.surjective n
  have hC48 :
      sourceGaugeOriginalPaired48 q
          (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A), r)
          (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B), s) =
        (FCP.BFSSSU2GaugeG3B.oneParticleMatrix q
          (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A))
          (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B))) *
          (1 : Matrix (Fin 2) (Fin 2) ℝ) r s := by
    rw [← pairedColorSpinEquiv_sourceMode j A r,
      ← pairedColorSpinEquiv_sourceMode k B s]
    exact sourceGaugeOriginalPaired48_G3B_mode_entry q j k r s A B
  calc
    sourceGaugeOriginalPaired48 q
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A), r)
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B), s) =
      (FCP.BFSSSU2GaugeG3B.oneParticleMatrix q
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A))
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B))) *
        (1 : Matrix (Fin 2) (Fin 2) ℝ) r s := hC48
    _ = FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j, A), r)
        (FCP.BFSSSU2GaugeG1A.colorModeEquiv (k, B), s) := by
      rw [FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix_entry]
      by_cases h : r = s <;> simp [Matrix.one_apply, h]

#print axioms pairedColorSpinEquiv_sourceMode
#print axioms sourceGaugeOriginalPaired48_eq_sourceRealMajoranaMatrix

end
end FCP.BFSSC48C0BOriginalSourceGaugeS1JMatrixIdentity
