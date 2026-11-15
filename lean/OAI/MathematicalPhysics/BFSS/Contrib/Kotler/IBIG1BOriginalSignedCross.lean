import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG1AOriginalLieTriple
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C0OriginalPauliPotentialBinding

/-!
# IBI-G1B — source-normalized signed color-cross incidence

The genuine paired AlgebraData 2 has exactly the normalized original
Pauli color structure constants: +sqrt(2) times the source epsilon3.
Transfer that signed source coefficient to the actual colorLie bracket,
then normalize G1A's gauge-invariant original Lie triple to a signed
cross/triple scalar. No surrogate SO(3) action or quaternion model.

This file is a PROSPECTIVE, UNQUALIFIED candidate until independently
compiled strict CI. The final original-source determinant definition
and rank-three Gram-only counterexample remain separate.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG1BOriginalSignedCross

noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1AOriginalLieTriple

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- Original paired 48-Majorana AlgebraData's exact Pauli color
orientation; the + sign is substantive. -/
theorem pairedColor_structureConstant (A B C : ColorIndex 2) :
    M.structureConstant A B C =
      Real.sqrt 2 * FCP.BFSSSU2.epsilon3 A B C := by
  change (Matrix.trace (M.color A *
    AlgebraData.bracket (M.color B) (M.color C))).re = _
  rw [pairedAlgebraData_color A, pairedAlgebraData_color B,
    pairedAlgebraData_color C]
  exact FCP.BFSSP2C0OriginalPauliPotentialBinding.originalPauli_structureConstant A B C

/-- Componentwise original color-Lie bracket equals the signed
original Pauli color cross product, not an imported textbook cross. -/
theorem pairedColorLie_cross (u v : ColorVector 2) (A : ColorIndex 2) :
    M.colorLie u v A =
      Real.sqrt 2 * FCP.BFSSSU2.colorCross
        (fun B : Fin 3 => u B) (fun C : Fin 3 => v C) A := by
  change (∑ B : Fin 3, ∑ C : Fin 3,
    M.structureConstant A B C * u B * v C) = _
  simp_rw [pairedColor_structureConstant]
  exact FCP.BFSSSU2.epsilon3_contraction
    (fun B : Fin 3 => u B) (fun C : Fin 3 => v C) A

/-- Original signed Pauli cross as a real Euclidean color vector. -/
noncomputable def sourceCross (u v : ColorVector 2) : ColorVector 2 :=
  WithLp.toLp 2 (fun A : Fin 3 =>
    FCP.BFSSSU2.colorCross
      (fun B : Fin 3 => u B) (fun C : Fin 3 => v C) A)

/-- Exact original source color Lie bracket in the same real carrier. -/
theorem pairedColorLie_eq_sourceCross (u v : ColorVector 2) :
    M.colorLie u v = Real.sqrt 2 • sourceCross u v := by
  ext A
  change M.colorLie u v A =
    Real.sqrt 2 * FCP.BFSSSU2.colorCross
      (fun B : Fin 3 => u B) (fun C : Fin 3 => v C) A
  exact pairedColorLie_cross u v A

/-- Signed triple on literal original nine-by-three bosons, with the
cross defined in the source Pauli ordered color basis. -/
noncomputable def originalCrossTriple
    (x : Boson 2) (i j k : SpaceIndex) : ℝ :=
  inner ℝ (sourceCross (spatialColor x i) (spatialColor x j))
    (spatialColor x k)

/-- Exact +sqrt(2) normalization of the already-qualified G1A invariant.
The separate cross-to-determinant spelling is deliberately not assumed. -/
theorem originalLieTriple_eq_crossTriple
    (x : Boson 2) (i j k : SpaceIndex) :
    originalLieTriple x i j k =
      Real.sqrt 2 * originalCrossTriple x i j k := by
  unfold originalLieTriple originalCrossTriple
  rw [pairedColorLie_eq_sourceCross]
  exact real_inner_smul_left
    (sourceCross (spatialColor x i) (spatialColor x j))
    (spatialColor x k) (Real.sqrt 2)

/-- The source signed cross triple is genuinely SU(2) gauge invariant.
It follows by cancelling the proved nonzero positive sqrt(2). -/
theorem originalCrossTriple_gauge
    (g : GaugeGroup 2) (x : Boson 2) (i j k : SpaceIndex) :
    originalCrossTriple (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j k =
      originalCrossTriple x i j k := by
  have h := originalLieTriple_gauge g x i j k
  rw [originalLieTriple_eq_crossTriple,
    originalLieTriple_eq_crossTriple] at h
  have hs : 0 < Real.sqrt (2 : ℝ) :=
    Real.sqrt_pos.2 (by norm_num)
  nlinarith

#print axioms pairedColor_structureConstant
#print axioms pairedColorLie_cross
#print axioms sourceCross
#print axioms pairedColorLie_eq_sourceCross
#print axioms originalCrossTriple
#print axioms originalLieTriple_eq_crossTriple
#print axioms originalCrossTriple_gauge

end
end FCP.BFSSIBIG1BOriginalSignedCross
