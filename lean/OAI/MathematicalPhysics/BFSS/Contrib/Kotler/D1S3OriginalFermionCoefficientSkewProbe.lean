import OAI.MathematicalPhysics.BFSS.FermionQuantization
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

/-!
D1S3 — prospective ORIGINAL BFSS fermionCoefficient skewness.
Source-only theorem target; no D1R0/D1S1/D1T0/D1T1 consumer edits.
No physical-state, spectral, or Hopfion conclusion.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S3
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Source cyclicity plus structure-constant last-index swap. -/
theorem sourceStructureFirstTwoSkew {N : ℕ} (M : AlgebraData N)
    (A B C : ColorIndex N) :
    M.structureConstant B A C = -M.structureConstant A B C := by
  calc
    M.structureConstant B A C = M.structureConstant A C B :=
      M.structureConstant_cycle B A C
    _ = -M.structureConstant A B C := M.structureConstant_swap A B C

/-- Source real gamma symmetry at individual spin entries. -/
theorem sourceGammaEntrySymm {N : ℕ} (M : AlgebraData N)
    (j : SpaceIndex) (a b : SpinIndex) :
    M.gamma j b a = M.gamma j a b := by
  have h := congrArg (fun A : GammaMatrix => A a b) (M.gamma_symmetric j).eq
  simpa only [Matrix.transpose_apply] using h

/-- The original massT source is skew in the spin indices. -/
theorem sourceMassTEntrySkew {N : ℕ} (M : AlgebraData N)
    (a b : SpinIndex) :
    BFSSGamma.massT M.gamma b a = -BFSSGamma.massT M.gamma a b := by
  have h := BFSSGamma.massT_transpose M.gamma
    M.gamma_clifford M.gamma_symmetric
  simpa only [Matrix.transpose_apply, Matrix.neg_apply] using
    congrArg (fun A : GammaMatrix => A a b) h

/-- ORIGINAL source fermionCoefficient(x) is real and skew in the
full SpinIndex × ColorIndex N labels. -/
theorem originalFermionCoefficient_skew {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    (M.fermionCoefficient x).transpose = -(M.fermionCoefficient x) := by
  classical
  ext r s
  change
    (if s.2 = r.2 then (3/2 : ℝ) * BFSSGamma.massT M.gamma s.1 r.1 else 0) -
      (∑ j : SpaceIndex, ∑ C : ColorIndex N,
        M.structureConstant r.2 s.2 C * x (j, C) * M.gamma j s.1 r.1) =
      -((if r.2 = s.2 then (3/2 : ℝ) * BFSSGamma.massT M.gamma r.1 s.1 else 0) -
        (∑ j : SpaceIndex, ∑ C : ColorIndex N,
          M.structureConstant s.2 r.2 C * x (j, C) * M.gamma j r.1 s.1))
  have hm :
      (if s.2 = r.2 then (3/2 : ℝ) * BFSSGamma.massT M.gamma s.1 r.1 else 0) =
      -(if r.2 = s.2 then (3/2 : ℝ) * BFSSGamma.massT M.gamma r.1 s.1 else 0) := by
    by_cases hc : r.2 = s.2
    · rw [ite_eq_left hc.symm, ite_eq_left hc, sourceMassTEntrySkew M r.1 s.1]
      ring
    · rw [ite_eq_right (Ne.symm hc), ite_eq_right hc]
      simp
  have hs :
      (∑ j : SpaceIndex, ∑ C : ColorIndex N,
        M.structureConstant r.2 s.2 C * x (j, C) * M.gamma j s.1 r.1) =
      -(∑ j : SpaceIndex, ∑ C : ColorIndex N,
        M.structureConstant s.2 r.2 C * x (j, C) * M.gamma j r.1 s.1) := by
    calc
      _ = ∑ j : SpaceIndex, ∑ C : ColorIndex N,
          -(M.structureConstant s.2 r.2 C * x (j, C) * M.gamma j r.1 s.1) := by
        apply Finset.sum_congr rfl
        intro j _
        apply Finset.sum_congr rfl
        intro C _
        rw [sourceStructureFirstTwoSkew M s.2 r.2 C,
          sourceGammaEntrySymm M j r.1 s.1]
        ring
      _ = _ := by simp only [Finset.sum_neg_distrib]
  rw [hm, hs]
  abel

/-- Literal original SU(2) paired-algebra specialization. -/
theorem pairedOriginalFermionCoefficient_skew (x : Boson 2) :
    (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x).transpose =
      -(FCP.BFSSSU2GaugeG1A.pairedAlgebraData.fermionCoefficient x) :=
  originalFermionCoefficient_skew _ x

#print axioms sourceStructureFirstTwoSkew
#print axioms sourceGammaEntrySymm
#print axioms sourceMassTEntrySkew
#print axioms originalFermionCoefficient_skew
#print axioms pairedOriginalFermionCoefficient_skew

end
end FCP.BFSSHopfD1S3
